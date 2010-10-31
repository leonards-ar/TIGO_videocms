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
<script language="javascript">AC_FL_RunContent = 0;</script>
<script language="javascript" src="${resource(dir:'js',file:'AC_RunActiveContent.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js',file:'jquery.js')}"></script>
<link rel="stylesheet" href="${resource(dir:'css',file:'nav_series.css')}" />
<link rel="stylesheet" href="${resource(dir:'css',file:'tv_online.css')}" />
</head>
<body id="tv_online">
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
		<div id="link_home"><g:link controller="portal"><img src="${resource(dir:'img',file:'link_home.png')}" border="0"/></g:link></div>
		<div id="nav_text"> <span class="titulo" style="font-size:16px;"></span><br />
			<span class="texto" style="font-size:10px;"></span> </div>
		<div id="left_menu">
			<ul id="navegacion">
				<li id="nav_tv"><g:link controller="TVOnline" action="index">TVOnline</g:link></li>
				<li id="nav_noticias"><a href="imagenes.html">Noticias</a></li>
				<li id="nav_programas"><a href="videos.html">Programacion</a></li>
				<li id="nav_promos"><a href="trivia.html">Promos</a></li>
			</ul>
		</div>
		<div id="main_gallery_container"> 
            <script type="text/javascript" src="http://content.bitsontherun.com/players/${videoInstance?.videoKey}-n7QZPPH0.js"></script>		
		</div>
	</div>
	<!--End main_container-->
	<div id="tv_online_menu">
		<!--URL utilizadas en la película-->
<!--Texto utilizado en la película-->
<!-- saved from url=(0013)about:internet -->
<script language="javascript">
	if (AC_FL_RunContent == 0) {
		alert("Esta página requiere el archivo AC_RunActiveContent.js.");
	} else {
		AC_FL_RunContent(
			'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0',
			'width', '580',
			'height', '120',
			'src', '${resource(dir:'swf',file:'tv_online_menu')}',
			'quality', 'high',
			'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
			'align', 'middle',
			'play', 'true',
			'loop', 'true',
			'scale', 'showall',
			'wmode', 'transparent',
			'devicefont', 'false',
			'id', 'tv_online_menu',
			'bgcolor', '#ffffff',
			'name', 'tv_online_menu',
			'menu', 'true',
			'allowFullScreen', 'false',
			'allowScriptAccess','sameDomain',
			'movie', '${resource(dir:'swf',file:'tv_online_menu')}',
			'salign', '',			
			'flashvars','todos_link=${createLink(action:'categoryResults',controller:'TVOnline', params:[category:'Todos'])}&series_link=${createLink(action:'categoryResults',controller:'TVOnline', params:[category:"Series"])}&eventos_link=${createLink(action:'categoryResults',controller:'TVOnline', params:[category:"Eventos Especiales"])}&deportes_link=${createLink(action:'categoryResults',controller:'TVOnline', params:[category:"Deportes"])}&trailers_link=${createLink(action:'categoryResults',controller:'TVOnline', params:[category:"Trailers"])}&noticias_link=${createLink(action:'categoryResults',controller:'TVOnline', params:[category:"Noticias y Actualidad"])}&cultura_link=${createLink(action:'categoryResults',controller:'TVOnline', params:[category:"Cultura"])}&estilos_link=${createLink(action:'categoryResults',controller:'TVOnline', params:[category:"Estilos y Tendencias"])}&otros_link=${createLink(action:'categoryResults',controller:'TVOnline', params:[category:'Otros'])}&adultos_link=${createLink(action:'categoryResults',controller:'TVOnline', params:[category:'Adultos'])}'
			); //end AC code
	}
</script>
<noscript>
	<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="580" height="120" id="tv_online_menu" align="middle">
	<param name="allowScriptAccess" value="sameDomain" />
	<param name="allowFullScreen" value="false" />
	<param name="movie" value="tv_online_menu.swf" />
	<param name="quality" value="high" />
	<param name="bgcolor" value="#ffffff" />
	<param name="FlashVars" value="todos_link=http://url_aqui.algo&series_link=http://url_aqui.algo&eventos_link=http://url_aqui.algo&deportes_link=http://url_aqui.algo&trailers_link=http://url_aqui.algo&noticias_link=http://url_aqui.algo&cultura_link=http://url_aqui.algo&estilos_link=http://url_aqui.algo&otros_link=http://url_aqui.algo&adultos_link=http://url_aqui.algo" />
	<embed src="${resource(dir:'swf',file:'tv_online_menu.swf')}" quality="high" bgcolor="#ffffff" width="580" height="120" name="tv_online_menu" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
	</object>
