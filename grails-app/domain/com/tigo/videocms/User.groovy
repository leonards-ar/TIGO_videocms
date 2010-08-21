package com.tigo.videocms

class User extends SecUser {
	
	String firstName
	String lastName
	String email

	//if countries is null the minSize validation won't kick off.
	//Need to add constructor since grails does not create a default Set
	//See http://jira.codehaus.org/browse/GRAILS-2808
	Set countries = new HashSet()
	
	static hasMany = [countries:Country]
	
	static constraints = {
		email(blank:false,email:true)
		firstName(blank:false)
		lastName(blank:false)
		countries(nullable:false,minSize:1)
	}
}
