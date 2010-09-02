import com.tigo.videocms.AudienceRestriction 
import com.tigo.videocms.Country 
import com.tigo.videocms.User
import com.tigo.videocms.Category
import com.tigo.videocms.Video 
import com.tigo.videocms.SecRole
import com.tigo.videocms.SecUser
import com.tigo.videocms.SecUserSecRole
import com.tigo.videocms.TVShow

class BootStrap {
	
	def springSecurityService
	
	def init = { 		
		
		def userBackofficeRole = SecRole.findByAuthority('ROLE_BACKOFFICE_USER') ?: new SecRole(authority: 'ROLE_BACKOFFICE_USER').save(failOnError: true)
		def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)
		
		def honduras = Country.findByCode("HN")?:new Country(code:"HN", name:"HONDURAS")
		.save(failOnError:true)
		
		def salvador = Country.findByCode("SV")?:new Country(code:"SV", name:"EL SALVADOR")
		.save(failOnError:true)
		
		def guatemala = Country.findByCode("GT")?:new Country(code:"GT", name:"GUATEMALA")
		.save(failOnError:true)
		
		def adminUser = User.findByUsername('admin') ?: new User(username: 'admin', password: springSecurityService.encodePassword('admin'), enabled: true,
		email:"admin@mindpool-it.com",firstName:"Admin",lastName:"Admin")
		.addToCountries(salvador)
		.addToCountries(honduras)
		.addToCountries(guatemala)
		.save(failOnError: true)
		
		if (!adminUser.authorities?.contains(adminRole)) {
			SecUserSecRole.create adminUser, adminRole
		}
		
		def cristian = User.findByEmail("cristian@mindpool-it.com")?: new User(username: 'cristian', password: springSecurityService.encodePassword('password'), enabled: true,
		email:"cristian@mindpool-it.com",firstName:"Cristian",lastName:"Nunez")
		.addToCountries(salvador)
		.addToCountries(honduras)
		.save(failOnError:true)
		
		if (!cristian.authorities?.contains(userBackofficeRole)) {
			SecUserSecRole.create cristian, userBackofficeRole
		}
		
		def mariano = User.findByEmail("mariano@mindpool-it.com")?: new User(username: 'mariano', password: springSecurityService.encodePassword('password'), enabled: true,
		email:"mariano@mindpool-it.com", firstName:"Mariano",lastName:"Capurro")
		.addToCountries(honduras)
		.save(failOnError:true)
		
		if (!mariano.authorities?.contains(userBackofficeRole)) {
			SecUserSecRole.create mariano, userBackofficeRole
		}
		
		def categories = ["Todos","Series","Eventos Especiales","Deportes","Trailers","Noticias y Actualidad","Cultura","Estilos y Tendencias","Otros","Adultos"]
		categories.each{
			Category.findByName(it)?:new Category(name:it).save(failOnError:true)
		}
		
		def audiencesRestrictions = ["T", "14", "18", "X"]
		audiencesRestrictions.each{
			AudienceRestriction.findByName(it)?:new AudienceRestriction(name:it).save(failOnError:true)
		}

		def shows = ["Cartoon TV", "Cadbury Ads", "CSI: NY", "Dexter"]
		shows.each{
			TVShow.findByName(it)?:new TVShow(name:it).save(failOnError:true)
		}

		def todos = Category.findByName("Todos")
		def spcEvnts = Category.findByName("Eventos Especiales")
		def deportes = Category.findByName("Deportes")
		
		def restrictionT = AudienceRestriction.findByName("T")
		def restriction14 = AudienceRestriction.findByName("14")
		def restriction18 = AudienceRestriction.findByName("18")
		
		def cartoonTV = TVShow.findByName("Cartoon TV")
		def cadbury = TVShow.findByName("Cadbury Ads")
		
		if(!Video.findByTitle("Gorilla Drummer")){			
			new Video(title:"Gorilla Drummer", duration:"01:30", 
			url:"http://pseudo01.hddn.com/vod/mindpool.mindpoollmtd/demo/gorilla.flv",
			thumbnailUrl:"http://mindpool-it.com/tigo/thumb/gorilla.gif",
			videoKey:'JobN6UuK',
			homeSection:Video.NEW_RELEASE,audienceRestriction: restrictionT, show:cadbury, 
			active:true, rating: 5, uploadStatus:Video.UPLOAD_SUCCESS_STATUS)
			.addToCategories(todos)
			.addToCategories(spcEvnts)
			.addToCountries(salvador)
			.addToCountries(honduras)
			.save(failOnError:true)
		}
		
		if(!Video.findByTitle("The Extremist")){
			new Video(title:"The Extremist", duration:"04:00", 
			url:"http://pseudo01.hddn.com/vod/mindpool.mindpoollmtd/demo/extremists.flv",
			thumbnailUrl:"http://mindpool-it.com/tigo/thumb/extremists.gif", 
			videoKey:'soInU17z',
			homeSection:Video.FULL_EPISODE,
			audienceRestriction: restriction14,
			active:true, rating:3.4, uploadStatus:Video.UPLOAD_SUCCESS_STATUS)
			.addToCategories(todos)
			.addToCategories(deportes)
			.addToCountries(salvador)
			.addToCountries(guatemala)
			.save(failOnError:true)
		}
		
		if(!Video.findByTitle("The lion sleeps tonight")){
			new Video(title:"The lion sleeps tonight", duration:"02:42", 
			url:"http://pseudo01.hddn.com/vod/mindpool.mindpoollmtd/demo/lionsleepstonight.flv",
			thumbnailUrl:"http://mindpool-it.com/tigo/thumb/lionsleepstonight.gif", 
			videoKey:'iW5iQrSS',
			homeSection:Video.NEW_RELEASE, 
			active:true,
			audienceRestriction: restrictionT, show:cartoonTV, rating:4,
			uploadStatus:Video.UPLOAD_SUCCESS_STATUS)
			.addToCategories(todos)
			.addToCountries(honduras)
			.save(failOnError:true)
		}

		if(!Video.findByTitle("HS Americas")){
			new Video(title:"HS Americas", duration:"05:42", 
			url:"http://pseudo01.hddn.com/vod/mindpool.mindpoollmtd/demo/hsamericas.flv",
			thumbnailUrl:"http://mindpool-it.com/tigo/thumb/hsamericas.gif", 
			videoKey:'H2J5lDU4',
			homeSection:Video.FULL_EPISODE, active:true, rating:1,
			uploadStatus:Video.UPLOAD_SUCCESS_STATUS,
			audienceRestriction: restrictionT)
			.addToCategories(todos)
			.addToCountries(honduras)
			.save(failOnError:true)
		}
	}
	
	def destroy = {
	}
}