$(document).ready(function () {
    getOrdersCount();
    getDrinksCount();
    setInterval('getOrdersCount()', refreshInterval);
    setInterval('getDrinksCount()', refreshInterval);
});

var getOrdersCount = function () {
    $.ajax({
        type:'GET',
        url:counterUrl,
        success:function (data, textStatus) {
            updateIndicators(data,'#ordersIndicator', true);
        },
        error:function (XMLHttpRequest, textStatus, errorThrown) {
        }
    });
};

var getDrinksCount = function () {
    console.log(drinksUrl);
    if (drinksUrl == undefined)
        return;
    $.ajax({
        type:'GET',
        url:drinksUrl,
        success:function (data, textStatus) {
            updateIndicators(data,'#drinksIndicator', false);
        },
        error:function (XMLHttpRequest, textStatus, errorThrown) {
        }
    });
};

var updateIndicators = function(data, selector, sound){
    var oldData = $(selector).html();
    $(selector).html(data);

    if (parseInt(oldData) < parseInt(data)) {
        notifyNewOrder(sound);
    }
};

function notifyNewOrder(sound) {
    if (sound == true){
    var audio = new Audio(soundEffect);
    audio.play();
    }
}