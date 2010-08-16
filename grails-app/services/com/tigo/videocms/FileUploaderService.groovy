package com.tigo.videocms

class FileUploaderService {
    static transactional = false
	
    def sendFileBySFTP(String host, String user, String password, String srcDir, String srcFile, String destDir) {
		def ant = new AntBuilder()
		
		ant.scp(trust:'true',file:"${srcDir}/${srcFile}",
			todir:"${user}@${host}:${destDir}",
			password:"${password}",verbose:"false");
    }
	
	def sendFileByFTP(String host, String user, String password, String srcDir, String srcFile, String destDir) {
		def ant = new AntBuilder()

		ant.ftp( server:"${host}",
			userid:"${user}",
			password:"${password}",
			passive:"yes",
			verbose:"no",
			remotedir:"${destDir}",
			binary:"yes" ) {
				fileset( dir:"${srcDir}" ) { include( name:"${srcFile}" ) }
			}
	}
	
}
