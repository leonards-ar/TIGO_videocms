package com.tigo.videocms

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_BACKOFFICE_USER','ROLE_ADMIN'])
class TVShowController extends BaseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [TVShowInstanceList: TVShow.list(params), TVShowInstanceTotal: TVShow.count()]
    }

    def create = {
        def TVShowInstance = new TVShow()
        TVShowInstance.properties = params
        return [TVShowInstance: TVShowInstance, elementList: getBackgroundImageElements()]
    }

    def save = {
        def TVShowInstance = new TVShow(params)
        if (TVShowInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'TVShow.label', default: 'TVShow'), TVShowInstance.id])}"
            redirect(action: "show", id: TVShowInstance.id)
        }
        else {
            render(view: "create", model: [TVShowInstance: TVShowInstance])
        }
    }

    def show = {
        def TVShowInstance = TVShow.get(params.id)
        if (!TVShowInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'TVShow.label', default: 'TVShow'), params.id])}"
            redirect(action: "list")
        }
        else {
            [TVShowInstance: TVShowInstance]
        }
    }

    def edit = {
        def TVShowInstance = TVShow.get(params.id)
        if (!TVShowInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'TVShow.label', default: 'TVShow'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [TVShowInstance: TVShowInstance, elementList: getBackgroundImageElements()]
        }
    }

    def update = {
        def TVShowInstance = TVShow.get(params.id)
        if (TVShowInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (TVShowInstance.version > version) {
                    
                    TVShowInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'TVShow.label', default: 'TVShow')] as Object[], "Another user has updated this TVShow while you were editing")
                    render(view: "edit", model: [TVShowInstance: TVShowInstance])
                    return
                }
            }
            TVShowInstance.properties = params
            if (!TVShowInstance.hasErrors() && TVShowInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'TVShow.label', default: 'TVShow'), TVShowInstance.id])}"
                redirect(action: "show", id: TVShowInstance.id)
            }
            else {
                render(view: "edit", model: [TVShowInstance: TVShowInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'TVShow.label', default: 'TVShow'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def TVShowInstance = TVShow.get(params.id)
        if (TVShowInstance) {
            try {
                TVShowInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'TVShow.label', default: 'TVShow'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'TVShow.label', default: 'TVShow'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'TVShow.label', default: 'TVShow'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def getBackgroundImageElements() {
		def elementsCriteria = Element.createCriteria()
		
		elementsCriteria.listDistinct {
			order('title', 'asc')
			
			type {
				eq('labelKey', 'tvshow_background')
			}

			countries {
				inList('id', getLoggedUserCountries()*.id)
			}
			
		}
	}
}
