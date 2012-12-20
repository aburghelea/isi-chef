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

<section id="list-comanda" class="first">

    <table class="table table-bordered">
        <thead>
        <tr>

            <th><g:message code="comanda.cook.label" default="Cook"/></th>

            <th><g:message code="comanda.masa.label" default="Masa"/></th>

            <th><g:message code="comanda.waiter.label" default="Waiter"/></th>

            <th><g:message code="comanda.operations.label" default="Operations"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${comandaInstanceList}" status="i" var="comandaInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td>${fieldValue(bean: comandaInstance, field: "cook")}</td>

                <td>${fieldValue(bean: comandaInstance, field: "masa")}</td>

                <td>${fieldValue(bean: comandaInstance, field: "waiter")}</td>
                <td>
                    <div class="left">
                        <g:link class="btn btn-small btn-info" action="show" id="${comandaInstance.id}">
                            ${message(code: 'comada.operations.show', default: 'Show')}
                        </g:link>
                    </div>
                    <g:if test="${drinks == true}">
                        %{--<div style="margin: 0 0 0 10px;">--}%
                        <div class="left">
                        <g:form controller="comanda" action="deliverDrink" style="margin: 0px">
                            <input type="hidden" name="orderId" value="${comandaInstance.id}">
                            <g:submitButton name="submit" class="btn btn-small btn-inverse"
                                            value="${message(code: 'comada.operations.deliverDrink', default: 'Deliver drink')}"/>

                        </g:form>
                        </div>
                    </g:if>

                </td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <g:if test="${drinks == true}">
        <div class="pagination">
            <bs:paginate total="${comandaInstanceTotal}"/>
        </div>

    </g:if>
</section>

</body>

</html>
