

<%@ page import="com.tigo.videocms.TVShow" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'TVShow.label', default: 'TVShow')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
            <g:hasErrors bean="${TVShowInstance}">
            <div class="errors">
                <g:renderErrors bean="${TVShowInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="TVShow.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: TVShowInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${TVShowInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="listInTheBest"><g:message code="TVShow.listInTheBest.label" default="List in the Best" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: TVShowInstance, field: 'listInTheBest', 'errors')}">
                                    <g:checkBox name="listInTheBest" value="${TVShowInstance?.listInTheBest}" />
                                </td>
                            </tr>          
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="backgroundImage"><g:message code="TVShow.backgroundImage.label" default="Background Image" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: TVShowInstance, field: 'backgroundImage', 'errors')}">
                                	<g:set var="elementsPerRow" value="${(int)(650 / (grailsApplication.config.image.list.thumbnail.width + 1))}" /> 
                                    <g:set var="emptySlots" value="${(elementList?.size() % elementsPerRow == 0) ? 0 : elementsPerRow - (elementList?.size() % elementsPerRow)}"/>
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
                                    							<td style="text-align: center;"><g:radio name="backgroundImage.id" value="${elementInstance?.id}" checked="${(TVShowInstance?.backgroundImage?.id != null && TVShowInstance?.backgroundImage?.id == elementInstance?.id)}"/></td>
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
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
