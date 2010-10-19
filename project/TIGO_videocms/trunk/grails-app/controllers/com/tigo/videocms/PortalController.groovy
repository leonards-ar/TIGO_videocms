package com.tigo.videocms

class PortalController {

    def index = { 
		def newReleases = Video.getTopByContent(Video.NEW_RELEASE)
		def fullEpisodes = Video.getTopByContent(Video.FULL_EPISODE)
		def mostPopulars = Video.getTopByRating()
		
		def rowList = [0,1]
		[countryCode: 'SV', newReleases: newReleases, fullEpisodes:fullEpisodes, mostPopulars:mostPopulars, rowList: rowList]
	}
	
	def playVideo = {
		def videoInstance = Video.get(params.id.toLong())
		if (!videoInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'video.label', default: 'Video'), params.id])}"
			redirect(action: "index")
		}
		else {
			render(view: "playvideo", model:[videoInstance: videoInstance])
		}	
	}
	
	def homeMainGalleryElements = {
		cache false
		
		def country = Country.findByCode(params.countryCode)
		
		def elements = HomePage.findByCountry(country)?.homeMainGalleryElements
		//TODO: Filter inactive elements
		
		render(view: "homeMainGalleryElements", model: [homeMainGalleryElementInstanceList: elements])
	}
}
