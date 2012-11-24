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
    a = typeof a !== 'undefined' ? a : false;
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

//noinspection JSUnusedGlobalSymbols
var addProductToOrderTemplate = function (productId) {
    var link = $('<a name="add"></a>')
        .html("Add")
        .addClass("btn btn-small btn-success")
        .attr('onClick', 'addProductToOrder(' + productId + ')');

    return $('<div></div>').append($(link)).html();
};

//noinspection JSUnusedGlobalSymbols
var removeProductFromOrderTemplate = function (productId) {
    var link = $('<a name="add"></a>')
        .html("Remove")
        .addClass("btn btn-small btn-danger")
        .attr('onClick', 'removeProductFromOrder(' + productId + ')');

    return $('<div></div>').append($(link)).html();
};

var operationTemplate = function (toDelete) {
    return toDelete == true ? '#= addProductToOrderTemplate(id) #' : '#= removeProductFromOrderTemplate(id) #';
};

var refreshTable = function (gridContainer) {
    $(gridContainer).data("kendoGrid").dataSource.read();
    $(gridContainer).data("kendoGrid").refresh();
};

var addProductToOrder = function (productId) {

    productsForNow.push(allProductsDataSource.get(productId).data);

    $('#hiddenProducts').empty();
    $.each(productsForNow, function (index, value) {
        $('<input/>').attr('type', 'hidden').attr('name', 'produses[' + index + '].id').attr('value', value.id).appendTo($('#hiddenProducts'));
    });
    updateAddedDataSource();
};

var updateAddedDataSource = function () {
    $("#products_added").data("kendoGrid").dataSource.data(productsForNow);
    refreshTable($("#products_added"));
};

var removeProductFromOrder = function (productId) {
    var element = allProductsDataSource.get(productId).data;
    alert(productsForNow.indexOf(element));
    productsForNow.splice(productsForNow.indexOf(element), 1);

    $("#products_added").data("kendoGrid").dataSource.data(productsForNow);
    refreshTable($("#products_added"));
};

var populateProductsForNow = function (data) {
    $.each(data, function (index, value) {
        productsForNow.push(allProductsDataSource.get(value).data);
    });
};

var populateProductsIfNull = function (data) {
    if (productsForNow.length <= 0) {
        populateProductsForNow(data);
        $("#products_added").data("kendoGrid").dataSource.data(productsForNow);
        refreshTable($("#products_added"));
    }
};