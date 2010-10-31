<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Tigo</title>
<!--[if IE]>
<style type="text/css" media="screen">
@font-face{
font-family:'cronos';
src: url('fonts/cronos.otf');
}
</style>
<![endif]-->
<script src="${resource(dir:'js',file:'AC_RunActiveContent.js')}" language="javascript"></script>
<script type="text/javascript" src="${resource(dir:'js',file:'jquery.js')}"></script>
<link href="${resource(dir:'css',file:'nav_series.css')}" rel="stylesheet" type="text/css" />
<link href="${resource(dir:'css',file:'series.css')}" rel="stylesheet" type="text/css" />
</head>
<body id="series" style="background-image:url(${tvShow?.backgroundImage?.url}); background-repeat:no-repeat; background-position:top center;">
<div id="wrapper" style="position:relative; margin:0px auto; width:770px;">
	<div id="nav_top">| <a href="">CONTACTENOS</a> | <a href="">PREGUNTAS FRECUENTES</a></div>
	<div id="banner_container"><img src="${resource(dir:'img',file:'banner.jpg')}" /></div>
	<div id="main_container">
		<div id="date"><g:formatDate date="${new Date()}" type="date" style="LONG" locale="es"/></div>
		<div id="search">
			<form class="search" action="search" method="post">
				<table width="200" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td><input name="search_content" type="text" class="search_content" />
						</td>
						<td><input type="image" src="${resource(dir:'img',file:'btn_search.png')}" value="Search" class="button"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<!--End search-->
		<div id="link_home"><a href="inedx.html"><img src="${resource(dir:'img',file:'link_home.png')}" border="0"/></a></div>
		<div id="nav_text"> <span class="titulo" style="font-size:16px;"></span><br />
			<span class="texto" style="font-size:10px;"></span> </div>
		<div id="left_menu">
			<ul id="navegacion">
				<li id="nav_tv"><g:link controller="TVOnline" action="index" params="[countryCode:countryCode]">TVOnline</g:link></li>
				<li id="nav_noticias"><a href="imagenes.html">Noticias</a></li>
				<li id="nav_programas"><a href="videos.html">Programacion</a></li>
				<li id="nav_promos"><a href="trivia.html">Promos</a></li>
			</ul>
		</div>
		<div id="main_gallery_container">
		<script type="text/javascript" src="http://content.bitsontherun.com/players/${tvShowVideo?.videoKey}-n7QZPPH0.js"></script>
		</div>
	</div>
	<!--End main_container-->
	<div id="descripcion_serie">
		<div id="titulo" style="position:relative; float:left; font-family:'cronos', Arial; font-size:28px;"> ${tvShowVideo?.title} </div>
		<div id="info" style="position:relative; float:right; font-size:11px; color:#444444; vertical-align:middle; top:5px;"> APTA : : : <strong>${tvShowVideo?.audienceRestriction?.name}</strong>&nbsp;&nbsp;&nbsp;&nbsp;CALIFICACION : : : <span id="calificacion">
        <g:set var="nRed" value="${tvShowVideo?.ratingAsInt()}" />
        <g:set var = "nGreyRelease" value="${5 - tvShowVideo?.ratingAsInt()}" />
       <g:while test="${nRed > 0}">
          <img src="${resource(dir:'img',file:'estrella_roja.png')}" />
          <g:set var = "nRed" value="${nRed -1}" /> 
       </g:while>    
       <g:while test="${nGreyRelease > 0}">
          <img src="${resource(dir:'img',file:'estrella_gris.png')}" />
          <g:set var = "nGreyRelease" value="${nGreyRelease -1}" /> 
       </g:while>    
		</span>
		</div>
		<!-- fin div info-->
		<div id="descripcion" style="position:relative; float:left; font-family:'cronos', Arial; width:580px; font-size:14px; border-top:1px solid #333333;">
			<div id="texto_descripcion" style="font-family:'cronos',Arial, Helvetica, sans-serif; float:left;width:400px;">${tvShowVideo?.audienceRestriction?.name}</div>
			<div id="info_descripcion" style="float:right; width:160px; text-align:right; font-size:12px;"> CATEGORIA : : : <strong>${tvShowVideo?.categories*.name}</strong><br />
				TEMPORADA : : : <strong>${tvShowVideo?.season}</strong><br />
				EPISODIO : : : <strong>${tvShowVideo?.episode}</strong><br />
				DURACION : : : <strong>${tvShowVideo?.duration}</strong><br />
			</div>
		</div>
	</div>
	<!-- fin descripcion serie-->
	<div id="tv_online">
		<div id="series_elegir_container">
			<g:render template="/TVOnline/tvonlinecontent" model="[countryCode:countryCode, newReleases: newReleases, fullEpisodes:fullEpisodes, mostPopulars:mostPopulars, rowList: rowList]"/>
			<g:render template="/TVOnline/tvshowthebest" model="[countryCode:countryCode, theBestTVShows: theBestTVShows]"/>
		</div>
	<div id="series_recomendadas_container">
	
				<div id="series_recomendadas_content">
				<table width="100%" border="0" cellspacing="2" cellpadding="0">
				<tr>
					<td colspan="3"><img src="${resource(dir:'img',file:'recomendados_titulo.jpg')}" /></td>
				</tr>
					<!-- comienza es un reglon completo-->
					<tr>
						<td><img src="${resource(dir:'img',file:'series/2.jpg')}" width="120" height="75" border="0"/></td>
						<td><img src="${resource(dir:'img',file:'series/2.jpg')}" width="120" height="75" border="0"/></td>
						<td><img src="${resource(dir:'img',file:'series/2.jpg')}" width="120" height="75" border="0"/></td>
					</tr>
					<tr>
						<td><table>
								<tr>
									<td width="95"><img src="${resource(dir:'img',file:'estrella_verde.png')}" /> <img src="${resource(dir:'img',file:'estrella_verde.png')}" /> <img src="${resource(dir:'img',file:'estrella_verde.png')}" /> <img src="${resource(dir:'img',file:'estrella_verde.png')}" /> <img src="${resource(dir:'img',file:'estrella_gris.png')}" /></td>
									<td>21:02</td>
							</table></td>
						<td><table>
								<tr>
									<td width="95"><img src="${resource(dir:'img',file:'estrella_roja.png')}" /> <img src="${resource(dir:'img',file:'estrella_roja.png')}" /> <img src="${resource(dir:'img',file:'estrella_roja.png')}" /> <img src="${resource(dir:'img',file:'estrella_roja.png')}" /> <img src="${resource(dir:'img',file:'estrella_roja.png')}" /></td>
									<td>21:02</td>
							</table></td>
						<td><table>
								<tr>
									<td width="95"><img src="${resource(dir:'img',file:'estrella_amarilla.png')}" /> <img src="${resource(dir:'img',file:'estrella_amarilla.png')}" /> <img src="${resource(dir:'img',file:'estrella_amarilla.png')}" /> <img src="${resource(dir:'img',file:'estrella_gris.png')}" /> <img src="${resource(dir:'img',file:'estrella_gris.png')}" /></td>
									<td>21:02</td>
							</table></td>
					</tr>
					<tr>
						<td>Futurama <br />
							Capitulo 8</td>
						<td>Futurama <br />
							Capitulo 8</td>
						<td>Futurama <br />
							Capitulo 8</td>
					</tr>
					<!-- fin reglon completo-->
					<tr>
						<td><a href="#"><img src="${resource(dir:'img',file:'ver_mas.png')}" border="0"/></a></td>
						<td><a href="#"><img src="${resource(dir:'img',file:'ver_mas.png')}" border="0"/></a></td>
						<td><a href="#"><img src="${resource(dir:'img',file:'ver_mas.png')}" border="0"/></a></td>
					</tr>
				</table>
			</div>
			<div id="series_recomendadas_col_derecha">&nbsp;</div>

	
	
	</div><!--fin series_recomendadas_container-->
	
	
	</div>
	<!-- fin tv_online-->
	
	<div id="footer"> <a href="">HOME </a> I <a href=""> POLITICA DE USO </a> I <a href=""> POLITICA DE PRIVACIDAD </a> I <a href=""> PARTNERS </a> I <a href=""> ANUNCIESE AQUI </a> I <a href=""> MAPA DEL SITIO </a> </div>
