package com.tigo.videocms

class RemoteVideoService {
	BotRInterfaceService botRInterfaceService
	
	static transactional = false

	def uploadVideos() {
		botRInterfaceService.uploadVideos()
	}
	
	def refreshVideos() {
		botRInterfaceService.refreshVideos()
	}
	
	def deleteVideo(Video video) {
		botRInterfaceService.delete(video)
	}
}
