package com.tigo.videocms

import java.util.Set;

class TVShow {

	String name
	boolean listInTheBest
	Element backgroundImage
	Set videos = new HashSet()
	
	static hasMany = [videos:Video]
	
    static constraints = {
		name(blank:false)
		backgroundImage(nullable:true)
    }

	String toString(){
		return name
	}

	static def getTheBestTVShows(country, maxNumber=8)
	{
		def aCriteria = TVShow.createCriteria()
		
		aCriteria.listDistinct{
			maxResults(maxNumber)
			isNotEmpty('videos')
			eq('listInTheBest',true)
		}
	}
	
}
