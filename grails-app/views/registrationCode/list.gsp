
<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'registrationCode.label', default: 'RegistrationCode')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-registrationCode" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'registrationCode.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="token" title="${message(code: 'registrationCode.token.label', default: 'Token')}" />
			
				<g:sortableColumn property="username" title="${message(code: 'registrationCode.username.label', default: 'Username')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${registrationCodeInstanceList}" status="i" var="registrationCodeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${registrationCodeInstance.id}">${fieldValue(bean: registrationCodeInstance, field: "dateCreated")}</g:link></td>
			
				<td>${fieldValue(bean: registrationCodeInstance, field: "token")}</td>
			
				<td>${fieldValue(bean: registrationCodeInstance, field: "username")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${registrationCodeInstanceTotal}" />
	</div>
</section>

</body>

</html>
