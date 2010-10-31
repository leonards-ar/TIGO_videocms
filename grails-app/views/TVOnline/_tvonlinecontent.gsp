<div id="tv_online_content">
	<table width="100%" border="0" cellspacing="2" cellpadding="0">
		<tr>
			<th align="left" width="130">ESTRENOS
				</td>
			<th align="left" width="130">MAS VOTADOS
				</td>
			<th align="left" width="130">EPISODIOS COMPLETOS
				</td>
		</tr>
		<tr>
			<td align="left"><img src="${resource(dir:'img',file:'flecha_verde.png')}"/></td>
			<td align="left"><img src="${resource(dir:'img',file:'flecha_roja.png')}"/></td>
			<td align="left"><img src="${resource(dir:'img',file:'flecha_amarilla.png')}" /></td>
		</tr>
		<!-- comienza es un reglon completo-->
		<g:each in ="${rowList}">
		<g:set var="newRelease" value="${newReleases[it]}" />                 
        <g:set var="mostPopular" value="${mostPopulars[it]}" />                 
        <g:set var="fullEpisode" value="${fullEpisodes[it]}" />
                         
		<tr>
			<td>
			<g:if test="${newRelease != null}">
				<g:link controller="TVOnline" action="playVideo" id="${newRelease?.id}" params="[countryCode:countryCode]"><img src="${newRelease?.thumbnailUrl}" width="120" height="75" border="0"/></g:link>
			</g:if>
			</td>
            <td>
            <g:if test="${mostPopular != null}">
	            <g:link controller="TVOnline" action="playVideo" id="${mostPopular?.id}" params="[countryCode:countryCode]"><img src="${mostPopular?.thumbnailUrl}" width="120" height="75" border="0"/></g:link>
			</g:if>
            </td>
            <td>
            <g:if test="${fullEpisode != null}">
            <g:link controller="TVOnline" action="playVideo" id="${fullEpisode?.id}" params="[countryCode:countryCode]"><img src="${fullEpisode?.thumbnailUrl}" width="120" height="75" border="0"/></g:link>
            </g:if>
            </td>
		</tr>
		<tr>
			<td>
				<g:if test="${newRelease != null}">
                     <table>
                             <tr>
                                 <td width="95">
                                  <g:set var="nGreen" value="${newRelease?.ratingAsInt()}" />
                                  <g:set var = "nGreyRelease" value="${5 - newRelease?.ratingAsInt()}" />
                                 <g:while test="${nGreen > 0}">
                                    <img src="${resource(dir:'img',file:'estrella_verde.png')}" />
                                    <g:set var = "nGreen" value="${nGreen -1}" /> 
                                 </g:while>    
                                 <g:while test="${nGreyRelease > 0}">
                                    <img src="${resource(dir:'img',file:'estrella_gris.png')}" />
                                    <g:set var = "nGreyRelease" value="${nGreyRelease -1}" /> 
                                 </g:while>    
                                 </td>
                                 <td>${newRelease?.duration}</td>
                             </tr>   
                         </table>
				</g:if>	
			</td>
			<td>
			<g:if test="${mostPopular != null}">
			<table>
	            <tr>
	                <td width="95">
	                 <g:set var="nRed" value="${mostPopular?.ratingAsInt()}" />
	                 <g:set var = "nGreyPopular" value="${5 - mostPopular?.ratingAsInt()}" />
	                <g:while test="${nRed > 0}">
	                   <img src="${resource(dir:'img',file:'estrella_roja.png')}" />
	                   <g:set var = "nRed" value="${nRed -1}" /> 
	                </g:while>    
	                <g:while test="${nGreyPopular > 0}">
	                   <img src="${resource(dir:'img',file:'estrella_gris.png')}" />
	                   <g:set var = "nGreyPopular" value="${nGreyPopular -1}" /> 
	                </g:while>    
	                </td>
	                <td>${mostPopular?.duration}</td>
	            </tr>   
			</table>
			</g:if>
			</td>
			<td>
			<g:if test="${fullEpisode != null}">			
			<table>
                             <tr>
                                 <td width="95">
                                  <g:set var="nYellow" value="${fullEpisode?.ratingAsInt()}" />
                                  <g:set var = "nGreyEpisodes" value="${5 - fullEpisode?.ratingAsInt()}" />
                                 <g:while test="${nYellow > 0}">
                                    <img src="${resource(dir:'img',file:'estrella_amarilla.png')}" />
                                    <g:set var = "nYellow" value="${nYellow -1}" /> 
                                 </g:while>    
                                 <g:while test="${nGreyEpisodes > 0}">
                                    <img src="${resource(dir:'img',file:'estrella_gris.png')}" />
                                    <g:set var = "nGreyEpisodes" value="${nGreyEpisodes -1}" /> 
                                 </g:while>    
                                 </td>
                                 <td>${fullEpisode?.duration}</td>
                             </tr> 
				</table>
			</g:if>		
				</td>
		</tr>
		<tr>
			<td>${newRelease?.title}<br />${newRelease?.show}</td>
                     <td>${mostPopular?.title}<br />${mostPopular?.show}</td>
                     <td>${fullEpisode?.title}<br />${fullEpisode?.show}</td>
		</tr>
		</g:each>
		<!-- fin reglon completo-->
		<tr>
			<td><a href=""><img src="${resource(dir:'img',file:'ver_mas.png')}" border="0"/></a></td>
            <td><a href=""><img src="${resource(dir:'img',file:'ver_mas.png')}" border="0"/></a></td>
            <td><a href=""><img src="${resource(dir:'img',file:'ver_mas.png')}" border="0"/></a></td>
		</tr>
	</table>
</div>
