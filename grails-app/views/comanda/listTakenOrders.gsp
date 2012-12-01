<%--
  Created by IntelliJ IDEA.
  User: iceman
  Date: 12/1/12
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>


<%@ page import="ro.isi.restaurant.Comanda" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'comanda.label', default: 'Comanda')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<div id="products"></div>

<g:javascript src="comanda.js"/>

<r:script>

    var assignUrl = "${createLink(controller: 'comanda', action: 'assignOrder')}";

    $(document).ready(function () {
        var takenComandsDataSource = buildDataSource("${createLink(controller: 'comanda', action: 'listTakenOrdersAsJson')}");
        buildTakenOrdersKendoGrid($("#products"), takenComandsDataSource);
    });
</r:script>

</body>

</html>
