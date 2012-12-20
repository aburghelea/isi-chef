<%@ page import="grails.converters.JSON; ro.isi.restaurant.Comanda" %>


<div class="control-group fieldcontain ${hasErrors(bean: comandaInstance, field: 'waiter', 'error')} required">
    <label for="waiter" class="control-label"><g:message code="comanda.waiter.label" default="Waiter"/><span
            class="required-indicator">*</span></label>

    <div class="controls">
        <g:select id="waiter" name="waiter.id" from="${ro.isi.auth.User.list()}"
                  optionKey="id"
                  required="true"
                  optionValue="username"
                  value="${comandaInstance?.waiter?.id}" class="many-to-one"
                  noSelection="['': 'No waiter assigned']"/>
        <span class="help-inline">${hasErrors(bean: comandaInstance, field: 'waiter', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: comandaInstance, field: 'masa', 'error')} required">
    <label for="masa" class="control-label">
        <g:message code="comanda.masa.label" default="Table"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:select id="masa" name="masa.id" from="${ro.isi.restaurant.Masa.list()}" optionKey="id"
                  optionValue="${{ it.number + ": " + it.description?.substring(0, Math.min(10, it.description?.length())) }}"
                  value="${comandaInstance?.masa?.id}" class="many-to-one"
                  noSelection="['': 'Select the table']"/>
        <span class="help-inline">${hasErrors(bean: comandaInstance, field: 'masa', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: comandaInstance, field: 'drinksServed', 'error')} required">
    <label for="masa" class="control-label">
        <g:message code="comanda.drinks.label" default="Drinks"/>
        <span class="required-indicator">*</span></label>

    <div class="controls">
        <bs:checkBox name="drinksServerd" value="${comandaInstance?.drinksServerd}"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: comandaInstance, field: 'produses', 'error')} ">
    <label for="products" class="control-label"><g:message code="comanda.product.label" default="Products"/></label>

    <div class="hidden" id='hiddenProducts'>
    </div>

    <div class="controls">
        <ul class="nav nav-tabs" id="products_nav">
            <li class="active"><a href="#products_tab">Add</a></li>
            <li><a href="#products_added_tab"
                   onclick="populateProductsIfNull(${comandaInstance.produses.collect {it.id} as JSON})">Ordered</a>
            </li>
        </ul>
    </div>

    <div class="controls">
        <div class="inline tab-content">
            <div class="tab-pane active" id="products_tab">
                <div id="products"></div>
            </div>

            <div class="tab-pane" id="products_added_tab">

                <div id="products_added"></div>
            </div>
        </div>
    </div>
</div>

<g:javascript src="comanda.js"/>

<r:script>
    $(document).ready(function () {
        buildTabPannel($('#products_nav a'));

        allProductsDataSource = buildDataSource("${createLink(controller: 'produs', action: 'listJSON')}");
        buildProdusKendoGrid($("#products"), allProductsDataSource, true);

        addedProductsDataSource = buildLocalDataSource(productsForNow);
        buildProdusKendoGrid($("#products_added"), addedProductsDataSource);

    });
</r:script>