<%@ page import="ro.isi.restaurant.Rezervare" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'rezervare.label', default: 'Rezervare')}"/>
    <title><g:message code="default.list.label" args="[entityName]" default="List ${entityName}"/></title>
</head>

<body>

<section id="list-rezervare" class="first">

    <table class="table table-bordered">
        <thead>
        <tr>

            <g:sortableColumn property="startDate"
                              title="${message(code: 'rezervare.startDate.label', default: 'Start Date')}"/>

            <g:sortableColumn property="endDate"
                              title="${message(code: 'rezervare.endDate.label', default: 'End Date')}"/>

            <th><g:message code="rezervare.masa.label" default="Masa"/></th>

            <g:sortableColumn property="tableId"
                              title="${message(code: 'rezervare.tableId.label', default: 'Table Id')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${rezervareInstanceList}" status="i" var="rezervareInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show"
                            id="${rezervareInstance.id}">${fieldValue(bean: rezervareInstance, field: "startDate")}</g:link></td>

                <td><g:formatDate date="${rezervareInstance.endDate}"/></td>

                <td>${fieldValue(bean: rezervareInstance, field: "masa")}</td>

                <td>${fieldValue(bean: rezervareInstance, field: "tableId")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <bs:paginate total="${rezervareInstanceTotal}"/>
    </div>
</section>

</body>

</html>
