<%-- 
    Document   : registrarMateria
    Created on : 11/03/2020, 10:45:52 PM
    Author     : Zaira
--%>


<%
    String context = request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="es" ng-app="inicioMaterias">
    <head >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Materia | SGAA</title>
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
        <!-- Style.css -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\style.css">
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\jquery.mCustomScrollbar.css">
    </head>
    <body ng-controller="controladorMateria" ng-init="inicioCarrera()">
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
                                                  <div class="card page-header p-0">
                                                    <div class="card-block front-icon-breadcrumb row align-items-end">
                                                        <div class="breadcrumb-header col">
                                                            <div class="big-icon">
                                                                <i class="icofont icofont-school-bag"></i>
                                                            </div>
                                                            <div class="d-inline-block">
                                                                <h5>Registrar Materia</h5>
                                                                <!--<span>lorem ipsum dolor sit amet, consectetur adipisicing elit</span>-->
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="page-header-breadcrumb">
                                                                <ul class="breadcrumb-title">
                                                                    <a style="font-size: 50px" href="<%=context%>/inicioMateria"><i class="icofont icofont-circled-left"></i></a>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                
                                                <div class="card-block">
                                                    <form id="main" method="post" action="<%=context%>/registrarMateriaJson">
                                                        <s:hidden name="bean.id_materia" value="%{bean.id_materia}"/>
                                                        <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label">Identificador <span style="color: red">*</span></label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" ng-model="bean.identificador" name="bean.identificador" id="bean.identificador" placeholder="TIC">
                                                                <span class="messages"></span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label">Nombre <span style="color: red">*</span></label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" ng-model="bean.nombre"  id="bean.nombre" name="bean.nombre" placeholder="Tecnologías de la información y comunicación">
                                                                <span class="messages"></span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label">Descripción<span style="color: red">*</span></label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" ng-model="bean.desc" id="bean.desc" name="bean.desc" placeholder="Materia encargada con las nuevas tecnologias">
                                                                <span class="messages"></span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label">Cuatrimestre<span style="color: red">*</span></label>
                                                            <div class="col-sm-10">
                                                                <select type="text" class="form-control" ng-model="bean.numero_cuatri.id_numero_cuatri" id="bean.numero_cuatri.id_numero_cuatri" name="bean.numero_cuatri.id_numero_cuatri" placeholder="1">
                                                                    <option value="1" selected="">1</option>
                                                                    <option value="2">2</option>
                                                                    <option value="3">3</option>
                                                                    <option value="4">4</option>
                                                                    <option value="5">5</option>
                                                                    <option value="6">6</option>
                                                                    <option value="7">7</option>
                                                                    <option value="8">8</option>
                                                                    <option value="9">9</option>
                                                                    <option value="10">10</option>
                                                                    <option value="11">11</option>
                                                                </select>
                                                                    <span class="messages"></span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label">Carrera<span style="color: red">*</span></label>
                                                            <div class="col-sm-10">
                                                                <select type="text" class="form-control" ng-model="bean.carrera.id_carrera" id="bean.carrera.id_carrera" name="bean.carrera.id_carrera" placeholder="Materia encargada con las nuevas tecnologias">
                                                                    <option>Seleccionar...</option>
                                                                    <option ng-repeat="carrera in listaCarreras" value="{{carrera.id_carrera}}">{{carrera.nombre}}</option>
                                                                </select>
                                                                    <span class="messages"></span>
                                                            </div>
                                                        </div>
                                                 
                                                        <div class="form-group row">
                                                            <label class="col-sm-2"></label>
                                                            <div class="col-sm-10">
                                                                <button type="submit" class="btn btn-success">Aceptar</button>
                                                            </div>
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

   <script type="text/javascript" src="<%=context%>\js\angular.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery\js\jquery.min.js"></script>
        <script type="text/javascript" src="<%=context%>\js\popper.js"></script>
        <script type="text/javascript" src="<%=context%>\js\bootstrap.js"></script>
        <script type="text/javascript" src="<%=context%>\js\sweetalert2.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery\js\jquery.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery-ui\js\jquery-ui.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\popper.js\js\popper.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\bootstrap\js\bootstrap.min.js"></script>
        <!--<script type="text/javascript" src="<%=context%>\files\assets\pages\dashboard\custom-dashboard.js"></script>-->
        <script src="<%=context%>/js/control_materia.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery-slimscroll\js\jquery.slimscroll.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\modernizr\js\modernizr.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\modernizr\js\css-scrollbars.js"></script>
        <!-- Sidebar -->
        <script src="<%=context%>\files\assets\js\pcoded.min.js"></script>
        <script src="<%=context%>\files\assets\js\vartical-layout.min.js"></script>
        <script src="<%=context%>\files\assets\js\jquery.mCustomScrollbar.concat.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\js\script.min.js"></script>

        <!-- data-table js -->
        <script>
            <s:if test="mensaje.equals('1')">
                console.log('lkjhgfds');
            </s:if>
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
