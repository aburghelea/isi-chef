var allProductsDataSource;
var addedProductsDataSource;
var productsForNow = [];

var Produs = kendo.data.Model.define({
    id:'id',
    fields:{
        code:{type:'string'},
        description:{type:'string'},
        name:{type:'string'},
        price:{type:'number'},
        '"type"':{type:'string'},
        preparationTime:{type:'number'}
    }
});

var buildLocalDataSource = function (data) {
    return new kendo.data.DataSource({
        data:data,
        schema:{model:Produs},
        pageSize:10
    });
};

var buildDataSource = function (uri) {
    return new kendo.data.DataSource({
        type:"application/json",
        transport:{
            read:uri
        },
        schema:{
            model:Produs
        },
        pageSize:10
    });
};

var buildKendoGrid = function (container, dataSource, toDelete) {
    $(container).kendoGrid({
        dataSource:dataSource,
        sortable:true,
        filterable:true,
        pageable:{
            refresh:true,
            pageSizes:true
        },
        columns:[
            {
                field:'name', filterable:true, title:"Name", width:'15%'
            },
            {
                field:'code', filterable:true, title:"code", width:'15%'
            },
            {
                field:'description', filterable:true, title:'Description'
            },
            {
                field:'price', filterable:true, title:"Price", width:'10%'
            },
            {
                field:'preparationTime', filterable:true, title:"Prep. time", width:'10%'
            },
            {
                field:'type', filterable:true, title:'Category', width:'15%'
            },
            {
                title:'Operations', template:operationTemplate(toDelete), width:'10%'
            }
        ]
    });
};

var buildTabPannel = function (container) {
    $(container).click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    });
};

var refreshTable = function (gridContainer) {
    $(gridContainer).data("kendoGrid").dataSource.read();
    $(gridContainer).data("kendoGrid").refresh();
};

var updateAddedDataSource = function () {
    $("#products_added").data("kendoGrid").dataSource.data(productsForNow);
    refreshTable($("#products_added"));
};

var operationTemplate = function (toDelete) {
    return toDelete == true ? '#= addProductToOrderTemplate(id) #' : '#= removeProductFromOrderTemplate(id) #';
};

//noinspection JSUnusedGlobalSymbols
var addProductToOrderTemplate = function (productId) {
    var link = $('<a name="add"></a>')
        .html("Add")
        .addClass("btn btn-small btn-info")
        .attr('onClick', 'addProductToOrder(' + productId + ')');
    var badge = '<span id="badge' + productId + '" class="badge badge-warn">0</span>';
    return $('<div class="row"></div>')
        .append($("<div class='span1'></div> ").append(link))
        .append($("<div class='span1'></div> ").append(badge))
        .html();
};

//noinspection JSUnusedGlobalSymbols
var removeProductFromOrderTemplate = function (productId) {
    var link = $('<a name="add"></a>')
        .html("Remove")
        .addClass("btn btn-small btn-danger")
        .attr('onClick', 'removeProductFromOrder(' + productId + ')');
    return $('<div></div>').append($(link)).html();
};

var addProductToOrder = function (productId) {
    $("#ok" + productId).show();

    productsForNow.push(allProductsDataSource.get(productId).data);
    updateBadge(productId);
    updateAddedDataSource();
    updateFormParameters();

    $("#ok" + productId).fadeOut("slow");
};

var removeProductFromOrder = function (productId) {
    var element = allProductsDataSource.get(productId).data;
    productsForNow.splice(productsForNow.indexOf(element), 1);
    updateFormParameters();
    updateBadge(productId, false);
    updateAddedDataSource();
};

var updateFormParameters = function () {
    $('#hiddenProducts').empty();
    console.log(productsForNow);
    $.each(productsForNow, function (index, value) {
        $('<input/>')
            .attr('type', 'hidden')
            .attr('name', 'produses[' + index + '].id')
            .attr('value', value.id)
            .appendTo($('#hiddenProducts'));
    });
};

var updateBadge = function (productId, increment) {
    increment = increment == false ? -1 : +1;
    var badge = $("#badge" + productId);
    var value = parseInt($(badge).html()) + increment;
    $(badge).html(value);
};

var populateProductsForNow = function (data) {
    $.each(data, function (index, value) {
        productsForNow.push(allProductsDataSource.get(value).data);
    });
};

//noinspection JSUnusedGlobalSymbols
var populateProductsIfNull = function (data) {
    if (productsForNow.length <= 0) {
        populateProductsForNow(data);
        $("#products_added").data("kendoGrid").dataSource.data(productsForNow);
        updateAddedDataSource();
    }
};

//noinspection JSUnusedGlobalSymbols
var resetProducts = function () {
    productsForNow = [];
    updateAddedDataSource();
};