<%@ page import="ro.isi.restaurant.Comanda" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'comanda.label', default: 'Comanda')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<g:render template="show" model="[comandaInstance: comandaInstance]"/>

<div class="form-actions">
    <g:link class="btn btn-small btn-warning" action="nota" id="${comandaInstance.id}">
        ${message(code: 'nota.label', default: 'Nota')}
    </g:link>
</div>

</body>

</html>
