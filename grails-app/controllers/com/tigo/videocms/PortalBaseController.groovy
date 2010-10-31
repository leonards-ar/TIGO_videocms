package com.tigo.videocms

import java.io.File;
import java.util.HashSet;
import java.util.TreeSet;

abstract class PortalBaseController {

	def getCountryCode() {
		params.countryCode ?: 'SV'
	}
}
