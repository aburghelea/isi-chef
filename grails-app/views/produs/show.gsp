
<%@ page import="ro.isi.restaurant.Produs" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'produs.label', default: 'Produs')}" />
	<title><g:message code="default.show.label" args="[entityName]" default="Show ${entityName}" /></title>
</head>

<body>

<section id="show-produs" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="produs.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: produsInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="produs.price.label" default="Price" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: produsInstance, field: "price")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="produs.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: produsInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="produs.preparationTime.label" default="Preparation Time" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: produsInstance, field: "preparationTime")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="produs.code.label" default="Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: produsInstance, field: "code")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="produs.type.label" default="Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: produsInstance, field: "type")}</td>
				
			</tr>

		</tbody>
	</table>
</section>

</body>

</html>
