package com.tigo.videocms


class Country implements Comparable {
	
	String name
	String code
	
	static constraints = {
		name(blank:false)
		code(blank:false)
	}
	
	String toString(){
		return name
	}
	
	int compareTo(o) {
		name.compareTo o?.name
	}
	
	
}
