package com.tigo.videocms

class Category {
	String name
	
	static constraints = {
		name(blank:false)
	}
	
	String toString(){
		return name
	}
}
