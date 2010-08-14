package com.tigo.videocms


class Country {
	
	String name
	String code
	
	static constraints = {
		name(blank:false)
		code(blank:false)
	}
	
	String toString(){
		return name
	}
}
