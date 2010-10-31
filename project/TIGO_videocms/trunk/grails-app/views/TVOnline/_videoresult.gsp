<td>
	<table border="0" cellpadding="0" cellspacing="2">
		<tr>
			<td><g:link controller="TVOnline" action="playVideo" id="${video?.id}"><img src="${video?.thumbnailUrl}" width="120" height="75" border="0"/></g:link></td>									
		</tr>
		<tr>
			<td>
				<table border="0" cellpadding="0" cellspacing="2">
					<tr>
                             	<td width="80">
                              	<g:set var="nGreen" value="${video?.ratingAsInt()}" />
                              	<g:set var = "nGreyRelease" value="${5 - video?.ratingAsInt()}" />
                               <g:while test="${nGreen > 0}">
                                   <img src="${resource(dir:'img',file:'estrella_verde.png')}" />
                                   <g:set var = "nGreen" value="${nGreen -1}" /> 
                               </g:while>    
                               <g:while test="${nGreyRelease > 0}">
                               	<img src="${resource(dir:'img',file:'estrella_gris.png')}" />
                               	<g:set var = "nGreyRelease" value="${nGreyRelease -1}" /> 
                              		</g:while>    
                              	</td>
                              <td>${video?.duration}</td>
                       			</tr>   										
				</table>
			</td>
		</tr>
		<tr>
			<td>${newRelease?.title}<br/>${newRelease?.show}</td>
		</tr>								
	</table>
</td>
