
<%@ page import="ro.isi.restaurant.Masa" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'table.label', default: 'Table')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-table" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="table.number.label" default="Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tableInstance, field: "number")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="table.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tableInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="table.reservations.label" default="Reservations" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${tableInstance.reservations}" var="r">
						<li><g:link controller="reservation" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
