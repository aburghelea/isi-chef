<%@ page import="ro.isi.restaurant.Comanda" %>



			<div class="control-group fieldcontain ${hasErrors(bean: comandaInstance, field: 'cook', 'error')} required">
				<label for="cook" class="control-label"><g:message code="comanda.cook.label" default="Cook" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="cook" name="cook.id" from="${ro.isi.auth.User.list()}" optionKey="id" required="" value="${comandaInstance?.cook?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: comandaInstance, field: 'cook', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: comandaInstance, field: 'masa', 'error')} required">
				<label for="masa" class="control-label"><g:message code="comanda.masa.label" default="Masa" /></label>
				<div class="controls">
					<g:select id="masa" name="masa.id" from="${ro.isi.restaurant.Masa.list()}" optionKey="id" value="${comandaInstance?.masa?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: comandaInstance, field: 'masa', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: comandaInstance, field: 'produses', 'error')} ">
				<label for="produses" class="control-label"><g:message code="comanda.produses.label" default="Produses" /></label>
				<div class="controls">
					<g:select name="produses" from="${ro.isi.restaurant.Produs.list()}" multiple="multiple" optionKey="id" size="5" value="${comandaInstance?.produses*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: comandaInstance, field: 'produses', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: comandaInstance, field: 'waiter', 'error')} required">
				<label for="waiter" class="control-label"><g:message code="comanda.waiter.label" default="Waiter" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="waiter" name="waiter.id" from="${ro.isi.auth.User.list()}" optionKey="id" required="" value="${comandaInstance?.waiter?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: comandaInstance, field: 'waiter', 'error')}</span>
				</div>
			</div>

