var raiz = window.location.origin + '/SGAA/';

window.addEventListener('load', function () {
    var f = new Date();
    var day = f.getDate();
    var month = (f.getMonth() + 1);
    var year = f.getFullYear();
    if (day < 10) {
        day = '0' + day;
    }
    if (month < 10) {
        month = '0' + month;
    }
    var date = year + "-" + month + "-" + day;
    document.getElementById("fechaInicio").setAttribute('min', date);
});

function pRegistrar() {
    if (validar()) {
        Swal.fire({
            title: 'Registrar Periodo',
            text: "¿Está seguro de registrar?.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Aceptar',
            cancelButtonText: 'Cancelar'
        }).then(function (result) {
            if (result.value) {
                registrarPeriodo();
            }
        });
    } else {
        Swal.fire({
            title: 'Error',
            text: "Todos los campos son obligatorios.",
            icon: 'warning',
            confirmButtonText: 'Aceptar'
        });
    }
}

function pModificar() {
    if (validar()) {
        Swal.fire({
            title: 'Modificar Periodo',
            text: "¿Está seguro de modificar?.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Aceptar',
            cancelButtonText: 'Cancelar'
        }).then(function (result) {
            if (result.value) {
                modificarPeriodo();
            }
        });
    } else {
        Swal.fire({
            title: 'Error',
            text: "Todos los campos son obligatorios.",
            icon: 'warning',
            confirmButtonText: 'Aceptar'
        });
    }
}

function back() {
    window.history.back();
}

function validar() {
    var nombre = document.getElementById("nombre").value;
    var fechaInicio = document.getElementById("fechaInicio").value;
    var fechaFin = document.getElementById("fechaFin").value;
    var bandera = false;
    if (nombre.length != 0 && fechaInicio.length != 0 && fechaFin.length != 0) {
        bandera = true;
    }

    return bandera;

}

function registrarPeriodo() {
    var nombre = document.getElementById("nombre").value;
    var fechaInicio = document.getElementById("fechaInicio").value;
    var fechaFin = document.getElementById("fechaFin").value;

    var datos = {
        "nombre": nombre,
        "fechaInicio": fechaInicio,
        "fechaFin": fechaFin
    };
    $.ajax({
        url: raiz + 'registrarPeriodo',
        data: {
            mensaje: JSON.stringify(datos)
        },
        success: function (r) {
            if (r.respuesta.bandera) {
                console.log(r.respuesta.bandera);
                Swal.fire({
                    title: 'Éxito',
                    text: 'El periodo se ha registrado exitosamente.',
                    icon: 'success',
                    showConfirmAlert: true,
                    confirmButtonText: 'Aceptar',
                    allowOutsideClick: false,
                    allowEscapeKey: false
                }).then(function (result) {
                    if (result) {
                        window.location.replace(raiz + "inicioPeriodos");
                    }
                });
            } else {
                Swal.fire({
                    title: 'Oops...',
                    text: 'Error al intentar registrar, intente de nuevo.',
                    icon: 'error'
                });
            }
        },
        error: function (r) {
            Swal.fire({
                title: 'Oops...',
                text: 'Hubo un error al realizar la acción, intenta de nuevo.',
                icon: 'error'
            });
        }
    });
}

function modificarPeriodo() {
    var idCuatrimestre = document.getElementById("idCuatrimestre").value;
    var nombre = document.getElementById("nombre").value;
    var fechaInicio = document.getElementById("fechaInicio").value;
    var fechaFin = document.getElementById("fechaFin").value;

    var datos = {
        "idCuatrimestre": idCuatrimestre,
        "nombre": nombre,
        "fechaInicio": fechaInicio,
        "fechaFin": fechaFin
    };
    $.ajax({
        url: raiz + 'modificarPeriodo',
        data: {
            mensaje: JSON.stringify(datos)
        },
        success: function (r) {
            if (r.respuesta.bandera) {
                console.log(r.respuesta.bandera);
                Swal.fire({
                    title: 'Éxito',
                    text: 'El periodo se ha modificado exitosamente.',
                    icon: 'success',
                    showConfirmAlert: true,
                    confirmButtonText: 'Aceptar',
                    allowOutsideClick: false,
                    allowEscapeKey: false
                }).then(function (result) {
                    if (result) {
                        window.location.replace(raiz + "inicioPeriodos");
                    }
                });
            } else {
                Swal.fire({
                    title: 'Oops...',
                    text: 'Error al intentar modificar, intente de nuevo.',
                    icon: 'error'
                });
            }
        },
        error: function (r) {
            Swal.fire({
                title: 'Oops...',
                text: 'Hubo un error al realizar la acción, intenta de nuevo.',
                icon: 'error'
            });
        }
    });
}

function prModificarEstado(idPeriodo) {
    Swal.fire({
        title: 'Cambiar Estado',
        text: "¿Está seguro de cambiarlo de estado?.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Aceptar',
        cancelButtonText: 'Cancelar'
    }).then(function (result) {
        if (result.value) {
            modificarEstado(idPeriodo);
        }
    });
}

function modificarEstado(idPeriodo) {
    $.ajax({
        url: raiz + 'modificarEstado',
        data: {
            param_integer: JSON.stringify(idPeriodo)
        },
        success: function (r) {
            if (r.respuesta.bandera) {
                console.log(r.respuesta.bandera);
                Swal.fire({
                    title: 'Éxito',
                    text: 'El periodo se ha modificado exitosamente.',
                    icon: 'success',
                    showConfirmAlert: true,
                    confirmButtonText: 'Aceptar',
                    allowOutsideClick: false,
                    allowEscapeKey: false
                }).then(function (result) {
                    if (result) {
                        location.reload();
                    }
                });
            } else {
                Swal.fire({
                    title: 'Oops...',
                    text: 'Error al intentar modificar, intente de nuevo.',
                    icon: 'error'
                });
            }
        },
        error: function (r) {
            Swal.fire({
                title: 'Oops...',
                text: 'Hubo un error al realizar la acción, intenta de nuevo.',
                icon: 'error'
            });
        }
    });
}

