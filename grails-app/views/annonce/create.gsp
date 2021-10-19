<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-annonce" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.annonce}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.annonce}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.annonce}" method="POST" enctype="multipart/form-data">
                <fieldset class="form">
                    <div class="fieldcontain required">
                        <label for="title">Title
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="title" value="" required="" maxlength="100" id="title">
                    </div>
                    <div class="fieldcontain">
                        <label for="description">Description</label>
                        <input type="text" name="description" value="" id="description">
                    </div>
                    <div class="fieldcontain required">
                        <label for="price">Price
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="number decimal" name="price" value="" required="" min="0.0" id="price">
                    </div>
                    <div class="fieldcontain">
                        <label for="active">Active</label><input type="hidden" name="_active"><input type="checkbox" name="active" id="active">
                    </div>
                    <div class="fieldcontain">
                        <label>Illustrations</label><input type="file" name="filename" required="" id="filename" multiple="multiple">
                    </div>
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <div class="fieldcontain required">
                            <label>Author
                                <span class="required-indicator">*</span>
                            </label>
                            <g:select from="${annonces.estia.User.list()}" name="author" optionKey="id" optionValue="username"/>
                        </div>
                    </sec:ifAllGranted>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
