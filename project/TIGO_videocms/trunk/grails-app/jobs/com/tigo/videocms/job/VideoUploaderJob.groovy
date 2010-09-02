package com.tigo.videocms.job

import com.tigo.videocms.BotRInterfaceService;

class VideoUploaderJob {
	BotRInterfaceService botRInterfaceService

	def concurrent = false
    def timeout = 30000l // execute job once in 30 seconds

    def execute() {
		println "Running video uploader"
		botRInterfaceService.refreshVideos()
		botRInterfaceService.uploadVideos()
    }
}
