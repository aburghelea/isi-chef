<%@ page import="ro.isi.restaurant.Produs" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'produs.label', default: 'Produs')}"/>
    <title><g:message code="default.list.label" args="[entityName]" default="List ${entityName}"/></title>
</head>

<body>

<section id="list-produs" class="first">
    <g:render template="printable" model="[produsInstanceMap: produsInstanceMap]"/>
</section>

</body>

</html>
