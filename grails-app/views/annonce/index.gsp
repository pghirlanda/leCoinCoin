<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title>Liste des annonces</title>
        <link href="../../assets/annoncesIndex.css" rel="stylesheet" type="text/css" media="all" />
    </head>
    <body>
        <a href="#list-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><img class="imgHome" src="../../assets/house.png"/> Retour à l'accueil</a></li>
                <sec:ifLoggedIn>
                    <li><g:link class="create" action="create"><img class="imgHome" src="../../assets/addannonce.png"/> Créer une nouvelle annonce</g:link></li>
                    <g:if test="${ String.valueOf(annonceList.author.id).contains(String.valueOf(sec.loggedInUserInfo(field: "id")))}">
                        <li><g:link action="showList" id="?offset=0&max=100" ><img class="imgHome" src="../../assets/mesannonces.png"/> Mes annonces</g:link></li>
                    </g:if>
                </sec:ifLoggedIn>
            </ul>
        </div>
        <div id="list-annonce" class="content scaffold-list" role="main">
            <h1>Nos annonces</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="centre">
                <div class="annonces">
                    <g:each in="${annonceList}" var="annonce">
                        <g:if test="${annonce.active == true}">
                            <div class="annonce">
                                <div class="illu">
                                    <g:each in="${annonce.illustrations}" var="illustrations">
                                        <asset:image class="img" src="${illustrations.filename}"/>
                                    </g:each>
                                </div>
                                <div class="titreprix">
                                    <div class="titre">
                                        <g:link controller="annonce" action="show" id="${annonce.id}">${annonce.title}</g:link>
                                    </div>
                                    <div class="prix">${annonce.price} €</div>
                                </div>
                                <div class="description">${annonce.description}</div>
                                <div class="author">${annonce.author.username}</div>
                            </div>
                        </g:if>
                        <g:elseif test="${annonce.active == false}">
                            <div class="nonactive">
                                <sec:ifAllGranted roles="ROLE_ADMIN">
                                    <div class="annonce">
                                        <p>Annonce non activé</p>
                                        <div class="illu">
                                            <g:each in="${annonce.illustrations}" var="illustrations">
                                                <asset:image class="img" src="${illustrations.filename}"/>
                                            </g:each>
                                        </div>
                                        <div class="titreprix">
                                            <div class="titre">
                                                <g:link controller="annonce" action="show" id="${annonce.id}">${annonce.title}</g:link>
                                            </div>
                                            <div class="prix">${annonce.price} €</div>
                                        </div>
                                        <div class="description">${annonce.description}</div>
                                        <div class="author">${annonce.author.username}</div>
                                    </div>
                                </sec:ifAllGranted>
                                <g:if test="${String.valueOf(annonce.author.id) == String.valueOf(sec.loggedInUserInfo(field: 'id'))}">
                                    <div class="annonce">
                                        <p>Annonce non activé</p>
                                        <div class="illu">
                                            <g:each in="${annonce.illustrations}" var="illustrations">
                                                <asset:image class="img" src="${illustrations.filename}"/>
                                            </g:each>
                                        </div>
                                        <div class="titreprix">
                                            <div class="titre">
                                                <g:link controller="annonce" action="show" id="${annonce.id}">${annonce.title}</g:link>
                                            </div>
                                            <div class="prix">${annonce.price} €</div>
                                        </div>
                                        <div class="description">${annonce.description}</div>
                                        <div class="author">${annonce.author.username}</div>
                                    </div>
                                </g:if>
                            </div>
                        </g:elseif>
                    </g:each>
                </div>
            </div>
            <div class="pagination">
                <g:paginate total="${annonceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>