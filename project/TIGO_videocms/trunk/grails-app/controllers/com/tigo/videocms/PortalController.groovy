package com.tigo.videocms

class PortalController {

    def index = { 
		def newReleasesCriteria = Video.createCriteria()
		def newReleases = newReleasesCriteria.listDistinct{			
			maxResults(2)
			order("lastUpdate", "desc")
			eq('active',true)
			eq('homeSection', Video.NEW_RELEASE)
		}
		
		def fullEpisodeCriteria = Video.createCriteria()
		def fullEpisodes = fullEpisodeCriteria.listDistinct{
			maxResults(2)
			order("lastUpdate", "desc")
			eq('active',true)
			eq('homeSection', Video.FULL_EPISODE)
		}

		def mostPopularCriteria = Video.createCriteria()
		def mostPopular = mostPopularCriteria.listDistinct{
			maxResults(2)
			order("rating", "desc")
			eq('active',true)
		}

		def rowList = [0,1]
		[newReleases: newReleases, fullEpisodes:fullEpisodes, mostPopular:mostPopular, rowList: rowList]
	}
}
