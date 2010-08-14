package com.tigo.videocms

import grails.test.*

class UserTests extends GrailsUnitTestCase {
	protected void setUp() {
		super.setUp()
	}
	
	protected void tearDown() {
		super.tearDown()
	}
	
	void testHappyPath() {
		mockDomain(User);
		def test = new User(email:"mymail@minpool-it.com")
		assertTrue 'validate should succeed',test.validate()
	}
	
	void testEmailNull() {
		mockDomain(User);
		def test = new User()
		assertFalse 'validate should have failed', test.validate()
	}
	
	void testEmailInvalid() {
		mockDomain(User);
		def test = new User(email:"xxzzzyyy")
		assertFalse 'validate should have failed', test.validate()
	}
}
