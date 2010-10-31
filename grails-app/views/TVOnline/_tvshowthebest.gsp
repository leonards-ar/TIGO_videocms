<div id="tv_online_col_derecha">
<img src="${resource(dir:'img',file:'series_lomejor.jpg')}"/>
<ul id="lo_mejor">
<g:each in ="${theBestTVShows}" var="aTVShow">
	<li><g:link controller="TVOnline" action="showTVShow" id="${aTVShow?.id}" params="[countryCode:countryCode]">${aTVShow?.name}</g:link></li>
</g:each>
</ul>
</div>
