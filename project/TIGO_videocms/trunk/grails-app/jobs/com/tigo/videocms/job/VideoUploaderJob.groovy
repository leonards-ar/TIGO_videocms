package com.tigo.videocms.job

import com.tigo.videocms.RemoteVideoService;


class VideoUploaderJob {
	RemoteVideoService remoteVideoService

	def concurrent = false
    def timeout = 30000l // execute job once in 30 seconds

    def execute() {
		log.debug "Running video uploader"
		remoteVideoService.refreshVideos()
		remoteVideoService.uploadVideos()
    }
}
