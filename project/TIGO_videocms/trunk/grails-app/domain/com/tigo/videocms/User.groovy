package com.tigo.videocms

import java.util.SortedSet;
import java.util.TreeSet;

class User extends SecUser {
	
	String firstName
	String lastName
	String email

	//if countries is null the minSize validation won't kick off.
	//Need to add constructor since grails does not create a default Set
	//See http://jira.codehaus.org/browse/GRAILS-2808
	SortedSet countries = new TreeSet()
	
	static hasMany = [countries:Country]
	
	static mapping = {
	}
	
	static constraints = {
		email(blank:false,email:true)
		firstName(blank:false)
		lastName(blank:false)
		countries(nullable:false,minSize:1)
	}
}
