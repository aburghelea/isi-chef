<%@ page import="ro.isi.restaurant.Masa" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'masa.label', default: 'Masa')}"/>
    <title><g:message code="default.show.label" args="[entityName]" default="Show ${entityName}"/></title>
</head>

<body>

<section id="show-masa" class="first">

    <table class="table">
        <tbody>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="masa.number.label" default="Number"/></td>

            <td valign="top" class="value">${fieldValue(bean: masaInstance, field: "number")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="masa.description.label" default="Description"/></td>

            <td valign="top" class="value">${fieldValue(bean: masaInstance, field: "description")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="comandas.label" default="Comandas"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${masaInstance.comandas}" var="c">
                        <li><g:link controller="comanda" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="masa.rezervares.label" default="Rezervares"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${masaInstance.rezervares}" var="r">
                        <li><g:link controller="rezervare" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        </tbody>
    </table>
</section>

</body>

</html>
