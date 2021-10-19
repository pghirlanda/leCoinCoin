<%@ page import="annonces.estia.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
    <title>
    <g:message code="default.edit.label" args="[entityName]" />
    </title>
</head>
<body>
<a href="#edit-annonce" class="skip" tabindex="-1">
    <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
</a>
<div class="nav" role="navigation">
    <ul>
        <li>
            <a class="home" href="${createLink(uri: '/')}">
                <g:message code="default.home.label"/>
            </a>
        </li>
        <li>
            <g:link class="list" action="index">
                <g:message code="default.list.label" args="[entityName]" />
            </g:link>
        </li>
        <li>
            <g:link class="create" action="create">
                <g:message code="default.new.label" args="[entityName]" />
            </g:link>
        </li>
    </ul>
</div>
<div id="edit-annonce" class="content scaffold-edit" role="main">
    <h1>
        <g:message code="default.edit.label" args="[entityName]" />
    </h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.annonce}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.annonce}" var="error">
                <li
                    <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>
                >
                    <g:message error="${error}"/>
                </li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form resource="${this.annonce}" method="PUT" enctype="multipart/form-data">
        <g:hiddenField name="version" value="${this.annonce?.version}" />
        <fieldset class="form">
            <div class="fieldcontain required">
                <label for="title">Title
                    <span class="required-indicator">*</span>
                </label><input type="text" name="title" value="${annonce.title}" required="" maxlength="100" id="title">
            </div>
            <div class="fieldcontain">
                <label for="description">Description</label><input type="text" name="description" value="${annonce.description}" id="description">
            </div>
            <div class="fieldcontain required">
                <label for="price">Price
                    <span class="required-indicator">*</span>
                </label><input type="number decimal" name="price" value="${annonce.price}" required="" min="0.0" id="price">
            </div>
            <div class="fieldcontain">
                <label for="active">Active</label><input type="hidden" name="_active"><input type="checkbox" name="active" checked="${annonce.active}" id="active">
            </div>
            <div class="fieldcontain">
                <label>Illustrations</label>
                <ul>
                    <g:each in="${annonce.illustrations}" var="illustrations">
                        <li>
                            <asset:image class="img" src="${illustrations.filename}"/>
                        </li>
                    </g:each>
                </ul>
            </div>
            <div class="fieldcontain">
                <label>Illustrations</label><input type="file" name="filename" id="filename" multiple="multiple">
            </div>

            <sec:ifAllGranted roles="ROLE_ADMIN">
                <div class="fieldcontain required">
                    <label for="author">Author
                        <span class="required-indicator">*</span>
                    </label>
                    <g:select from="${User.list()}" name="author" optionKey="id" optionValue="username"/>

                </div>
            </sec:ifAllGranted>
        </fieldset>
        <fieldset class="buttons">
            <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        </fieldset>
    </g:form>
</div>
</body>
</html>