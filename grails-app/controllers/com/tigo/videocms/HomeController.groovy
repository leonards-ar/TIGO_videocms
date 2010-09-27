package com.tigo.videocms

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_BACKOFFICE_USER','ROLE_ADMIN'])
class HomeController {
	def springSecurityService
	
	def index = {
		if (!springSecurityService.isLoggedIn()) {
			redirect(controller:'login', action:'auth')
		}
	}
}
