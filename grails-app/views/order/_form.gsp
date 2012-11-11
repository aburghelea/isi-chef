<%@ page import="ro.isi.restaurant.Order" %>



			<div class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'table', 'error')} ">
				<label for="table" class="control-label"><g:message code="order.table.label" default="Table" /></label>
				<div class="controls">
					<g:field type="number" name="table" value="${orderInstance.table}"/>
					<span class="help-inline">${hasErrors(bean: orderInstance, field: 'table', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'ordercol', 'error')} ">
				<label for="ordercol" class="control-label"><g:message code="order.ordercol.label" default="Ordercol" /></label>
				<div class="controls">
					<g:textField name="ordercol" maxlength="45" value="${orderInstance?.ordercol}"/>
					<span class="help-inline">${hasErrors(bean: orderInstance, field: 'ordercol', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'cookId', 'error')} required">
				<label for="cookId" class="control-label"><g:message code="order.cookId.label" default="Cook Id" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="cookId" required="" value="${orderInstance.cookId}"/>
					<span class="help-inline">${hasErrors(bean: orderInstance, field: 'cookId', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'products', 'error')} ">
				<label for="products" class="control-label"><g:message code="order.products.label" default="Products" /></label>
				<div class="controls">
					
					<span class="help-inline">${hasErrors(bean: orderInstance, field: 'products', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'userByCookId', 'error')} required">
				<label for="userByCookId" class="control-label"><g:message code="order.userByCookId.label" default="User By Cook Id" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="userByCookId" name="userByCookId.id" from="${ro.isi.auth.User.list()}" optionKey="id" required="" value="${orderInstance?.userByCookId?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: orderInstance, field: 'userByCookId', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'userByWaiterId', 'error')} required">
				<label for="userByWaiterId" class="control-label"><g:message code="order.userByWaiterId.label" default="User By Waiter Id" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="userByWaiterId" name="userByWaiterId.id" from="${ro.isi.auth.User.list()}" optionKey="id" required="" value="${orderInstance?.userByWaiterId?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: orderInstance, field: 'userByWaiterId', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'waiterId', 'error')} required">
				<label for="waiterId" class="control-label"><g:message code="order.waiterId.label" default="Waiter Id" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="waiterId" required="" value="${orderInstance.waiterId}"/>
					<span class="help-inline">${hasErrors(bean: orderInstance, field: 'waiterId', 'error')}</span>
				</div>
			</div>

