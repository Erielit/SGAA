var app = angular.module('docent-app', []);
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

app.controller('buscarEstudiantes', function ($scope, $http) {
    $http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
    $scope.estudiantes = [];
    $scope.loading = undefined;
    $scope.obtenerEstudiantes = function (bean) {
        $scope.loading = true;
        bean.asesoria = document.getElementById('course').value;
        $http({
            method: 'post',
            url: raiz + 'obtenerEstudiantesSearch',
            data: "datos=" + bean.matricula + "&param_integer=" + bean.asesoria
        }).then(function (response) {
            $scope.estudiantes = response.data.respuesta.estudiantes;
            $scope.loading = false;
        });
    };
    $scope.asignarEstudiante = function (e) {
        e.asesoria = document.getElementById("course").value;
        e.estudiante = document.getElementById("estudiante").value;
        console.log(e);
        $http({
            method: 'post',
            url: raiz + 'asignarEstudianteAsesoria',
            data: "datos=" + e.asesoria + "&param_integer=" + e.estudiante
        }).then(function (response) {
            var mensaje = response.data.respuesta.mensaje;
            if (mensaje === "1") {
                Toast.fire({
                    icon: 'success',
                    text: mensaje1
                });
            } else if (mensaje === "2") {
                Toast.fire({
                    icon: 'error',
                    text: mensaje2
                });
            }
        });
    };

});

app.controller('asesorias', function ($scope, $http) {
    $http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

    $scope.aceptarAsesoria = function (id) {
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
                    if (mensaje === "1") {
                        Toast.fire({
                            icon: 'success',
                            title: mensaje1
                        });
                    } else if (mensaje === "2") {
                        Toast.fire({
                            icon: 'error',
                            title: mensaje2
                        });
                    }
                    window.location.reload();
                });
            }
        });
    };

    $scope.rechazarAsesoria = function (id) {
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
                    if (mensaje === "1") {
                        Toast.fire({
                            icon: 'success',
                            title: mensaje1
                        });
                    } else if (mensaje === "2") {
                        Toast.fire({
                            icon: 'error',
                            title: mensaje2
                        });
                    }
                    window.location.reload();
                });
            }
        });
    };
});
