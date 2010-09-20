package com.tigo.videocms

import java.util.ArrayList;

class HomePage {
	
	List homeMainGalleryElements = new ArrayList()
	Country country
	
	static hasMany = [homeMainGalleryElements:HomeMainGalleryElement]

	static constraints = {
		country(unique:true)
	}
}
