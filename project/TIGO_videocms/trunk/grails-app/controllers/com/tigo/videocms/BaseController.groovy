package com.tigo.videocms

import java.io.File;
import java.util.HashSet;
import java.util.TreeSet;

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
				
		return new TreeSet(user?.countries)
	}
	
	def getLoggedUserNoPermissionCountries() {
		return Country.list()?.removeAll(getLoggedUserCountries())
	}
	
	def deleteElementFiles(element) {
		//:TODO: Validate that the file was deleted from the file system
		if(element?.getFilename()) {
			def f = new File(element.getFilename())
			f.delete()
		}
		
		if(element?.getThumbnailFilename()) {
			def f = new File(element.getThumbnailFilename())
			f.delete()
		}
		element.setFilename(null)
		element.setUrl(null)
		element.setThumbnailFilename(null)
		element.setThumbnailUrl(null)
	}
}
