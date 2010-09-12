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
		def userCountries = getLoggedUserCountries()
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.offset = params.offset? params.int('offset') : 0
		params.order = params.order?params.order:'desc'
		params.sort = params.sort?params.sort:'id'
		
		def videoCriteria = Video.createCriteria()

		def videos = videoCriteria.listDistinct{			
			maxResults(params.max)
			firstResult(params.offset)
			order(params.sort, params.order)
						
			countryVideos {
				inList('country',userCountries)
			}
		}
				
		def countCriteria = Video.createCriteria()
		def videosCount = countCriteria.get {
			projections { 
				countDistinct('id') 
			}
			countryVideos {
				inList('country',userCountries)
			}
		}
						
		[videoInstanceList: videos, videoInstanceTotal: videosCount]
	}
	
	def create = {
		def videoInstance = new Video()
		videoInstance.properties = params
		def countryList = getLoggedUserCountries()
		
		return [videoInstance: videoInstance, countryList:countryList, selectedCountryList:[]]
	}
	
	def save = {
		def videoInstance = new Video(params)
		def countryVideos = params.selectedCountryVideos
		
		countryVideos.each { countryId ->
			videoInstance.addToCountryVideos(country:Country.get(countryId))
		}

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
			
			videoInstance.save(flush:true)
			createdVideos << videoInstance.id
			
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
			render(view: "create", model: [videoInstance: videoInstance, countryList: countryList, countryVideoList:countryVideos])
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
			return [videoInstance: videoInstance, countryList:countryList, selectedCountryList: videoInstance.countryVideos*.country.id]
		}
	}
	
	def update = {
		def videoInstance = Video.get(params.id)
		def countryList = getLoggedUserCountries()
		def selectedCountryVideos = params.selectedCountryVideos.collect { it.toLong() }
		
		if (videoInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (videoInstance.version > version) {
					
					videoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'video.label', default: 'Video')] as Object[], "Another user has updated this Video while you were editing")
					render(view: "edit", model: [videoInstance: videoInstance, countryList:countryList, selectedCountryList:selectedCountryVideos])
					return
				}
			}
			videoInstance.properties = params
			
			// Set country videos
			def countryVideosToRemove = videoInstance.countryVideos.findAll{!(it.country.id in selectedCountryVideos)}
			countryVideosToRemove.each { aCountryVideo ->
				videoInstance.removeFromCountryVideos(aCountryVideo)
			}
			
			def currentCountryVideos = videoInstance.countryVideos.collect {it.country.id}
			
			selectedCountryVideos.each { countryId -> 
				if(!currentCountryVideos.contains(countryId)) {
					videoInstance.addToCountryVideos(country:Country.get(countryId))
				}
			}
			
			//Setting update date
			videoInstance.lastUpdate = new Date()
			
			if (!videoInstance.hasErrors() && videoInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'video.label', default: 'Video'), videoInstance.id])}"
				redirect(action: "show", id: videoInstance.id)
			}
			else {
				render(view: "edit", model: [videoInstance: videoInstance, countryList:countryList, selectedCountryVideos:selectedCountryVideos])
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
				if(videoInstance.isUploaded()) {
					// Delete remote video
					remoteVideoService.deleteVideo(videoInstance)
				}
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
		if(fileToStore != null && !fileToStore.isEmpty())
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
