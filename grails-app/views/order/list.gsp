
<%@ page import="ro.isi.restaurant.Order" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'order.label', default: 'Order')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-order" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="table" title="${message(code: 'order.table.label', default: 'Table')}" />
			
				<g:sortableColumn property="ordercol" title="${message(code: 'order.ordercol.label', default: 'Ordercol')}" />
			
				<g:sortableColumn property="cookId" title="${message(code: 'order.cookId.label', default: 'Cook Id')}" />
			
				<th><g:message code="order.userByCookId.label" default="User By Cook Id" /></th>
			
				<th><g:message code="order.userByWaiterId.label" default="User By Waiter Id" /></th>
			
				<g:sortableColumn property="waiterId" title="${message(code: 'order.waiterId.label', default: 'Waiter Id')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${orderInstanceList}" status="i" var="orderInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${orderInstance.id}">${fieldValue(bean: orderInstance, field: "table")}</g:link></td>
			
				<td>${fieldValue(bean: orderInstance, field: "ordercol")}</td>
			
				<td>${fieldValue(bean: orderInstance, field: "cookId")}</td>
			
				<td>${fieldValue(bean: orderInstance, field: "userByCookId")}</td>
			
				<td>${fieldValue(bean: orderInstance, field: "userByWaiterId")}</td>
			
				<td>${fieldValue(bean: orderInstance, field: "waiterId")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${orderInstanceTotal}" />
	</div>
</section>

</body>

</html>
