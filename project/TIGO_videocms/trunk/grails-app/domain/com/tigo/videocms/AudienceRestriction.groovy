package com.tigo.videocms

class AudienceRestriction {
	
	String name
	
	static constraints = {
		name(blank:false)
	}
	
	String toString(){
		return name
	}
}
