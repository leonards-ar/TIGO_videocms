package com.tigo.videocms
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_BACKOFFICE_USER','ROLE_ADMIN'])
class HomePageController extends BaseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

	def availableCountries(currentCountry)
	{
		def availableCountries = getLoggedUserCountries()
		availableCountries?.removeAll(HomePage.list()*.country)
		if(currentCountry)
		{
			availableCountries.add(currentCountry)
		}
		return availableCountries
	}
	
    def list = {
		def userCountries = getLoggedUserCountries()
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.offset = params.offset? params.int('offset') : 0
		params.order = params.order?params.order:'desc'
		params.sort = params.sort?params.sort:'id'
		
		def homePageCriteria = HomePage.createCriteria()

		def homePages = homePageCriteria.listDistinct{
			maxResults(params.max)
			firstResult(params.offset)
			order(params.sort, params.order)
			
			inList('country', userCountries)
		}
				
		def countCriteria = HomePage.createCriteria()
		def homePagesCount = countCriteria.get {
			projections {
				countDistinct('id')
			}
			inList('country', userCountries)
		}

		[homePageInstanceList: homePages, homePageInstanceTotal: homePagesCount, canCreateNewHomePage: availableCountries(null)?.size() > 0]
    }

    def create = {
        def homePageInstance = new HomePage()
        homePageInstance.properties = params
        return [homePageInstance: homePageInstance, availableCountries: availableCountries(null)]
    }

    def save = {
        def homePageInstance = new HomePage(params)
        if (homePageInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'homePage.label', default: 'HomePage'), homePageInstance.id])}"
            redirect(action: "show", id: homePageInstance.id)
        }
        else {
            render(view: "create", model: [homePageInstance: homePageInstance])
        }
    }

    def show = {
        def homePageInstance = HomePage.get(params.id)
        if (!homePageInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'homePage.label', default: 'HomePage'), params.id])}"
            redirect(action: "list")
        }
        else {
            [homePageInstance: homePageInstance, canCreateNewHomePage: availableCountries(null)?.size() > 0]
        }
    }

    def edit = {
        def homePageInstance = HomePage.get(params.id)
        if (!homePageInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'homePage.label', default: 'HomePage'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [homePageInstance: homePageInstance, availableCountries: availableCountries(homePageInstance?.getCountry()), availableElementList: getAvailableElementList(homePageInstance),canCreateNewHomePage: availableCountries(null)?.size() > 0]
        }
    }

    def update = {
        def homePageInstance = HomePage.get(params.id)
        if (homePageInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (homePageInstance.version > version) {
                    
                    homePageInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'homePage.label', default: 'HomePage')] as Object[], "Another user has updated this HomePage while you were editing")
                    render(view: "edit", model: [homePageInstance: homePageInstance])
                    return
                }
            }
            homePageInstance.properties = params
            if (!homePageInstance.hasErrors() && homePageInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'homePage.label', default: 'HomePage'), homePageInstance.id])}"
                redirect(action: "show", id: homePageInstance.id)
            }
            else {
                render(view: "edit", model: [homePageInstance: homePageInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'homePage.label', default: 'HomePage'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def homePageInstance = HomePage.get(params.id)
        if (homePageInstance) {
            try {
                homePageInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'homePage.label', default: 'HomePage'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'homePage.label', default: 'HomePage'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'homePage.label', default: 'HomePage'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def addElements = {
		def homePageInstance = HomePage.get(params.id)
		if (homePageInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (homePageInstance.version > version) {
					
					homePageInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'homePage.label', default: 'HomePage')] as Object[], "Another user has updated this HomePage while you were editing")
					render(view: "edit", model: [homePageInstance: homePageInstance])
					return
				}
			}
			
			def added = []
			params.selectedAvailableHomeMainGalleryElement?.each() { anElementId ->
				def elementToAdd = HomeMainGalleryElement.get(anElementId)
				if(elementToAdd) {
					homePageInstance.addToHomeMainGalleryElements(elementToAdd)
					added << anElementId
				}
			} 
			
			if(added?.size() <= 0) {
				flash.message = "${message(code: 'homePage.element.not.added.message', args: [message(code: 'homePage.label', default: 'HomePage'), homePageInstance.id, message(code: 'homeMainGalleryElement.label', default: 'Home Main Gallery Element')])}"
				redirect(action: "edit", id: homePageInstance.id)
			} else
			if (!homePageInstance.hasErrors() && homePageInstance.save(flush: true)) {
				flash.message = "${message(code: 'homePage.element.added.message', args: [message(code: 'homePage.label', default: 'HomePage'), homePageInstance.id, added])}"
				redirect(action: "edit", id: homePageInstance.id)
			}
			else {
				render(view: "edit", model: [homePageInstance: homePageInstance, availableCountries: availableCountries(homePageInstance?.getCountry()), availableElementList: getAvailableElementList(homePageInstance)])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'homePage.label', default: 'HomePage'), params.id])}"
			redirect(action: "list")
		}
	}
	
	def removeElements = {
		def homePageInstance = HomePage.get(params.id)
		if (homePageInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (homePageInstance.version > version) {
					
					homePageInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'homePage.label', default: 'HomePage')] as Object[], "Another user has updated this HomePage while you were editing")
					render(view: "edit", model: [homePageInstance: homePageInstance])
					return
				}
			}
			
			def removed = []
			params.selectedHomeMainGalleryElement?.each() { anElementId ->
				def elementToRemove = homePageInstance?.homeMainGalleryElements.find{ it.id == anElementId.toLong() }
				if(elementToRemove) {
					homePageInstance.removeFromHomeMainGalleryElements(elementToRemove)
					removed << anElementId
				}
			} 
			
			if(removed?.size() <= 0) {
				flash.message = "${message(code: 'homePage.element.not.removed.message', args: [message(code: 'homePage.label', default: 'HomePage'), homePageInstance.id, message(code: 'homeMainGalleryElement.label', default: 'Home Main Gallery Element')])}"
				redirect(action: "edit", id: homePageInstance.id)
			} else
			if (!homePageInstance.hasErrors() && homePageInstance.save(flush: true)) {
				flash.message = "${message(code: 'homePage.element.removed.message', args: [message(code: 'homePage.label', default: 'HomePage'), homePageInstance.id, removed])}"
				redirect(action: "edit", id: homePageInstance.id)
			}
			else {
				render(view: "edit", model: [homePageInstance: homePageInstance, availableCountries: availableCountries(homePageInstance?.getCountry()), availableElementList: getAvailableElementList(homePageInstance)])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'homePage.label', default: 'HomePage'), params.id])}"
			redirect(action: "list")
		}
	}
	
	def moveUp = {
		def homePageInstance = HomePage.get(params.homePageId)
		def elementIndex = params.elementIndex?.toInteger()
		
		if(homePageInstance && elementIndex && homePageInstance?.homeMainGalleryElements?.size() > elementIndex && elementIndex > 0) {
			def elementGoingUp = homePageInstance?.homeMainGalleryElements?.remove(elementIndex)
			homePageInstance?.homeMainGalleryElements?.add(elementIndex - 1, elementGoingUp)
			
			if (!homePageInstance.hasErrors() && homePageInstance.save(flush: true)) {
				flash.message = "${message(code: 'homePage.element.up.message', args: [message(code: 'homePage.label', default: 'HomePage'), homePageInstance.id, elementGoingUp?.id])}"
				redirect(action: "edit", id: homePageInstance.id)
			} else {
				render(view: "edit", model: [homePageInstance: homePageInstance, availableCountries: availableCountries(homePageInstance?.getCountry()), availableElementList: getAvailableElementList(homePageInstance)])
			}
		} else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'homePage.label', default: 'HomePage'), params.id])}"
			redirect(action: "list")
		}
	}
	
	def moveDown = {
		def homePageInstance = HomePage.get(params.homePageId)
		def elementIndex = params.elementIndex?.toInteger()
		
		if(homePageInstance && homePageInstance?.homeMainGalleryElements?.size() - 1 > elementIndex && elementIndex >= 0) {
			def elementGoingDown = homePageInstance?.homeMainGalleryElements?.remove(elementIndex)
			homePageInstance?.homeMainGalleryElements?.add(elementIndex + 1, elementGoingDown)
			
			if (!homePageInstance.hasErrors() && homePageInstance.save(flush: true)) {
				flash.message = "${message(code: 'homePage.element.down.message', args: [message(code: 'homePage.label', default: 'HomePage'), homePageInstance.id, elementGoingDown?.id])}"
				redirect(action: "edit", id: homePageInstance.id)
			} else {
				render(view: "edit", model: [homePageInstance: homePageInstance, availableCountries: availableCountries(homePageInstance?.getCountry()), availableElementList: getAvailableElementList(homePageInstance)])
			}
		} else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'homePage.label', default: 'HomePage'), params.id])}"
			redirect(action: "list")
		}
	}
	
	def getAvailableElementList(homePageInstance) {
		HomeMainGalleryElement.createCriteria().listDistinct {
			
			eq('active', true)
			if(homePageInstance?.homeMainGalleryElements?.size() > 0) {
				not {
					inList('id', homePageInstance?.homeMainGalleryElements*.id)
				}
			}
			element {
				order('title', 'asc')
				countries {
					eq('id', homePageInstance?.country.id)
				}
				
			}

		}
	}
}
