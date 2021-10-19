<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-user" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
                            <div class="fieldcontain required">
                            <label for="username">Username
                                <span class="required-indicator">*</span>
                            </label>
                                <input type="text" name="username" value="${user.username}" required="" id="username">
                            </div>
                            <div class="fieldcontain">
                                <label for="tel">Tel</label>
                                <input type="text" name="tel" value="${user.tel}" maxlength="16" id="tel">
                            </div>
                            <div class="fieldcontain required">
                                <label for="email">Email
                                    <span class="required-indicator">*</span>
                                </label>
                                <input type="email" name="email" value="${user.email}" required="" id="email">
                            </div>
                            <div class="fieldcontain">
                                <label>Annonces</label>
                                <ul><g:each in="${user.annonces}" var="annonce">
                                    <li>
                                        <g:link controller="annonce" action="show" id="${annonce.id}">${annonce.title}</g:link>
                                    </li>
                                </g:each></ul>
                            </div>
                            <div class="fieldcontain">
                                <label for="nouveauRole">Role</label>
                                <g:select from="${annonces.estia.Role.list()}" name="nouveauRole" optionKey="id" optionValue="authority"/>
                            </div>
                            <div class="fieldcontain">
                                <label for="passwordExpired">Password Expired</label>
                                <input type="hidden" name="_passwordExpired">
                                <input type="checkbox" name="passwordExpired" id="passwordExpired">
                            </div>
                            <div class="fieldcontain">
                                <label for="accountLocked">Account Locked</label>
                                <input type="hidden" name="_accountLocked">
                                <input type="checkbox" name="accountLocked" id="accountLocked">
                            </div>
                            <div class="fieldcontain">
                                <label for="accountExpired">Account Expired</label>
                                <input type="hidden" name="_accountExpired">
                                <input type="checkbox" name="accountExpired" id="accountExpired">
                            </div>
                            <div class="fieldcontain">
                                <label for="enabled">Enabled</label>
                                <input type="hidden" name="_enabled">
                                <input type="checkbox" name="enabled" checked="checked" id="enabled">
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
