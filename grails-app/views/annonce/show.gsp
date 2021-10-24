<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title>Annonce - ${annonce.title}</title>
        <link href="../../assets/showAnnonce.css" rel="stylesheet" type="text/css" media="all" />
    </head>
    <body>
        <a href="#show-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><img class="imgHome" src="../../assets/house.png"/> Retour à l'accueil</a></li>
                <li><g:link class="list" action="index"><img class="imgHome" src="../../assets/listannonce.png"/> Retour aux annonces</g:link></li>
                <sec:ifLoggedIn>
                    <li><g:link class="create" action="create"><img class="imgHome" src="../../assets/addannonce.png"/> Créer une annonce</g:link></li>
                </sec:ifLoggedIn>
            </ul>
        </div>
        <div id="show-annonce" class="content scaffold-show" role="main">
            <h1>Annonce - ${annonce.title}</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <div id="list-annonce" class="content scaffold-list" role="main">
                <div id="image">
                    <g:each in="${annonce.illustrations}" var="illustrations">
                        <asset:image class="img" src="${illustrations.filename}"/>
                    </g:each>
                </div>
                <ul class="middle">
                    <div class="titre">
                        <h1>${annonce.title}</h1>
                    </div>

                    <ul class="middle1">
                        <div class="fieldcontain">
                            <span id="description-label" class="Description">Description :</span>
                            <div class="Description1">${annonce.description}</div>
                        </div>

                        <div class="fieldcontain">
                            <span id="prix-label" class="Prix">Prix :</span>
                            <div class="Prix1">${annonce.price} euros</div>
                        </div>
                    </ul>
                </ul>
                <ul class="second">
                    <div class="maj">
                        <span id="update-label" class="maj">Dernière mise à jour : </span>
                        <div class="maj1">${annonce.lastUpdated}</div>
                    </div>

                    <div class="auteur">
                        <span id="author-label" class="auteur">Publié par : </span>
                        <div class="auteur1">${annonce.author.username}</div>
                    </div>
                </ul>
            </div>

            <g:if test="${String.valueOf(annonce.author.id) == String.valueOf(sec.loggedInUserInfo(field: 'id'))}">
                <g:form resource="${this.annonce}" method="DELETE">
                    <fieldset class="buttons">
                        <g:link class="edit" action="edit" resource="${this.annonce}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </fieldset>
                </g:form>
            </g:if>
            <g:else>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <g:form resource="${this.annonce}" method="DELETE">
                        <fieldset class="buttons">
                            <g:link class="edit" action="edit" resource="${this.annonce}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </fieldset>
                    </g:form>
                </sec:ifAllGranted>
            </g:else>
        </div>
    </body>
</html>
