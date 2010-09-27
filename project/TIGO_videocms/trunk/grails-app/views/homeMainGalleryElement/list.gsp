
<%@ page import="com.tigo.videocms.HomeMainGalleryElement" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'homeMainGalleryElement.label', default: 'HomeMainGalleryElement')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="id" title="${message(code: 'homeMainGalleryElement.id.label', default: 'Id')}" />

                            <th><g:message code="homeMainGalleryElement.element.thumbnail.label" default="Thumbnail" /></th>

                            <th><g:message code="homeMainGalleryElement.element.title.label" default="Title" /></th>
                        
                            <g:sortableColumn property="active" title="${message(code: 'homeMainGalleryElement.active.label', default: 'Active')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${homeMainGalleryElementInstanceList}" status="i" var="homeMainGalleryElementInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${homeMainGalleryElementInstance.id}">${fieldValue(bean: homeMainGalleryElementInstance, field: "id")}</g:link></td>

							<td><img border="0" src="${homeMainGalleryElementInstance?.element?.thumbnailUrl}" height="${grailsApplication.config.image.list.thumbnail.height}" border="0" alt="${homeMainGalleryElementInstance?.element?.title}" title="${homeMainGalleryElementInstance?.element?.title}"/></td>                        

                            <td>${fieldValue(bean: homeMainGalleryElementInstance, field: "element.title")}</td>
                        
                            <td><g:formatBoolean boolean="${homeMainGalleryElementInstance.active}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${homeMainGalleryElementInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
