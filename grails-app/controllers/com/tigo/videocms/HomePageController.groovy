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
            [homePageInstance: homePageInstance]
        }
    }

    def edit = {
        def homePageInstance = HomePage.get(params.id)
        if (!homePageInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'homePage.label', default: 'HomePage'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [homePageInstance: homePageInstance, availableCountries: availableCountries(homePageInstance?.getCountry()), availableElementList: getAvailableElementList(homePageInstance)]
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
	
	def getAvailableElementList(homePageInstance) {
		HomeMainGalleryElement.createCriteria().listDistinct {
			
			eq('active', true)
			not {
				inList('id', homePageInstance?.homeMainGalleryElements*.id)
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
