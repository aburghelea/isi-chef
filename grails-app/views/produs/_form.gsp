<%@ page import="ro.isi.restaurant.Produs" %>



<div class="control-group fieldcontain ${hasErrors(bean: produsInstance, field: 'name', 'error')} ">
    <label for="name" class="control-label"><g:message code="produs.name.label" default="Name"/></label>

    <div class="controls">
        <g:textField name="name" maxlength="45" value="${produsInstance?.name}"/>
        <span class="help-inline">${hasErrors(bean: produsInstance, field: 'name', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: produsInstance, field: 'price', 'error')} ">
    <label for="price" class="control-label"><g:message code="produs.price.label" default="Price"/></label>

    <div class="controls">
        <g:field type="number" name="price" value="${produsInstance.price}"/>
        <span class="help-inline">${hasErrors(bean: produsInstance, field: 'price', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: produsInstance, field: 'description', 'error')} ">
    <label for="description" class="control-label"><g:message code="produs.description.label"
                                                              default="Description"/></label>

    <div class="controls">
        <g:textArea name="description" cols="40" rows="5" maxlength="500" value="${produsInstance?.description}"/>
        <span class="help-inline">${hasErrors(bean: produsInstance, field: 'description', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: produsInstance, field: 'preparationTime', 'error')} ">
    <label for="preparationTime" class="control-label"><g:message code="produs.preparationTime.label"
                                                                  default="Preparation Time"/></label>

    <div class="controls">
        <g:field type="number" name="preparationTime" value="${produsInstance.preparationTime}"/>
        <span class="help-inline">${hasErrors(bean: produsInstance, field: 'preparationTime', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: produsInstance, field: 'stock', 'error')} ">
    <label for="preparationTime" class="control-label">
        <g:message code="produs.stock.label" default="Stock"/>
    </label>

    <div class="controls">
        <g:field type="number" name="stock" value="${produsInstance.stock}"/>
        <span class="help-inline">${hasErrors(bean: produsInstance, field: 'stock', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: produsInstance, field: 'code', 'error')} ">
    <label for="code" class="control-label"><g:message code="produs.code.label" default="Code"/></label>

    <div class="controls">
        <g:textField name="code" maxlength="45" value="${produsInstance?.code}"/>
        <span class="help-inline">${hasErrors(bean: produsInstance, field: 'code', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: produsInstance, field: 'type', 'error')} ">
    <label for="type" class="control-label"><g:message code="produs.type.label" default="Type"/></label>

    <div class="controls">
        <g:textField name="type" maxlength="45" value="${produsInstance?.type}"/>
        <span class="help-inline">${hasErrors(bean: produsInstance, field: 'type', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: produsInstance, field: 'comandas', 'error')} ">
    <label for="comandas" class="control-label"><g:message code="comandas.label" default="Comandas"/></label>

    <div class="controls">

        <span class="help-inline">${hasErrors(bean: produsInstance, field: 'comandas', 'error')}</span>
    </div>
</div>

