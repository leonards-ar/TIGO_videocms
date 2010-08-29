

<%@ page import="com.tigo.videocms.Video" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'video.label', default: 'Video')}" />
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
            <g:hasErrors bean="${videoInstance}">
            <div class="errors">
                <g:renderErrors bean="${videoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" enctype="multipart/form-data" method="post">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title"><g:message code="video.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: videoInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${videoInstance?.title}" />
                                </td>
                            </tr>
                                                
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="season"><g:message code="video.season.label" default="Season" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: videoInstance, field: 'season', 'errors')}">
                                    <g:textField name="season" value="${fieldValue(bean: videoInstance, field: 'season')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="episode"><g:message code="video.episode.label" default="Episode Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: videoInstance, field: 'episode', 'errors')}">
                                    <g:textField name="episode" value="${fieldValue(bean: videoInstance, field: 'episode')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="episodeName"><g:message code="video.episodeName.label" default="Episode Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: videoInstance, field: 'episodeName', 'errors')}">
                                    <g:textField name="episodeName" value="${videoInstance?.episodeName}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="video.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: videoInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" value="${videoInstance?.description}"  rows="7" cols="40"/>                                    
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="url"><g:message code="video.movieFile.label" default="File Upload" /></label>
                                </td>
                                <td valign="top" class="value">
									<input type="file" name="movieFile" />
								</td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="url"><g:message code="video.thumbnail.label" default="Thumbnail Upload" /></label>
                                </td>
                                <td valign="top" class="value">
									<input type="file" name="thumbnail"/>
								</td>
                            </tr>
                                                                                
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="url"><g:message code="video.url.label" default="Url" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textField name="url" value="${videoInstance?.url}" />
                                </td>
                            </tr>
                                                
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="thumbnailUrl"><g:message code="video.thumbnailUrl.label" default="Thumbnail Url" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textField name="thumbnailUrl" value="${videoInstance?.thumbnailUrl}" />
                                </td>
                            </tr>
<!-- Descomentar cuando implementemos url con duracion
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="duration"><g:message code="video.duration.label" default="Duration (mm:ss)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: videoInstance, field: 'duration', 'errors')}">
                                    <g:textField name="duration" value="${fieldValue(bean: videoInstance, field: 'duration')}" />
                                </td>
                            </tr>
 -->                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="active"><g:message code="video.active.label" default="Active" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: videoInstance, field: 'active', 'errors')}">
                                    <g:checkBox name="active" value="${videoInstance?.active}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rating"><g:message code="video.rating.label" default="Rating" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: videoInstance, field: 'rating', 'errors')}">
                                    <g:textField name="rating" value="${fieldValue(bean: videoInstance, field: 'rating')}" />
                                </td>
                            </tr>

							<tr class="prop">
							  <td valign="top" class="name">
							    <label for="dose"><g:message code="video.homeSection.label" default="Home Section" />:</label>
							  </td>
							  <td valign="top" class="value ${hasErrors(bean: videoInstance, field: 'homeSection', 'errors')}">
							    	<g:select name="homeSection" from="${com.tigo.videocms.Video.HOME_SECTIONS}" size="1" value="${fieldValue(bean: videoInstance, field: 'homeSection')}" noSelection="['':'NO_HOME_SECTION']"/>
							  </td>
							</tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="audienceRestriction"><g:message code="video.audienceRestrictions.label" default="Audience Restriction" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: videoInstance, field: 'audienceRestriction', 'errors')}">
                                    <g:select name="audienceRestriction.id" from="${com.tigo.videocms.AudienceRestriction.list()}" optionKey="id" size="5" value="${videoInstance?.audienceRestriction?.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="categories"><g:message code="video.categories.label" default="Categories" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: videoInstance, field: 'categories', 'errors')}">
                                    <g:select name="categories" from="${com.tigo.videocms.Category.list()}" multiple="yes" optionKey="id" size="5" value="${videoInstance?.categories*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countries"><g:message code="video.countries.label" default="Countries" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: videoInstance, field: 'countries', 'errors')}">
                                    <g:select name="countries" from="${countryList}" multiple="yes" optionKey="id" size="5" value="${videoInstance?.countries*.id}" />
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
