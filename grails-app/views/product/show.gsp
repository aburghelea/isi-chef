
<%@ page import="ro.isi.restaurant.Produs" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-product" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.price.label" default="Price" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "price")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.preparationTime.label" default="Preparation Time" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "preparationTime")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.code.label" default="Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "code")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.type.label" default="Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "type")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.orders.label" default="Orders" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${productInstance.orders}" var="o">
						<li><g:link controller="order" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
