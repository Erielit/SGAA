/*========= stroll js start ========= */
'use strict';
$(document).ready(function () {
    stroll.bind('.scroll-list');
    var a = $(".wave").height();
    $(".wave").slimScroll({
        height: 250,
        allowPageScroll: false,
        color: '#000'
    });
});
/*========= stroll js end ========= */
