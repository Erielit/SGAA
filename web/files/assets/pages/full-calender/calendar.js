"use strict";
$(document).ready(function () {
    var date = new Date();
    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay,listMonth'
        },
        locale: 'es',
        defaultDate: date,
        navLinks: true, // can click day/week names to navigate views
        businessHours: true, // display business hours
        dayClick: function (date, jsEvent, view) {
            $("#default-Modal").modal('show');
            console.log(date);
        }
    });
});
