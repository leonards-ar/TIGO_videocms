package com.tigo.videocms

import java.util.Set;

class Element {
	
	String title
	String description
	ElementType type
	String url
	String filename
	String thumbnailFilename
	String thumbnailUrl
	
	Set countries = new HashSet()
	
	static hasMany = [countries:Country]
	
	static belongsTo = [type:ElementType]
	
	static transients = [ "extension" ]
	
    static constraints = {
		title(blank:false)
		type(nullable:false)
		filename(blank:false)
		url(blank:false)
		thumbnailFilename(blank:true, nullable:true)
		thumbnailUrl(blank:true, nullable:true)
    }
	
	String toString() {
		title ?: filename
	}
	
	String getExtension() {
		if(filename) {
			def i = filename.lastIndexOf('.');
			return filename.substring(i >= 0 ? i : 0)
		} else if(url) {
			def i = url.lastIndexOf('.');
			return url.substring(i >= 0 ? i : 0)
		} else {
			return ""
		}
	}
}
