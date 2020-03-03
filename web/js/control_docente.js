var app = angular.module('docent-app', []);
var origin = window.location.origin + '/SGAA/';
var mensaje1 = "Acción realizada correctamente.";
var mensaje2 = "Ocurrió un error inténtalo nuevamente.";
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

app.controller('asesorias', function ($scope, $http) {
    $http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

    $scope.aceptarAsesoria = function (id) {
        console.log(id);
        swalWithBootstrapButtons.fire({
            title: 'Aceptar asesoria',
            text: "Confirmar para continuar la acción.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Aceptar',
            cancelButtonText: 'Cancelar'
        }).then(function (result) {
            if (result.value) {
                $http({
                    method: 'post',
                    url: origin + 'asesoria-aceptada',
                    data: "param_integer=" + id
                }).then(function (response) {
                    var mensaje = response.data.respuesta.mensaje;
                    console.log(mensaje);
                });
            }
        });
    };

    $scope.rechazarAsesoria = function (id) {
        console.log(id);
        swalWithBootstrapButtons.fire({
            title: 'Rechazar asesoria',
            text: "Confirmar para continuar la acción.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Aceptar',
            cancelButtonText: 'Cancelar'
        }).then(function (result) {
            if (result.value) {
                $http({
                    method: 'post',
                    url: origin + 'asesoria-rechazada',
                    data: "param_integer=" + id
                }).then(function (response) {
                    var mensaje = response.data.respuesta.mensaje;
                    console.log(mensaje);
                });
            }
        });
    };
});