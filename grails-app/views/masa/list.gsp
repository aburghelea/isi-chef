<%@ page import="ro.isi.restaurant.Masa" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'masa.label', default: 'Masa')}"/>
    <title><g:message code="default.list.label" args="[entityName]" default="List ${entityName}"/></title>
</head>

<body>

<section id="list-masa" class="first">

    <table class="table table-bordered">
        <thead>
        <tr>

            <g:sortableColumn property="number" title="${message(code: 'masa.number.label', default: 'Number')}"/>

            <g:sortableColumn property="description"
                              title="${message(code: 'masa.description.label', default: 'Description')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${masaInstanceList}" status="i" var="masaInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show"
                            id="${masaInstance.id}">${fieldValue(bean: masaInstance, field: "number")}</g:link></td>

                <td>${fieldValue(bean: masaInstance, field: "description")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <bs:paginate total="${masaInstanceTotal}"/>
    </div>
</section>

</body>

</html>
