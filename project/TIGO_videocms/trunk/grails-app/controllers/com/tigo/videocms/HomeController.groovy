package com.tigo.videocms

class HomeController {
	def springSecurityService
	
	def index = {
		if (!springSecurityService.isLoggedIn()) {
			redirect(controller:'login', action:'auth')
		}
	}
}
