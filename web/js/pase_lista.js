var raiz = window.location.origin + '/SGAA/';

function paseLista(idStudent) {
    var idCourse = document.getElementById("idCourse").value;
    var checked = document.getElementById("btnAttendance" + idStudent).value;
    if (checked == 0) {
        checked = 1;
    } else {
        checked = 0;
    }
    var datos = {
        idCourse: idCourse,
        idStudent: idStudent,
        checked: checked
    };
    $.ajax({
        url: raiz + 'pasarLista',
        data: {
            datos: JSON.stringify(datos)
        },
        success: function (r) {
            if (checked == 1) {
                document.getElementById("radio").className = 'btn btn-success';
                document.getElementById("btnAttendance" + idStudent).value = 1;
            } else {
                document.getElementById("radio").className = 'btn btn-danger';
                document.getElementById("btnAttendance" + idStudent).value = 0;
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