package com.tigo.videocms

class Video {
	
	String title
	Integer season
	Integer episode
	String episodeName
	String description
	String homeSection
	
	String url
	String thumbnailUrl
	
	//In Hours, minutes and seconds I.e: 02:60:30 (hh:mm:ss)
	String duration
	
	Double rating = 0.0	
	
	boolean active = true
	Date uploadDate = new Date()
	Date lastUpdate = uploadDate
	
	AudienceRestriction audienceRestriction

	//if countries is null the minSize validation won't kick off.
	//Need to add constructor since grails does not create a default Set
	//See http://jira.codehaus.org/browse/GRAILS-2808
	Set countries = new HashSet()
	Set categories = new HashSet()

	//Static list of home section
	//TODO: In the future this can be an entity
	static final def HOME_SECTIONS = ['NEW_RELEASE','FULL_EPISODE']

	static hasMany = [countries:Country, categories:Category]
	
	static constraints = {
		title(blank:false)
		url(blank:false)
		thumbnailUrl(blank:false)
		audienceRestriction(blank:false)
		homeSection(nullable:true,inList:HOME_SECTIONS)
		countries(nullable:false,minSize:1)
		categories(nullable:false)
		season(nullable:true)
		episode(nullable:true)
		episodeName(nullable:true)
		description(nullable:true)
		duration(nullable:true)
	}
	
	String toString(){
		return title
	}
}
