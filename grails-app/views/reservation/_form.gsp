<%@ page import="ro.isi.restaurant.Masa; ro.isi.restaurant.Rezervare" %>



			<div class="control-group fieldcontain ${hasErrors(bean: reservationInstance, field: 'startDate', 'error')} ">
				<label for="startDate" class="control-label"><g:message code="reservation.startDate.label" default="Start Date" /></label>
				<div class="controls">
					<bs:datePicker name="startDate" precision="day"  value="${reservationInstance?.startDate}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: reservationInstance, field: 'startDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reservationInstance, field: 'endDate', 'error')} ">
				<label for="endDate" class="control-label"><g:message code="reservation.endDate.label" default="End Date" /></label>
				<div class="controls">
					<bs:datePicker name="endDate" precision="day"  value="${reservationInstance?.endDate}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: reservationInstance, field: 'endDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reservationInstance, field: 'table', 'error')} required">
				<label for="table" class="control-label"><g:message code="reservation.table.label" default="Table" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="table" name="table.id" from="${Masa.list()}" optionKey="id" required="" value="${reservationInstance?.table?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: reservationInstance, field: 'table', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reservationInstance, field: 'tableId', 'error')} required">
				<label for="tableId" class="control-label"><g:message code="reservation.tableId.label" default="Table Id" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="tableId" required="" value="${reservationInstance.tableId}"/>
					<span class="help-inline">${hasErrors(bean: reservationInstance, field: 'tableId', 'error')}</span>
				</div>
			</div>

