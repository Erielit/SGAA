<%-- 
    Document   : modificarDocente
    Created on : 15/02/2020, 06:24:43 PM
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
        <title>Modificar Docente | SGAA</title>
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
                                                <h1>Modificar Docente</h1>
                                                <s:form id="modDocentesForm">
                                                    <div class="row">
                                                        <div class="col-md-3 mb-3">
                                                            <label for="validationCustom04">CURP:</label>
                                                            <input type="text" class="form-control" id="validationCustom04" placeholder="EDUP941209MMSRMR19" required>
                                                            <div class="invalid-feedback">
                                                                Please provide a valid state.
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 mb-3">
                                                            <label for="validationCustom04">Nombre:</label>
                                                            <input type="text" class="form-control" id="validationCustom04" placeholder="Eduardo" required>
                                                            <div class="invalid-feedback">
                                                                Please provide a valid state.
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 mb-3">
                                                            <label for="validationCustom04">Apellido Paterno:</label>
                                                            <input type="text" class="form-control" id="validationCustom04" placeholder="Lopezz" required>
                                                            <div class="invalid-feedback">
                                                                Please provide a valid state.
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 mb-3">
                                                            <label for="validationCustom04">Apellido Materno:</label>
                                                            <input type="text" class="form-control" id="validationCustom04" placeholder="Perez" required>
                                                            <div class="invalid-feedback">
                                                                Please provide a valid state.
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-3 mb-3">
                                                            <label for="validationCustom04">Fecha de Nacimiento:</label>
                                                            <input type="text" class="form-control" id="validationCustom04" placeholder="1990-10-12" required>
                                                            <div class="invalid-feedback">
                                                                Please provide a valid state.
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 mb-3">
                                                            <label for="validationCustom04">Genero</label>
                                                            <input type="text" class="form-control" id="validationCustom04" placeholder="Masculino" required>
                                                            <div class="invalid-feedback">
                                                                Please provide a valid state.
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 mb-3">
                                                            <label for="validationCustom04">Cedula Profesional:</label>
                                                            <input type="text" class="form-control" id="validationCustom04" placeholder="MDE100" required>
                                                            <div class="invalid-feedback">
                                                                Please provide a valid state.
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 mb-3">
                                                            <label for="validationCustom04">Descripción:</label>
                                                            <input type="text" class="form-control" id="validationCustom04" placeholder="Profesor de apoyo" required>
                                                            <div class="invalid-feedback">
                                                                Please provide a valid state.
                                                            </div>
                                                        </div>
                                                    </div>

                                                </s:form>


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
        <!-- Callendar-->
        <script type="text/javascript" src="<%=context%>\files\assets\js\classie.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\moment\js\moment.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\fullcalendar\js\fullcalendar.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\fullcalendar\js\locale-all.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\pages\full-calender\calendar.js"></script>
        <!-- Sidebar -->
        <script src="<%=context%>\files\assets\js\pcoded.min.js"></script>
        <script src="<%=context%>\files\assets\js\vartical-layout.min.js"></script>
        <script src="<%=context%>\files\assets\js\jquery.mCustomScrollbar.concat.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\js\script.min.js"></script>

        <script type="text/javascript" src="<%=context%>\files\assets\js\modalEffects.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\js\classie.js"></script>
           <!--<script src="<%=context%>\files\bower_components\datatables.net-responsive-bs4\js\responsive.bootstrap4.min.js"></script>-->

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
