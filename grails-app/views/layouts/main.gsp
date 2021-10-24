<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="logopage.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark navbar-static-top" role="navigation">
    <a class="navbar-brand" href="/#"><asset:image class="imageLogo" src="logo.png" alt="Grails Logo"/></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" aria-expanded="false" style="height: 0.8px;" id="navbarContent">
        <h1 class="titreLogo">LeCoinCoin</h1>
        <ul class="nav navbar-nav ml-auto">
            <g:pageProperty name="page.nav"/>
        </ul>
    </div>

</nav>

<g:layoutBody/>

<footer class="footer row" role="contentinfo">
    <p>Lecoincoin 2021</p>
    <p class="footerMilieu">All rights reserved Adeline Feurté and Pauline Ghirlanda</p>
    <div class="footerDroite">
        <p>Retrouvez-nous sur LinkedIn</p>
        <a href="https://www.linkedin.com/in/adeline-feurte-583971196/" class="imgLinkedin"><g:img class="imgLinkedin" dir="images" file="/linkedin.png"/></a>
        <a href="https://www.linkedin.com/in/pauline-ghirlanda-58b335193/" class="imgLinkedin"><g:img class="imgLinkedin" dir="images" file="/linkedin.png"/></a>
    </div>
</footer>


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
