var app = angular.module('my-app', []);
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
function changeCarrera(id) {
    console.log(id);
}
app.controller("registroEstudiante", function ($scope, $http) {
    $http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
    $scope.grupos = [];
    $scope.carrera = null;

    $scope.init = function () {
        console.log("sasasas");
    };

    $scope.carreraChange = function (id) {
        console.log(id);
        $http({
            method: 'post',
            url: origin + 'grupos-carrera',
            data: "number_param=" + id
        }).then(function (response) {
            $scope.grupos = response.data.respuesta.grupos;
        });
    };

    $scope.confirmarRegistro = function () {
        swalWithBootstrapButtons.fire({
            title: 'Registrarse',
            text: "Confirmar para continuar la acción.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Aceptar',
            cancelButtonText: 'Cancelar'
        }).then(function (result) {
            if (result.value) {
                $("#design-wizard").submit();
            }
        });
    };

});