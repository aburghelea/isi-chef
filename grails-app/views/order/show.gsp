
<%@ page import="ro.isi.restaurant.Order" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'order.label', default: 'Order')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-order" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="order.table.label" default="Table" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: orderInstance, field: "table")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="order.ordercol.label" default="Ordercol" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: orderInstance, field: "ordercol")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="order.cookId.label" default="Cook Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: orderInstance, field: "cookId")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="order.products.label" default="Products" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${orderInstance.products}" var="p">
						<li><g:link controller="product" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="order.userByCookId.label" default="User By Cook Id" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${orderInstance?.userByCookId?.id}">${orderInstance?.userByCookId?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="order.userByWaiterId.label" default="User By Waiter Id" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${orderInstance?.userByWaiterId?.id}">${orderInstance?.userByWaiterId?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="order.waiterId.label" default="Waiter Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: orderInstance, field: "waiterId")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
