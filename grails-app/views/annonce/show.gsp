<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-annonce" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <div id="list-annonce" class="content scaffold-list" role="main">
                <h1>${annonce.title}</h1>
                <ul>
                    <li>
                        <g:each in="${annonce.illustrations}" var="illustrations">
                            <asset:image class="img" src="${illustrations.filename}"/>
                        </g:each>
                    </li>

                    <li class="fieldcontain">
                        <span id="description-label" class="property-label">Description</span>
                        <div class="property-value">${annonce.description}</div>
                    </li>

                    <li class="fieldcontain">
                        <span id="prix-label" class="property-label">Prix</span>
                        <div class="property-value">${annonce.price}</div>
                    </li>

                    <li class="fieldcontain">
                        <span id="creation-label" class="property-label">Date de création</span>
                        <div class="property-value">${annonce.dateCreated}</div>
                    </li>

                    <li class="fieldcontain">
                        <span id="update-label" class="property-label">Dernière mise à jour</span>
                        <div class="property-value">${annonce.lastUpdated}</div>
                    </li>

                    <li class="fieldcontain">
                        <span id="author-label" class="property-label">Publié par</span>
                        <div class="property-value">${annonce.author.username}</div>
                    </li>
                </ul>
            </div>
            <sec:ifAllGranted roles="ROLE_ADMIN">
                <g:form resource="${this.annonce}" method="DELETE">
                    <fieldset class="buttons">
                        <g:link class="edit" action="edit" resource="${this.annonce}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </fieldset>
                </g:form>
            </sec:ifAllGranted>

            <g:if test="${String.valueOf(annonce.author.id) == String.valueOf(sec.loggedInUserInfo(field: 'id'))}">
                <g:form resource="${this.annonce}" method="DELETE">
                    <fieldset class="buttons">
                        <g:link class="edit" action="edit" resource="${this.annonce}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </fieldset>
                </g:form>
            </g:if>

        </div>


    </body>
</html>
