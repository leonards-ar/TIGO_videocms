
<%@ page import="com.tigo.videocms.HomePage" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'homePage.label', default: 'HomePage')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <g:if test="${canCreateNewHomePage}">
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
			</g:if>
			<span class="menuButton"><g:link class="list" action="list" controller="homeMainGalleryElement" params="[homePageId: homePageInstance?.id]"><g:message code="default.list.label" args="[message(code: 'homeMainGalleryElement.label', default: 'HomeMainGalleryElement')]" /></g:link></span>
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
                            <td valign="top" class="name"><g:message code="homePage.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: homePageInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="homePage.country.label" default="Country" /></td>
                            
                            <td valign="top" class="value"><g:link controller="country" action="show" id="${homePageInstance?.country?.id}">${homePageInstance?.country?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="homePage.homeMainGalleryElements.label" default="Home Main Gallery Elements" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                           	   <g:set var="elementsPerRow" value="${(int)(650 / (grailsApplication.config.image.list.thumbnail.width + 1))}" /> 
                               <g:set var="emptySlots" value="${(homePageInstance?.homeMainGalleryElements?.size() % elementsPerRow == 0) ? 0 : elementsPerRow - (homePageInstance?.homeMainGalleryElements?.size() % elementsPerRow)}"/>
                               <div id="elementDiv" style="overflow: auto; ${(homePageInstance?.homeMainGalleryElements?.size() > elementsPerRow * 3 ? 'height: 250px;' : '')}">
                               	<table>
                                	<g:each in="${homePageInstance?.homeMainGalleryElements}" status="i" var="homeMainGalleryElementInstance">
                                		<g:if test="${(i % elementsPerRow) == 0}">
                                			<tr>
                                		</g:if>
                               				<td width="${100/elementsPerRow}%">
                               					<table style="border: 0; padding: 1px 1px 1px 1px;">
                               						<tr>
                               							<td style="text-align: center;">
                               							<g:link controller="homeMainGalleryElement" action="show" id="${homeMainGalleryElementInstance?.id}">
                               								<img src="${homeMainGalleryElementInstance?.element?.thumbnailUrl ?: homeMainGalleryElementInstance?.element?.url}" width="${grailsApplication.config.image.list.thumbnail.width}px" border="0" alt="${homeMainGalleryElementInstance?.element?.title}" title="${homeMainGalleryElementInstance?.element?.title}"/>
                               							</g:link>
                               							</td>
                               						</tr>
                               					</table>
                               				</td>
                                		<g:if test="${((i + 1) % elementsPerRow) == 0}">
                                			<tr>
                                		</g:if>												
                                	</g:each>
                                	<g:each in="${(0..<emptySlots)}">
                                		<td align="center" width="${100/elementsPerRow}%">
                                		&nbsp;
                                		</td>
                                	</g:each>
                               		<g:if test="${emptySlots > 0}">
                               			</tr>
                               		</g:if>		                                    	
                               	</table>
                               </div>                            
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${homePageInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
