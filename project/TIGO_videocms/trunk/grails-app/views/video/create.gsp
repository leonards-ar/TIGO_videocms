

<%@ page import="com.tigo.videocms.Video" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <sfu:generateConfiguration fileSize="100" form="videoForm"/>
        <g:set var="entityName" value="${message(code: 'video.label', default: 'Video')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <script language="javascript" type="text/javascript">
        <!--  to hide script contents from old browsers
			function showExternalURLs() {
				if(document.videoForm && document.videoForm.external && document.videoForm.external.checked) {
					hideObject('videoFileUploadRow');
					showObject('videoUrlRow');
					showObject('thumbnailUrlRow');
				} else {
					showObject('videoFileUploadRow');
					hideObject('videoUrlRow');
					hideObject('thumbnailUrlRow');
				}
        	}

    		function submitForm(f) {
				if(document.videoForm && document.videoForm.external && document.videoForm.external.checked) {
					return true;
				} else {
					sfuSubmitForm(f);				}
    		}
     	// end hiding contents from old browsers  -->
        </script>
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
            <g:form name="videoForm" id="videoForm" action="save" enctype="multipart/form-data" method="post" onsubmit="return submitForm(this);">
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
                                  <label for="show"><g:message code="video.show.label" default="TV Show" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: videoInstance, field: 'show', 'errors')}">
                                    <g:select name="show.id" from="${com.tigo.videocms.TVShow.listOrderByName()}" optionKey="id" size="5" value="${videoInstance?.show?.id}" noSelection="['':'No selection...']" />
                                </td>
                            </tr>
                                                
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="season"><g:message code="video.season.label" default="Season" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: videoInstance, field: 'season', 'errors')}">
                                    <g:textField size="4" name="season" value="${fieldValue(bean: videoInstance, field: 'season')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="episode"><g:message code="video.episode.label" default="Episode Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: videoInstance, field: 'episode', 'errors')}">
                                    <g:textField size="4" name="episode" value="${fieldValue(bean: videoInstance, field: 'episode')}" />
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
                                  <label for="external"><g:message code="video.external.label" default="External Video" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: videoInstance, field: 'external', 'errors')}">
									<g:checkBox name="external" value="${videoInstance?.external}" onclick="showExternalURLs()" onchange="showExternalURLs()"/>
                                </td>
                            </tr>

                            <tr class="prop" id="videoFileUploadRow" <g:if test="${videoInstance?.external}">style="display:none"</g:if>>
                                <td valign="top" class="name">
                                    <label for="url"><g:message code="video.movieFile.label" default="File Upload" /></label>
                                </td>
                                <td valign="top" class="value">
									<sfu:fileUploadControl/>&nbsp;<sfu:fileUploadProgressBar/>
								</td>
                            </tr>

                            <tr class="prop" id="videoUrlRow" <g:if test="!${videoInstance?.external}">style="display:none"</g:if>>
                                <td valign="top" class="name">
                                    <label for="url"><g:message code="video.url.label" default="Video URL" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textField size="80" name="url" value="${videoInstance?.url}" />
                                </td>
                            </tr>

                            <tr class="prop" id="thumbnailUrlRow" <g:if test="!${videoInstance?.external}">style="display:none"</g:if>>
                                <td valign="top" class="name">
                                  <label for="thumbnailUrl"><g:message code="video.thumbnailUrl.label" default="Thumbnail URL" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: videoInstance, field: 'thumbnailUrl', 'errors')}">
                                    <g:textField size="80" name="thumbnailUrl" value="${videoInstance?.thumbnailUrl}" />
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
							    	<g:select name="homeSection" valueMessagePrefix="tigo.videocms.video" from="${com.tigo.videocms.Video.HOME_SECTIONS}" size="1" value="${fieldValue(bean: videoInstance, field: 'homeSection')}"/>
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
