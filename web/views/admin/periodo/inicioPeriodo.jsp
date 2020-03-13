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
        <title>SGAA | Periodo</title>
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
                <jsp:include page="../../header.jsp"/>
                <!-- Sidebar inner chat end-->
                <div class="pcoded-main-container">
                    <div class="pcoded-wrapper">
                        <jsp:include page="../../menu.jsp"/>
                        <div class="pcoded-content">
                            <div class="pcoded-inner-content">
                                <div class="main-body">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 ">
                                                    <h2>Periodos</h2>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 text-right">
                                                    <a href="<%=context%>/vistaPeriodo" class="btn btn-success">Registrar Periodo</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-block">
                                            <div class="dt-responsive table-responsive">
                                                <table id="simpletable" class="table compact table-striped table-bordered nowrap">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Nombre</th>
                                                            <th>Fecha inicio</th>
                                                            <th>Fecha fin</th>
                                                            <th>Modificar</th>
                                                            <th>Habilitar/Deshabilitar</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <s:iterator value="respuesta.listQuarters" status="po">
                                                            <tr>
                                                                <td><s:property value="#po.count"/></td>
                                                                <td><s:property value="nombre"/></td>
                                                                <td><s:property value="fecha_inicio"/></td>
                                                                <td><s:property value="fecha_fin"/></td>
                                                                <td class="text-center">
                                                                    <form action="infoPeriodo" method="post">
                                                                        <input type="hidden" value="<s:property value="id_cuatrimestre"/>" name="param_integer">
                                                                        <button type="submit" class="btn btn-warning">
                                                                            <i class="ti-pencil"></i>
                                                                        </button>
                                                                    </form>
                                                                </td>
                                                                <td class="text-center">
                                                                    <s:if test="estado.id_estado == 1">
                                                                        <button class="btn btn-success" onclick="prModificarEstado(<s:property value="id_cuatrimestre"/>)">
                                                                            <i class="ti-check"></i>
                                                                        </button>
                                                                    </s:if>
                                                                    <s:else>
                                                                        <button class="btn btn-danger" onclick="prModificarEstado(<s:property value="id_cuatrimestre"/>)">
                                                                            <i class="ti-close"></i>
                                                                        </button>
                                                                    </s:else>
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

    <script type="text/javascript" src="<%=context%>\files\bower_components\jquery-slimscroll\js\jquery.slimscroll.js"></script>
    <!-- Sidebar -->
    <script src="<%=context%>\files\assets\js\pcoded.min.js"></script>
    <script src="<%=context%>\files\assets\js\vartical-layout.min.js"></script>
    <script src="<%=context%>\files\assets\js\jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="<%=context%>/js/gestion_periodo.js"></script>
    <script type="text/javascript" src="<%=context%>\files\assets\js\script.min.js"></script>
    <script src="<%=context%>\files\bower_components\datatables.net\js\jquery.dataTables.min.js"></script>
    <script src="<%=context%>\files\bower_components\datatables.net-buttons\js\dataTables.buttons.min.js"></script>
    <script src="<%=context%>\files\bower_components\datatables.net-bs4\js\dataTables.bootstrap4.min.js"></script>
    <script src="<%=context%>\files\bower_components\datatables.net-responsive\js\dataTables.responsive.min.js"></script>
    <script src="<%=context%>\files\bower_components\datatables.net-responsive-bs4\js\responsive.bootstrap4.min.js"></script>       <!--<script src="<%=context%>\files\bower_components\datatables.net-responsive-bs4\js\responsive.bootstrap4.min.js"></script>-->
    <script>

                                                                            $(document).ready(function () {
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
