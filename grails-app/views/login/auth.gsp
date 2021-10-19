<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message code='springSecurity.login.title'/></title>
    <link href="../../assets/auth.css" rel="stylesheet" type="text/css" media="all" />
    </style>
</head>

<body>
<div id="login">
    <div class="inner">
        <div class="fheader">
            <h2>Bonjour !</h2>
            <h5><g:message code='springSecurity.login.header'/></h5>
        </div>

        <g:if test='${flash.message}'>
            <div class="login_message">${flash.message}</div>
        </g:if>

        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
            <p class="allUsername">
                <label class="txtUsername" for="username"><g:message code='springSecurity.login.username.label'/> :</label>
                <input type="text" class="username" name="${usernameParameter ?: 'username'}" id="username"/>
            </p>

            <div class="allMdp">
                <label class="txtMdp" for="password"><g:message code='springSecurity.login.password.label'/> :</label>
                <input type="password" class="mdp" name="${passwordParameter ?: 'password'}" id="password"/>
                <p class="mdpOublie">Mot de passe oublié</p>
            </div>

           <p id="remember_me_holder">
                <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                <label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>
            </p>

            <p class="bouton">
                <input type="submit" id="submit" value="Se connecter">
            </p>

            <p class="creationCompte">
                Envie de nous rejoindre ?
                <g:link controller="user" action="create">Créer un compte</g:link>
            </p>
        </form>
    </div>
</div>
<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>
