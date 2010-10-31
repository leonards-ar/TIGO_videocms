package com.tigo.videocms

class Category {
	String name
	String headerFileName
		
	static constraints = {
		name(blank:false)
	}
	
	String toString(){
		return name
	}
}
