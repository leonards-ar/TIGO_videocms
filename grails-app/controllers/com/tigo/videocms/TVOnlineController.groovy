package com.tigo.videocms

class TVOnlineController {

	private final static ROWS_NUMBER  = 3
	private final static RESULTS_ROW_SIZE = 4
	
    def index = { 
		def videoInstance = Video.getRandomVideo()
		def countryCode = params.countryCode
		
		chain(action:'tvonline',model:[videoInstance:videoInstance],params:[countryCode:countryCode])
	}
	
	def playVideo = {
		def countryCode = params.countryCode
		
		def videoInstance = Video.get(params.id.toLong())
		if (!videoInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'video.label', default: 'Video'), params.id])}"
			redirect(action: "index")
		}
		else {
			chain(action:'tvonline',model:[videoInstance:videoInstance],params:[countryCode:countryCode])
		}
	}
	
	
	def tvonline = {
		def countryCode = params.countryCode
				
		def country = Country.findByCode(countryCode)
		
		def newReleases = Video.getTopByContent(Video.NEW_RELEASE,country,ROWS_NUMBER)
		def fullEpisodes = Video.getTopByContent(Video.FULL_EPISODE,country,ROWS_NUMBER)
		def mostPopulars = Video.getTopByRating(country,ROWS_NUMBER)
		def rowList = [0,1,3]
		
		return [countryCode:countryCode, newReleases: newReleases, fullEpisodes:fullEpisodes,
			mostPopulars:mostPopulars, rowList: rowList]
	}
	
	def categoryResults = {
		def category = params.category
		def categoryInstance = Category.findByName(category)
		
		def countryCode = params.countryCode 
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.offset = params.offset? params.int('offset') : 0
		params.order = params.order?params.order:'desc'
		
		def	result = Video.getByCategories([category], params)
		
		def sizeLine = RESULTS_ROW_SIZE
		int nLines = result?.size()/sizeLine
		int lastLineSize = result?.size() % sizeLine
		int lastLineEmptyElements = RESULTS_ROW_SIZE - lastLineSize
		render(view: "categories", model:[countryCode:countryCode, category:categoryInstance,videos: result, sizeLine:sizeLine, nLines : nLines, lastLineSize:lastLineSize, lastLineEmptyElements:lastLineEmptyElements])
	}
}
