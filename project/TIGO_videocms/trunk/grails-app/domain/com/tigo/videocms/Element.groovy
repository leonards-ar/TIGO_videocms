package com.tigo.videocms

import java.util.Set;

class Element {
	
	String title
	String description
	ElementType type
	String url
	String filename
	Set countries = new HashSet()
	
	static hasMany = [countries:Country]
	
	static belongsTo = [type:ElementType]
	
    static constraints = {
		title(blank:false)
		type(nullable:false)
		filename(blank:false)
		url(blank:false)
    }
	
	String toString() {
		title ?: filename
	}
}
