package com.tigo.videocms

class Video {
	public static String UPLOAD_SUCCESS_STATUS = 'upload_success'
	public static String UPLOAD_IN_PROGRESS_STATUS = 'upload_progress'
	public static String UPLOAD_PENDING_STATUS = 'upload_pending'
	public static String UPLOAD_FAIL_STATUS = 'upload_fail'
	
	public static String NEW_RELEASE = 'new_release'
	public static String FULL_EPISODE = 'full_episode'
	public static String NO_HOME_SECTION = 'no_home'
		
	String title
	Integer season
	Integer episode
	String episodeName
	String description
	String homeSection
	
	String url
	String thumbnailUrl
	
	//In Hours, minutes and seconds I.e: 02:60:30 (hh:mm:ss)
	String duration
	
	Double rating = 0.0	
	
	boolean active = false
	boolean external = false
	
	Date uploadDate = new Date()

	String localTmpFile
	String uploadStatus
	Integer uploadRetriesCount
	String videoKey

	Date lastUpdate = uploadDate
	
	AudienceRestriction audienceRestriction
	TVShow show
	
	//if countries is null the minSize validation won't kick off.
	//Need to add constructor since grails does not create a default Set
	//See http://jira.codehaus.org/browse/GRAILS-2808
	Set countryVideos = new HashSet()
	Set categories = new HashSet()

	//Static list of home section
	//TODO: In the future this can be an entity
	static final def HOME_SECTIONS = [NO_HOME_SECTION,NEW_RELEASE,FULL_EPISODE]

	static hasMany = [countryVideos:CountryVideo, categories:Category]
	
	static transients = [ "extension", "uploaded" ] 
	
	static mapping = {
		countryVideos cascade: "all-delete-orphan"
	}
	
	static constraints = {
		title(blank:false)
		url(blank:true)
		thumbnailUrl(blank:true)
		audienceRestriction(blank:false)
		homeSection(nullable:true, inList:HOME_SECTIONS)
		countryVideos(nullable:false,minSize:1)
		categories(nullable:false)
		season(nullable:true)
		episode(nullable:true)
		episodeName(nullable:true)
		description(nullable:true)
		duration(nullable:true)
		show(nullable:true)
		localTmpFile(nullable:true)
		uploadRetriesCount(nullable:true)
		videoKey(nullable:true)
		uploadStatus(nullable:true, inList:[UPLOAD_SUCCESS_STATUS, UPLOAD_FAIL_STATUS, UPLOAD_PENDING_STATUS, UPLOAD_IN_PROGRESS_STATUS])
	}
	
	String toString(){
		return title
	}
	
	String getExtension() {
		if(localTmpFile) {
			def i = localTmpFile.lastIndexOf('.');
			return localTmpFile.substring(i >= 0 ? i : 0)
		} else if(url) {
			def i = url.lastIndexOf('.');
			return url.substring(i >= 0 ? i : 0)
		} else {
			return ""
		}	
	}
	
	public Integer ratingAsInt(){
		return this.rating.intValue()	
	}
	
	public boolean isUploaded() {
		return getUploadStatus() == Video.UPLOAD_FAIL_STATUS || getUploadStatus() == Video.UPLOAD_SUCCESS_STATUS 
	}
	
	static def Video getRandomVideo(){
		def videoN = Video.count()
		def randomN = getRandomNumber(videoN)
		return Video.get(randomN.toLong())
	}

	static def getTopByContent(content, maxNumber=2){
		def aCriteria = Video.createCriteria()
		aCriteria.listDistinct{
			maxResults(maxNumber)
			order("lastUpdate", "desc")
			eq('active',true)
			eq('homeSection', content)
		}		
	}

	static def getTopByRating(maxNumber=2){
		def aCriteria = Video.createCriteria()
		aCriteria.listDistinct{
			maxResults(maxNumber)
			order("rating", "desc")
			eq('active',true)
		}
	}
	
	private static def int getRandomNumber(int to){
		System.out.println 'getRandomNumber - parameter to:' +to
		def random = new Random()
		def randomInt = random.nextInt(to) + 1
		System.out.println 'Video Random Number Generated: '+randomInt
		
		return randomInt
	}	
}
