package com.tigo.videocms

class Video {
	
	String title
	Integer season
	Integer episode
	String episodeName
	String description
	String url
	String thumbnailUrl
	
	//Minutes and seconds in decimal format I.e: 60.5= 60:30 (mm/ss)	
	Double duration
	Double rating = 0.0	
	Integer homeOrder = null
	
	boolean active = true
	Date uploadDate = new Date()
	
	static hasMany = [countries:Country, categories:Category, audienceRestrictions: AudienceRestriction]
	
	static constraints = {
		title(blank:false)
		duration(blank:false)
		url(blank:false)
		season(nullable:true)
		episode(nullable:true)
		episodeName(nullable:true)
		homeOrder(nullable:true)
		thumbnailUrl(nullable:true)
		description(nullable:true)
	}
	
	String toString(){
		return title
	}
}
