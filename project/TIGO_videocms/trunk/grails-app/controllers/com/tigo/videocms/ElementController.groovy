package com.tigo.videocms

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_BACKOFFICE_USER','ROLE_ADMIN'])
class ElementController extends BaseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
		def userCountries = getLoggedUserCountries()*.name
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.offset = params.offset? params.int('offset') : 0
		params.order = params.order?params.order:'desc'
		params.sort = params.sort?params.sort:'id'
		
		def elementCriteria = Element.createCriteria()

		def elements = elementCriteria.listDistinct{
			maxResults(params.max)
			firstResult(params.offset)
			order(params.sort, params.order)
						
			countries {
				inList('name',userCountries)
			}
		}
				
		def countCriteria = Element.createCriteria()
		def elementsCount = countCriteria.get {
			projections {
				countDistinct('id')
			}
			countries {
				inList('name',userCountries)
			}
		}
						
        [elementInstanceList: elements, elementInstanceTotal: elementsCount]

    }

    def create = {
        def elementInstance = new Element()
        elementInstance.properties = params
		
		def countryList = getLoggedUserCountries()
		def elementTypeList = ElementType.list()

        return [elementInstance: elementInstance, countryList:countryList, elementTypeList:elementTypeList]
    }

	def save = {
		def elementInstance = new Element(params)

		def elementFile =  request.getFile("elementFile")
		
		if (!elementFile?.isEmpty()){
			def fileName = elementFile.getOriginalFilename()
			// Set temporal value to pass validation
			elementInstance.setFilename(fileName)
			elementInstance.setUrl(fileName)
		}

		
		if (elementInstance.validate()) {
			def file = storeFile(elementFile)
			elementInstance.setUrl(getFileUrl(file))
			elementInstance.setFilename(file.getAbsolutePath())
			
			if (elementInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.created.message', args: [message(code: 'element.label', default: 'Element'), params.id])}"
				redirect(action: "list")
			}
			else
			{
				def countryList = getLoggedUserCountries()
				def elementTypeList = ElementType.list()
				render(view: "create", model: [elementInstance: elementInstance, countryList: countryList, elementTypeList:elementTypeList])
			}
	
		} else {
			def countryList = getLoggedUserCountries()
			def elementTypeList = ElementType.list()
			render(view: "create", model: [elementInstance: elementInstance, countryList: countryList, elementTypeList:elementTypeList])
		}

	}

    def show = {
        def elementInstance = Element.get(params.id)
        if (!elementInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'element.label', default: 'Element'), params.id])}"
            redirect(action: "list")
        }
        else {
            [elementInstance: elementInstance]
        }
    }

    def edit = {
        def elementInstance = Element.get(params.id)
        if (!elementInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'element.label', default: 'Element'), params.id])}"
            redirect(action: "list")
        }
        else {
			def countryList = getLoggedUserCountries()
			def elementTypeList = ElementType.list()
            return [elementInstance: elementInstance, countryList: countryList, elementTypeList:elementTypeList]
        }
    }

    def update = {
        def elementInstance = Element.get(params.id)
        if (elementInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (elementInstance.version > version) {
                    
                    elementInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'element.label', default: 'Element')] as Object[], "Another user has updated this Element while you were editing")
                    render(view: "edit", model: [elementInstance: elementInstance])
                    return
                }
            }
            elementInstance.properties = params

			def elementFile =  request.getFile("elementFile")

			if(elementInstance.validate())
			{
				// New file has been uploaded
				if (!elementFile?.isEmpty())
				{
					def oldFile = new File(elementInstance.getFilename())
					oldFile.delete()
					def file = storeFile(elementFile)
					elementInstance.setUrl(getFileUrl(file))
					elementFile.setFilename(file.getAbsolutePath())
				}
				
				if (elementInstance.save(flush: true)) {
					flash.message = "${message(code: 'default.updated.message', args: [message(code: 'element.label', default: 'Element'), elementInstance.id])}"
					redirect(action: "show", id: elementInstance.id)
				}
				else
				{
					def countryList = getLoggedUserCountries()
					def elementTypeList = ElementType.list()
					render(view: "edit", model: [elementInstance: elementInstance, countryList: countryList, elementTypeList:elementTypeList])
				}
			}	
			else
			{
				def countryList = getLoggedUserCountries()
				def elementTypeList = ElementType.list()
				render(view: "edit", model: [elementInstance: elementInstance, countryList: countryList, elementTypeList:elementTypeList])
			}		
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'element.label', default: 'Element'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def elementInstance = Element.get(params.id)
        if (elementInstance) {
            try {
                elementInstance.delete(flush: true)
				
				//:TODO: Validate that the file was deleted from the file system
				def oldFile = new File(elementInstance.getFilename())
				oldFile.delete()
				
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'element.label', default: 'Element'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'element.label', default: 'Element'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'element.label', default: 'Element'), params.id])}"
            redirect(action: "list")
        }
    }
}
