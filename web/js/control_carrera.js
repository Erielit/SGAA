var raiz = window.location.origin + '/SGAA/';
var swalWithBootstrapButtons = Swal.mixin({
    customClass: {
        confirmButton: 'btn btn-success mr-3',
        cancelButton: 'btn btn-default'
    },
    buttonsStyling: false
});

angular.module('inicioCarreras', []).controller('controladorCarrera', function ($scope, $http, $location) {
    $http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
    $scope.mensaje;
    $scope.listaCarreras = [];
    $scope.bean = {};
    $scope.beanMCarrera = {};

    $scope.inicioCarrera = function () {
        $http.post(raiz + 'inicioCarrerasJson', {}).then(function (response) {
            $scope.listaCarreras = response.data.lista;
            console.log("-->" + $scope.listaCarreras);

        }, function (response) {
        });
    }

    $scope.registrarCarreras = function () {
        
        $http.post(raiz + 'registrarCarreraJson', "parametro=" + angular.toJson($scope.bean)
                ).then(function (response) {
            $scope.mensaje = response.data.mensaje;
            alert($scope.mensaje);
            window.location.href = raiz + "inicioCarrera";

        }, function (response) {
        });
    }

    $scope.setModificarCarrera = function (carrera) {
        console.log("-->***" + carrera);
        angular.copy(carrera, $scope.beanMCarrera);
        window.location.href = raiz + "/views/carrer/modificarCarrera.jsp";
        console.log("-->---" + $scope.beanMCarrera);


    }

    $scope.modificarCarrerasJson = function () {
        $http.post(raiz + 'modificarCarreraJson', "parametro=" + angular.toJson($scope.beanMCarrera)).then(function (response) {
            $scope.mensaje = response.data.mensaje;
            $('#home-tab').click();
            alert($scope.mensaje);
            $scope.inicio();
        }, function (response) {
        });
    }

   $scope.confirmarEstadoCarrera = function (form) {
       console.log(form);
        swalWithBootstrapButtons.fire({
            title: 'Estado Carrera',
            text: "Confirmar para continuar la acción.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Aceptar',
            cancelButtonText: 'Cancelar'
        }).then(function (result) {
            if (result.value) {
                $('#inactivo' + form).submit();
            }
        });
    };
});
