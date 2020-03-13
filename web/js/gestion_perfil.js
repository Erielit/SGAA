var raiz = window.location.origin + '/SGAA/';
var contra = document.getElementById("contra");

function pModificar() {
    if (validar()) {
        if (validarNewPass()) {
            Swal.fire({
                title: 'Modificar Perfil',
                text: "¿Está seguro de modificar?.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Aceptar',
                cancelButtonText: 'Cancelar'
            }).then(function (result) {
                if (result.value) {
                    modificarPerfil();
                }
            });
        } else {
            Swal.fire({
                title: 'Error',
                text: "Las contraseñas no coinciden.",
                icon: 'warning',
                confirmButtonText: 'Aceptar'
            });
        }
    } else {
        Swal.fire({
            title: 'Error',
            text: "Todos los campos son obligatorios.",
            icon: 'warning',
            confirmButtonText: 'Aceptar'
        });
    }
}

function modificarPerfil() {
    var nombre = document.getElementById("nombre").value;
    var apellidoM = document.getElementById("apellidoM").value;
    var apellidoP = document.getElementById("apellidoP").value;
    var fechaNac = document.getElementById("fechaNac").value;
    var curp = document.getElementById("curp").value;
    var email = document.getElementById("email").value;
    var contra = document.getElementById("password1").value;

    var datos = {
        "nombre": nombre,
        "apellidoM": apellidoM,
        "apellidoP": apellidoP,
        "fechaNac": fechaNac,
        "curp": curp,
        "email": email,
        "contra": contra
    };
    $.ajax({
        url: raiz + 'modificarPerfil',
        data: {
            mensaje: JSON.stringify(datos)
        },
        success: function (r) {
            if (r.respuesta.bandera) {
                console.log(r.respuesta.bandera);
                Swal.fire({
                    title: 'Éxito',
                    text: 'El perfil se ha modificado exitosamente.',
                    icon: 'success',
                    showConfirmAlert: true,
                    confirmButtonText: 'Aceptar',
                    allowOutsideClick: false,
                    allowEscapeKey: false
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

function back() {
    window.history.back();
}

function validar() {
    var nombre = document.getElementById("nombre").value;
    var apellidoM = document.getElementById("apellidoM").value;
    var apellidoP = document.getElementById("apellidoP").value;
    var fechaNac = document.getElementById("fechaNac").value;
    var curp = document.getElementById("curp").value;
    var email = document.getElementById("email").value;

    var bandera = false;
    if (nombre.length != 0 && apellidoM.length != 0 && apellidoP.length != 0 && fechaNac.length != 0 && curp.length != 0 && email.length != 0) {
        bandera = true;
    }

    return bandera;
}

contra.onkeypress = function () {
    var contra = document.getElementById("contra").value;
    var contraActual = document.getElementById("contraActual").value;
    if (contra == contraActual) {
        console.log(true);
        document.getElementById("password1").disabled = false;
        document.getElementById("password2").disabled = false;
    } else {
        document.getElementById("password1").disabled = true;
        document.getElementById("password2").disabled = true;
    }
};


function validarNewPass() {
    var password1 = document.getElementById("password1").value;
    var password2 = document.getElementById("password2").value;
    var bandera = false;
    if (password1 == password2) {
        bandera = true;
    }

    return bandera;
}