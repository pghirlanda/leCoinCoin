<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
    <title>Création d'une annonce</title>
    <link href="../../assets/createAnnonce.css" rel="stylesheet" type="text/css" media="all" />

</head>
<body>
<a href="#create-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><img class="imgHome" src="../../assets/house.png"/> Retour à l'accueil</a></li>
        <li><g:link class="list" action="index"><img class="imgHome" src="../../assets/listannonce.png"/> Retour aux annonces</g:link></li>
    </ul>
</div>
<div id="create-annonce" class="content scaffold-create" role="main">
    <h1>Déposer une annonce</h1>
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
            <div class="titre">
                <span class="titre2">
                    <div class="titre1">
                        <div>
                            <div class="nom">
                                <label class="loulou" for="title">Titre
                                    <span class="required-indicator">*</span>
                                </label>
                            </div>

                            <div class="chps">
                                <input type="text" class="inpt" name="title" value="" required="" maxlength="100" id="title">
                            </div>
                        </div>
                        <div>
                            <div class="nom">
                                <label class="loulou" for="description">Description</label>
                            </div>
                            <div class="chps">
                                <input type="text" class="inpt" name="description" value="" id="description">
                            </div>
                        </div>

                        <div>
                            <div class="nom">
                                <label class="loulou" for="price">Prix
                                    <span class="required-indicator">*</span>
                                </label>
                                <div class="chps">
                                    <input type="number decimal" class="inpt" name="price" value="" required="" min="0.0" id="price">
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="nom">
                                <label class="loulou">Illustrations</label>
                                <div class="chps">
                                    <input type="file" class="inpt" name="filename" required="" id="filename" multiple="multiple">
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="checkbox">
                                <div class="loulou">
                                    <label class="act" for="active">Activé</label>
                                    <div class="chps">
                                        <input type="hidden" name="_active"><input type="checkbox" name="active" id="active">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <div class="fieldcontain required">
                                <div class="txt">
                                    <label class="author">Author
                                        <span class="required-indicator">*</span>
                                    </label>
                                </div>
                                <g:select class="choixrole" from="${annonces.estia.User.list()}" name="author" optionKey="id" optionValue="username"/>
                            </div>
                        </sec:ifAllGranted>
                    </div>
                </span>

                <div class="tout">
                    <div class="img">
                        <img class="fit-picture" src="../../assets/ampoule.png" alt="Grapefruit slice atop a pile of other slices">
                    </div>
                    <div class="paragraphe">
                        <p>
                            Votre annonce sera trouvée plus facilement !
                        </p>
                        <p>
                            Vous aurez 50% de chances en plus d’être contacté si votre annonce est dans la bonne catégorie.
                        </p>
                    </div>
                </div>
            </div>
        </fieldset>
        <fieldset class="buttons">
            <input type="submit" name="create" class="create" value="Create" id="create">
        </fieldset>
    </g:form>
</div>
</body>
</html>