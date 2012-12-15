<%@ page import="ro.isi.restaurant.Produs" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'produs.label', default: 'Produs')}" />
	<title><g:message code="default.edit.label" args="[entityName]" default="Edit ${entityName}" /></title>
</head>

<body>

<section id="edit-produs" class="first">

	<g:hasErrors bean="${produsInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${produsInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${produsInstance?.id}" />
		<g:hiddenField name="version" value="${produsInstance?.version}" />
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<div class="form-actions">
			<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            <button class="btn" type="reset">${message(code: 'default.button.cancel.label', default: 'Cancel')}</button>
		</div>
	</g:form>

</section>
			
</body>

</html>
