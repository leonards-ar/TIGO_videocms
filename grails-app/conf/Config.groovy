// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if(System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
		xml: ['text/xml', 'application/xml'],
		text: 'text/plain',
		js: 'text/javascript',
		rss: 'application/rss+xml',
		atom: 'application/atom+xml',
		css: 'text/css',
		csv: 'text/csv',
		all: '*/*',
		json: ['application/json','text/json'],
		form: 'application/x-www-form-urlencoded',
		multipartForm: 'multipart/form-data'
		]
// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// whether to install the java.util.logging bridge for sl4j. Disable for AppEngine!
grails.logging.jul.usebridge = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []

// set per-environment serverURL stem for creating absolute links
image.list.thumbnail.height = 30
image.list.thumbnail.width = 100
environments {
	production {
		sfu.tempUploadDirectory = "/tmp/"
		grails.serverURL = "http://www.tigotvonline.com/${appName}"
		uploadServerLocation = "/var/www/elements_tigo/"
		uploadBaseUrl = "http://www.tigotvonline.com/elements_tigo/"
		videoUploadUrl = "http://content.bitsontherun.com/videos/"
		thumbnailUploadUrl = "http://content.bitsontherun.com/thumbs/"
		videoUploadRetries = 3
		videoDeleteTmpFile = true
		bi.renderingEngine = RenderingEngine.IMAGE_MAGICK
		bi.imageMagickQuality = 100
		bi.imageMagickCompression= 0
	}
	
	development {
		sfu.tempUploadDirectory = "d:\\tigo\\"
		grails.serverURL = "http://localhost:8080/${appName}"
		uploadServerLocation = "d:\\tigo\\"
		uploadBaseUrl = "http://localhost:8080/tigo/"
		videoUploadUrl = "http://content.bitsontherun.com/videos/"
		thumbnailUploadUrl = "http://content.bitsontherun.com/thumbs/"
		videoUploadRetries = 3
		videoDeleteTmpFile = true
	}
	
	test {
		sfu.tempUploadDirectory = "/tmp/"
		grails.serverURL = "http://labs.mindpool.com.ar:8080/${appName}"
		videoUploadUrl = "http://content.bitsontherun.com/videos/"
		uploadServerLocation = "/var/www/elements_tigo/"
		uploadBaseUrl = "http://labs.mindpool.com.ar/elements_tigo/"
		thumbnailUploadUrl = "http://content.bitsontherun.com/thumbs/"
		videoUploadRetries = 3
		videoDeleteTmpFile = true
		bi.renderingEngine = RenderingEngine.IMAGE_MAGICK
		bi.imageMagickQuality = 100
		bi.imageMagickCompression= 0
	}
}

// log4j configuration
log4j = {
	// Example of changing the log pattern for the default console
	// appender:
	//
	
	error	'org.codehaus.groovy.grails.web.servlet',  //  controllers
			'org.codehaus.groovy.grails.web.pages', //  GSP
			'org.codehaus.groovy.grails.web.sitemesh', //  layouts
			'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
			'org.codehaus.groovy.grails.web.mapping', // URL mapping
			'org.codehaus.groovy.grails.commons', // core / classloading
			'org.codehaus.groovy.grails.plugins', // plugins
			'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
			'org.springframework',
			'org.hibernate',
			'net.sf.ehcache.hibernate'
	
	warn	'org.mortbay.log'
	
	info	'grails.app.task'

	debug	'com.tigo.videocms',
			'ar.com.mindpool'
			

	appenders {
		console name:'stdout', layout:pattern(conversionPattern: '[%d{ISO8601}]%10p %C{1} - %m%n')
	}
	
	root {
	    error 'stdout'
	    additivity = true
	}
}

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'com.tigo.videocms.SecUser'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'com.tigo.videocms.SecUserSecRole'
grails.plugins.springsecurity.authority.className = 'com.tigo.videocms.SecRole'
grails.plugins.springsecurity.rejectIfNoRule = false

grails.plugins.springsecurity.useSecurityEventListener = true
