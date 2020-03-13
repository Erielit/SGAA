var raiz = window.location.origin + '/SGAA/';

var swalWithBootstrapButtons = Swal.mixin({
    customClass: {
        confirmButton: 'btn btn-success mr-3',
        cancelButton: 'btn btn-default'
    },
    buttonsStyling: false
});

angular.module('inicioMaterias', []).controller('controladorMateria', function ($scope, $http, $location) {
    $http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
    $scope.mensaje;
    $scope.id = undefined;
    $scope.listaMaterias = [];
    $scope.listaDocentes = [];
    $scope.listaCarreras = [];
    $scope.bean = {};
    $scope.beanMMateria = {};

    $scope.inicioMateria = function () {
        $http.post(raiz + 'inicioMateriasJson', {}).then(function (response) {
            $scope.listaMaterias = response.data.lista;
            console.log("-->" + $scope.listaMaterias);
        }, function (response) {
        });
    }
    $scope.inicioDocente = function (id) {
        console.log("id-- " + id)
        $http({
            method: 'post',
            url: raiz + 'inicioDocentes',
            data: "bean.id_materia=" + id
        }).then(function (response) {
            console.log(response.data.listaD);
            $scope.listaDocentes = response.data.listaD;
            console.log("--> Docente" + $scope.listaDocentes)

        }, function (response) {
        });
    }

    $scope.inicioCarrera = function () {
        $http.post(raiz + 'inicioCarrerasJson', {}).then(function (response) {
            $scope.listaCarreras = response.data.lista;
            console.log("-->" + $scope.listaCarreras)
        }, function (response) {
        });
    }

    $scope.registrarMaterias = function () {
        $http.post(raiz + 'registrarMateriaJson', "parametro=" + angular.toJson($scope.bean)).then(function (response) {
            $scope.mensaje = response.data.mensaje;
            alert($scope.mensaje);
            $scope.inicio();
        }, function (response) {
        });
    }

    $scope.setModificarMateria = function (materia) {
        console.log("-->***" + materia);
        angular.copy(materia, $scope.beanMMateria);
        window.location.href = raiz + "/views/carrer/modificarMateria.jsp";
        console.log("-->---" + $scope.beanMMateria);


    }

    $scope.modificarMateriasJson = function () {
        $http.post(raiz + 'modificarMateriaJson', "parametro=" + angular.toJson($scope.beanMMateria)).then(function (response) {
            $scope.mensaje = response.data.mensaje;
            $('#home-tab').click();
            alert($scope.mensaje);
            $scope.inicio();
        }, function (response) {
        });
    }
    $scope.confirmarEstadoMateria = function (form) {
        console.log(form);
        swalWithBootstrapButtons.fire({
            title: 'Estado Materia',
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
