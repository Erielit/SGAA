<%-- 
    Document   : inicioDocent
    Created on : 14/02/2020, 11:12:16 AM
    Author     : Zaira
--%>

<%
    String context = request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="es" ng-app="inicioDocentes">
    <head >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio Docente | SGAA</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
        <!-- Required Fremwork -->

        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\bootstrap\css\bootstrap.min.css">
        <!-- themify-icons line icon -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\icon\themify-icons\themify-icons.css">
        <!-- ico font -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\icon\icofont\css\icofont.css">
        <!-- Style.css -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\pages\menu-search\css\component.css">
        <link rel="stylesheet" href="<%=context%>/files/assets/icon/feather/css/feather.css"/>
        <!-- Callendar -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\fullcalendar\css\fullcalendar.css">
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\style.css">
        <!-- Sidebar -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\jquery.mCustomScrollbar.css">
        <!-- Data Table Css -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\datatables.net-bs4\css\dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\pages\data-table\css\buttons.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\datatables.net-responsive-bs4\css\responsive.bootstrap4.min.css">
        <!-- Style.css -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\style.css">
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\jquery.mCustomScrollbar.css">
    </head>
    <body ng-controller="controlador1" ng-init="inicio()">
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
                        <div class="pcoded-content">
                            <div class="pcoded-inner-content">
                                <div class="main-body">
                                    <div class="page-wrapper full-calender">
                                        <div class="page-body">
                                            <div class="">
                                                <!-- Todo el contenido aquí-->
                                                <div class="card page-header p-0">
                                                    <div class="card-block front-icon-breadcrumb row align-items-end">
                                                        <div class="breadcrumb-header col">
                                                            <div class="big-icon">
                                                                <i class="icofont icofont-teacher"></i>
                                                            </div>
                                                            <div class="d-inline-block">
                                                                <h5>Gestión de Docente</h5>
                                                                <!--<span>lorem ipsum dolor sit amet, consectetur adipisicing elit</span>-->
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="page-header-breadcrumb">
                                                                <ul class="breadcrumb-title">
                                                                    <button class="btn btn-success"><i class="icofont icofont-plus-circle"></i>Registrar</button>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="card-block">
                                                        <div class="dt-responsive table-responsive">
                                                            <table id="simpletable" class="table table-striped table-bordered nowrap">
                                                                <thead>
                                                                    <tr style="color: #000">
                                                                        <th>No. Docente</th>
                                                                        <th>Nombre</th>
                                                                        <th>Descripción</th>
                                                                        <th>Modificar</th>
                                                                        <th>Eliminar</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                    <tr style="color: #000" ng-repeat ="docente in listaDocentes" style="color: white">

                                                                        <td>{{docente.cedula}}</td>
                                                                        <td>{{docente.nombre + " " + docente.primer_apellido + " " + docente.segundo_apellido}}</td>

                                                                        <td>{{docente.desc}}</td>
                                                                        <td>    
                                                                            <s:form action="consultaIndividual">
                                                                                <s:hidden name="bean.idCancion" value="{{cancion.idCancion}}" />
                                                                                <button class="btn btn-warning btn-icon" type="submit" > <i class="icofont icofont-edit"></i> </button>
                                                                            </s:form>
                                                                        </td> 
                                                                        <td>    
                                                                            <s:form action="eliminarCanciones">
                                                                                <s:hidden name="bean.idCancion" value="%{idCancion}" />
                                                                                <button class="btn btn-danger btn-icon"type="submit" ><i class="icofont icofont-ui-delete"></i></button>
                                                                                </s:form>
                                                                        </td>   
                                                                    </tr>

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
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.8/angular.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery\js\jquery.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery-ui\js\jquery-ui.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\popper.js\js\popper.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\bootstrap\js\bootstrap.min.js"></script>
        <!--<script type="text/javascript" src="<%=context%>\files\assets\pages\dashboard\custom-dashboard.js"></script>-->
        <script src="<%=context%>/js/control_docente.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery-slimscroll\js\jquery.slimscroll.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\modernizr\js\modernizr.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\modernizr\js\css-scrollbars.js"></script>
        <!-- Sidebar -->
        <script src="<%=context%>\files\assets\js\pcoded.min.js"></script>
        <script src="<%=context%>\files\assets\js\vartical-layout.min.js"></script>
        <script src="<%=context%>\files\assets\js\jquery.mCustomScrollbar.concat.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\js\script.min.js"></script>

        <!-- data-table js -->
        <script src="<%=context%>\files\bower_components\datatables.net\js\jquery.dataTables.js"></script> 

        <script src="<%=context%>\files\assets\js\pcoded.min.js"></script>
        <script src="<%=context%>\files\assets\js\vartical-layout.min.js"></script>
        <script src="<%=context%>\files\assets\js\jquery.mCustomScrollbar.concat.min.js"></script>
        <script type="text/javascript" src="..\files\assets\js\script.js"></script>

        <script type="text/javascript" src="<%=context%>\files\assets\js\modalEffects.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\js\classie.js"></script>
           <!--<script src="<%=context%>\files\bower_components\datatables.net-responsive-bs4\js\responsive.bootstrap4.min.js"></script>-->

        <script>
                                                                                    $(document).ready(function () {
                                                                                        $('#tabla').DataTable(
                                                                                                {
                                                                                                    language: {
                                                                                                        processing: "Procesando...",
                                                                                                        lengthMenu: "Mostrar _MENU_ registros",
                                                                                                        zeroRecords: "No se encontraron resultados",
                                                                                                        emptyTable: "Ningún dato disponible en esta tabla",
                                                                                                        info: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                                                                                                        infoEmpty: "Mostrando registros del 0 al 0 de un total de 0 registros",
                                                                                                        infoFiltered: "(filtrado de un total de _MAX_ registros)",
                                                                                                        infoPostFix: "",
                                                                                                        search: "Buscar:",
                                                                                                        url: "",
                                                                                                        infoThousands: ",",
                                                                                                        loadingRecords: "Cargando...",
                                                                                                        paginate: {
                                                                                                            first: "Primero",
                                                                                                            last: "Último",
                                                                                                            next: "Siguiente",
                                                                                                            previous: "Anterior"
                                                                                                        },
                                                                                                        aria: {
                                                                                                            sortAscending: ": Activar para ordenar la columna de manera ascendente",
                                                                                                            sortDescending: ": Activar para ordenar la columna de manera descendente"
                                                                                                        }
                                                                                                    }
                                                                                                });
                                                                                    });

        </script>
        <script>
                    (function () {
                        'use strict';
                        window.addEventListener('load', function () {
                            // Fetch all the forms we want to apply custom Bootstrap validation styles to
                            var forms = document.getElementsByClassName('needs-validation');
                            // Loop over them and prevent submission
                            var validation = Array.prototype.filter.call(forms, function (form) {
                                form.addEventListener('submit', function (event) {
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

