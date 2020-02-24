
var app = angular.module('my-app', []);
var origin = window.location.origin + '/SGAA/';
var swalWithBootstrapButtons = Swal.mixin({
    customClass: {
        confirmButton: 'btn btn-success mr-3',
        cancelButton: 'btn btn-default'
    },
    buttonsStyling: false
});

app.controller('agendarAsesoria', ['$scope', '$http', function ($scope, $http) {
        $http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
        $scope.docentes = [];
        $scope.historial = [];
        $scope.asesoria = {};
        $scope.materia = undefined;

        $scope.inicioEstudiante = function () {
            $http({
                method: 'post',
                url: origin + 'cuatrimestre',
                data: {}
            }).then(function (response) {
                var asesorias = response.data.respuesta.asesorias;
                var asesorias_up = [];
                asesorias.map(function (x) {
                    asesorias_up.push({
                        id: x.id_asesoria,
                        title: "Asesoria",
                        start: x.date + "T" + x.horario.hora_inicio,
                        end: x.date + "T" + x.horario.hora_fin,
                        allDay: false
                    });
                });
                var cuatri = response.data.respuesta.cuatrimestre;
                var date = new Date();
                var initialLocaleCode = 'es';
                var calendarEl = document.getElementById('calendar');
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    plugins: ['interaction', 'dayGrid', 'timeGrid', 'list'],
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,listMonth'
                    },
                    defaultDate: '2019-08-12',
                    locale: initialLocaleCode,
                    buttonIcons: false, // show the prev/next text
                    weekNumbers: true,
                    navLinks: true, // can click day/week names to navigate views
                    editable: true,
                    eventLimit: true, // allow "more" link when too many events
                    validRange: {
                        start: date,
                        end: cuatri.fecha_fin
                    },
                    dateClick: function (dateInfo) {
                        document.getElementById('fecha').value = dateInfo.dateStr;
                        $("#default-Modal").modal('show');
                    },
                    events: asesorias_up,
                    eventClick: function (event) {
                        $scope.detalles(event.event.id);
                    }
                });
                calendar.render();
            });
        };

        $scope.detalles = function (id) {
            $http({
                method: 'post',
                url: origin + 'detalles-asesoria',
                data: 'number_param=' + id
            }).then(function (response) {
                var detalles = JSON.parse(response.data.respuesta.asesoria);
                $("#det_materia").text(detalles.materia);
                $("#det_docente").text(detalles.docente);
                var horario = detalles.horario.split(' ');
                $("#det_horario").text(horario[0].substring(1, 8) + " " + horario[1].substring(1, 8) + " PM");
                $("#det_fecha").text(detalles.fecha);
                $("#asesoria_cancelar").val(id);
                $("#cancelar-asesoria").modal('show');
            });
        };

        $scope.changeMateria = function (e) {
            $http({
                method: 'post',
                url: origin + 'listDocents',
                data: 'number_param=' + e
            }).then(function (response) {
                $scope.docentes = response.data.respuesta.docentes;
            });
        };

        $scope.confirmAsesoria = function (asesoria) {
            var estudiante = document.getElementById('estudiante').value;
            var fecha = document.getElementById('fecha').value;
            var horario = document.getElementById('horario').value;
            var docente = document.getElementById('docente').value;
            var materia = document.getElementById('materia').value;
            var data = {
                estudiante: estudiante,
                fecha: fecha,
                horario: horario,
                docente: docente,
                materia: materia
            };
            $scope.asesoria = angular.toJson(data);
            $("#params").val($scope.asesoria);
            $("#default-Modal").modal('hide');
            swalWithBootstrapButtons.fire({
                title: 'Agendar asesoria',
                text: "Confirmar para continuar la acción.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Aceptar',
                cancelButtonText: 'Cancelar'
            }).then(function (result) {
                if (result.value) {
                    $("#formAsesoria").submit();
                } else {
                    $("#default-Modal").modal('show');
                }
            });
        };

        $scope.cancelarAsesoria = function () {
            $("#cancelar-asesoria").modal('hide');
            swalWithBootstrapButtons.fire({
                title: 'Cancelar asesoria',
                text: "Confirmar para continuar la acción.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Aceptar',
                cancelButtonText: 'Cancelar'
            }).then(function (result) {
                if (result.value) {
                    $("#form_cancelar").submit();
                } else {
                    $("#cancelar-asesoria").modal('show');
                }
            });
        };

        //        $scope.historialEstudiante = function () {
//            $http({
//                method: 'post',
//                url: origin + 'list-historial',
//                data: {}
//            }).then(function (response) {
//                var data = response.data.respuesta.asesoria;
//                console.log(JSON.parse(data));
//                $('#dt-ajax-array').DataTable({
//                    "processing": true,
//                    "data": JSON.parse(data),
//                    columns: [
//                        {title: "Docente"},
//                        {title: "Materia"},
//                        {title: "Fecha"},
//                        {title: "Horario"},
//                        {title: "Estado"}
//                    ]
//                });
//            });
//        };

        $scope.historialEstudiante = function () {
            $http({
                method: 'post',
                url: origin + 'list-historial'
            }).then(function (response) {
                var data = JSON.parse(response.data.respuesta.asesoria);
                $scope.historial = data;
//                $('#dt-ajax-array').DataTable({ajax: data});
            });
        };
    }]);
