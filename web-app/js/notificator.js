$(document).ready(function () {
    console.log(counterUrl);
    getOrdersCount();
    setInterval('getOrdersCount()', refreshInterval);
});

var getOrdersCount = function () {
    $.ajax({
        type:'GET',
        url:counterUrl,
        success:function (data, textStatus) {
            updateIndicators(data);
            console.log('bine');
        },
        error:function (XMLHttpRequest, textStatus, errorThrown) {
            console.log('rau');
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