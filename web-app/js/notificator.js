$(document).ready(function () {
    getOrdersCount();
    setInterval('getOrdersCount()', refreshInterval);
});

var getOrdersCount = function () {
    $.ajax({
        type:'GET',
        url:counterUrl,
        success:function (data, textStatus) {
            updateIndicators(data);
        },
        error:function (XMLHttpRequest, textStatus, errorThrown) {
        }
    });
};

var updateIndicators = function(data){
    var oldData = $('#ordersIndicator').html();
    $('#ordersIndicator').html(data);

    if (parseInt(oldData) < parseInt(data)) {
        notifyNewOrder();
    }
};

function notifyNewOrder() {
    var audio = new Audio(soundEffect);
    audio.play();
}