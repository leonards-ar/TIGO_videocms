<html>
    <head>
        <title><g:layoutTitle default="Backcoffice Tigo" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="grailsLogo"><b>Backoffice TIGO</b></div>
        <p></p>
        <div class="welcomeBox">        
        	<sec:ifLoggedIn><sec:username /> (<g:link controller="logout">sign out</g:link>)</sec:ifLoggedIn>
        </div>
        <br/>
        <g:layoutBody />
    </body>
</html>