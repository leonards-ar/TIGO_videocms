package com.tigo.videocms

class PortalController {

    def index = {
		
		def countryCode = 'SV'
		def country = Country.findByCode(countryCode)
		def newReleases = Video.getTopByContent(Video.NEW_RELEASE, country)
		def fullEpisodes = Video.getTopByContent(Video.FULL_EPISODE, country)
		def mostPopulars = Video.getTopByRating(country)
		
		def rowList = [0,1]
		[countryCode: countryCode, newReleases: newReleases, fullEpisodes:fullEpisodes, mostPopulars:mostPopulars, rowList: rowList]
	}
		
	def homeMainGalleryElements = {
		cache false
		
		def country = Country.findByCode(params.countryCode)
		
		def elements = HomePage.findByCountry(country)?.homeMainGalleryElements
		//TODO: Filter inactive elements
		
		render(view: "homeMainGalleryElements", model: [homeMainGalleryElementInstanceList: elements])
	}
}
