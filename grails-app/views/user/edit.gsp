<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title>Modification du profil de ${user.username}</title>
        <link href="../../assets/editUser.css" rel="stylesheet" type="text/css" media="all" />
    </head>
    <body>
        <a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><img class="imgHome" src="../../assets/house.png"/> Retour à l'accueil</a></li>
                <li><g:link class="list" action="index"><img src="../../assets/userlist.png"/> Liste des utilisateurs</g:link></li>
                <li><g:link class="create" action="create"><img src="../../assets/addUser.png"/> Ajouter un nouvel utilisateur</g:link></li>
            </ul>
        </div>
        <div id="edit-user" class="content scaffold-edit" role="main">
            <h1>Modification du profil de ${user.username}</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.user}" method="PUT">
                <g:hiddenField name="version" value="${this.user?.version}" />
                <fieldset class="form">
                    <form action="/user/update/${user.id}" method="post">
                        <input type="hidden" name="_method" value="PUT" id="_method">
                        <input type="hidden" name="version" value="0" id="version">
                        <fieldset class="form">
                            <div class="container">
                                <div class="fieldcontain required">
                                    <div class="txtnomuser">
                                        <label for="username">Username
                                            <span class="required-indicator">*</span>
                                        </label>
                                    </div>
                                    <input class="nomuser" type="text" name="username" value="${user.username}" required="" id="username">
                                </div>
                                <div class="fieldcontain">
                                    <div class="texttel">
                                        <label for="tel">Tel</label>
                                    </div>
                                    <input class="tel" type="text" name="tel" value="${user.tel}" maxlength="16" id="tel">
                                </div>
                                <div class="fieldcontain required">
                                    <div class="textmail">
                                        <label for="email">Email
                                            <span class="required-indicator">*</span>
                                        </label>
                                    </div>
                                    <input class="mail" type="email" name="email" value="${user.email}" required="" id="email">
                                </div>
                                <div class="fieldcontain">
                                    <div class="textroleuser">
                                        <label for="nouveauRole">Role</label>
                                    </div>
                                    <g:select class="roleuser" from="${annonces.estia.Role.list()}" name="nouveauRole" optionKey="id" optionValue="authority" value="${user.getAuthorities().id}"/>
                                </div>
                                <div class="ckbox">
                                    <div class="fieldcontain">
                                        <label for="passwordExpired">Password Expired</label>
                                        <input type="hidden" name="_passwordExpired">
                                        <g:if test="${user.passwordExpired == true}">
                                            <input class="checkbox" type="checkbox" name="passwordExpired" checked="checked" id="passwordExpired">
                                        </g:if>
                                        <g:else>
                                            <input class="checkbox" type="checkbox" name="passwordExpired" id="passwordExpired">
                                        </g:else>
                                    </div>
                                    <div class="fieldcontain">
                                        <label for="enabled">Enabled</label>
                                        <input type="hidden" name="_enabled">
                                        <g:if test="${user.enabled == true}">
                                            <input class="checkbox" type="checkbox" name="enabled" checked="checked" id="enabled">
                                        </g:if>
                                        <g:else>
                                            <input class="checkbox" type="checkbox" name="enabled" id="enabled">
                                        </g:else>
                                    </div>
                                    <div class="fieldcontain">
                                        <label for="accountLocked">Account Locked</label>
                                        <input type="hidden" name="_accountLocked">
                                        <g:if test="${user.accountLocked == true}">
                                            <input class="checkbox" type="checkbox" name="accountLocked" checked="checked" id="accountLocked">
                                        </g:if>
                                        <g:else>
                                            <input class="checkbox" type="checkbox" name="accountLocked" id="accountLocked">
                                        </g:else>
                                    </div>
                                    <div class="fieldcontain">
                                        <label for="accountExpired">Account Expired</label>
                                        <input type="hidden" name="_accountExpired">
                                        <g:if test="${user.accountExpired == true}">
                                            <input class="checkbox" type="checkbox" name="accountExpired" checked="checked" id="accountExpired">
                                        </g:if>
                                        <g:else>
                                            <input class="checkbox" type="checkbox" name="accountExpired" id="accountExpired">
                                        </g:else>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </form>

                    <fieldset class="buttons">
                        <input class="save" type="submit" value="Mettre à jour" />
                    </fieldset>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
