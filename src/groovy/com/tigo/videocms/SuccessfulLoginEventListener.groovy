package com.tigo.videocms

import org.springframework.context.ApplicationListener 
import org.springframework.security.authentication.event.AuthenticationSuccessEvent

class SuccessfulLoginEventListener implements ApplicationListener<AuthenticationSuccessEvent> {

	void onApplicationEvent(AuthenticationSuccessEvent event) {
		//In case we need to something at Login
	}
}

