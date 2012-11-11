
<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'registrationCode.label', default: 'RegistrationCode')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-registrationCode" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="registrationCode.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${registrationCodeInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="registrationCode.token.label" default="Token" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: registrationCodeInstance, field: "token")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="registrationCode.username.label" default="Username" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: registrationCodeInstance, field: "username")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
