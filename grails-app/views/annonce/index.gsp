<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <link href="../../assets/annoncesIndex.css" rel="stylesheet" type="text/css" media="all" />
    </head>
    <body>
        <a href="#list-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-annonce" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <div class="annonces">
                <g:each in="${annonceList}" var="annonce">
                    <div class="annonce">
                        <div>
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
                </g:each>
            </div>
            <div class="pagination">
                <g:paginate total="${annonceCount ?: 0}" />
            </div>
    <script>
        (function changeImage()
        {
            var element=document.getElementById('vetement')
            if (element.src.match("vetementestia")) //element est un objet de type image
            {
                element.src="multimedia/mugz.jpg";
            }
            else if (element.src.match("mugz"))
            {
                element.src="multimedia/usbb.jpg";
            }
            else
            {
                element.src="multimedia/vetementestia.png"
            }
        })()
        setInterval(changeImage, 3000))
    </script>
    </body>
</html>