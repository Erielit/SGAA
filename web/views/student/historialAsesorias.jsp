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
<html lang="es" ng-app="my-app">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Bienvenido | Iniciar Sesión</title>
        <!-- Required Fremwork -->
        <link rel="stylesheet" type="text/css" href="<%=context%>/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="<%=context%>/css/sweetalert2.css">
        <!-- themify-icons line icon -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\icon\themify-icons\themify-icons.css"/>
        <!-- ico font -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\icon\icofont\css\icofont.css"/>
        <!-- Style.css -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\datatables.net-bs4\css\dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\pages\data-table\css\buttons.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\datatables.net-responsive-bs4\css\responsive.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\pages\menu-search\css\component.css"/>
        <link rel="stylesheet" href="<%=context%>/files/assets/icon/feather/css/feather.css"/>
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\style.css"/>
        <!-- Sidebar -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\jquery.mCustomScrollbar.css"/>
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
        <div id="pcoded" class="pcoded" ng-controller="agendarAsesoria" ng-init="historialEstudiante()">
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
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h5>Historial de asesorias</h5>
                                                        </div>
                                                        <div class="card-block">
                                                            <div class="table-responsive dt-responsive">
                                                                <table id="dt-ajax-array" class="table compact table-striped table-bordered nowrap">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Docente</th>
                                                                            <th>Materia</th>
                                                                            <th>Fecha</th>
                                                                            <th>horario</th>
                                                                            <th>Estado</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr ng-repeat="asesoria in historial">
                                                                            <td>{{asesoria.docente}}</td>
                                                                            <td>{{asesoria.materia}}</td>
                                                                            <td>{{asesoria.fecha}}</td>
                                                                            <td>{{asesoria.horario}}</td>
                                                                            <td>{{asesoria.estado}}</td>
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
        <script type="text/javascript" src="<%=context%>\files\assets\js\script.min.js"></script>
        <script src="<%=context%>\files\bower_components\datatables.net\js\jquery.dataTables.min.js"></script>
        <script src="<%=context%>\files\bower_components\datatables.net-bs4\js\dataTables.bootstrap4.min.js"></script>
        <script src="<%=context%>\files\bower_components\datatables.net-responsive\js\dataTables.responsive.min.js"></script>
        <script src="<%=context%>\files\bower_components\datatables.net-responsive-bs4\js\responsive.bootstrap4.min.js"></script>
        <script type="text/javascript" src="<%=context%>\js\angular.js"></script>
        <script type="text/javascript" src="<%=context%>\js\control_estudiante.js"></script>
           <!--<script src="<%=context%>\files\bower_components\datatables.net-responsive-bs4\js\responsive.bootstrap4.min.js"></script>-->
        <script>
            var mensaje = '<s:property value="mensaje" />' + "";
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
        </script>
        <script>

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
