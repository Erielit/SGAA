<%-- 
    Document   : inicioCarrera
    Created on : 10/03/2020, 08:48:51 AM
    Author     : Zaira
--%>

<%
    String context = request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="es" ng-app="inicioCarreras">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio Carrera | SGAA</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
        <!-- Required Fremwork -->
        <link rel="stylesheet" type="text/css" href="<%=context%>/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="<%=context%>/css/sweetalert2.css">

        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\icon\themify-icons\themify-icons.css">
        <!-- ico font -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\icon\icofont\css\icofont.css">
        <!-- Style.css -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\pages\menu-search\css\component.css">
        <link rel="stylesheet" href="<%=context%>/files/assets/icon/feather/css/feather.css"/>
        <!-- Callendar -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\style.css">
        <!-- Sidebar -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\jquery.mCustomScrollbar.css">
        <!-- Data Table Css -->
        <link rel="stylesheet" type="text/css" href="<%=context%>/css/dataTables.bootstrap4.css">
    </head>
    <body ng-controller="controladorCarrera" ng-init="inicioCarrera()">
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
                                                                <i class="icofont icofont-calculations"></i>
                                                            </div>
                                                            <div class="d-inline-block">
                                                                <h5>Gestión de Carrera</h5>
                                                                <!--<span>lorem ipsum dolor sit amet, consectetur adipisicing elit</span>-->
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="page-header-breadcrumb">
                                                                <ul class="breadcrumb-title">
                                                                    <a class="btn btn-success" href="registrarCarrera" ><i class="icofont icofont-plus-circle"></i>Registrar</a>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="card-block">
                                                        <div class="dt-responsive table-responsive">
                                                            <table id="simpletable" class="table compact table-striped table-bordered nowrap">
                                                                <thead>
                                                                    <tr style="color: #000">
                                                                        <th>Identificador.</th>
                                                                        <th>Nombre</th>
                                                                        <th>Descripción</th>
                                                                        <th>Modificar</th>
                                                                        <th>Eliminar</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr style="color: #000" ng-repeat="carrera in listaCarreras" style="color: white">

                                                                        <td>{{carrera.siglas}}</td>
                                                                        <td>{{carrera.nombre}}</td>

                                                                        <td>{{carrera.descripciont}}</td>
                                                                        <td>   
                                                                            <s:form action="consultaIndividualCarrera">
                                                                                <s:hidden ng-model="carrera.id_carrera" name="bean.id_carrera" value="{{carrera.id_carrera}}" />
                                                                                <button class="btn btn-warning btn-icon" rype="submit"> <i class="icofont icofont-edit"></i> </button>
                                                                            </s:form>
                                                                        </td> 
                                                                        <td>    
                                                                            <div ng-if="carrera.estado.id_estado === 2">
                                                                                <form action="estadoCarrera" method="post" id="inactivo{{carrera.id_carrera}}">
                                                                                    <input name="bean.estado.id_estado" id="params{{carrera.id_carrera}}" type="hidden" value="1">
                                                                                    <input type="hidden" value="{{carrera.id_carrera}}" name="bean.id_carrera">
                                                                                    <a href="javascript:void(0)" class="btn btn-success" 
                                                                                       ng-click="confirmarEstadoCarrera(carrera.id_carrera)">
                                                                                        <i class="ti-check"></i>
                                                                                    </a>
                                                                                </form>
                                                                            </div>
                                                                            <div ng-if="carrera.estado.id_estado === 1">
                                                                                <form action="estadoCarrera" method="post" id="inactivo{{carrera.id_carrera}}">
                                                                                    <input name="bean.estado.id_estado" id="params{{carrera.id_carrera}}" type="hidden" value="2">
                                                                                    <input type="hidden"value="{{carrera.id_carrera}}" name="bean.id_carrera">
                                                                                    <a href="javascript:void(0)" class="btn btn-danger" 
                                                                                       ng-click="confirmarEstadoCarrera(carrera.id_carrera)">
                                                                                        <i class="ti-close"></i>
                                                                                    </a>
                                                                                </form>
                                                                            </div>
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
        <script type="text/javascript" src="<%=context%>\js\angular.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery\js\jquery.min.js"></script>
        <script type="text/javascript" src="<%=context%>\js\popper.js"></script>
        <script type="text/javascript" src="<%=context%>\js\bootstrap.js"></script>
        <script type="text/javascript" src="<%=context%>\js\sweetalert2.js"></script>
            <!--<script type="text/javascript" src="<%=context%>\files\assets\pages\dashboard\custom-dashboard.js"></script>-->
        <script src="<%=context%>/js/control_carrera.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery-slimscroll\js\jquery.slimscroll.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\modernizr\js\modernizr.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\modernizr\js\css-scrollbars.js"></script>
        <!-- Sidebar -->
        <script src="<%=context%>\files\assets\js\pcoded.min.js"></script>
        <script src="<%=context%>\files\assets\js\vartical-layout.min.js"></script>
        <script src="<%=context%>\files\assets\js\jquery.mCustomScrollbar.concat.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\js\script.min.js"></script>

        <script src="<%=context%>\js\datatables.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\js\modalEffects.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\js\classie.js"></script>
           <!--<script src="<%=context%>\files\bower_components\datatables.net-responsive-bs4\js\responsive.bootstrap4.min.js"></script>-->

        <script>
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

                                                                                                   var mensaje = '<s:property value="mensaje" />' + "";
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
                                                                                                   })();</script>
    </body>
</html>
