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

app.controller('administrador', function ($scope, $http) {
    $http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';


    $scope.confirmar = function () {
        swalWithBootstrapButtons.fire({
            title: 'Registrar Horario',
            text: "Confirmar para continuar la acción.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Aceptar',
            cancelButtonText: 'Cancelar'
        }).then(function (result) {
            if (result.value) {
                $("#registrar-horario").submit();
            }
        });
    };

    $scope.confirmarEstado = function (form) {
        swalWithBootstrapButtons.fire({
            title: 'Estado Horario',
            text: "Confirmar para continuar la acción.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Aceptar',
            cancelButtonText: 'Cancelar'
        }).then(function (result) {
            if (result.value) {
                $('#' + form).submit();
            }
        });
    };
});