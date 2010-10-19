import com.tigo.videocms.AudienceRestriction 
import com.tigo.videocms.Country 
import com.tigo.videocms.CountryVideo 
import com.tigo.videocms.ElementType;
import com.tigo.videocms.HomePage;
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
		
		def honduras = Country.findByCode("HN")?:new Country(code:"HN", name:"Honduras")
		.save(failOnError:true)
		
		def salvador = Country.findByCode("SV")?:new Country(code:"SV", name:"El Salvador")
		.save(failOnError:true)
		
		def guatemala = Country.findByCode("GT")?:new Country(code:"GT", name:"Guatemala")
		.save(failOnError:true)

		def homeMainGallery = ElementType.findByLabelKey("home_main_gallery")?:new ElementType(name:"Home Main Gallery Component", description:"Pictures that will be displayed in the home page main gallery component", labelKey:"home_main_gallery",allowedExtensions:"gif,jpg,png", width:490, height:300, maxSize:100.00).save(failOnError:true)
		def videoThumbnail = ElementType.findByLabelKey("video_thumbnail")?:new ElementType(name:"Video Thumbnail", description:"Video Thumbnail", labelKey:"video_thumbnail",allowedExtensions:"gif,jpg,png", width:300, height:300, maxSize:100.00).save(failOnError:true)

		def hondurasHomePage = HomePage.findByCountry(honduras)?:new HomePage(country:honduras)	
		.save(failOnError:true)
		def salvadorHomePage = HomePage.findByCountry(salvador)?:new HomePage(country:salvador)
		.save(failOnError:true)
		def guatemalaHomePage = HomePage.findByCountry(guatemala)?:new HomePage(country:guatemala)
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

		def shows = ["Programa Test 1", "Programa Test 2", "Programa Test 3", "Programa Test 4"]
		shows.each{
			TVShow.findByName(it)?:new TVShow(name:it).save(failOnError:true)
		}

		def todos = Category.findByName("Todos")
		def spcEvnts = Category.findByName("Eventos Especiales")
		def deportes = Category.findByName("Deportes")
		
		def restrictionT = AudienceRestriction.findByName("T")
		def restriction14 = AudienceRestriction.findByName("14")
		def restriction18 = AudienceRestriction.findByName("18")
		
		def show1 = TVShow.findByName("Programa Test 1")
		def show2 = TVShow.findByName("Programa Test 2")
		
		if(!Video.findByTitle("Que si, que no")){			
			new Video(title:"Que si, que no", duration:"00:29", 
			url:"http://content.bitsontherun.com/players/ug3RJ4Ac-n7QZPPH0.js",
			thumbnailUrl:"http://content.bitsontherun.com/thumbs/ug3RJ4Ac.jpg", 
			videoKey:'ug3RJ4Ac',
			homeSection:Video.NEW_RELEASE,audienceRestriction: restrictionT, show:show1, 
			active:true, rating: 5, uploadStatus:Video.UPLOAD_SUCCESS_STATUS)
			.addToCategories(todos)
			.addToCategories(spcEvnts)
			.addToCountryVideos(country: salvador)
			.addToCountryVideos(country: honduras)
			.save(failOnError:true)
		}
		
		if(!Video.findByTitle("Fans")){
			new Video(title:"Fans", duration:"00:25", 
			url:"http://content.bitsontherun.com/players/GOTiSZjO-n7QZPPH0.js",
			thumbnailUrl:"http://content.bitsontherun.com/thumbs/GOTiSZjO.jpg", 
			videoKey:'GOTiSZjO',
			homeSection:Video.FULL_EPISODE,
			audienceRestriction: restriction14,
			active:true, rating:3.4, uploadStatus:Video.UPLOAD_SUCCESS_STATUS)
			.addToCategories(todos)
			.addToCategories(deportes)
			.addToCountryVideos(country: salvador)
			.addToCountryVideos(country: guatemala)
			.save(failOnError:true)
		}
		
		if(!Video.findByTitle("Poirot")){
			new Video(title:"Poirot", duration:"00:30", 
			url:"http://content.bitsontherun.com/players/qipr65jv-n7QZPPH0.js",
			thumbnailUrl:"http://content.bitsontherun.com/thumbs/qipr65jv.jpg", 
			videoKey:'qipr65jv',
			homeSection:Video.NEW_RELEASE, 
			active:true,
			audienceRestriction: restrictionT, show:show2, rating:4,
			uploadStatus:Video.UPLOAD_SUCCESS_STATUS)
			.addToCategories(todos)
			.addToCountryVideos(country: honduras)
			.save(failOnError:true)
		}

		if(!Video.findByTitle("Dr. Martin")){
			new Video(title:"Dr. Martin", duration:"00:25", 
			url:"http://content.bitsontherun.com/players/UEGomhRo-n7QZPPH0.js",
			thumbnailUrl:"http://content.bitsontherun.com/thumbs/UEGomhRo.jpg", 
			videoKey:'UEGomhRo',
			homeSection:Video.FULL_EPISODE, active:true, rating:1,
			uploadStatus:Video.UPLOAD_SUCCESS_STATUS,
			audienceRestriction: restrictionT)
			.addToCategories(todos)
			.addToCountryVideos(country: honduras)
			.save(failOnError:true)
		}
	}
	
	def destroy = {
	}
}
