package com.tigo.videocms

import grails.test.*

class CountryTests extends GrailsUnitTestCase {
	protected void setUp() {
		super.setUp()
	}
	
	protected void tearDown() {
		super.tearDown()
	}
	
	void testHappyPath() {
		mockDomain(Country);
		def aCountry = new Country(name:"IRELAND", code:"IE")
		assertTrue 'validate should succeed',aCountry.validate()
	}
	
	void testCodeNull() {
		mockDomain(Country);
		def aCountry = new Country(name:"IRELAND")
		assertFalse 'validate should have failed', aCountry.validate()
	}
	
	void testNameNull() {
		mockDomain(Country);
		def aCountry = new Country(code:"IE")
		assertFalse 'validate should have failed', aCountry.validate()
	}
}
