<html>
  <head>
    <title>${grailsApplication.config.application.name}</title>
    <meta name="layout" content="main" />
  </head>
  <body>
    <div class="nav">
      <span class="menuButton">
        <sec:ifAllGranted roles="ROLE_ADMIN">
        	<g:link controller="user" action="list"><g:message code="tigo.videocms.bar.user"/></g:link>
        </sec:ifAllGranted>
        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_BACKOFFICE_USER">
        	<g:link controller="video" action="list"><g:message code="tigo.videocms.bar.video"/></g:link>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_BACKOFFICE_USER">
            <g:link controller="TVShow" action="list"><g:message code="tigo.videocms.bar.tvshow"/></g:link>
        </sec:ifAnyGranted>
      </span>
    </div>
  </body>
</html>
