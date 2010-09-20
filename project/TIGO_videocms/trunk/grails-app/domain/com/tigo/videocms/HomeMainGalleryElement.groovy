package com.tigo.videocms

class HomeMainGalleryElement {
	Element element
	String filename
	String thumbnailFilename
	String targetUrl
	String target
	String text
	boolean active
	
	static belongsTo = [element:Element]
	
    static constraints = {
		element(nullable:false)
    }

}
