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
    <!-- Callendar -->
    <link href='<%=context%>/packages/core/main.css' rel='stylesheet'/>
    <link href='<%=context%>/packages/daygrid/main.css' rel='stylesheet'/>
    <link href='<%=context%>/packages/timegrid/main.css' rel='stylesheet'/>
    <link href='<%=context%>/packages/list/main.css' rel='stylesheet'/>
    <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\style.css"/>
    <!-- Sidebar -->
    <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\jquery.mCustomScrollbar.css"/>
    <link rel="stylesheet" type="text/css" href="<%=context%>/css/datatables.css">
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
                <div class="pcoded-content" ng-app="docent-app">
                    <div class="pcoded-inner-content" ng-controller="administrador">
                        <div class="main-body">
                            <div class="card">
                                <div class="card-header">
                                    <h2>Modificar grupo</h2>
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <form class="needs-validation" novalidate="" method="post"
                                                  id="modificar-grupo" action="modificar-grupo">
                                                <div class="form-row">
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <input type="hidden" id="idGrupo" value="<s:property value="respuesta.idGrupo"/>" name="param_integer"/>

                                                            <label>Número de cuatrimestre</label>
                                                            <select name="grupo.numero_cuatri.id_numero_cuatri"
                                                                    required=""
                                                                    class="form-control"
                                                                    value="<s:property value="respuesta.idNumeroCuatri"/>">
                                                                <s:iterator value="respuesta.numeroCuatris" status="po">
                                                                    <s:if test="respuesta.idNumeroCuatri == id_numero_cuatri">
                                                                        <option selected="" value="<s:property value="id_numero_cuatri"/>">
                                                                            <s:property value="numero"/>
                                                                        </option>
                                                                    </s:if>
                                                                    <s:else>
                                                                        <option value="<s:property value="id_numero_cuatri"/>">
                                                                            <s:property value="numero"/>
                                                                        </option>
                                                                    </s:else>

                                                                </s:iterator>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label>Nombre de cuatrimestre</label>
                                                            <select name="idCuatrimestre"
                                                                    required=""
                                                                    class="form-control"
                                                                    value="<s:property value="respuesta.idCuatrimestre"/>">
                                                                <s:iterator value="respuesta.cuatrimestres" status="po">
                                                                    <s:if test="respuesta.idCuatrimestre == id_cuatrimestre">
                                                                        <option selected="" value="<s:property value="id_cuatrimestre"/>">
                                                                            <s:property value="nombre"/>
                                                                        </option>
                                                                    </s:if>
                                                                    <s:else>
                                                                    <option value="<s:property value="id_cuatrimestre"/>">
                                                                        <s:property value="nombre"/></option>
                                                                    </s:else>
                                                                </s:iterator>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label>Carrera</label>
                                                            <select name="idCarrera" required=""
                                                                    class="form-control"
                                                                    value="<s:property value="respuesta.idCarrera"/>">
                                                                <s:iterator value="respuesta.carreras" status="po">
                                                                    <s:if test="respuesta.idCarrera == id_carrera">
                                                                        <option selected="" value="<s:property value="id_carrera"/>">
                                                                            <s:property value="nombre"/>
                                                                        </option>
                                                                    </s:if>
                                                                    <s:else>
                                                                    <option value="<s:property value="id_carrera"/>">
                                                                        <s:property value="nombre"/></option>
                                                                    </s:else>
                                                                </s:iterator>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label>Docente</label>
                                                            <select name="idDocente" required=""
                                                                    class="form-control"
                                                                    value="<s:property value="respuesta.idDocente"/>">
                                                                <s:iterator value="respuesta.docentes" status="po">
                                                                    <s:if test="respuesta.idDocente == id_docent">
                                                                        <option selected="" value="<s:property value="id_docent"/>">
                                                                            <s:property value="nombre"/>
                                                                            <s:property value="primer_apellido"/>
                                                                        </option>
                                                                    </s:if>
                                                                    <s:else>
                                                                    <option value="<s:property value="id_docent"/>">
                                                                        <s:property value="nombre"/> <s:property
                                                                            value="primer_apellido"/></option>
                                                                    </s:else>
                                                                </s:iterator>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label>Letra</label>
                                                            <select name="idLetra" required=""
                                                                    class="form-control"
                                                                    value="<s:property value="respuesta.idLetra"/>">
                                                                <s:iterator value="respuesta.letras" status="po">
                                                                    <s:if test="respuesta.idLetra == id_letra">
                                                                        <option selected="" value="<s:property value="id_letra"/>">
                                                                            <s:property value="letra"/>
                                                                        </option>
                                                                    </s:if>
                                                                    <s:else>
                                                                    <option value="<s:property value="id_letra"/>">
                                                                        <s:property value="letra"/></option>
                                                                    </s:else>
                                                                </s:iterator>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label>Estado</label>
                                                            <select name="idEstado" required=""
                                                                    class="form-control"
                                                                    value="<s:property value="respuesta.idEstado"/>">
                                                                <s:iterator value="respuesta.estados" status="po">
                                                                     <s:if test="respuesta.idEstado == id_estado">
                                                                        <option selected="" value="<s:property value="id_estado"/>">
                                                                            <s:property value="estado"/>
                                                                        </option>
                                                                    </s:if>
                                                                    <s:else>
                                                                    <option value="<s:property value="id_estado"/>">
                                                                        <s:property value="estado"/></option>
                                                                    </s:else>
                                                                </s:iterator>
                                                            </select>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="form-row">
                                                    <br/>
                                                    <div class="col-12 text-right">
                                                        <a class="btn btn-danger" href="<%=context%>/list-grupos">Cancelar</a>
                                                        <button type="button" ng-click="confirmarGrupoModificar()"
                                                                class="btn btn-success"
                                                                id="btn-horario">Modificar
                                                        </button>
                                                    </div>
                                                </div>
                                                <div>

                                                </div>
                                            </form>
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
<script src="<%=context%>\js\datatables.js"></script>
<!--<script src="<%=context%>\files\bower_components\datatables.net-responsive-bs4\js\responsive.bootstrap4.min.js"></script>-->
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
