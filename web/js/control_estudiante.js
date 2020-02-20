
var app = angular.module('my-app', []);
var origin = window.location.origin + '/SGAA/';
var swalWithBootstrapButtons = Swal.mixin({
    customClass: {
        confirmButton: 'btn btn-success mr-3',
        cancelButton: 'btn btn-danger'
    },
    buttonsStyling: false
});

app.controller('agendarAsesoria', ['$scope', '$http', function ($scope, $http) {
        $http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
        $scope.docentes = [];
        $scope.asesoria = {};
        $scope.materia = undefined;

        $scope.inicioEstudiante = function () {
            $http({
                method: 'post',
                url: origin + 'cuatrimestre',
                data: {}
            }).then(function (response) {
                var cuatri = response.data.respuesta.cuatrimestre;
                var date = new Date();
                var initialLocaleCode = 'es';
                var calendarEl = document.getElementById('calendar');
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    plugins: ['interaction', 'dayGrid', 'timeGrid', 'list'],
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
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
                    }
                });
                calendar.render();
            });
        };

        $scope.changeMateria = function (e) {
            console.log(e);
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
    }]);
