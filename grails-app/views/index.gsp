<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>
    Lecoincoin, le site de petites annonces gratuites
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-ico" href="/assets/logopage.ico">
    <link rel="stylesheet" href="/assets/bootstrap.css?compile=false">
    <link rel="stylesheet" href="/assets/grails.css?compile=false">
    <link rel="stylesheet" href="/assets/main.css?compile=false">
    <link rel="stylesheet" href="/assets/mobile.css?compile=false">
    <link rel="stylesheet" href="/assets/application.css?compile=false">
    <link href="../../assets/menu.css" rel="stylesheet" type="text/css" media="all" />
    <meta name="layout" content="main">
</head>
<body>
    <div id="content" role="main">
        <section class="row colset-2-its">
            <div class="texte">
                <h1 class="bienvenue">Bienvenue sur Lecoincoin <sec:username/> !</h1>

                <h2>Avec la livraison chez vous ou en point relais tout est à porter de main !</h2>
                <p class="bastexte">Trouver la bonne affaire parmi les millions de petites annonce lecoincoin.</p>
            </div>

            <div class="container">
                <div class="choix">
                    <img src="/assets/annonce.png" class="image"/>
                    <button class="boutton">
                        <g:link controller="annonce" action="index" class="txtbouton">Les Annonces</g:link>
                    </button>

                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <img src="/assets/user.png" class="image">
                        <button class="boutton">
                            <g:link controller="user" action="index" class="txtbouton">Les utilisateurs</g:link>
                        </button>
                    </sec:ifAllGranted>

                    <sec:access expression="hasAnyRole('ROLE_ADMIN','ROLE_CLIENT','ROLE_MODO')" class="deco">
                        <g:form controller="logout" action="index" id="logout" method="POST" onClick="action();">
                            <img src="/assets/imgDeco.png"/>
                            <button class="boutton" name="Logout">Se déconnecter</button>
                        </g:form>
                    </sec:access>

                    <sec:ifNotLoggedIn class="connection">
                        <img src="  /assets/imgCo.png"/>
                        <button class="boutton">
                            <g:link controller="login" action="index" class="txtbouton">Se Connecter</g:link>
                        </button>
                    </sec:ifNotLoggedIn>
                </div>
            </div>
        </section>
    </div>
    <div id="spinner" class="spinner" style="display:none;">
        Loading…
    </div>
    <script type="text/javascript" src="/assets/jquery-3.3.1.min.js?compile=false"></script>
    <script type="text/javascript" src="/assets/bootstrap.js?compile=false"></script>
    <script type="text/javascript" src="/assets/popper.min.js?compile=false"></script>
    <script type="text/javascript" src="/assets/application.js?compile=false"></script>
</body>
</html>