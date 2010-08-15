<html>
  <head>
    <title>${grailsApplication.config.application.name}</title>
    <meta name="layout" content="main" />
  </head>
  <body>
    <div class="nav">
      <span class="menuButton">
        <g:link controller="user" action="list"><g:message code="tigo.videocms.bar.user"/></g:link>
        <g:link controller="video" action="list"><g:message code="tigo.videocms.bar.video"/></g:link>
      </span>
    </div>
  </body>
</html>
