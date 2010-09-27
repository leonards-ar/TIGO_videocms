

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
			<span class="menuButton"><g:link class="list" action="list" controller="homeMainGalleryElement" params="[homePageId: homePageInstance?.id]"><g:message code="default.list.label" args="[message(code: 'homeMainGalleryElement.label', default: 'HomeMainGalleryElement')]" /></g:link></span>
            
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
                                    <g:select disabled="true" name="country.id" from="${availableCountries}" optionKey="id" value="${homePageInstance?.country?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="homeMainGalleryElements"><g:message code="homePage.homeMainGalleryElements.label" default="Home Main Gallery Elements" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: homePageInstance, field: 'homeMainGalleryElements', 'errors')}">
									<g:set var="divHeight" value="${(elementList?.size() > 10 || homePageInstance?.homeMainGalleryElements?.size() > 10 ? 'height: 250px;' : 'height: 100%;')}"/>	                                	
                                    <table>
                                    	<tr><td>
                                    <table class="nostyle" style="width: 150px; border: 0;">
                                    	<tr>
                                    		<td valign="top" align="center" class="name"><g:message code="homePage.homeMainGalleryElements.available.label"/></td>
                                    		<td>&nbsp;</td>
                                    		<td valign="top" align="center" class="name"><g:message code="homePage.homeMainGalleryElements.selected.label"/></td>                                    		
                                    	</tr>
                                    	<tr>
	                                    	<td class="nostyle" style="text-align: center; vertical-align: middle; border: 1px solid #ccc;">
	                                    		<!-- Available Home Main Gallery Elements -->
			                                    <div id="availableElementDiv" style="overflow: auto; ${divHeight}">
                                   					<table class="nostyle">
                                   						<g:if test="${availableElementList?.size() <= 0}">
                                   						<tr>
                                   							<td style="text-align: center; vertical-align: middle;" nowrap="nowrap">
                                   							<g:message code="homePage.homeMainGalleryElements.available.empty" default="No available elements" />
                                   							</td>
                                   						</tr>
                                   						</g:if>
                                   						<g:each in="${availableElementList}" status="i" var="homeMainGalleryElementInstance">
                                   						<tr>
                                   							<td style="text-align: center; vertical-align: middle;">
                                   								<g:checkBox name="selectedHomeMainGalleryElement" value="${homeMainGalleryElementInstance?.id}" />
                                   							</td>
                                   							<td style="text-align: center;">
                                   								<img src="${homeMainGalleryElementInstance?.element?.thumbnailUrl ?: homeMainGalleryElementInstance?.element?.url}" height="${grailsApplication.config.image.list.thumbnail.height}px" border="0" alt="${homeMainGalleryElementInstance?.element?.title}" title="${homeMainGalleryElementInstance?.element?.title}"/>
                                   							</td>
                                   						</tr>
                                   						</g:each>
                                   					</table>			                                    	
			                                    </div>
	                                    		<!-- Available Home Main Gallery Elements -->
	                                    	</td>
	                                    	<td class="nostyle">
	                                    		<!-- Selection Buttons -->
	                                    		<table class="nostyle">
	                                    			<tr class="nostyle"><td class="nostyle">
	                                    			<g:if test="${availableElementList?.size() > 0}">
	                                    			<g:actionSubmitImage action="addElements" value="${message(code: 'homePage.homeMainGalleryElements.add.label', default: 'Add')}" src="${resource(dir:'images',file:'right.png')}" />
	                                    			</g:if>
	                                    			<g:else>
	                                    			&nbsp;
	                                    			</g:else>
	                                    			</td></tr>
													<tr class="nostyle"><td class="nostyle">
	                                    			<g:if test="${homePageInstance?.homeMainGalleryElements?.size() > 0}">
	                                    			<g:actionSubmitImage action="removeElements" value="${message(code: 'homePage.homeMainGalleryElements.remove.label', default: 'Remove')}" src="${resource(dir:'images',file:'left.png')}" />
	                                    			</g:if>
	                                    			<g:else>
	                                    			&nbsp;
	                                    			</g:else>
	                                    			</td></tr>
	                                    		</table>
	                                    		<!-- Selection Buttons -->
	                                    	</td>
	                                    	<td style="text-align: center; vertical-align: middle; border: 1px solid #ccc;">
	                                    		<!-- Selected Home Main Gallery Elements -->
			                                    <div id="selectedElementDiv" style="overflow: auto; ${divHeight}">
                                   					<table class="nostyle">
                                   						<g:each in="${homePageInstance?.homeMainGalleryElements}" status="i" var="homeMainGalleryElementInstance">
                                   						<tr>
                                   							<td style="text-align: center; vertical-align: middle;">
                                   								<g:checkBox name="selectedHomeMainGalleryElement" value="${homeMainGalleryElementInstance?.id}" />
                                   								<g:hiddenField name="homeMainGalleryElements" value="${homeMainGalleryElementInstance?.id}" />
                                   							</td>
                                   							<td style="text-align: center;">
                                   								<img src="${homeMainGalleryElementInstance?.element?.thumbnailUrl ?: homeMainGalleryElementInstance?.element?.url}" height="${grailsApplication.config.image.list.thumbnail.height}px" border="0" alt="${homeMainGalleryElementInstance?.element?.title}" title="${homeMainGalleryElementInstance?.element?.title}"/>
                                   							</td>
                                   							<td style="text-align: center; vertical-align: middle;">
                                   								<table style="border: 0; padding: 0;">
                                   									<tr>
                                   										<td>
                                   										<g:if test="${i > 0}">
                                   										<g:actionSubmitImage action="addElements" value="${message(code: 'homePage.homeMainGalleryElements.up.label', default: 'Up')}" src="${resource(dir:'images',file:'up.png')}" />
                                   										</g:if>
                                   										<g:else>
                                   										&nbsp;
                                   										</g:else>
                                   										</td>
                                   										<td>
                                   										<g:if test="${i < (homePageInstance?.homeMainGalleryElements?.size() - 1)}">
                                   										<g:actionSubmitImage action="addElements" value="${message(code: 'homePage.homeMainGalleryElements.down.label', default: 'Down')}" src="${resource(dir:'images',file:'down.png')}" />
                                   										</g:if>
                                   										<g:else>
                                   										&nbsp;
                                   										</g:else>
                                   										</td>                                   										
                                   									</tr>
                                   								</table>
                                   							</td>
                                   						</tr>
                                   						</g:each>
                                   					</table>			                                    
			                                    </div>
			                                    <!-- Selected Home Main Gallery Elements -->
	                                    	</td>
                                    	</tr>
                                    </table>                                    	
                                    	</td></tr>
                                    </table>
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
