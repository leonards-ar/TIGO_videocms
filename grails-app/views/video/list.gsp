
<%@ page import="com.tigo.videocms.Video" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'video.label', default: 'Video')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'video.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'video.title.label', default: 'Title')}" />
                                                                        
                            <g:sortableColumn property="show" title="${message(code: 'video.show.label', default: 'TV Show')}" />
                                                    
                            <g:sortableColumn property="duration" title="${message(code: 'video.duration.label', default: 'Duration')}" />                    

                            <g:sortableColumn property="homeSection" title="${message(code: 'video.homeSection.label', default: 'Home Section')}" />                    

                            <g:sortableColumn property="lastUpdate" title="${message(code: 'video.uploadstatus.label', default: 'Upload Status')}" />

                            <g:sortableColumn property="lastUpdate" title="${message(code: 'video.lastUpdate.label', default: 'Last Update')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${videoInstanceList}" status="i" var="videoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${videoInstance.id}">${fieldValue(bean: videoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: videoInstance, field: "title")}</td>
                                                                        
                            <td>${fieldValue(bean: videoInstance, field: "show")}</td>
                        
                            <td>${fieldValue(bean: videoInstance, field: "duration")}</td>

                            <td>${fieldValue(bean: videoInstance, field: "homeSection")}</td>  

                            <td>${fieldValue(bean: videoInstance, field: "uploadStatus")}</td>  

                            <td><g:formatDate date="${videoInstance.lastUpdate}" /></td>                                                  
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${videoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
