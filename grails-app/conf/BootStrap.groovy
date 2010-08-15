import com.tigo.videocms.AudienceRestriction 
import com.tigo.videocms.Country 
import com.tigo.videocms.User
import com.tigo.videocms.Category
import com.tigo.videocms.Video 

class BootStrap {
	
	def init = { 		
		
		def ireland = Country.findByCode("IE")?:new Country(code:"IE", name:"IRELAND")
		.save(failOnError:true)
		
		def argentina = Country.findByCode("AR")?:new Country(code:"AR", name:"ARGENTINA")
		.save(failOnError:true)
		
		if(!User.findByEmail("cristian@mindpool-it.com")) {
			new User(email:"cristian@mindpool-it.com",firstName:"Cristian",lastName:"Nunez")
			.addToCountries(ireland)
			.addToCountries(argentina)
			.save(failOnError:true)
		}
		
		if (!User.findByEmail("mariano@mindpool-it.com")) { 	
			new User(email:"mariano@mindpool-it.com", firstName:"Mariano",lastName:"Capurro")
			.addToCountries(argentina)
			.save(failOnError:true)
		}
		
		def categories = ["Todos","Series","Eventos Especiales","Deportes","Trailers","Noticias y Actualidad","Cultura","Estilos y Tendencias","Otros","Adultos"]
		categories.each{
			Category.findByName(it)?:new Category(name:it).save(failOnError:true)
		}
		
		def audiencesRestrictions = ["G", "PG", "PG-13", "R", "NC-17"]
		audiencesRestrictions.each{
			AudienceRestriction.findByName(it)?:new AudienceRestriction(name:it).save(failOnError:true)
		}
		
		def todos = Category.findByName("Todos");
		def spcEvnts = Category.findByName("Eventos Especiales");
		def deportes = Category.findByName("Deportes");
		
		def restrictionPG = AudienceRestriction.findByName("PG")
		def restrictionG = AudienceRestriction.findByName("G")
		def restrictionPG13 = AudienceRestriction.findByName("PG-13")
		
		
		if(!Video.findByTitle("Gorilla Drummer")){			
			new Video(title:"Gorilla Drummer", duration:1.5, url:"http://pseudo01.hddn.com/vod/mindpool.mindpoollmtd/demo/gorilla.flv")
			.addToCategories(todos)
			.addToCategories(spcEvnts)
			.addToAudienceRestrictions(restrictionPG)
			.addToCountries(ireland)
			.addToCountries(argentina)
			.save(failOnError:true)
		}
		
		if(!Video.findByTitle("The Extremist")){
			new Video(title:"The Extremist", duration:4, url:"http://pseudo01.hddn.com/vod/mindpool.mindpoollmtd/demo/extremists.flv")
			.addToCategories(todos)
			.addToCategories(deportes)
			.addToAudienceRestrictions(restrictionPG13)
			.addToCountries(ireland)
			.save(failOnError:true)
		}
		
		if(!Video.findByTitle("The lion sleeps tonight")){
			new Video(title:"The lion sleeps tonight", duration:2.61, url:"http://pseudo01.hddn.com/vod/mindpool.mindpoollmtd/demo/lionsleepstonight.flv")
			.addToCategories(todos)
			.addToAudienceRestrictions(restrictionG)
			.addToCountries(argentina)
			.save(failOnError:true)
		}
	}
	
	def destroy = {
	}
}
