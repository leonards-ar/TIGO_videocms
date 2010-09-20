

<%@ page import="com.tigo.videocms.HomePage" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'homePage.label', default: 'HomePage')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${homePageInstance}">
            <div class="errors">
                <g:renderErrors bean="${homePageInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${homePageInstance?.id}" />
                <g:hiddenField name="version" value="${homePageInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="country"><g:message code="homePage.country.label" default="Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: homePageInstance, field: 'country', 'errors')}">
                                    <g:select name="country.id" from="${com.tigo.videocms.Country.list()}" optionKey="id" value="${homePageInstance?.country?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="homeMainGalleryElements"><g:message code="homePage.homeMainGalleryElements.label" default="Home Main Gallery Elements" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: homePageInstance, field: 'homeMainGalleryElements', 'errors')}">
                                    <g:select name="homeMainGalleryElements" from="${com.tigo.videocms.HomeMainGalleryElement.list()}" multiple="yes" optionKey="id" size="5" value="${homePageInstance?.homeMainGalleryElements*.id}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
