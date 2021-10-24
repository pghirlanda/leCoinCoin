<%@ page import="annonces.estia.Annonce" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'illustration.label', default: 'Illustration')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-illustration" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><img class="imgHome" src="../../assets/house.png"/> Retour à l'accueil</a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-illustration" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.illustration}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.illustration}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form resource="${this.illustration}" method="POST" enctype="multipart/form-data">
                <fieldset class="form">
                    <div class="fieldcontain required">
                        <label for="filename">Filename
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="file" name="filename" required="" id="filename">
                    </div>
                    <div class="fieldcontain required">
                        <label for="annonce">Annonce
                            <span class="required-indicator">*</span>
                        </label>
                        <g:select from="${Annonce.list()}" name="annonce" optionKey="id" optionValue="title"/>
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>

    <script>
        const fileUploader = document.getElementById('filename');
        const reader = new FileReader();

        fileUploader.addEventListener('change', (event) => {
            const files = event.target.files;
            const file = files[0];
            reader.readAsDataURL(file);

            reader.addEventListener('load', (event) => {
                const img = document.createElement('img');
                img.src = event.target.result;
                img.alt = file.name;
                var monSVG = document.createElementNS("http://www.w3.org/2000/svg",'svg');
                img.appendChild(monSVG);
            });
        });
    </script>
    </body>
</html>
