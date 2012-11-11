
<%@ page import="ro.isi.restaurant.Comanda" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'comanda.label', default: 'Comanda')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-comanda" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="comanda.cook.label" default="Cook" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${comandaInstance?.cook?.id}">${comandaInstance?.cook?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="comanda.masa.label" default="Masa" /></td>
				
				<td valign="top" class="value"><g:link controller="masa" action="show" id="${comandaInstance?.masa?.id}">${comandaInstance?.masa?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="comanda.produses.label" default="Produses" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${comandaInstance.produses}" var="p">
						<li><g:link controller="produs" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="comanda.waiter.label" default="Waiter" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${comandaInstance?.waiter?.id}">${comandaInstance?.waiter?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
