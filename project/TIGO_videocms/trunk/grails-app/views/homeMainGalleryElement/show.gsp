
<%@ page import="com.tigo.videocms.HomeMainGalleryElement" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'homeMainGalleryElement.label', default: 'HomeMainGalleryElement')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="list" action="list" controller="homePage"><g:message code="default.list.label" args="[message(code: 'homePage.label', default: 'HomePage')]" /></g:link></span>
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
                            <td valign="top" class="name"><g:message code="homeMainGalleryElement.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: homeMainGalleryElementInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="homeMainGalleryElement.element.label" default="Element" /></td>
                            
                            <td valign="top" class="value"><g:link controller="element" action="show" id="${homeMainGalleryElementInstance?.element?.id}">${homeMainGalleryElementInstance?.element?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="homeMainGalleryElement.active.label" default="Active" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${homeMainGalleryElementInstance?.active}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="homeMainGalleryElement.target.label" default="Target" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: homeMainGalleryElementInstance, field: "target")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="homeMainGalleryElement.targetUrl.label" default="Target Url" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: homeMainGalleryElementInstance, field: "targetUrl")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="homeMainGalleryElement.text.label" default="Text" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: homeMainGalleryElementInstance, field: "text")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${homeMainGalleryElementInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
