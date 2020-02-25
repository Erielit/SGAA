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
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\icon\font-awesome\css\font-awesome.min.css">
        <!-- Style.css -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\pages\menu-search\css\component.css"/>
        <link rel="stylesheet" href="<%=context%>/files/assets/icon/feather/css/feather.css"/>
        <!-- list css -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\pages\list-scroll\list.css">
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\stroll\css\stroll.css">
        <!-- Multi Select css -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\bootstrap-multiselect\css\bootstrap-multiselect.css">
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\multiselect\css\multi-select.css">
        <!-- Callendar -->
        <link href='<%=context%>/packages/core/main.css' rel='stylesheet' />
        <link href='<%=context%>/packages/daygrid/main.css' rel='stylesheet' />
        <link href='<%=context%>/packages/timegrid/main.css' rel='stylesheet' />
        <link href='<%=context%>/packages/list/main.css' rel='stylesheet' />
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
        <div id="pcoded" class="pcoded" ng-controller="agendarAsesoria" ng-init="inicioEstudiante()">
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
                                                    <div id='calendar'></div>
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
            <form class="needs-validation" method="post" action="agendar-asesoria" novalidate id="formAsesoria" name="form_agendar">
                <div class="modal fade" id="default-Modal" tabindex="-1" role="dialog">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Agendar Asesoria</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-row m-3">
                                    <div class="col-lg-6 col-md-6">
                                        <label>Fecha de solicitud de asesoria</label>
                                        <input type="hidden" id="estudiante" value="<s:property value="#session.estudiante.id_estudiante"/>"/>
                                        <input id="fecha" name="date" value="" type="text" readonly="" class="form-control" />
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <label for="horario">Horario</label>
                                        <s:select class="custom-select col-12" required="" name="horario" id="horario"
                                                  list="respuesta.horarios" listKey="id_horario" listValue="hora_inicio + ' ' + hora_fin" headerKey="" headerValue="Seleccionar un horario...">
                                        </s:select>
                                        <div class="invalid-feedback">Seleccionar un horario.</div>
                                    </div>
                                </div>
                                <input type="hidden" name="params" value="{{asesoria}}" id="params"/>
                                <div class="form-row m-3">
                                    <div class="col-lg-6 col-md-6">
                                        <label for="materia">Materia </label>
                                        <s:select class="custom-select col-12" required="" id="materia" ng-change="changeMateria(materia)" ng-model="materia"
                                                  list="respuesta.materias" listKey="id_materia" listValue="nombre" headerKey="" headerValue="Seleccionar materia...">
                                        </s:select>
                                        <div class="invalid-feedback">Seleccionar una materia.</div>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <label for="docente">Docente</label>
                                        <select class="custom-select col-12" ng-disabled="form_agendar.materia.$invalid" id="docente" required>
                                            <option selected="true" value="">Seleccionar docente...</option>
                                            <option ng-repeat="docent in docentes" value="{{docent.id_docent}}">{{docent.nombre + ' ' + docent.primer_apellido + ' ' + docent.segundo_apellido}}</option>
                                        </select>
                                        <div class="invalid-feedback">
                                            Seleccionar un docente.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Cerrar</button>
                                <button type="button" class="btn btn-info waves-effect" ng-disabled="form_agendar.$invalid" ng-click="confirmAsesoria(asesoria)">Confirm</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <div class="modal fade" id="cancelar-asesoria" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Opciones</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <ul class="nav nav-tabs md-tabs " role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#home7" role="tab"><i class="fa fa-file-text-o"></i> Asesoria</a>
                                    <div class="slide"></div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#profile7" role="tab"><i class="fa fa-share-alt"></i></i> Invitar</a>
                                    <div class="slide"></div>
                                </li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content card-block">
                                <div class="tab-pane active" id="home7" role="tabpanel">
                                    <div class="form-row m-3">
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <label>Materia:</label>
                                            <p id="det_materia"></p>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <label>Docente:</label>
                                            <p id="det_docente"></p>
                                        </div>
                                    </div>
                                    <div class="form-row m-3">
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <label>Fecha: </label>
                                            <p id="det_fecha"></p>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <label>Horario:</label>
                                            <p id="det_horario"></p>
                                        </div>

                                    </div>
                                </div>
                                <div class="tab-pane" id="profile7" role="tabpanel">
                                    <div class="form-row m-3">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <form>
                                                <h4 class="sub-title">Invitar compañeros</h4>
                                                <select id='public-methods' multiple='multiple'>
                                                    <option ng-repeat="" value=""></option>
                                                </select>
                                            </form>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-t-15">
                                            <h6 class="sub-title">Integrantes</h6>
                                            <ul class="basic-list list-icons">
                                                <li>
                                                    <i class="icofont icofont-speech-comments text-primary p-absolute text-center d-block f-30"></i>
                                                    <h6>Heading</h6>
                                                    <p>Laborum nihil aliquam nulla praesentium illo libero
                                                        nihil at odio maxime.</p>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Cerrar</button>
                            <form method="post" action="cancelar-asesoria" id="form_cancelar">
                                <input type="hidden" id="asesoria_cancelar" />
                                <button class="btn btn-danger" ng-click="cancelarAsesoria()"  type="button">Cancelar asesoria</button>
                            </form>
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
        <!-- Callendar-->
        <script src='<%=context%>\packages\core\main.js'></script>
        <script src='<%=context%>\packages/core/locales-all.js'></script>
        <script src='<%=context%>/packages/interaction/main.js'></script>
        <script src='<%=context%>/packages/daygrid/main.js'></script>
        <script src='<%=context%>/packages/timegrid/main.js'></script>
        <script src='<%=context%>/packages/list/main.js'></script>
        <!-- Sidebar -->
        <script src="<%=context%>\files\assets\js\pcoded.min.js"></script>
        <script src="<%=context%>\files\assets\js\vartical-layout.min.js"></script>
        <script src="<%=context%>\files\assets\js\jquery.mCustomScrollbar.concat.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\js\script.min.js"></script>
        <!--List -->
        <script src="<%=context%>\files\bower_components\stroll\js\stroll.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\pages\list-scroll\list-custom.js"></script>
        <!--Select-->
        <script type="text/javascript" src="<%=context%>\files\bower_components\select2\js\select2.full.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\bootstrap-multiselect\js\bootstrap-multiselect.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\multiselect\js\jquery.multi-select.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\js\jquery.quicksearch.js"></script>
        <!-- >Modal <-->
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