</noscript>
	</div>
	<!-- fin descripcion serie-->
	<div id="tv_online">
		
		<div id="series_elegir_container">
			<g:render template="/TVOnline/tvonlinecontent" model="[newReleases: newReleases, fullEpisodes:fullEpisodes, mostPopulars:mostPopulars, rowList: rowList]"/>
			<div id="tv_online_col_derecha">
			<img src="${resource(dir:'img',file:'series_lomejor.jpg')}"/>
			<ul id="lo_mejor">
				<li><a href="">24</a></li>
				<li><a href="">Prison Break</a></li>
				<li><a href="">Padre de Familia</a></li>
				<li><a href="">American Dad</a></li>
				<li><a href="">Tiempo Final</a></li>
				<li><a href="">Prison Break</a></li>
				<li><a href="">Padre de Familia</a></li>
				<li><a href="">American Dad</a></li>
			</ul>
			</div>
		</div>
	
	
	</div>
	<!-- fin tv_online-->
	
	<div id="footer"> <a href="">HOME </a> I <a href=""> POLITICA DE USO </a> I <a href=""> POLITICA DE PRIVACIDAD </a> I <a href=""> PARTNERS </a> I <a href=""> ANUNCIESE AQUI </a> I <a href=""> MAPA DEL SITIO </a> </div>
</div>

		<div id="slider" style="position:absolute; right:0px; top:50px;">
			<script language="javascript">
	if (AC_FL_RunContent == 0) {
		alert("Esta página requiere el archivo AC_RunActiveContent.js.");
	} else {
		AC_FL_RunContent(
			'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0',
			'width', '240',
			'height', '500',
			'src', '${resource(dir:'swf',file:'panel_slider')}',
			'quality', 'high',
			'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
			'align', 'top',
			'play', 'true',
			'loop', 'true',
			'scale', 'showall',
			'wmode', 'transparent',
			'devicefont', 'false',
			'id', 'panel_slider',
			'bgcolor', '#000000',
			'name', 'panel_slider',
			'menu', 'true',
			'allowFullScreen', 'false',
			'allowScriptAccess','sameDomain',
			'movie', '${resource(dir:'swf',file:'panel_slider')}',
			'flashvars', 'xml_links=${resource(dir:'swf',file:'slider_links.xml')}&xml_content=${resource(dir:'swf',file:'slider_content.xml')}',				
			'salign', ''
			); //end AC code
	}
</script>
			<noscript>
			<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="240" height="500" id="panel_slider" align="middle">
				<param name="allowScriptAccess" value="sameDomain" />
				<param name="allowFullScreen" value="false" />
				<param name="movie" value="${resource(dir:'swf',file:'panel_slider.swf')}" />
				<param name="quality" value="high" />
				<param name="wmode" value="transparent" />
				<param name="bgcolor" value="#000000" />
				<param name="FlashVars" value="xml_links=${resource(dir:'swf',file:'slider_links.xml')}&xml_content=${resource(dir:'swf',file:'slider_content.xml')}" />				
				<embed src="${resource(dir:'swf',file:'panel_slider.swf')}" quality="high" wmode="transparent" bgcolor="#000000" width="240" height="500" name="panel_slider" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
			</object>
			</noscript>
		</div>


</body>
</html>
<script>
$(document).ready(function() {
	$("#nav_tv a").hover(
		function(){
			$("#nav_text").children("span.titulo").html('TVONLINE');
			$("#nav_text").children("span.texto").html('Mira la Tv Online');
		},
		function(){
				$("#nav_text").children("span.titulo").html('');
				$("#nav_text").children("span.texto").html('');
		}
	);
	$("#nav_noticias").hover(
		function(){
			$("#nav_text").children("span.titulo").html('NOTICIAS');
			$("#nav_text").children("span.texto").html('Mantente informado');
		},
		function(){
				$("#nav_text").children("span.titulo").html('');
				$("#nav_text").children("span.texto").html('');
		}
	);
	$("#nav_programas").hover(
		function(){
			$("#nav_text").children("span.titulo").html('PROGRAMAS');
			$("#nav_text").children("span.texto").html('Encuentra tu programa preferido');
		},
		function(){
				$("#nav_text").children("span.titulo").html('');
				$("#nav_text").children("span.texto").html('');
		}
	);
	$("#nav_promos").hover(
		function(){
			$("#nav_text").children("span.titulo").html('PROMOS');
			$("#nav_text").children("span.texto").html('Siempre hay algo esperando por ti');
		},
		function(){
				$("#nav_text").children("span.titulo").html('');
				$("#nav_text").children("span.texto").html('');
		}
	);
	
});
</script>
