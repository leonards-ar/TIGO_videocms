package com.tigo.videocms

class ElementContainer {
	Element element
	
	static mapping = {
		tablePerHierarchy false
	}
	
	static belongsTo = [element:Element]
	
	static constraints = {
		element(nullable:false)
	}
}
