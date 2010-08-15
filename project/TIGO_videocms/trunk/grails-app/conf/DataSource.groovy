dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	username = "tigo"
	password = "java1234"
}
hibernate {
	cache.use_second_level_cache = true
	cache.use_query_cache = true
	cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "create-drop" // one of 'create', 'create-drop','update'
			url = "jdbc:mysql://localhost/tigo_videocms_db?useUnicode=true&characterEncoding=utf-8"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:hsqldb:mem:testDb"
		}
	}
	production {
		dataSource {
			dbCreate = "create-drop"
			url = "jdbc:mysql://localhost/tigo_videocms_db?useUnicode=true&characterEncoding=utf-8"
		}
	}
}
