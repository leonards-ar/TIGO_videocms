<%@ page import="com.tigo.videocms.HomeMainGalleryElement" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'homeMainGalleryElement.label', default: 'HomeMainGalleryElement')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <resource:richTextEditor />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
   	        <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${homeMainGalleryElementInstance}">
            <div class="errors">
                <g:renderErrors bean="${homeMainGalleryElementInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
            	<g:hiddenField name="homePageId" value="${homePageId}" />
            	
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="element"><g:message code="homeMainGalleryElement.element.label" default="Element" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: homeMainGalleryElementInstance, field: 'element', 'errors')}">
                                	<g:set var="elementsPerRow" value="${(int)(650 / (grailsApplication.config.image.list.thumbnail.width + 1))}" /> 
                                    <g:set var="emptySlots" value="${(elementList.size() % elementsPerRow == 0) ? 0 : elementsPerRow - (elementList.size() % elementsPerRow)}"/>
                                    <div id="elementDiv" style="overflow: auto; ${(elementList?.size() > elementsPerRow * 3 ? 'height: 250px;' : '')}">
                                    	<table>
	                                    	<g:each in="${elementList}" status="i" var="elementInstance">
	                                    		<g:if test="${(i % elementsPerRow) == 0}">
	                                    			<tr>
	                                    		</g:if>
                                    				<td width="${100/elementsPerRow}%">
                                    					<table style="border: 0; padding: 1px 1px 1px 1px;">
                                    						<tr>
                                    							<td style="text-align: center;"><img src="${elementInstance?.thumbnailUrl ?: elementInstance?.url}" width="${grailsApplication.config.image.list.thumbnail.width}px" border="0" alt="${elementInstance?.title}" title="${elementInstance?.title}"/></td>
                                    						</tr>
                                    						<tr>
                                    							<td style="text-align: center;"><g:radio name="element.id" value="${elementInstance?.id}" checked="${(homeMainGalleryElementInstance?.element?.id != null && homeMainGalleryElementInstance?.element?.id == elementInstance?.id)}"/></td>
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="active"><g:message code="homeMainGalleryElement.active.label" default="Active" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: homeMainGalleryElementInstance, field: 'active', 'errors')}">
                                    <g:checkBox name="active" value="${homeMainGalleryElementInstance?.active}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="target"><g:message code="homeMainGalleryElement.target.label" default="Target" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: homeMainGalleryElementInstance, field: 'target', 'errors')}">
                                    <g:textField name="target" value="${homeMainGalleryElementInstance?.target}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="targetUrl"><g:message code="homeMainGalleryElement.targetUrl.label" default="Target Url" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: homeMainGalleryElementInstance, field: 'targetUrl', 'errors')}">
                                    <g:textField name="targetUrl" value="${homeMainGalleryElementInstance?.targetUrl}" size="80" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="text"><g:message code="homeMainGalleryElement.text.label" default="Text" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: homeMainGalleryElementInstance, field: 'text', 'errors')}">
                                	<richui:richTextEditor name="text" value="${homeMainGalleryElementInstance?.text}" width="500"/>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
