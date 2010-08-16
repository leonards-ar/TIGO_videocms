package com.tigo.videocms

class User extends SecUser {
	
	String firstName
	String lastName
	String email
	
	static hasMany = [countries:Country]
	
	static constraints = {
		email(blank:false,email:true)
		firstName(blank:false)
		lastName(blank:false)
	}
}
