<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
  </head>
  <body>
    <div class="nav">
        <sec:ifAllGranted roles="ROLE_ADMIN">
        	<span class="menuButton"><g:link controller="user" action="list"><g:message code="tigo.videocms.bar.user"/></g:link></span>
        </sec:ifAllGranted>
        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_BACKOFFICE_USER">
        	<span class="menuButton"><g:link controller="video" action="list"><g:message code="tigo.videocms.bar.video"/></g:link></span>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_BACKOFFICE_USER">
            <span class="menuButton"><g:link controller="TVShow" action="list"><g:message code="tigo.videocms.bar.tvshow"/></g:link></span>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_BACKOFFICE_USER">
            <span class="menuButton"><g:link controller="element" action="list"><g:message code="tigo.videocms.bar.element"/></g:link></span>
        </sec:ifAnyGranted>
    </div>
  </body>
</html>
