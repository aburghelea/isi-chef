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

    <table class="table table-bordered">
        <thead>
        <tr>

            <g:sortableColumn property="name" title="${message(code: 'produs.name.label', default: 'Name')}"/>

            <g:sortableColumn property="price" title="${message(code: 'produs.price.label', default: 'Price')}"/>

            <g:sortableColumn property="description"
                              title="${message(code: 'produs.description.label', default: 'Description')}"/>

            <g:sortableColumn property="preparationTime"
                              title="${message(code: 'produs.preparationTime.label', default: 'Preparation Time')}"/>

            <g:sortableColumn property="code" title="${message(code: 'produs.code.label', default: 'Code')}"/>

            <g:sortableColumn property="type" title="${message(code: 'produs.type.label', default: 'Type')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${produsInstanceList}" status="i" var="produsInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show"
                            id="${produsInstance.id}">${fieldValue(bean: produsInstance, field: "name")}</g:link></td>

                <td>${fieldValue(bean: produsInstance, field: "price")}</td>

                <td>${fieldValue(bean: produsInstance, field: "description")}</td>

                <td>${fieldValue(bean: produsInstance, field: "preparationTime")}</td>

                <td>${fieldValue(bean: produsInstance, field: "code")}</td>

                <td>${fieldValue(bean: produsInstance, field: "type")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <bs:paginate total="${produsInstanceTotal}"/>
    </div>
</section>

</body>

</html>
