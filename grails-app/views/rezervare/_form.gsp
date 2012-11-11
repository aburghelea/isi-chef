<%@ page import="ro.isi.restaurant.Rezervare" %>



			<div class="control-group fieldcontain ${hasErrors(bean: rezervareInstance, field: 'startDate', 'error')} ">
				<label for="startDate" class="control-label"><g:message code="rezervare.startDate.label" default="Start Date" /></label>
				<div class="controls">
					<bs:datePicker name="startDate" precision="day"  value="${rezervareInstance?.startDate}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: rezervareInstance, field: 'startDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: rezervareInstance, field: 'endDate', 'error')} ">
				<label for="endDate" class="control-label"><g:message code="rezervare.endDate.label" default="End Date" /></label>
				<div class="controls">
					<bs:datePicker name="endDate" precision="day"  value="${rezervareInstance?.endDate}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: rezervareInstance, field: 'endDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: rezervareInstance, field: 'masa', 'error')} required">
				<label for="masa" class="control-label"><g:message code="rezervare.masa.label" default="Masa" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="masa" name="masa.id" from="${ro.isi.restaurant.Masa.list()}" optionKey="id" required="" value="${rezervareInstance?.masa?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: rezervareInstance, field: 'masa', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: rezervareInstance, field: 'tableId', 'error')} required">
				<label for="tableId" class="control-label"><g:message code="rezervare.tableId.label" default="Table Id" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="tableId" required="" value="${rezervareInstance.tableId}"/>
					<span class="help-inline">${hasErrors(bean: rezervareInstance, field: 'tableId', 'error')}</span>
				</div>
			</div>

