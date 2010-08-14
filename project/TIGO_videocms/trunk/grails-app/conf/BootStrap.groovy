import com.tigo.videocms.Country 
import com.tigo.videocms.User

class BootStrap {
	
	def init = { 		
		
		def ireland = Country.findByCode("IE")?:new Country(code:"IE", name:"IRELAND")
		.save(failOnError:true)
		
		def argentina = Country.findByCode("AR")?:new Country(code:"AR", name:"ARGENTINA")
		.save(failOnError:true)
		
		if(!User.findByEmail("cristian@mindpool-it.com")) {
			new User(email:"cristian@mindpool-it.com")
			.addToCountries(ireland)
			.addToCountries(argentina)
			.save(failOnError:true)
		}
		
		if (!User.findByEmail("mariano@mindpool-it.com")) { 	
			new User(email:"mariano@mindpool-it.com")
			.addToCountries(argentina)
			.save(failOnError:true)
		}
	}
	
	def destroy = {
	}
}
