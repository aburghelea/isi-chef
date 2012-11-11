<%@ page import="ro.isi.restaurant.Comanda; ro.isi.restaurant.Produs" %>



			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="product.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" maxlength="45" value="${productInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'price', 'error')} ">
				<label for="price" class="control-label"><g:message code="product.price.label" default="Price" /></label>
				<div class="controls">
					<g:field type="number" name="price" value="${productInstance.price}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'price', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="product.description.label" default="Description" /></label>
				<div class="controls">
					<g:textArea name="description" cols="40" rows="5" maxlength="500" value="${productInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'preparationTime', 'error')} ">
				<label for="preparationTime" class="control-label"><g:message code="product.preparationTime.label" default="Preparation Time" /></label>
				<div class="controls">
					<g:field type="number" name="preparationTime" value="${productInstance.preparationTime}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'preparationTime', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'code', 'error')} ">
				<label for="code" class="control-label"><g:message code="product.code.label" default="Code" /></label>
				<div class="controls">
					<g:textField name="code" maxlength="45" value="${productInstance?.code}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'code', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'type', 'error')} ">
				<label for="type" class="control-label"><g:message code="product.type.label" default="Type" /></label>
				<div class="controls">
					<g:textField name="type" maxlength="45" value="${productInstance?.type}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'type', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'orders', 'error')} ">
				<label for="orders" class="control-label"><g:message code="product.orders.label" default="Orders" /></label>
				<div class="controls">
					<g:select name="orders" from="${Comanda.list()}" multiple="multiple" optionKey="id" size="5" value="${productInstance?.orders*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'orders', 'error')}</span>
				</div>
			</div>

