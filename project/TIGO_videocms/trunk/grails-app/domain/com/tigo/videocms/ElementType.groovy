package com.tigo.videocms

import java.util.Set;

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
	
	Set elements = new HashSet()

	static hasMany = [elements:Element]
	
	static mapping = {
		elements cascade: "all-delete-orphan"
	}
    static constraints = {
		name(blank:false)
		labelKey(blank:false, unique:true)
    }
	
	String toString(){
		return name
	}
}
