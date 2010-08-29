package com.tigo.videocms

class TVShow {

	String name
	
    static constraints = {
		name(blank:false)
    }

	String toString(){
		return name
	}

}
