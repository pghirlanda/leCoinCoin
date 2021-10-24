<%@ page import="annonces.estia.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
    <title>Edition de l'annonce ${annonce.title}</title>
    <link href="../../assets/editAnnonce.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<a href="#edit-annonce" class="skip" tabindex="-1">
    <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
</a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><img class="imgHome" src="../../assets/house.png"/> Retour à l'accueil</a></li>
        <li><g:link class="list" action="index"><img class="imgHome" src="../../assets/listannonce.png"/> Retour aux annonces</g:link></li>
        <li><g:link class="create" action="create"><img class="imgHome" src="../../assets/addannonce.png"/> Créer une annonce</g:link></li>
    </ul>
</div>
<div id="edit-annonce" class="content scaffold-edit" role="main">
    <h1>Modification de l'annonce ${annonce.title}</h1>
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
    <g:uploadForm action = "update" id="${annonce.id}">
        <g:hiddenField name="version" value="${this.annonce?.version}" />
        <fieldset class="form">
            <div class="fieldcontain">
                <div class="illus">
                    <g:each in="${annonce.illustrations}" var="illustrations">
                        <div class="illutrash">
                            <asset:image class="img" src="${illustrations.filename}"/>
%{--                            <g:link controller="illustration" action="delete" id="${illustrations.id}" params="[id_annonce: annonce.id]">--}%
                                <g:img class="poubelle" dir="images" file="/supprimer.png"/>
%{--                            </g:link>--}%
                        </div>
                    </g:each>
                </div>
            </div>
            <div class="text">
                <div class="fieldcontain required">
                    <div class="txttitle">
                        <label for="title">Title
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <input class="title" type="text" name="title" value="${annonce.title}" required="" maxlength="100" id="title">
                </div>

                <div class="fieldcontain">
                    <div class="colonne">
                        <label class="txtdescription" for="description">Description</label>
                        <input class="description" type="text" name="description" value="${annonce.description}" id="description">
                    </div>
                </div>

                <div class="fieldcontain required">
                    <div class="txtprice">
                        <label for="price">Price
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <input class="price" type="number decimal" name="price" value="${Float.toString(annonce.price).replace('.',',')}" required="" min="0,0" id="price">
                </div>

                <div class="fieldcontain">
                    <div class="colonne">
                        <label class="txtillustration">Ajouter des illustrations</label>
                        <input class="illustration" type="file" name="filename" id="filename" multiple="multiple">
                    </div>
                </div>
            </div>

            <div class="fieldcontain">
                <div class="active">
                    <label for="active">Active</label>
                    <input type="hidden" name="_active">
                    <g:if test="${annonce.active == true}">
                        <input type="checkbox" name="active" checked="" id="active">
                    </g:if>
                    <g:elseif test="${annonce.active == false}">
                        <input type="checkbox" name="active" id="active">
                    </g:elseif>
                </div>
            </div>


            <sec:ifAllGranted roles="ROLE_ADMIN">
                <div class="fieldcontain required">
                    <div class="role">
                        <label for="author">Author
                            <span class="required-indicator">*</span>
                        </label>
                        <g:select from="${User.list()}" name="author" optionKey="id" optionValue="username" value="${annonce.author.id}"/>
                    </div>
                </div>
            </sec:ifAllGranted>
        </fieldset>

        <fieldset class="buttons">
            <input class="save" type="submit" value="Enregistrer les modifications" />
        </fieldset>
    </g:uploadForm>
</div>
</body>
</html>