</div>
</body>
</html>
<script>
$(document).ready(function() {
	$("#nav_tv a").hover(
		function(){
			$("#nav_text").children("span.titulo").html('TVONLINE');
			$("#nav_text").children("span.texto").html('MIRA LAS MEJORES SERIES ONLINE');
		},
		function(){
				$("#nav_text").children("span.titulo").html('');
				$("#nav_text").children("span.texto").html('');
		}
	);
	$("#nav_noticias").hover(
		function(){
			$("#nav_text").children("span.titulo").html('NOTICIAS');
			$("#nav_text").children("span.texto").html('MIRA LAS MEJORES SERIES ONLINE');
		},
		function(){
				$("#nav_text").children("span.titulo").html('');
				$("#nav_text").children("span.texto").html('');
		}
	);
	$("#nav_programas").hover(
		function(){
			$("#nav_text").children("span.titulo").html('PROGRAMAS');
			$("#nav_text").children("span.texto").html('MIRA LAS MEJORES SERIES ONLINE');
		},
		function(){
				$("#nav_text").children("span.titulo").html('');
				$("#nav_text").children("span.texto").html('');
		}
	);
	$("#nav_promos").hover(
		function(){
			$("#nav_text").children("span.titulo").html('PROMOS');
			$("#nav_text").children("span.texto").html('MIRA LAS MEJORES SERIES ONLINE');
		},
		function(){
				$("#nav_text").children("span.titulo").html('');
				$("#nav_text").children("span.texto").html('');
		}
	);
	
});
</script>
