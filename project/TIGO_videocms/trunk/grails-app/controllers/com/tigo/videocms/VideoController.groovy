package com.tigo.videocms
import java.io.File;

import grails.plugins.springsecurity.Secured
import com.solution51.sfu.SuperFileUploadService

@Secured(['ROLE_BACKOFFICE_USER','ROLE_ADMIN'])

class VideoController {
	SuperFileUploadService superFileUploadService
	
	def springSecurityService
	def remoteVideoService
	
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
			
		//Upload Video
		String uploadFilename = params.uploadedFileId
		File videoFile = null
		if (uploadFilename) {
			// get the full path name of the file from the temp directory
			videoFile = superFileUploadService.getTempUploadFile(uploadFilename)
		} else {
			// file was not uploaded by flash. User might have javascript off
			def videoUpload = request.getFile('sfuFile');
			if (videoUpload != null && !videoUpload.isEmpty()) {
				def fileName = videoUpload.getOriginalFilename()
				videoFile = storeFile(videoUpload)
			}
		}
		
		if(videoInstance.isExternal()) {
			videoInstance.setUploadStatus(Video.UPLOAD_SUCCESS_STATUS)
		} else if(videoFile != null) {
			// Signal the video to be uploaded by Quartz
			videoInstance.setUploadStatus(Video.UPLOAD_PENDING_STATUS)
			videoInstance.setLocalTmpFile(videoFile.getAbsolutePath())
			videoInstance.setUploadRetriesCount(0)
			videoInstance.setActive(false) // Video will be set active after complete upload
		}
		
		//Upload Thumbnail
		def thumbUpload =  request.getFile("thumbnail")
		
		if (thumbUpload != null && !thumbUpload.isEmpty()){
			def fileName = thumbUpload.getOriginalFilename()
			videoInstance.setThumbnailUrl(grailsApplication.config.thumbnailUploadUrl+fileName)
		}
				
		if (videoInstance.validate()) {
			//TODO:Add transactional behaviour to the creation of the videos and the transfer of the files
			def createdVideos = []
			Set videoCountries = videoInstance.getCountries().collect{it.id} as Set
			videoCountries.each{
				Video auxVideo = new Video()
				auxVideo.properties = videoInstance.properties
				auxVideo.countries = new HashSet()
				auxVideo.addToCountries(Country.get(it))				
				auxVideo.save(flush:true)
				createdVideos << auxVideo.id
			}
			
			//Transfering video & thumb to a temporary location in the server
			storeFile(thumbUpload)

			flash.message = "${message(code: 'default.created.message', args: [message(code: 'video.label', default: 'Video'), createdVideos])}"
			redirect(action: "list")
		} else {
			if (videoFile != null) {
				videoFile.delete()
			}
			videoInstance.setThumbnailUrl(null)
			videoInstance.setUrl(null)
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
						
			//Setting update date
			videoInstance.lastUpdate = new Date()
			
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
				// Delete remote video
				remoteVideoService.delete(videoInstance)
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
		
	
	def storeFile(fileToStore)
	{		
		File file = null
		if(!fileToStore.isEmpty())
		{
			def tmpLocation = grailsApplication.config.uploadServerLocation			
			def fileName = fileToStore.getOriginalFilename()
			file = new File(tmpLocation+fileName)
			fileToStore.transferTo(file)
		}
		return file
	}
	
	def getLoggedUserCountries(){
		
		def principal = springSecurityService.principal
		User user = User.get(principal.id)
				
		return user.countries
	}
}
