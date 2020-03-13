var app = angular.module('coordinador-app', []);
var origin = window.location.origin + '/SGAA/';
var mensaje1 = "Acción realizada correctamente.";
var mensaje2 = "Ocurrió un error, intenta nuevamente.";
var Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    onOpen: function (toast) {
        toast.addEventListener('mouseenter', Swal.stopTimer);
        toast.addEventListener('mouseleave', Swal.resumeTimer);
    }
});
var swalWithBootstrapButtons = Swal.mixin({
    customClass: {
        confirmButton: 'btn btn-success mr-3',
        cancelButton: 'btn btn-default'
    },
    buttonsStyling: false
});

app.controller("coordinador", function ($scope, $http) {
    $scope.asesoriasM = [];
    $scope.asesoriasH = [];
    $scope.asesoriasDirectedM = [];
    $scope.asesoriasDirectedH = [];

    $scope.inicioCoordinador = function () {
        $http({
            method: 'post',
            url: origin + 'stadistics-coor',
            data: ""
        }).then(function (response) {
            console.log(response.data.respuesta);
            $scope.asesoriasM = response.data.respuesta.mujeres;
            $scope.asesoriasH = response.data.respuesta.hombres;
            $scope.asesoriasDirectedM = response.data.respuesta.mujeresD;
            $scope.asesoriasDirectedH = response.data.respuesta.hombresD;
            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['Mujeres', 'Hombres'],
                    datasets: [{
                            label: '# de asistencias',
                            data: [$scope.asesoriasM[0].id_estudiante, $scope.asesoriasH[0].id_estudiante],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)'
                            ],
                            borderWidth: 1,
                            barPercentage: 1,
                        }]
                }
            });
            var ctx = document.getElementById('myChart2').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: ['Mujeres', 'Hombres'],
                    datasets: [{
                            label: '# de asistencias',
                            data: [$scope.asesoriasDirectedM[0].id_estudiante, $scope.asesoriasDirectedH[0].id_estudiante],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)'
                            ],
                            borderWidth: 1,
                            barPercentage: 1,
                        }]
                }
            });

        });
    };
});