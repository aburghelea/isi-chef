$(document).ready(function () {
    getOrdersCount();
    setInterval('getOrdersCount()', refreshInterval);
});

var getOrdersCount = function () {
    $.ajax({
        type:'GET',
        url: counterUrl,
        success:function (data, textStatus) {
            $('#ordersIndicator').html(data);
            console.log('bine');
        },
        error:function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('rau');
        }
    });
}