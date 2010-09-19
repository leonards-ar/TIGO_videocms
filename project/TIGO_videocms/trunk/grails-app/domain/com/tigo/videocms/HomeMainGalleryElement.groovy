package com.tigo.videocms

class HomeMainGalleryElement {
	Element element
	String filename
	String thumbnailFilename
	String targetUrl
	String target
	String text
	Integer order
	boolean active
	
    static constraints = {
		element(nullable:false)
    }

}
