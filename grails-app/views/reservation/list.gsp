
<%@ page import="ro.isi.restaurant.Rezervare" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-reservation" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="startDate" title="${message(code: 'reservation.startDate.label', default: 'Start Date')}" />
			
				<g:sortableColumn property="endDate" title="${message(code: 'reservation.endDate.label', default: 'End Date')}" />
			
				<th><g:message code="reservation.table.label" default="Table" /></th>
			
				<g:sortableColumn property="tableId" title="${message(code: 'reservation.tableId.label', default: 'Table Id')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${reservationInstanceList}" status="i" var="reservationInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${reservationInstance.id}">${fieldValue(bean: reservationInstance, field: "startDate")}</g:link></td>
			
				<td><g:formatDate date="${reservationInstance.endDate}" /></td>
			
				<td>${fieldValue(bean: reservationInstance, field: "table")}</td>
			
				<td>${fieldValue(bean: reservationInstance, field: "tableId")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${reservationInstanceTotal}" />
	</div>
</section>

</body>

</html>
