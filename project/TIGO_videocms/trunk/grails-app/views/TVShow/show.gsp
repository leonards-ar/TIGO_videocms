
<%@ page import="com.tigo.videocms.TVShow" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'TVShow.label', default: 'TVShow')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="TVShow.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: TVShowInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="TVShow.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: TVShowInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="TVShow.listInTheBest.label" default="List in the Best" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${TVShowInstance?.listInTheBest}" /></td>
                            
                        </tr> 
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="TVShow.backgroundImage.label" default="Background Image" /></td>
                            
                            <td valign="top" class="value">
                            	<g:if test="${TVShowInstance?.backgroundImage}">
                            	<img src="${TVShowInstance?.backgroundImage?.thumbnailUrl ?: TVShowInstance?.backgroundImage?.url}" width="${grailsApplication.config.image.list.thumbnail.width}px" border="0" alt="${TVShowInstance?.backgroundImage?.title}" title="${TVShowInstance?.backgroundImage?.title}"/>
                            	</g:if>
                            	<g:else>
                            	&nbsp;
                            	</g:else>
                            </td>
                            
                        </tr>                                            
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${TVShowInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
