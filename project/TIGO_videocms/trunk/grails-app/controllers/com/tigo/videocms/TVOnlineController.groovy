package com.tigo.videocms

class TVOnlineController {

	private final static ROWS_NUMBER  = 3
    def index = { 
		def videoInstance = Video.getRandomVideo()

		def newReleases = Video.getTopByContent(Video.NEW_RELEASE,ROWS_NUMBER)
		def fullEpisodes = Video.getTopByContent(Video.FULL_EPISODE,ROWS_NUMBER)
		def mostPopulars = Video.getTopByRating(ROWS_NUMBER)		
		def rowList = [0,1,3]
		
		render(view: "tvonline", model:[videoInstance: videoInstance,countryCode: 'SV', newReleases: newReleases, fullEpisodes:fullEpisodes, 
			mostPopulars:mostPopulars, rowList: rowList])
	}
	
	def playVideo = {
		def videoInstance = Video.get(params.id.toLong())
		if (!videoInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'video.label', default: 'Video'), params.id])}"
			redirect(action: "index")
		}
		else {
			def newReleases = Video.getTopByContent(Video.NEW_RELEASE,ROWS_NUMBER)
			def fullEpisodes = Video.getTopByContent(Video.FULL_EPISODE,ROWS_NUMBER)
			def mostPopulars = Video.getTopByRating(ROWS_NUMBER)
			def rowList = [0,1,3]
						
			render(view: "tvonline", model:[videoInstance: videoInstance, countryCode: 'SV', newReleases: newReleases, fullEpisodes:fullEpisodes, 
			mostPopulars:mostPopulars, rowList: rowList])
		}
	}
}
