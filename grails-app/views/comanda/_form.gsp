<%@ page import="ro.isi.restaurant.Comanda" %>


<div class="control-group fieldcontain ${hasErrors(bean: comandaInstance, field: 'waiter', 'error')} required">
    <label for="waiter" class="control-label"><g:message code="comanda.waiter.label" default="Waiter"/><span
            class="required-indicator">*</span></label>

    <div class="controls">
        <g:select id="waiter" name="waiter.id" from="${ro.isi.auth.User.list()}" optionKey="id" required=""
                  value="${comandaInstance?.waiter?.id}" class="many-to-one"/>
        <span class="help-inline">${hasErrors(bean: comandaInstance, field: 'waiter', 'error')}</span>
    </div>

</div>

<div class="control-group fieldcontain ${hasErrors(bean: comandaInstance, field: 'cook', 'error')} required">
    <label for="cook" class="control-label"><g:message code="comanda.cook.label" default="Cook"/><span
            class="required-indicator">*</span></label>

    <div class="controls">
        <g:select id="cook" name="cook.id" from="${ro.isi.auth.User.list()}" optionKey="id" required=""
                  value="${comandaInstance?.cook?.id}" class="many-to-one"/>
        <span class="help-inline">${hasErrors(bean: comandaInstance, field: 'cook', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: comandaInstance, field: 'masa', 'error')} required">
    <label for="masa" class="control-label"><g:message code="comanda.masa.label" default="Masa"/><span
            class="required-indicator">*</span></label>

    <div class="controls">
        <g:select id="masa" name="masa.id" from="${ro.isi.restaurant.Masa.list()}" optionKey="id"
                  optionValue="${{it.number + ": " + it.description?.substring(0, Math.min(10, it.description?.length())) }}"
                  value="${comandaInstance?.masa?.id}" class="many-to-one"
                onchange="resetProducts()"
        />
        <span class="help-inline">${hasErrors(bean: comandaInstance, field: 'masa', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: comandaInstance, field: 'produses', 'error')} ">
    <label for="products" class="control-label"><g:message code="comanda.product.label" default="Products"/></label>

    %{--<div class="controls">--}%
        %{--<g:select name="produses" from="${ro.isi.restaurant.Produs.list()}" multiple="multiple" optionKey="id" size="5" value="${comandaInstance?.produses*.id}" class="many-to-many"/>--}%
        %{--<span class="help-inline">${hasErrors(bean: comandaInstance, field: 'produses', 'error')}</span>--}%
    %{--</div>--}%

    <div class="" id='hiddenProducts'>
    </div>

    <div class="controls">
        <ul class="nav nav-tabs" id="products_nav">
            <li class="active"><a href="#products_tab">Add</a></li>
            <li><a href="#products_added_tab">Ordered</a></li>
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

<div id="test"></div>
<g:javascript src="comanda.js"/>
<r:script>
    var productsForNow = [];
    var resetProducts = function() {
        productsForNow = [];
    };
    $(document).ready(function () {
        buildTabPannel($('#products_nav a'));

        var allProductsDataSource = buildDataSource("${createLink(controller: 'produs', action: 'listJSON')}");
        buildTable($("#products"), allProductsDataSource);

        var addedProductsDataSource = buildDataSource("${createLink(controller: 'produs', action: 'listNone')}");
        buildTable($("#products_added"), addedProductsDataSource);

    });

    var submitProductToSession = function(productId) {
        productsForNow.push(productId);
        console.log(productsForNow);
        $('#hiddenProducts').empty();
        $.each(productsForNow, function(index, value){

            $('<input>')/*.attr('type', 'hidden')*/.attr('name', 'produses['+index+'].id').attr('value',value).appendTo($('#hiddenProducts'));

        });



        %{--$.ajax ({--}%
            %{--type : "POST",--}%
            %{--url : "${createLink(controller: 'comanda', action: 'addProductToSession')}",--}%
            %{--data : {tableId: $('#masa :selected').val(), productId: productId},--}%
            %{--success : function () {console.log('Added');},--}%
            %{--error : function() {alert('Could not add the product');}--}%
        %{--});--}%

    };


</r:script>