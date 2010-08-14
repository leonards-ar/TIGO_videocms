package com.tigo.videocms




class User {
	
	String email
	
	static hasMany = [countries:Country]
	
	static constraints = {
		email(blank:false,email:true)
	}
}
