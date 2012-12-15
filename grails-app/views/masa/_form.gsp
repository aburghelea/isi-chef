<%@ page import="ro.isi.restaurant.Masa" %>



			<div class="control-group fieldcontain ${hasErrors(bean: masaInstance, field: 'number', 'error')} ">
				<label for="number" class="control-label"><g:message code="masa.number.label" default="Number" /></label>
				<div class="controls">
					<g:field type="number" name="number" value="${masaInstance.number}"/>
					<span class="help-inline">${hasErrors(bean: masaInstance, field: 'number', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: masaInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="masa.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" maxlength="45" value="${masaInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: masaInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: masaInstance, field: 'comandas', 'error')} ">
				<label for="comandas" class="control-label"><g:message code="comandas.label" default="Comandas" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${masaInstance?.comandas?}" var="c">
    <li><g:link controller="comanda" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="comanda" action="create" params="['masa.id': masaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'comanda.label', default: 'Comanda')],default: 'Add '+message(code: 'comanda.label', default: 'Comanda'))}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: masaInstance, field: 'comandas', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: masaInstance, field: 'rezervares', 'error')} ">
				<label for="rezervares" class="control-label"><g:message code="masa.rezervares.label" default="Rezervares" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${masaInstance?.rezervares?}" var="r">
    <li><g:link controller="rezervare" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="rezervare" action="create" params="['masa.id': masaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'rezervare.label', default: 'Rezervare')], default: 'Add '+message(code: 'rezervare.label', default: 'Rezervare'))}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: masaInstance, field: 'rezervares', 'error')}</span>
				</div>
			</div>

