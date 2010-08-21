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
	
	AudienceRestriction audienceRestriction

	//if countries is null the minSize validation won't kick off.
	//Need to add constructor since grails does not create a default Set
	//See http://jira.codehaus.org/browse/GRAILS-2808
	Set countries = new HashSet()
	Set categories = new HashSet()
	
	static hasMany = [countries:Country, categories:Category]
	
	static constraints = {
		title(blank:false)
		duration(blank:false)
		url(blank:false)
		thumbnailUrl(blank:false)
		audienceRestriction(blank:false)
		countries(nullable:false,minSize:1)
		categories(nullable:false,minSize:1)
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
