
<%@ page import="ro.isi.restaurant.Rezervare" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-reservation" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reservation.startDate.label" default="Start Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${reservationInstance?.startDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reservation.endDate.label" default="End Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${reservationInstance?.endDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reservation.table.label" default="Table" /></td>
				
				<td valign="top" class="value"><g:link controller="table" action="show" id="${reservationInstance?.table?.id}">${reservationInstance?.table?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reservation.tableId.label" default="Table Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reservationInstance, field: "tableId")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
