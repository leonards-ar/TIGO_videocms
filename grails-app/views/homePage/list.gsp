
<%@ page import="com.tigo.videocms.HomePage" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'homePage.label', default: 'HomePage')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <g:if test="${canCreateNewHomePage}">
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
			</g:if>
			<span class="menuButton"><g:link class="list" action="list" controller="homeMainGalleryElement" params="[homePageId: homePageInstance?.id]"><g:message code="default.list.label" args="[message(code: 'homeMainGalleryElement.label', default: 'HomeMainGalleryElement')]" /></g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'homePage.id.label', default: 'Id')}" />
                        
                            <th><g:message code="homePage.country.label" default="Country" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${homePageInstanceList}" status="i" var="homePageInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${homePageInstance.id}">${fieldValue(bean: homePageInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: homePageInstance, field: "country")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${homePageInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
