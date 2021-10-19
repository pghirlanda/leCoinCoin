<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <link href="../../assets/createUser.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
    <a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        </ul>
    </div>

    <div id="create-user" class="content scaffold-create" role="main">
        <h1><g:message code="default.create.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                        <g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <g:form resource="${this.user}" method="POST">
            <fieldset class="form">
                <div class="fieldcontain_required">
                    <label for="username">Nom d'utilisateur
                        <span class="required-indicator">champ requis</span>
                    </label>
                    <input type="text" name="username" required="" value="" id="username">
                </div>

                <div class="fieldcontain_required">
                    <label for="email">E-Mail
                        <span class="required-indicator">champ requis</span>
                    </label>
                    <input type="email" name="email" value="" required="" id="email">
                </div>

                <div class="fieldcontain_required">
                    <label for="password">Mot de passe
                        <span class="required-indicator">champ requis</span>
                    </label>
                    <input type="password" name="password" value="" required="" id="password">
                </div>

                <div class="fieldcontain">
                    <label for="tel">Numéro de téléphone</label><input type="text" name="tel" value="" maxlength="16" id="tel">
                </div>

                <div class="pub">
                    <input class="checkbox" type="checkbox" checked /> Recevoir les bons plans de nos sites partenaires
                </div>

                <div class="commentaire">
                    En créant mon compte je reconnais avoir lu et accepté les Conditions Générales de Vente et les Conditions Générales d‘Utilisation, et je confirme être âgé d’au moins 18 ans.
                </div>
            </fieldset>

            <fieldset class="buttons">
                <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </fieldset>
        </g:form>
    </div>
</body>
</html>