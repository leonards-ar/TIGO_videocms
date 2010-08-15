package com.tigo.videocms

class VideoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [videoInstanceList: Video.list(params), videoInstanceTotal: Video.count()]
    }

    def create = {
        def videoInstance = new Video()
        videoInstance.properties = params
        return [videoInstance: videoInstance]
    }

    def save = {
        def videoInstance = new Video(params)
        if (videoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'video.label', default: 'Video'), videoInstance.id])}"
            redirect(action: "show", id: videoInstance.id)
        }
        else {
            render(view: "create", model: [videoInstance: videoInstance])
        }
    }

    def show = {
        def videoInstance = Video.get(params.id)
        if (!videoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'video.label', default: 'Video'), params.id])}"
            redirect(action: "list")
        }
        else {
            [videoInstance: videoInstance]
        }
    }

    def edit = {
        def videoInstance = Video.get(params.id)
        if (!videoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'video.label', default: 'Video'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [videoInstance: videoInstance]
        }
    }

    def update = {
        def videoInstance = Video.get(params.id)
        if (videoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (videoInstance.version > version) {
                    
                    videoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'video.label', default: 'Video')] as Object[], "Another user has updated this Video while you were editing")
                    render(view: "edit", model: [videoInstance: videoInstance])
                    return
                }
            }
            videoInstance.properties = params
            if (!videoInstance.hasErrors() && videoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'video.label', default: 'Video'), videoInstance.id])}"
                redirect(action: "show", id: videoInstance.id)
            }
            else {
                render(view: "edit", model: [videoInstance: videoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'video.label', default: 'Video'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def videoInstance = Video.get(params.id)
        if (videoInstance) {
            try {
                videoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'video.label', default: 'Video'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'video.label', default: 'Video'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'video.label', default: 'Video'), params.id])}"
            redirect(action: "list")
        }
    }
}
