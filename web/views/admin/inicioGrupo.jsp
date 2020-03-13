<%-- 
    Document   : index
    Created on : 14/01/2020, 09:31:59 AM
    Author     : netmo
--%>

<%
    String context = request.getContextPath();
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SGAA | Grupo</title>
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="<%=context%>/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="<%=context%>/css/sweetalert2.css">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\icon\themify-icons\themify-icons.css"/>
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\icon\icofont\css\icofont.css"/>
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\pages\menu-search\css\component.css"/>
    <link rel="stylesheet" href="<%=context%>/files/assets/icon/feather/css/feather.css"/>
    <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\style.css"/>
    <!-- Sidebar -->
    <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\jquery.mCustomScrollbar.css"/>
    <link rel="stylesheet" type="text/css" href="<%=context%>/css/dataTables.bootstrap4.css">
</head>
<body>
<!-- Pre-loader start -->
<div class="theme-loader">
    <div class="ball-scale">
        <div class='contain'>
            <div class="ring">
                <div class="frame"></div>
            </div>
            <div class="ring">
                <div class="frame"></div>
            </div>
            <div class="ring">
                <div class="frame"></div>
            </div>
            <div class="ring">
                <div class="frame"></div>
            </div>
            <div class="ring">
                <div class="frame"></div>
            </div>
            <div class="ring">
                <div class="frame"></div>
            </div>
            <div class="ring">
                <div class="frame"></div>
            </div>
            <div class="ring">
                <div class="frame"></div>
            </div>
            <div class="ring">
                <div class="frame"></div>
            </div>
            <div class="ring">
                <div class="frame"></div>
            </div>
        </div>
    </div>
</div>
<!-- Pre-loader end -->
<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
    <div class="pcoded-container navbar-wrapper">
        <jsp:include page="../header.jsp"/>
        <!-- Sidebar inner chat end-->
        <div class="pcoded-main-container">
            <div class="pcoded-wrapper">
                <jsp:include page="../menu.jsp"/>
                <div class="pcoded-content" ng-app="docent-app">
                    <div class="pcoded-inner-content" ng-controller="administrador">
                        <div class="main-body">
                            <div class="card">
                                <div class="card-header">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-6 ">
                                            <h2>Grupos</h2>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 text-right">
                                            <a href="<%=context%>/grupo" class="btn btn-success">Registrar grupos</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-block">
                                    <div class="dt-responsive table-responsive">
                                        <table id="simpletable"
                                               class="table compact table-striped table-bordered nowrap">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Cuatrimeste</th>
                                                <th>Letra</th>
                                                <th>Docente</th>
                                                <th>Carrera</th>
                                                <th>Fecha de registro</th>
                                                <th>Cambiar estado</th>
                                                <!--<th>Modificar</th>-->
                                                <th>Modificar</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <s:iterator value="respuesta.grupos" status="po">
                                                <tr>
                                                    <td><s:property value="#po.count"/></td>
                                                    <td><s:property value="cuatrimestre.nombre"/></td>
                                                    <td><s:property value="letra.letra"/></td>
                                                    <td><s:property value="docente.nombre"/> <s:property
                                                            value="docente.primer_apellido"/></td>
                                                    <td><s:property value="carrera.nombre"/></td>
                                                    <td><s:property value="fecha_registro"/></td>
                                                    <td class="text-center">
                                                        <s:if test="estado.estado.equals('Activo')">
                                                            <form action="cambiar-estado-grupo" method="post"
                                                                  id="inactivo<s:property value="id_grupo"/>">
                                                                <input name="params" type="hidden"
                                                                       value="<s:property value="id_grupo"/>">
                                                                <a href="javascript:void(0)" class="btn btn-danger"
                                                                   ng-click="confirmarGrupoCambio('inactivo<s:property value="id_grupo"/>')">
                                                                    <i class="ti-close"></i>
                                                                </a>
                                                            </form>
                                                        </s:if>
                                                        <s:else>
                                                            <form action="cambiar-estado-grupo" method="post"
                                                                  id="activo<s:property value="id_grupo"/>">
                                                                <input name="params" type="hidden"
                                                                       value="<s:property value="id_grupo"/>">
                                                                <a href="javascript:void(0)" class="btn btn-success"
                                                                   ng-click="confirmarGrupoCambio('activo<s:property value="id_grupo"/>')">
                                                                    <i class="ti-check"></i>
                                                                </a>
                                                            </form>
                                                        </s:else>
                                                    </td>
                                                    <td class="text-center">
                                                        <form action="infoGrupo" method="post">
                                                            <input type="hidden" value="<s:property value="id_grupo"/>"
                                                                   name="param_integer">
                                                            <button type="submit" class="btn btn-warning">
                                                                <i class="ti-pencil"></i>
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </s:iterator>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<script type="text/javascript" src="<%=context%>\files\bower_components\jquery\js\jquery.min.js"></script>
<script type="text/javascript" src="<%=context%>\js\popper.js"></script>
<script type="text/javascript" src="<%=context%>\js\bootstrap.js"></script>
<script type="text/javascript" src="<%=context%>\js\sweetalert2.js"></script>

<!--<script type="text/javascript" src="<%=context%>\files\assets\pages\dashboard\custom-dashboard.js"></script>-->

<script type="text/javascript"
        src="<%=context%>\files\bower_components\jquery-slimscroll\js\jquery.slimscroll.js"></script>
<!-- Sidebar -->
<script src="<%=context%>\files\assets\js\pcoded.min.js"></script>
<script src="<%=context%>\files\assets\js\vartical-layout.min.js"></script>
<script src="<%=context%>\files\assets\js\jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="<%=context%>\files\assets\js\script.min.js"></script>
<script type="text/javascript" src="<%=context%>\js\angular.js"></script>
<script type="text/javascript" src="<%=context%>\js\control_admin.js"></script>

<!--<script src="<%=context%>\files\bower_components\datatables.net-responsive-bs4\js\responsive.bootstrap4.min.js"></script>-->
<%--    Los de whats--%>
<script src="<%=context%>\files\bower_components\datatables.net\js\jquery.dataTables.min.js"></script>
<script src="<%=context%>\files\bower_components\datatables.net-buttons\js\dataTables.buttons.min.js"></script>
<script src="<%=context%>\files\bower_components\datatables.net-bs4\js\dataTables.bootstrap4.min.js"></script>
<script src="<%=context%>\files\bower_components\datatables.net-responsive\js\dataTables.responsive.min.js"></script>
<script src="<%=context%>\files\bower_components\datatables.net-responsive-bs4\js\responsive.bootstrap4.min.js"></script>

<script>

    $(document).ready(function () {
        console.log('mensaje');
        var mensaje = '<s:property value="respuesta.mensaje" />' + "";
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
        if (mensaje === "1") {
            Toast.fire({
                icon: 'success',
                title: 'Acción realizada correctamente.'
            });
        } else if (mensaje === "2") {
            Toast.fire({
                icon: 'error',
                title: 'Ha ocurrido un error, inténtelo nuevamente.'
            });
        }

        $("#simpletable").DataTable({
            "language": {
                "sProcessing": "Procesando...",
                "sLengthMenu": "Mostrar _MENU_ registros",
                "sZeroRecords": "No se encontraron resultados",
                "sEmptyTable": "Ningún dato disponible en esta tabla",
                "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                "sInfoPostFix": "",
                "sSearch": "Buscar:",
                "sUrl": "",
                "sInfoThousands": ",",
                "sLoadingRecords": "Cargando...",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Último",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                    "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                }
            }
        });
    });
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('change', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>
</body>
</html>
