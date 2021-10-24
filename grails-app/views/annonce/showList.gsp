<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
    <title>Mes annonces</title>
    <link href="../../assets/annoncesIndex.css" rel="stylesheet" type="text/css" media="all" />
</head>

<body>
<a href="#list-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><img class="imgHome" src="../../assets/house.png"/> Retour à l'accueil</a></li>
        <li><g:link class="list" action="index"><img class="imgHome" src="../../assets/listannonce.png"/> Retour aux annonces</g:link></li>
        <sec:ifLoggedIn>
            <li><g:link class="create" action="create"><img class="imgHome" src="../../assets/addannonce.png"/> Créer une nouvelle annonce</g:link></li>
        </sec:ifLoggedIn>
    </ul>
</div>
<div id="list-annonce" class="content scaffold-list" role="main">
    <h1>Voici vos annonces</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div class="annonces">
        <g:each in="${annonceList}" var="annonce">
            <g:if test="${String.valueOf(annonce.author.id) == String.valueOf(sec.loggedInUserInfo(field: "id"))}">
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
                    </div>
                </g:elseif>
            </g:if>
        </g:each>
    </div>
</body>
</html>