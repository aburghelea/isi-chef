
<%@ page import="ro.isi.restaurant.Comanda" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'comanda.label', default: 'Comanda')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-comanda" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<th><g:message code="comanda.cook.label" default="Cook" /></th>
			
				<th><g:message code="comanda.masa.label" default="Masa" /></th>
			
				<th><g:message code="comanda.waiter.label" default="Waiter" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${comandaInstanceList}" status="i" var="comandaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${comandaInstance.id}">${fieldValue(bean: comandaInstance, field: "cook")}</g:link></td>
			
				<td>${fieldValue(bean: comandaInstance, field: "masa")}</td>
			
				<td>${fieldValue(bean: comandaInstance, field: "waiter")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${comandaInstanceTotal}" />
	</div>
</section>

</body>

</html>
