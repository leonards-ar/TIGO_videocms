package com.tigo.videocms
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_BACKOFFICE_USER','ROLE_ADMIN'])
class VideoController {
	
	def springSecurityService
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def index = {
		redirect(action: "list", params: params)
	}
	
	def list = {
		def userCountries = getLoggedUserCountries().collect{it.getName()}
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.offset = params.offset? params.int('offset') : 0
		params.order = params.order?params.order:'desc'
		params.sort = params.sort?params.sort:'id'
		
		def videoCriteria = Video.createCriteria()

		def videos = videoCriteria.listDistinct{			
			maxResults(params.max)
			firstResult(params.offset)
			order(params.sort, params.order)
						
			countries {
				inList('name',userCountries)
			}
		}
				
		def countCriteria = Video.createCriteria()
		def videosCount = countCriteria.get {
			projections { 
				countDistinct('id') 
			}
			countries {
				inList('name',userCountries)
			}
		}
						
		[videoInstanceList: videos, videoInstanceTotal: videosCount]
	}
	
	def create = {
		def videoInstance = new Video()
		videoInstance.properties = params
		def countryList = getLoggedUserCountries()
		return [videoInstance: videoInstance, countryList:countryList]
	}
	
	def save = {
		def videoInstance = new Video(params)
		
		//Upload Video & Thumbnail
		uploadVideoAndThumnail(videoInstance)
		
		if (videoInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'video.label', default: 'Video'), videoInstance.id])}"
			redirect(action: "show", id: videoInstance.id)
		}
		else {
			def countryList = getLoggedUserCountries()
			render(view: "create", model: [videoInstance: videoInstance, countryList: countryList])
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
			def countryList = getLoggedUserCountries()			
			return [videoInstance: videoInstance, countryList:countryList]
		}
	}
	
	def update = {
		def videoInstance = Video.get(params.id)
		def countryList = getLoggedUserCountries()
		
		if (videoInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (videoInstance.version > version) {
					
					videoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'video.label', default: 'Video')] as Object[], "Another user has updated this Video while you were editing")
					render(view: "edit", model: [videoInstance: videoInstance, countryList:countryList])
					return
				}
			}
			videoInstance.properties = params
			
			//Upload Video & Thumbnail
			uploadVideoAndThumnail(videoInstance)
			
			if (!videoInstance.hasErrors() && videoInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'video.label', default: 'Video'), videoInstance.id])}"
				redirect(action: "show", id: videoInstance.id)
			}
			else {
				render(view: "edit", model: [videoInstance: videoInstance, countryList:countryList])
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
	
	def uploadVideoAndThumnail(videoInstance){
		
		//Upload Video
		def uploadedVideo =  uploadFile("movieFile")
		
		if(uploadedVideo) {
			videoInstance.setUrl(grailsApplication.config.videoUploadUrl+uploadedVideo)
		}
		
		//Upload thumbnail
		def uploadedThumbnail =  uploadFile("thumbnail")
		
		if(uploadedThumbnail) {
			videoInstance.setThumbnailUrl(grailsApplication.config.thumbnailUploadUrl+uploadedThumbnail)
		}
	}
	
	def uploadFile(inputNameParam){
		def tmpLocation = grailsApplication.config.uploadServerLocation
		
		//Upload Video
		def uploadedFile =  request.getFile(inputNameParam)
		
		def fileName = null
		if(!uploadedFile.isEmpty()) {
			fileName = uploadedFile.getOriginalFilename();
			uploadedFile.transferTo(new File(tmpLocation+fileName))
		}
		
		return fileName
	}
	
	def getLoggedUserCountries(){
		
		def principal = springSecurityService.principal
		User user = User.get(principal.id)
				
		return user.countries
	}
}
