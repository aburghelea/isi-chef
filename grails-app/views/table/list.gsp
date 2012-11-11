
<%@ page import="ro.isi.restaurant.Table" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'table.label', default: 'Table')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-table" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="number" title="${message(code: 'table.number.label', default: 'Number')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'table.description.label', default: 'Description')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${tableInstanceList}" status="i" var="tableInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${tableInstance.id}">${fieldValue(bean: tableInstance, field: "number")}</g:link></td>
			
				<td>${fieldValue(bean: tableInstance, field: "description")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${tableInstanceTotal}" />
	</div>
</section>

</body>

</html>
