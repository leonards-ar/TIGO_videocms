grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
//grails.project.war.file = "target/${appName}-${appVersion}.war"
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // uncomment to disable ehcache
        // excludes 'ehcache'
    }
    log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    repositories {
        grailsPlugins()
        grailsHome()
        grailsCentral()

        // uncomment the below to enable remote dependency resolution
        // from public Maven repositories
        mavenLocal()
        mavenCentral()
        mavenRepo "http://snapshots.repository.codehaus.org"
        mavenRepo "http://repository.codehaus.org"
        mavenRepo "http://download.java.net/maven/2/"
        mavenRepo "http://repository.jboss.com/maven2/"
    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

        // runtime 'mysql:mysql-connector-java:5.1.5'
		runtime 'org.apache.ant:ant-jsch:1.7.1',
				'com.jcraft:jsch:0.1.42',
				'org.apache.ant:ant-commons-net:1.7.1',
				'commons-net:commons-net:2.0',
				'commons-httpclient:commons-httpclient:3.1',
				'org.apache.xmlbeans:xmlbeans:2.4.0'
				
		test 'org.apache.ant:ant-jsch:1.7.1',
 			 'com.jcraft:jsch:0.1.42',
			 'org.apache.ant:ant-commons-net:1.7.1',
			 'commons-net:commons-net:2.0',
			 'commons-httpclient:commons-httpclient:3.1',
			 'org.apache.xmlbeans:xmlbeans:2.4.0'

    }
}
