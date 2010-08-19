package com.tigo.videocms

import grails.plugins.springsecurity.Secured
import org.springframework.validation.BindException
import java.util.Set;

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
		def defaultRole = SecRole.findByAuthority('ROLE_BACKOFFICE_USER').getId()		
		return [userInstance: userInstance, roles:defaultRole]
	}
	
	def save = {
		def errorFlag = false
			
		def userInstance = new User(params)	
		
		if (!userInstance.validate())
		{
			errorFlag = true
		}	
		
		String[] rolesAux = request.getParameterValues('roles')
		def confirmationPassword = request.getParameter('confirmationPassword')
		
		def userPassword = userInstance.getPassword()
		
		if (userPassword){
			if (validatePassword(userPassword, confirmationPassword)){
				def auxPassword = springSecurityService.encodePassword(userPassword)
				userInstance.setPassword(auxPassword)
			}else{
				userInstance.errors.rejectValue("password", "user.error.password.confirmation.doesnotmatch","Password does not match confirmation")
				errorFlag = true
			}
		}
		
		//TODO: Check that the user is not admin		
		if(userInstance?.getCountries()?.size() < 1){
			userInstance.errors.rejectValue("countries", "user.error.nocountry","Country cannot be empty")
			errorFlag = true
		}

		if(!rolesAux){
			errors = new BindException(this, "com.tigo.videocms.UserController")
			errors.reject("user.error.norole","Roles cannot be empty")	
			errorFlag = true
		}

		userInstance.setEnabled(true)
		
		if (!errorFlag && userInstance.save(flush: true)) {
			addRoles(rolesAux, userInstance)
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
			redirect(action: "show", id: userInstance.id)
		}
		else {
			render(view: "create", model: [userInstance: userInstance, roles:rolesAux])
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
			def rolesAux = userInstance.getAuthorities().collect {it.id} as Set
			return [userInstance: userInstance, roles: rolesAux]
		}
	}
	
	def update = {
		def errorFlag = false 		
		def userInstance = User.get(params.id)
		String[] rolesAux = request.getParameterValues('roles')
		
		if (userInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (userInstance.version > version) {
					
					userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
					render(view: "edit", model: [userInstance: userInstance, roles: rolesAux])
					return
				}
			}
						
			userInstance.properties = params
			
			if (!userInstance.validate())
			{
				errorFlag = true
			}
			
			def oldPassword = request.getParameter('oldPassword')
			def newPassword = request.getParameter('newPassword')
			def confirmationPassword = request.getParameter('confirmationPassword')
			
			if (oldPassword || newPassword || confirmationPassword)
			{
				//check if all the values are defined
				if (oldPassword && newPassword && confirmationPassword){
					//check if old password matches user password
					def userPassword = userInstance.getPassword()
					def oldPasswordEncoded = springSecurityService.encodePassword(oldPassword)
					
					if (validatePassword(userPassword, oldPasswordEncoded)){					
						//check if new password matches confirmation
						if (validatePassword(userPassword, oldPasswordEncoded)){					
							def auxPassword = springSecurityService.encodePassword(newPassword)
							userInstance.setPassword(auxPassword)
						}else{
							errors = new BindException(this, "com.tigo.videocms.UserController")						
							errors.reject("user.error.password.confirmation.doesnotmatch","Password does not match confirmation")
							errorFlag = true
						}
					}else{
						errors = new BindException(this, "com.tigo.videocms.UserController")
						errors.reject("user.error.oldpassword.newpassword.doesnotmatch","Old password is invalid")
						errorFlag = true
					}
				}else{
					errors = new BindException(this, "com.tigo.videocms.UserController")				
					errors.reject("user.error.passwordforupdate.mandatory","To modify the password please enter: old password, new password, and password confirmation")
					errorFlag = true									
				}
			}
			
			if(userInstance?.getCountries()?.size() < 1){
				userInstance.errors.rejectValue("countries", "user.error.nocountry","Country cannot be empty")
				errorFlag = true
			}
	
			if(!rolesAux){
				errors = new BindException(this, "com.tigo.videocms.UserController")
				errors.reject("user.error.norole","Role cannot be empty")
				errorFlag = true
			}
	
			if (!errorFlag && userInstance.save(flush: true)) {
				SecUserSecRole.removeAll(userInstance)
				addRoles(rolesAux, userInstance)
								
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
				redirect(action: "show", id: userInstance.id)
			}
			else {
				render(view: "edit", model: [userInstance: userInstance,roles:rolesAux])
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
				SecUserSecRole.removeAll(userInstance)
				
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
	
	def validatePassword(String userPassword, String passwordConfirmation){
		return (userPassword && passwordConfirmation && (userPassword.equals(passwordConfirmation)))
	}
	
	def addRoles(String[] rolesAux, User userInstance){		
		rolesAux.each {
			def userRole = SecRole.findById(it)
			
			if (!userInstance.authorities.contains(userRole)) {
				SecUserSecRole.create userInstance, userRole, true
			}
		}
	}

}
