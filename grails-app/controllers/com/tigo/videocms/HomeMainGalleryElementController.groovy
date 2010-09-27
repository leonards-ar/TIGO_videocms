package com.tigo.videocms

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_BACKOFFICE_USER','ROLE_ADMIN'])
class HomeMainGalleryElementController extends BaseController {
	def burningImageService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [homeMainGalleryElementInstanceList: HomeMainGalleryElement.list(params), homeMainGalleryElementInstanceTotal: HomeMainGalleryElement.count(), elementList: getHomeMainGalleryElements()]
    }

    def create = {
        def homeMainGalleryElementInstance = new HomeMainGalleryElement()
        homeMainGalleryElementInstance.properties = params
		
        return [homeMainGalleryElementInstance: homeMainGalleryElementInstance, elementList: getHomeMainGalleryElements(), homePageId: getHomePage()?.id]
    }

    def save = {
        def homeMainGalleryElementInstance = new HomeMainGalleryElement(params)

		createThumbnail(homeMainGalleryElementInstance)
				
        if (homeMainGalleryElementInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'homeMainGalleryElement.label', default: 'HomeMainGalleryElement'), homeMainGalleryElementInstance.id])}"
            redirect(action: "show", id: homeMainGalleryElementInstance.id)
        }
        else {
            render(view: "create", model: [homeMainGalleryElementInstance: homeMainGalleryElementInstance])
        }
    }

    def show = {
        def homeMainGalleryElementInstance = HomeMainGalleryElement.get(params.id)
        if (!homeMainGalleryElementInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'homeMainGalleryElement.label', default: 'HomeMainGalleryElement'), params.id])}"
            redirect(action: "list")
        }
        else {
            [homeMainGalleryElementInstance: homeMainGalleryElementInstance]
        }
    }

    def edit = {
        def homeMainGalleryElementInstance = HomeMainGalleryElement.get(params.id)
        if (!homeMainGalleryElementInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'homeMainGalleryElement.label', default: 'HomeMainGalleryElement'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [homeMainGalleryElementInstance: homeMainGalleryElementInstance]
        }
    }

    def update = {
        def homeMainGalleryElementInstance = HomeMainGalleryElement.get(params.id)
        if (homeMainGalleryElementInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (homeMainGalleryElementInstance.version > version) {
                    
                    homeMainGalleryElementInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'homeMainGalleryElement.label', default: 'HomeMainGalleryElement')] as Object[], "Another user has updated this HomeMainGalleryElement while you were editing")
                    render(view: "edit", model: [homeMainGalleryElementInstance: homeMainGalleryElementInstance])
                    return
                }
            }
            homeMainGalleryElementInstance.properties = params
			
			createThumbnail(homeMainGalleryElementInstance)
			
            if (!homeMainGalleryElementInstance.hasErrors() && homeMainGalleryElementInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'homeMainGalleryElement.label', default: 'HomeMainGalleryElement'), homeMainGalleryElementInstance.id])}"
                redirect(action: "show", id: homeMainGalleryElementInstance.id)
            }
            else {
                render(view: "edit", model: [homeMainGalleryElementInstance: homeMainGalleryElementInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'homeMainGalleryElement.label', default: 'HomeMainGalleryElement'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def homeMainGalleryElementInstance = HomeMainGalleryElement.get(params.id)
        if (homeMainGalleryElementInstance) {
            try {
                homeMainGalleryElementInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'homeMainGalleryElement.label', default: 'HomeMainGalleryElement'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'homeMainGalleryElement.label', default: 'HomeMainGalleryElement'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'homeMainGalleryElement.label', default: 'HomeMainGalleryElement'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def getHomePage() {
		HomePage.get params.homePageId
	}
	
	def getHomeMainGalleryElements() {
		def homePage = getHomePage()
		
		def elementsCriteria = Element.createCriteria()
		
		elementsCriteria.listDistinct {
			order('title', 'asc')
			
			type {
				eq('labelKey', 'home_main_gallery')
			}
			
			countries {
				eq('id', homePage?.country?.id)
			}
		}
	}
	
	def createThumbnail(homeMainGalleryElementInstance) {
		def thumbFilename = 'thumb_hmge_' + homeMainGalleryElementInstance?.element?.id + homeMainGalleryElementInstance?.element?.getExtension()
		// Delete file if exists
		def f = new File(grailsApplication.config.uploadServerLocation + thumbFilename)
		f.delete()
		
		burningImageService.doWith(homeMainGalleryElementInstance?.element?.filename, grailsApplication.config.uploadServerLocation)
		.execute (thumbFilename, {
                  it.scaleApproximate(100, 70)
        })
		
		homeMainGalleryElementInstance?.element?.setThumbnailFilename(grailsApplication.config.uploadServerLocation + thumbFilename)
		homeMainGalleryElementInstance?.element?.setThumbnailUrl(grailsApplication.config.uploadBaseUrl + thumbFilename)
	}
}
