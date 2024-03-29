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
			url = "jdbc:mysql://devdb/tigo_videocms_db?useUnicode=true&characterEncoding=utf-8"
			loggingSql = true
		}
	}
	test {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:mysql://localhost/tigo_videocms_db?useUnicode=true&characterEncoding=utf-8"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://localhost/tigo_videocms_db?useUnicode=true&characterEncoding=utf-8"
		}
	}
}
