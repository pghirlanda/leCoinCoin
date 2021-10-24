<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title>Liste des utilisateurs</title>
        <link href="../../assets/indexUser.css" rel="stylesheet" type="text/css" media="all" />
    </head>
    <body>
        <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><img class="imgHome" src="../../assets/house.png"/> Retour à l'accueil</a></li>
                <li><g:link class="create" action="create"><img src="../../assets/addUser.png"/> Ajouter un nouvel utilisateur</g:link></li>
            </ul>
        </div>
        <div id="list-user" class="content scaffold-list" role="main">
            <h1>Utilisateurs du site LeCoinCoin</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="listUtilisateur">
                <g:each in="${userList}" var="user">
                    <div class="utilisateur">
                        <h2 class="nom"><g:link class="lienNom" controller="user" action="show" id="${user.id}">${user.username}</g:link></h2>
                        <div class="mail">E-mail : ${user.email}</div>
                        <div class="tel">Numéro de téléphone :
                            <if test="${user.tel!=null}">
                                ${user.tel}
                            </if>
                            <esle>
                                inconnu
                            </esle>
                        </div>
                        <div class="role">Rôle :
                            <g:each in="${user.getAuthorities()}" var="userRole">
                                ${userRole.authority}
                            </g:each>
                        </div>
                        <div class="boutons">
                            <button class="modifier"><g:link class="lien" controller="user" action="edit" id="${user.id}">Modifier</g:link></button>
                            <button onclick="return confirm('Etes-vous sûr?')"><g:link class="lien" controller="user" action="delete" id="${user.id}">Supprimer</g:link></button>
                        </div>
                    </div>
                </g:each>
            </div>

            <div class="pagination">
                <g:paginate total="${userCount ?: 0}" />
            </div>
        </div>
    </body>
</html>