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


<script language="javascript" src="${resource(dir:'js',file:'AC_RunActiveContent.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js',file:'jquery.js')}"></script>
<link rel="stylesheet" href="${resource(dir:'css',file:'nav.css')}" />
<link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" />
</head>
<body>
<div id="wrapper" style="position:relative; margin:0px auto; width:770px;">
	<div id="banner_container"><img src="${resource(dir:'img',file:'banner.jpg')}" /></div>
	<div id="main_container">
		<div id="date">20 de Agosto de 2010</div>
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
				<li id="nav_tv"><a href="index.gsp">TVOnline</a></li>
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
			'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0',
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
			'salign', ''
			); //end AC code
	}
</script>
            <noscript>
            <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="560" height="310" id="main_gallery" align="middle">
                <param name="allowScriptAccess" value="sameDomain" />
                <param name="allowFullScreen" value="false" />
                <param name="movie" value="${resource(dir:'swf',file:'main_gallery.swf')}" />
                <param name="quality" value="high" />
                <param name="wmode" value="transparent" />
                <param name="bgcolor" value="#000000" />
                <embed src="${resource(dir:'swf',file:'main_gallery.swf')}" quality="high" wmode="transparent" bgcolor="#000000" width="560" height="310" name="main_gallery" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
            </object>
            </noscript>

		</div>
	</div>
	<!--End main_container-->
	<div id="series_container">
	</div>
	<!--fin series-->
	<div id="tv_online">
		<div id="left_col"> <img src="${resource(dir:'img',file:'titulo_noticias.png')}" />
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
			<img src="${resource(dir:'img',file:'noticia_vermas.png')}" />
		</div>
		<div id="tv_online_container">
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
					<tr>
						<td><img src="${resource(dir:'img/series',file:'2.jpg')}" width="120" height="75" border="0"/></td>
                        <td><img src="${resource(dir:'img/series',file:'2.jpg')}" width="120" height="75" border="0"/></td>
                        <td><img src="${resource(dir:'img/series',file:'2.jpg')}" width="120" height="75" border="0"/></td>
					</tr>
					<tr>
						<td><table>
								<tr>
									<td width="95">
									   <img src="${resource(dir:'img',file:'estrella_verde.png')}" /><img src="${resource(dir:'img',file:'estrella_verde.png')}" />
									   <img src="${resource(dir:'img',file:'estrella_verde.png')}" /><img src="${resource(dir:'img',file:'estrella_verde.png')}" /> 
									   <img src="${resource(dir:'img',file:'estrella_gris.png')}" />
									</td>
									<td>21:02</td>
							</table></td>
						<td><table>
								<tr>
									<td width="95">
									   <img src="${resource(dir:'img',file:'estrella_roja.png')}" /><img src="${resource(dir:'img',file:'estrella_roja.png')}" />
						               <img src="${resource(dir:'img',file:'estrella_roja.png')}" /><img src="${resource(dir:'img',file:'estrella_roja.png')}" />
						               <img src="${resource(dir:'img',file:'estrella_roja.png')}" />
									</td>
									<td>21:02</td>
							</table></td>
						<td><table>
								<tr>
									<td width="95">
									   <img src="${resource(dir:'img',file:'estrella_amarilla.png')}" />
                                       <img src="${resource(dir:'img',file:'estrella_amarilla.png')}" />
                                       <img src="${resource(dir:'img',file:'estrella_amarilla.png')}" />
                                       <img src="${resource(dir:'img',file:'estrella_gris.png')}" />
                                       <img src="${resource(dir:'img',file:'estrella_gris.png')}" />
                                    </td>
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
					<!-- comienza es un reglon completo-->
                    <tr>
                        <td><img src="${resource(dir:'img/series',file:'2.jpg')}" width="120" height="75" border="0"/></td>
                        <td><img src="${resource(dir:'img/series',file:'2.jpg')}" width="120" height="75" border="0"/></td>
                        <td><img src="${resource(dir:'img/series',file:'2.jpg')}" width="120" height="75" border="0"/></td>
                    </tr>
                    <tr>
                        <td><table>
                                <tr>
                                    <td width="95">
                                       <img src="${resource(dir:'img',file:'estrella_verde.png')}" /><img src="${resource(dir:'img',file:'estrella_verde.png')}" />
                                       <img src="${resource(dir:'img',file:'estrella_verde.png')}" /><img src="${resource(dir:'img',file:'estrella_verde.png')}" /> 
                                       <img src="${resource(dir:'img',file:'estrella_gris.png')}" />
                                    </td>
                                    <td>21:02</td>
                            </table></td>
                        <td><table>
                                <tr>
                                    <td width="95">
                                       <img src="${resource(dir:'img',file:'estrella_roja.png')}" /><img src="${resource(dir:'img',file:'estrella_roja.png')}" />
                                       <img src="${resource(dir:'img',file:'estrella_roja.png')}" /><img src="${resource(dir:'img',file:'estrella_roja.png')}" />
                                       <img src="${resource(dir:'img',file:'estrella_roja.png')}" />
                                    </td>
                                    <td>21:02</td>
                            </table></td>
                        <td><table>
                                <tr>
                                    <td width="95">
                                       <img src="${resource(dir:'img',file:'estrella_amarilla.png')}" />
                                       <img src="${resource(dir:'img',file:'estrella_amarilla.png')}" />
                                       <img src="${resource(dir:'img',file:'estrella_amarilla.png')}" />
                                       <img src="${resource(dir:'img',file:'estrella_gris.png')}" />
                                       <img src="${resource(dir:'img',file:'estrella_gris.png')}" />
                                    </td>
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
						<td><a href=""><img src="${resource(dir:'img',file:'ver_mas.png')}" border="0"/></a></td>
                        <td><a href=""><img src="${resource(dir:'img',file:'ver_mas.png')}" border="0"/></a></td>
                        <td><a href=""><img src="${resource(dir:'img',file:'ver_mas.png')}" border="0"/></a></td>
					</tr>
				</table>
			</div>
			<div id="tv_online_banner"><img src="${resource(dir:'img',file:'tv_online_banner.png')}" /></div>
		</div>
	</div>
	<!-- fin tv_online-->
	<div id="footer">
	<a href="">HOME </a> I <a href=""> POLITICA DE USO </a> I <a href=""> POLITICA DE PRIVACIDAD </a> I <a href=""> PARTNERS </a> I <a href=""> ANUNCIESE AQUI </a> I <a href=""> MAPA DEL SITIO </a>
	</div>
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