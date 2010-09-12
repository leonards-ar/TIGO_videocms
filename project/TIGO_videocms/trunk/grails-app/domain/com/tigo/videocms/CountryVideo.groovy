package com.tigo.videocms

class CountryVideo {
	
	Video video
	Country country
	
	static belongsTo = [video:Video]
	
    static constraints = {
		video(nullable:false)
		country(nullable:false)
    }
	
	String toString(){
		return "$video ($country)"
	}
	
	boolean equals(other) {
		other?.video?.id == video?.id && other?.country?.id == country?.id
	}
	
	int hashCode() {
		(video?.id ?: 0) * 13 + (country?.id ?: 0) * 7
	}
}
