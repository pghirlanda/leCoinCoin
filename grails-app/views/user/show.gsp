<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title>Profil de ${user.username}</title>
        <link href="../../assets/userShow.css" rel="stylesheet" type="text/css" media="all" />
    </head>
<body>
<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><img class="imgHome" src="../../assets/house.png"/> Retour à l'accueil</a></li>
        <li><g:link class="list" action="index"><img src="../../assets/userlist.png"/> Liste des utilisateurs</g:link></li>
        <li><g:link class="create" action="create"><img src="../../assets/addUser.png"/> Ajouter un nouvel utilisateur</g:link></li>
    </ul>
</div>
<div id="show-user" class="content scaffold-show" role="main">
    <h1>Profil de ${user.username}</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div class="container">
        <div class="property-list user">
            <div class="texthaut">
                <div class="ut">
                    <li class="fieldcontain">
                        <div class="username">
                            <span id="username-label" class="txtnomuser">Username</span>
                            <div class="nomuser" aria-labelledby="username-label">${user.username}</div>
                        </div>
                    </li>

                    <li class="fieldcontain">
                        <div class="telephone">
                            <span id="tel-label" class="texttel">Numéro de téléphone</span>
                            <div class="tel" aria-labelledby="tel-label">${user.tel}</div>
                        </div>
                    </li>
                </div>
                <div class="er">
                    <li class="fieldcontain">
                        <div class="email">
                            <span id="email-label" class="textmail">Email</span>
                            <div class="mail" aria-labelledby="email-label">${user.email}</div>
                        </div>
                    </li>

                    <li class="fieldcontain">
                        <div class="roleUser">
                            <span id="role-label" class="textroleuser">Role</span>
                            <div class="roleuser" aria-labelledby="role-label">
                                <ul>
                                    <g:each in="${user.getAuthorities()}" var="userRole">
                                        ${userRole.authority}
                                    </g:each>
                                </ul>
                            </div>
                        </div>
                    </li>
                </div>
            </div>

            <div class="ck">
                <g:if test="${user.passwordExpired==false}">
                    <span id="passwordExpired-label" class="property-label">Password Expired</span>
                    <input type="checkbox" style="width:15px; height:15px;" class="property-value" aria-labelledby="passwordExpired-label" disabled readonly></input>
                </g:if>
                <g:elseif test="${user.passwordExpired==true}">
                    <span id="passwordExpired-label" class="property-label">Password Expired</span>
                    <input type="checkbox" style="width:15px; height:15px;" class="property-value" aria-labelledby="passwordExpired-label" checked disabled readonly></input>
                </g:elseif>
                <g:if test="${user.accountLocked==false}">
                    <span id="accountLocked-label" class="property-label">Account Locked</span>
                    <input type="checkbox" style="width:15px; height:15px;" class="property-value" aria-labelledby="accountLocked-label" disabled readonly></input>
                </g:if>
                <g:elseif test="${user.accountLocked==true}">
                    <span id="accountLocked-label" class="property-label">Account Locked</span>
                    <input type="checkbox" style="width:15px; height:15px;" class="property-value" aria-labelledby="accountLocked-label" checked disabled readonly></input>
                </g:elseif>
                <g:if test="${user.accountExpired==false}">
                    <span id="accountExpired-label" class="property-label">Account Expired</span>
                    <input type="checkbox" style="width:15px; height:15px;" class="property-value" aria-labelledby="accountExpired-label" disabled readonly></input>
                </g:if>
                <g:elseif test="${user.accountExpired==true}">
                    <span id="accountExpired-label" class="property-label">Account Expired</span>
                    <input type="checkbox" style="width:15px; height:15px;" class="property-value" aria-labelledby="accountExpired-label" checked disabled readonly></input>
                </g:elseif>
                <g:if test="${user.enabled==false}">
                    <span id="enabled-label" class="property-label">Enabled</span>
                    <input type="checkbox" style="width:15px; height:15px;" class="property-value" aria-labelledby="enabled-label" disabled readonly></input>
                </g:if>
                <g:elseif test="${user.enabled==true}">
                    <span id="enabled-label" class="property-label">Enabled</span>
                    <input type="checkbox" style="width:15px; height:15px;" class="property-value" aria-labelledby="enabled-label" checked disabled readonly></input>
                </g:elseif>
            </div>

            <nav>
                <div id="annonces-label" class="deroulant">
                    <div class="annonce">Annonces :</div>
                </div>
                <div class="property-value" aria-labelledby="annonces-label">
                    <ul>
                        <g:each in="${user.annonces}" var="annonce">
                            <li><g:link controller="annonce" action="show" id="${annonce.id}">${annonce.title}</g:link></li>
                        </g:each>
                    </ul>
                </div>
            </nav>
        </div>
    </div>

    <g:form resource="${this.user}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.user}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</body>
</html>
