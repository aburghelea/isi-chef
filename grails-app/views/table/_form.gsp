<%@ page import="ro.isi.restaurant.Masa" %>



			<div class="control-group fieldcontain ${hasErrors(bean: tableInstance, field: 'number', 'error')} ">
				<label for="number" class="control-label"><g:message code="table.number.label" default="Number" /></label>
				<div class="controls">
					<g:field type="number" name="number" value="${tableInstance.number}"/>
					<span class="help-inline">${hasErrors(bean: tableInstance, field: 'number', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: tableInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="table.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" maxlength="45" value="${tableInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: tableInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: tableInstance, field: 'reservations', 'error')} ">
				<label for="reservations" class="control-label"><g:message code="table.reservations.label" default="Reservations" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${tableInstance?.reservations?}" var="r">
    <li><g:link controller="reservation" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="reservation" action="create" params="['table.id': tableInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reservation.label', default: 'Reservation')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: tableInstance, field: 'reservations', 'error')}</span>
				</div>
			</div>

