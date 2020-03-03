var raiz = window.location.origin + '/SGAA/';

function canalizarEstudiante(idGroupStudent) {
    console.log(raiz)
    console.log(idGroupStudent);

    Swal.fire({
        title: 'Canalizar Estudiante',
        text: "Confirmar para continuar la acción.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Aceptar',
        cancelButtonText: 'Cancelar'
    }).then(function (result) {
        if (result.value) {
            canalizar(idGroupStudent);
        }
    });

}

function canalizar(idGroupStudent) {
    console.log(idGroupStudent);
    $.ajax({
        url: raiz + 'canalizarEstudiante',
        data: {
            datos: JSON.stringify(idGroupStudent)
        },
        success: function (r) {
            if (r.respuesta.bandera) {
                console.log(r.respuesta.bandera);
                Swal.fire({
                    title: 'Éxito',
                    text: 'El estudiante ha sido canalizado.',
                    icon: 'success',
                    showConfirmAlert: true,
                    confirmButtonText: 'Aceptar',
                    allowOutsideClick: false,
                    allowEscapeKey: false
                }).then(function (result){
                    if (result) {
                        location.reload();
                    }
                });
            } else {
                Swal.fire({
                    title: 'Éxito',
                    text: 'Error al canalizar estudiante, intente de nuevo.',
                    icon: 'success'
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
