package com.tigo.videocms

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class UserController {
	
	def springSecurityService
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def index = {
		redirect(action: "list", params: params)
	}
	
	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[userInstanceList: User.list(params), userInstanceTotal: User.count()]
	}
	
	def create = {
		def userInstance = new User()
		userInstance.properties = params
		return [userInstance: userInstance]
	}
	
	def save = {
		def userInstance = new User(params)
		
		def passwordConfirmation = request.getParameter('passwordConfirmation')
		def userPassword = userInstance?.getPassword()
		
		if (userPassword) {
			if(!passwordConfirmation || !(userPassword?.equals(passwordConfirmation))){
				userInstance.errors.rejectValue("password", "user.error.password.confirmation.doesnotmatch","Password does not match confirmation")
				render(view: "create", model: [userInstance: userInstance])
				return
			}else{
				def auxPassword = springSecurityService.encodePassword(userPassword)
				userInstance.setPassword(auxPassword)
			}
		}
		
		if(userInstance?.getCountries()?.size() < 1){
			userInstance.errors.rejectValue("countries", "user.error.nocountry","Country cannot be empty")
			render(view: "create", model: [userInstance: userInstance])
			return
		}
		
		userInstance.setEnabled(true)
		
		if (userInstance.save(flush: true)) {
			def userBackofficeRole = SecRole.findByAuthority('ROLE_BACKOFFICE_USER')
			
			if (!userInstance.authorities.contains(userBackofficeRole)) {
				SecUserSecRole.create userInstance, userBackofficeRole
			}
			
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
			redirect(action: "show", id: userInstance.id)
		}
		else {
			render(view: "create", model: [userInstance: userInstance])
		}
	}
	
	def show = {
		def userInstance = User.get(params.id)
		if (!userInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "list")
		}
		else {
			[userInstance: userInstance]
		}
	}
	
	def edit = {
		def userInstance = User.get(params.id)
		if (!userInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [userInstance: userInstance]
		}
	}
	
	def update = {
		def userInstance = User.get(params.id)
		if (userInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (userInstance.version > version) {
					
					userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
					render(view: "edit", model: [userInstance: userInstance])
					return
				}
			}
			
			userInstance.properties = params
			
			if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
				redirect(action: "show", id: userInstance.id)
			}
			else {
				render(view: "edit", model: [userInstance: userInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "list")
		}
	}
	
	def delete = {
		def userInstance = User.get(params.id)
		if (userInstance) {
			try {
				userInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "list")
		}
	}
}
