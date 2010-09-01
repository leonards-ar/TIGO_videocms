
<%@ page import="com.tigo.videocms.Video" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'video.label', default: 'Video')}" />
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
                            <td valign="top" class="name"><g:message code="video.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: videoInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="video.title.label" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: videoInstance, field: "title")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="video.show.label" default="TV Show" /></td>                            
                            <td valign="top" class="value">${fieldValue(bean: videoInstance, field: "show")}</td>                            
                        </tr>
                                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="video.season.label" default="Season" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: videoInstance, field: "season")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="video.episode.label" default="Episode Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: videoInstance, field: "episode")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="video.episodeName.label" default="Episode Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: videoInstance, field: "episodeName")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="video.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">
                            	<g:textArea name="description" value="${videoInstance?.description}"  rows="7" cols="40" readonly="true" />                                    
							</td>                           
                        </tr>
                                            
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="video.url.label" default="Url" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: videoInstance, field: "url")}</td>
                            
                        </tr>
                                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="video.thumbnailUrl.label" default="Thumbnail Url" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: videoInstance, field: "thumbnailUrl")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="video.duration.label" default="Duration (mm:ss)" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: videoInstance, field: "duration")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="video.active.label" default="Active" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${videoInstance?.active}" /></td>
                            
                        </tr>
                                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="video.rating.label" default="Rating" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: videoInstance, field: "rating")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="video.homeSection.label" default="Home Section" /></td>
                            <td valign="top" class="value">${fieldValue(bean: videoInstance, field: "homeSection")}</td>                            
                       </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="video.audienceRestriction.label" default="Audience Restriction" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${videoInstance.audienceRestriction}" var="a">
                                    <li>${a?.encodeAsHTML()}</li>
                                </g:each>
                                </ul>
                            </td>                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="video.categories.label" default="Categories" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${videoInstance.categories}" var="c">
                                    <li>${c?.encodeAsHTML()}</li>
                                </g:each>
                                </ul>
                            </td>                           
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="video.countries.label" default="Countries" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${videoInstance.countries}" var="c">
                                    <li>${c?.encodeAsHTML()}</li>
                                </g:each>
                                </ul>
                            </td>                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="video.uploadStatus.label" default="Upload Status" /></td>
                            <td valign="top" class="value">${fieldValue(bean: videoInstance, field: "uploadStatus")}</td>                            
                       </tr>

						<tr class="prop">
						    <td valign="top" class="name">
						      <label for="uploadDate"><g:message code="video.uploadDate.label" default="Upload Date" /></label>
						    </td>
						    <td valign="top" class="value ${hasErrors(bean: videoInstance, field: 'uploadDate', 'errors')}">
						        <g:formatDate date="${videoInstance?.uploadDate}" />                           
						    </td>
						</tr>
						
						<tr class="prop">
						    <td valign="top" class="name">
						      <label for="lastUpdate"><g:message code="video.lastUpdate.label" default="Last Update" /></label>
						    </td>
						    <td valign="top" class="value">
						        <g:formatDate date="${videoInstance?.lastUpdate}" />                           
						    </td>
						</tr>                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${videoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
