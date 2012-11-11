<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode" %>



			<div class="control-group fieldcontain ${hasErrors(bean: registrationCodeInstance, field: 'token', 'error')} ">
				<label for="token" class="control-label"><g:message code="registrationCode.token.label" default="Token" /></label>
				<div class="controls">
					<g:textField name="token" value="${registrationCodeInstance?.token}"/>
					<span class="help-inline">${hasErrors(bean: registrationCodeInstance, field: 'token', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: registrationCodeInstance, field: 'username', 'error')} ">
				<label for="username" class="control-label"><g:message code="registrationCode.username.label" default="Username" /></label>
				<div class="controls">
					<g:textField name="username" value="${registrationCodeInstance?.username}"/>
					<span class="help-inline">${hasErrors(bean: registrationCodeInstance, field: 'username', 'error')}</span>
				</div>
			</div>

