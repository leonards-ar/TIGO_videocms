package com.tigo.videocms

import java.io.File;

abstract class BaseController {
	def springSecurityService
	
	def storeFile(fileToStore)
	{
		File file = null
		if(!fileToStore?.isEmpty())
		{
			def location = grailsApplication.config.uploadServerLocation
			def fileName = fileToStore.getOriginalFilename()
			file = new File(location + new Random().nextInt(1000) + fileName)
			while(file.exists())
			{
				file = new File(location + new Random().nextInt(1000) + fileName)
			}
			fileToStore.transferTo(file)
		}
		return file
	}
	
	def getFileUrl(file)
	{
		if(file != null)
		{
			def baseUrl = grailsApplication.config.uploadBaseUrl
			return baseUrl + file.getName()
		}
		else
		{
			return null
		}
	}
	
	def getLoggedUserCountries(){
		
		def principal = springSecurityService.principal
		User user = User.get(principal.id)
				
		return user.countries
	}
}
