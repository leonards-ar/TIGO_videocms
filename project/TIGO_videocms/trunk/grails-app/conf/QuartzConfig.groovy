
quartz {
	autoStartup = true
	jdbcStore = false
	waitForJobsToCompleteOnShutdown = true
}

environments {
	development {
		quartz { autoStartup = false }
	}
	test {
		quartz { autoStartup = true }
	}
}
