package com.tigo.videocms

class PortalController {

    def index = { 
		def newReleasesCriteria = Video.createCriteria()
		def newReleases = newReleasesCriteria.listDistinct{			
			maxResults(2)
			order("lastUpdate", "desc")
			eq('active',true)
			eq('homeSection', Video.NEW_RELEASE)
		}
		
		def fullEpisodeCriteria = Video.createCriteria()
		def fullEpisodes = fullEpisodeCriteria.listDistinct{
			maxResults(2)
			order("lastUpdate", "desc")
			eq('active',true)
			eq('homeSection', Video.FULL_EPISODE)
		}

		def mostPopularCriteria = Video.createCriteria()
		def mostPopulars = mostPopularCriteria.listDistinct{
			maxResults(2)
			order("rating", "desc")
			eq('active',true)
		}

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
		def country = Country.findByCode(params.countryCode)
		
		def elements = HomePage.findByCountry(country)?.homeMainGalleryElements
		//TODO: Filter inactive elements
		
		render(view: "homeMainGalleryElements", model: [homeMainGalleryElementInstanceList: elements])
	}
}
