<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Tigo</title>
 <!--[if IE]>
<style type="text/css" media="screen">
@font-face{
font-family:'cronos';
src: url('${resource(dir:'fonts',file:'cronos.otf')}');
}
</style>
<![endif]-->
<script language="javascript">AC_FL_RunContent = 0;</script>
<script language="javascript" src="${resource(dir:'js',file:'AC_RunActiveContent.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js',file:'jquery.js')}"></script>
<link rel="stylesheet" href="${resource(dir:'css',file:'nav.css')}" />
<link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" />
</head>
<body>
<div id="wrapper" style="position:relative; margin:0px auto; width:770px;">
<div id="nav_top">|  <a href="">CONTACTENOS</a>  |  <a href="">PREGUNTAS FRECUENTES</a></div>
	<div id="banner_container"><img src="${resource(dir:'img',file:'banner.jpg')}" /></div>
	<div id="main_container">
		<div id="date"><g:formatDate date="${new Date()}" type="date" style="LONG" locale="es"/></div>
		<div id="search">
			<form class="search" action="search" method="post">
				<table width="380" border="0" cellspacing="0" cellpadding="0">
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
		<div id="nav_text">
		<span class="titulo" style="font-size:16px;"></span><br />
		<span class="texto" style="font-size:10px;"></span>
		</div>
		<div id="left_menu">
			<ul id="navegacion">
				<li id="nav_tv"><g:link controller="TVOnline" action="index" params="[countryCode:countryCode]">TVOnline</g:link></li>
				<li id="nav_noticias"><a href="imagenes.html">Noticias</a></li>
				<li id="nav_programas"><a href="videos.html">Programacion</a></li>
				<li id="nav_promos"><a href="trivia.html">Promos</a></li>
			</ul>
		</div>
		<div id="main_gallery_container">
			<script language="javascript">
	if (AC_FL_RunContent == 0) {
		alert("Esta pagina requiere el archivo AC_RunActiveContent.js.");
	} else {
		AC_FL_RunContent(
			'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0',
			'width', '560',
			'height', '310',
			'src', '${resource(dir:'swf',file:'main_gallery')}',
			'quality', 'high',
			'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
			'align', 'top',
			'play', 'true',
			'loop', 'true',
			'scale', 'showall',
			'wmode', 'transparent',
			'devicefont', 'false',
			'id', 'main_gallery',
			'bgcolor', '#000000',
			'name', 'main_gallery',
			'menu', 'true',
			'allowFullScreen', 'false',
			'allowScriptAccess','sameDomain',
			'movie', '${resource(dir:'swf',file:'main_gallery')}',
			'salign', '',
			'FlashVars', 'xmlFile=${createLink(action:'homeMainGalleryElements',controller:'portal', params:[countryCode:countryCode])}'
			); //end AC code
	}
</script>


            <noscript>
            <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="560" height="310" id="main_gallery" align="middle">
                <param name="allowScriptAccess" value="sameDomain" />
                <param name="allowFullScreen" value="false" />
                <param name="movie" value="${resource(dir:'swf',file:'main_gallery.swf')}" />
                <param name="quality" value="high" />
                <param name="wmode" value="transparent" />
                <param name="bgcolor" value="#000000" />
                <param name="FlashVars" value="xmlFile=${createLink(action:'homeMainGalleryElements',controller:'portal', params:[countryCode:countryCode])}" />
                <embed src="${resource(dir:'swf',file:'main_gallery.swf')}" FlashVars="xmlFile=${createLink(action:'homeMainGalleryElements',controller:'portal', params:[countryCode:countryCode])}" quality="high" wmode="transparent" bgcolor="#000000" width="560" height="310" name="main_gallery" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
            </object>
            </noscript>

		</div>
	</div>
	<!--End main_container-->
	<div id="series_container">
		<script language="JavaScript" type="text/javascript">
	AC_FL_RunContent(
		'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0',
		'width', '580',
		'height', '160',
		'src', '${resource(dir:'swf',file:'carousel.swf')}',
		'quality', 'high',
		'pluginspage', 'http://www.adobe.com/go/getflashplayer',
		'align', 'middle',
		'play', 'true',
		'loop', 'true',
		'scale', 'showall',
		'wmode', 'transparent',
		'devicefont', 'false',
		'id', 'carousel',
		'bgcolor', '#ffffff',
		'name', 'carousel',
		'menu', 'true',
		'allowFullScreen', 'false',
		'allowScriptAccess','sameDomain',
		'movie', '${resource(dir:'swf',file:'carousel')}',
		'flashvars', 'xml_url=${resource(dir:'swf',file:'imagenes.xml')}',		
		'salign', ''
		); //end AC code
</script>
		<noscript>
		<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0" width="580" height="160" id="carousel" align="middle">
			<param name="allowScriptAccess" value="sameDomain" />
			<param name="allowFullScreen" value="false" />
			<param name="movie" value="${resource(dir:'swf',file:'carousel.swf')}" />
			<param name="quality" value="high" />
			<param name="bgcolor" value="#ffffff" />
			<param name="FlashVars" value="xml_url=${resource(dir:'swf',file:'imagenes.xml')}" />			
			<embed src="${resource(dir:'swf',file:'carousel.swf')}" FlashVars="xml_url=${resource(dir:'swf',file:'imagenes.xml')}" quality="high" bgcolor="#ffffff" width="580" height="160" name="carousel" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/go/getflashplayer" />
		</object>
		</noscript>
	</div>
	<!--fin series-->
	
	<div id="tv_online">
		<div id="left_col">
		&nbsp;
		<!-- img src="${resource(dir:'img',file:'titulo_noticias.png')}" />
		    <img src="${resource(dir:'img',file:'noticias_img.png')}" /> 
			<div class="noticia"> <span class="titulo">TITULAR DE NOTICIAS</span>
				<p class="texto">Donec condimentum ultrices pharetra. Nulla id tellus arcu, eget feugiat mi. Class aptent taciti socios.</p>
			</div>
			<div class="noticia"> <span class="titulo">TITULAR DE
				NOTICIAS</span>
				<p class="texto">Donec condimentum ultrices pharetra. Nulla id tellus arcu, eget feugiat mi. Class aptent taciti socios.</p>
			</div>
			<div class="noticia"> <span class="titulo">TITULAR DE
				NOTICIAS</span>
				<p class="texto">Donec condimentum ultrices pharetra. Nulla id tellus arcu, eget feugiat mi. Class aptent taciti socios.</p>
			</div>
			<br />
			<img src="${resource(dir:'img',file:'noticia_vermas.png')}" /-->
		</div>
		<div id="tv_online_container">
			<g:render template="/TVOnline/tvonlinecontent" model="[countryCode:countryCode, newReleases: newReleases, fullEpisodes:fullEpisodes, mostPopulars:mostPopulars, rowList: rowList]"/>
			<div id="tv_online_banner"><img src="${resource(dir:'img',file:'banner.gif')}" /></div>
		</div>
	</div>
	<!-- fin tv_online-->
	<div id="footer">
	<a href="">HOME </a> I <a href=""> POLITICA DE USO </a> I <a href=""> POLITICA DE PRIVACIDAD </a> I <a href=""> PARTNERS </a> I <a href=""> ANUNCIESE AQUI </a> I <a href=""> MAPA DEL SITIO </a>
	</div>
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
