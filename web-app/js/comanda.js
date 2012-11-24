var buildDataSource = function (uri) {
    return new kendo.data.DataSource({
        type:"application/json",
        transport:{
            read:uri
        },
        schema:{
            'id' : {type: 'number'},
            'code':{type:'string'},
            'description':{type:'string'},
            'name':{type:'string'},
            'price':{type:'number'},
            '"type"':{type:'string'},
            'preparationTime':{type:'number'}
        },
        pageSize:10
    });
};

var buildTable = function (container, dataSource) {
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
                field:'name',
                filterable:true,
                title:"Name",
                width:'15%'
            },
            {
                field:'code',
                filterable:true,
                title:"code",
                width:'15%'
            },
            {
                field:'description',
                filterable:true,
                title:'Description'

            },
            {
                field:'price',
                filterable:true,
                title:"Price",
                width:'15%'
            },
            {
                field:'preparationTime',
                filterable:true,
                title:"Preparation time",
                width:'15%'
            },
            {
                field:'type',
                filterable:true,
                title:'Category',
                width:'15%'
            },
            {
                title:'Adauga la comanda',
                template: '#= addProductToOrderTemplate(id) #'
            }
        ]
    });

};

var buildTabPannel = function(container) {
    $(container).click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    });
};

var addProductToOrderTemplate = function (productId) {
    var link = $('<a name="add"></a>').html("Add").addClass("btn btn-small btn-success").attr('onClick', 'submitProductToSession('+productId+')');
    return $('<div></div>').append($(link)).html();
};
