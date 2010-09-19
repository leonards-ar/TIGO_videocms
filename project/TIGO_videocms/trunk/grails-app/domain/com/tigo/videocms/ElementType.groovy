package com.tigo.videocms

class ElementType {

	String name
	String description
	String labelKey
	// Comma separated list of allowed file extensions
	String allowedExtensions
	// In pixels
	Integer width
	Integer height
	// In KB
	Double maxSize

    static constraints = {
		name(blank:false)
		labelKey(blank:false, unique:true)
    }
	
	String toString(){
		return name
	}
}
