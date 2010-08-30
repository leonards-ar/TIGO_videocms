package com.tigo.videocms

import java.io.File;

import org.codehaus.groovy.grails.commons.ConfigurationHolder;

import com.tigo.videocms.Video;

import ar.com.mindpool.bitsontherunapi.VideosAPI;
import ar.com.mindpool.bitsontherunapi.dto.VideoDTO;


class BotRInterfaceService {
	def config = ConfigurationHolder.config
	
    static transactional = true
	
	VideosAPI api = new VideosAPI()
	
	def uploadVideos() {
		getVideosToUpload().each { aVideo ->
			log.info "Uploading video " + aVideo
			
			try {
				VideoDTO videoToCreate = buildApiVideo(aVideo)
				String resp = api.create(videoToCreate)
				
				if(resp == "ok" && config.videoDeleteTmpFile) {
					deleteFile(aVideo.getLocalTmpFile())
				}
				
				aVideo.setUrl(config.videoUploadUrl + videoToCreate.getKey() + aVideo.getExtension())
				aVideo.setUploadStatus(Video.UPLOAD_IN_PROGRESS_STATUS)
				aVideo.setLocalTmpFile(null)
				aVideo.setUploadRetriesCount(0)
				aVideo.setVideoKey(videoToCreate.getKey())
				
			} catch(Exception ex) {
				log.error ex
				aVideo.setUploadRetriesCount(aVideo.getUploadRetriesCount() + 1)
				if(aVideo.getUploadRetriesCount() >= config.videoUploadRetries) {
					aVideo.setUploadStatus(Video.UPLOAD_FAIL_STATUS)
				}
			}

			if(!aVideo.save(flush:true)) {
				aVideo.errors.each { err ->
					log.error err
				}
			}
		}
	}

	def deleteFile(String filename) {
		File f = new File(filename)
		return f.delete()	
	}
	
	def refreshVideos() {
		getVideosToRefresh().each { aVideo ->
			log.info "Refreshing video " + aVideo
			
			try {
				VideoDTO apiVideo = api.show(aVideo.getVideoKey())
				
				if(apiVideo.isReady()) {
					aVideo.setUploadStatus(Video.UPLOAD_SUCCESS_STATUS)
					aVideo.setDuration(formatSecondsDuration(apiVideo.getDuration()))
					aVideo.setActive(true)
				} else if(apiVideo.isFailed()) {
					aVideo.setUploadStatus(Video.UPLOAD_FAIL_STATUS)
				}
			} catch(Exception ex) {
				log.error ex
			}

			if(!aVideo.save(flush:true)) {
				aVideo.errors.each { err ->
					log.error err
				}
			}
		}
	}

	def formatSecondsDuration(Double duration) {
		Integer mins = duration / 60
		Integer secs = duration % 60
		return mins + ':' + secs
	}
	
	def getVideosToRefresh() {
		Video.withCriteria {
			eq("uploadStatus", Video.UPLOAD_IN_PROGRESS_STATUS)
		}
	}

	def getVideosToUpload() {
		Video.withCriteria {
			isNotNull("localTmpFile")
			lt("uploadRetriesCount", config.videoUploadRetries)
			eq("uploadStatus", Video.UPLOAD_PENDING_STATUS)
		}
	}
	
	def buildApiVideo(Video video) {
		VideoDTO apiVideo = new VideoDTO()
		apiVideo.setTitle(video.getTitle())
		apiVideo.setLocalFile(video.getLocalTmpFile())
		apiVideo.setDescription(video.getDescription());
		
		return apiVideo
	}
}
