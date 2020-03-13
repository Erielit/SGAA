<%-- 
    Document   : registrarDocente
    Created on : 17/02/2020, 09:47:35 AM
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
        <title>Registrar Docente | SGAA</title>
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
        <!--forms-wizard css-->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\jquery.steps\css\jquery.steps.css">
        <!-- Date-time picker css -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\pages\advance-elements\css\bootstrap-datetimepicker.css">
        <!-- Date-range picker css  -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\bootstrap-daterangepicker\css\daterangepicker.css">
        <!-- Date-Dropper css -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\datedropper\css\datedropper.min.css">
        <!-- Color Picker css -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\spectrum\css\spectrum.css">
        <!-- Mini-color css -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\jquery-minicolors\css\jquery.minicolors.css">
        <!-- Style.css -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\style.css">



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

                                            <!-- Todo el contenido aquí-->
                                            <div class="row"> 
                                                <div class="col-md-12">
                                                    <div class="card page-header p-0">
                                                        <div class="card-block front-icon-breadcrumb row align-items-end">
                                                            <div class="breadcrumb-header col">
                                                                <div class="big-icon">
                                                                    <i class="icofont icofont-teacher"></i>
                                                                </div>
                                                                <div class="d-inline-block">
                                                                    <h5>Registrar Docente</h5>
                                                                    <!--<span>lorem ipsum dolor sit amet, consectetur adipisicing elit</span>-->
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div class="page-header-breadcrumb">
                                                                    <ul class="breadcrumb-title">

                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>







                                                        <div class="card-block">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div id="wizard3">
                                                                        <section>
                                                                            <form class="wizard-form" id="design-wizard" action="#">
                                                                                <h3></h3>
                                                                                <fieldset>
                                                                                    <div class="form-group row">
                                                                                        <div class="col-sm-12">
                                                                                            <label for="curp" class="block">CURP <span style="color: red">*</span></label>
                                                                                        </div>
                                                                                        <div class="col-sm-12">
                                                                                            <input id="curp" name="curp" type="text" class=" form-control">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group row">
                                                                                        <div class="col-sm-12">
                                                                                            <label for="nombre" class="block">Nombre <span style="color: red">*</span></label>
                                                                                        </div>
                                                                                        <div class="col-sm-12">
                                                                                            <input id="nombre" name="nombre" type="text" class=" form-control">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group row">
                                                                                        <div class="col-sm-12">
                                                                                            <label for="primerAp" class="block">Primer Apellido <span style="color: red">*</span></label>
                                                                                        </div>
                                                                                        <div class="col-sm-12">
                                                                                            <input id="primerAp" name="primerAp" type="text" class="form-control ">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group row">
                                                                                        <div class="col-sm-12">
                                                                                            <label for="segundoAp" class="block">Segundo Apellido</label>
                                                                                        </div>
                                                                                        <div class="col-sm-12">
                                                                                            <input id="segundoAp" name="segundoAp" type="text" class="form-control ">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group row">
                                                                                        <div class="col-sm-6">
                                                                                            <label for="fechaNac"  class="block">Fecha de Nacimiento<span style="color: red">*</span></label>
                                                                                            <input id="dropper-default" class="form-control" type="text" placeholder="Select your date">
                                                                                            <div class="col-sm-6">
                                                                                                <label for="Sexo" class="block">Sexo</label><select id="sexo" name="sexo" type="text" class="form-control "></select>
                                                                                            </div>
                                                                                        </div>
                                                                                        </div>
                                                                                </fieldset>
                                                                                <h3></h3>
                                                                                <fieldset>
                                                                                    <div class="form-group row">
                                                                                        <div class="col-sm-12">
                                                                                            <label for="cedula" class="block">Cedula<span style="color: red">*</span></label>
                                                                                        </div>
                                                                                        <div class="col-sm-12">
                                                                                            <input id="cedula" name="cedula" type="text" class="form-control">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group row">
                                                                                        <div class="col-sm-12">
                                                                                            <label for="descripcion" class="block">Descripción<span style="color: red">*</span></label>
                                                                                        </div>
                                                                                        <div class="col-sm-12">
                                                                                            <input id="descripcion" name="descripcion" type="text" class="form-control">
                                                                                        </div>
                                                                                    </div>

                                                                                </fieldset>
                                                                                <h3></h3>
                                                                                <fieldset>
                                                                                    <div class="form-group row">
                                                                                        <div class="col-sm-12">
                                                                                            <label for="correo" class="block">Correo<span style="color: red">*</span></label>
                                                                                        </div>
                                                                                        <div class="col-sm-12">
                                                                                            <input id="correo" name="correo" type="text" class="form-control required">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group row">
                                                                                        <div class="col-sm-12">
                                                                                            <label for="contrasena" class="block">Contraseña<span style="color: red">*</span></label>
                                                                                        </div>
                                                                                        <div class="col-sm-12">
                                                                                            <input id="contrasena" name="contrasena" type="text" class="form-control required">
                                                                                        </div>
                                                                                    </div>
                                                                                </fieldset>

                                                                            </form>
                                                                        </section>
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
        <!-- Custom js -->
        <script src="<%=context%>\files\assets\pages\forms-wizard-validation\form-wizard.js"></script>
        <script src="<%=context%>\files\assets\js\pcoded.min.js"></script>
        <script src="<%=context%>\files\assets\js\vartical-layout.min.js"></script>
        <script src="<%=context%>\files\assets\js\jquery.mCustomScrollbar.concat.min.js"></script>
        <script type="text/javascript" src="..\files\assets\js\script.js"></script>

        <!--Forms - Wizard js-->
        <script src="<%=context%>\files\bower_components\jquery.cookie\js\jquery.cookie.js"></script>
        <script src="<%=context%>\files\bower_components\jquery.steps\js\jquery.steps.js"></script>
        <script src="<%=context%>\files\bower_components\jquery-validation\js\jquery.validate.js"></script>

        <script type="text/javascript" src="<%=context%>\files\assets\js\modalEffects.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\js\classie.js"></script>
           <!--<script src="<%=context%>\files\bower_components\datatables.net-responsive-bs4\js\responsive.bootstrap4.min.js"></script>-->

        <!-- Bootstrap date-time-picker js -->
        <script type="text/javascript" src="<%=context%>\files\assets\pages\advance-elements\moment-with-locales.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\bootstrap-datepicker\js\bootstrap-datepicker.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\pages\advance-elements\bootstrap-datetimepicker.min.js"></script>
        <!-- Date-range picker js -->
        <script type="text/javascript" src="<%=context%>\files\bower_components\bootstrap-daterangepicker\js\daterangepicker.js"></script>
        <!-- Date-dropper js -->
        <script type="text/javascript" src="<%=context%>\files\bower_components\datedropper\js\datedropper.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\pages\advance-elements\custom-picker.js"></script>
        <!-- i18next.min.js -->
        <script type="text/javascript" src="<%=context%>\files\bower_components\i18next\js\i18next.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\i18next-xhr-backend\js\i18nextXHRBackend.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\i18next-browser-languagedetector\js\i18nextBrowserLanguageDetector.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery-i18next\js\jquery-i18next.min.js"></script>

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
        <script>
                    window.dataLayer = window.dataLayer || [];
                    function gtag() {
                        dataLayer.push(arguments);
                    }
                    gtag('js', new Date());

                    gtag('config', 'UA-23581568-13');
        </script>
    </body>
</html>

