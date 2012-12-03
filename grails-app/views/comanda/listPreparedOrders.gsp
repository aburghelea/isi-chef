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
    <g:javascript src="comanda.js"/>
    <script>
        var assignUrl = "${createLink(controller: 'comanda', action: 'assignOrder')}";
        var deliverUrl = "${createLink(controller: 'comanda', action: 'deliverOrder')}";
        $(document).ready(function () {
            var preparedOrders = buildDataSource("${createLink(controller: 'comanda', action: 'listPreparedOrdersAsJson')}");
            buildOrdersKendoGrid($("#products"), preparedOrders, true);
        });
    </script>
</head>

<body>

<div id="products"></div>

</body>

</html>
