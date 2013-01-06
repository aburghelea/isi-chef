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

    <script>
        var assignUrl = "${createLink(controller: 'comanda', action: 'assignOrder')}";
        var showUrl = "${createLink(controller: 'comanda', action: 'show')}";
        $(document).ready(function () {
            var takenComandsDataSource = buildDataSource("${createLink(controller: 'comanda', action: 'listTakenOrdersAsJson')}");
            buildOrdersKendoGrid($("#products"), takenComandsDataSource, false);
        });
    </script>
</head>

<body>
<g:if test="${comandaInstance}">
    <g:render template="show" model="[comandaInstance: comandaInstance]"/>
    <div class="form-actions">
        <g:form action="markAsPrepared" style="margin: 0">
            <input type="hidden" name="id" value="${comandaInstance?.id}"/>
            <input type="submit" class="btn btn-inverse"
                   value="${message(code: "prepare.finalize.label", default: "Finalizeaza preparare")}">

        </g:form>
    </div>

</g:if>
<g:else>
    <div id="products"></div>

</g:else>

<g:javascript src="comanda.js"/>

</body>

</html>
