var raiz = window.location.origin + '/SGAA/';

function paseLista(idStudent) {
    var idCourse = document.getElementById("idCourse").value;
    var checked = document.getElementById("btnAttendance" + idStudent).value;
    if (checked == 0) {
        document.getElementById("btnAttendance" + idStudent).value = 1;
        checked = 1;
        document.getElementById("radio").className = 'btn btn-success';
    } else {
        document.getElementById("btnAttendance" + idStudent).value = 0;
        checked = 0;
        document.getElementById("radio").className = 'btn btn-danger';
    }
    var datos = {idCourse: idCourse,
        idStudent: idStudent,
        checked: checked
    };
    $.ajax({
        url: raiz + 'pasarLista',
        data: {
            datos: JSON.stringify(datos)
        },
        success: function (r) {

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