<%@ page import="ro.isi.restaurant.Rezervare" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'rezervare.label', default: 'Rezervare')}"/>
    <title><g:message code="default.show.label" args="[entityName]" default="Show ${entityName}"/></title>
</head>

<body>

<section id="show-rezervare" class="first">

    <table class="table">
        <tbody>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="rezervare.startDate.label" default="Start Date"/></td>

            <td valign="top" class="value"><g:formatDate date="${rezervareInstance?.startDate}"/></td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="rezervare.endDate.label" default="End Date"/></td>

            <td valign="top" class="value"><g:formatDate date="${rezervareInstance?.endDate}"/></td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="rezervare.masa.label" default="Masa"/></td>

            <td valign="top" class="value">
                <g:link controller="masa" action="show" id="${rezervareInstance?.masa?.id}">
                    ${rezervareInstance?.masa?.description}
                </g:link>
            </td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="rezervare.name.label" default="name"/></td>

            <td valign="top" class="value">${fieldValue(bean: rezervareInstance, field: "name")}</td>

        </tr>

        </tbody>
    </table>
</section>

</body>

</html>
