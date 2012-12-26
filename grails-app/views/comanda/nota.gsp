<%@ page import="ro.isi.restaurant.Comanda" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'comanda.label', default: 'Comanda')}"/>
    <title><g:message code="default.nota.label" args="[entityName]" default = "Nota ${entityName}"/></title>
</head>

<body>
<g:render template="nota" model="[comandaInstance: comandaInstance]"/>

</body>

</html>