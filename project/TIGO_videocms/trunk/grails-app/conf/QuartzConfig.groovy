
quartz {
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
	production {
		quartz { autoStartup = true }
	}
}
