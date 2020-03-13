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
        <title>SGAA | Horario</title>
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
    <body ng-app="coordinador-app" ng-controller="coordinador">
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
                        <div class="pcoded-content"  >
                            <div class="pcoded-inner-content" >
                                <div class="main-body">
                                    <div class="page-wrapper">
                                        <div class="page-body" ng-init="inicioCoordinador()">
                                            <div class="row">
                                                <!-- statustic-card start -->
                                                <div class="col-xl-3 col-md-6">
                                                    <div class="card bg-c-yellow text-white">
                                                        <div class="card-block">
                                                            <div class="row align-items-center">
                                                                <div class="col">
                                                                    <p class="m-b-5">Asistencias Mujeres</p>
                                                                    <h4 class="m-b-0">{{asesoriasM[0].id_estudiante}}</h4>
                                                                </div>
                                                                <div class="col col-auto text-right">
                                                                    <i class="feather icon-user f-50 text-c-yellow"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 col-md-6">
                                                    <div class="card bg-c-green text-white">
                                                        <div class="card-block">
                                                            <div class="row align-items-center">
                                                                <div class="col">
                                                                    <p class="m-b-5">Asistencias Hombres</p>
                                                                    <h4 class="m-b-0">{{asesoriasH[0].id_estudiante}}</h4>
                                                                </div>
                                                                <div class="col col-auto text-right">
                                                                    <i class="feather icon-user f-50 text-c-green"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 col-md-6">
                                                    <div class="card bg-c-pink text-white">
                                                        <div class="card-block">
                                                            <div class="row align-items-center">
                                                                <div class="col">
                                                                    <p class="m-b-5">Canalizaciones completadas hombres</p>
                                                                    <h4 class="m-b-0">{{asesoriasDirectedH[0].id_estudiante}}</h4>
                                                                </div>
                                                                <div class="col col-auto text-right">
                                                                    <i class="feather icon-book f-50 text-c-pink"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 col-md-6">
                                                    <div class="card bg-c-blue text-white">
                                                        <div class="card-block">
                                                            <div class="row align-items-center">
                                                                <div class="col">
                                                                    <p class="m-b-5">Canalizaciones completadas muejeres</p>
                                                                    <h4 class="m-b-0">{{asesoriasDirectedM[0].id_estudiante}}</h4>
                                                                </div>
                                                                <div class="col col-auto text-right">
                                                                    <i class="feather icon-shopping-cart f-50 text-c-blue"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- statustic-card start -->

                                                <!-- statustic-card start -->
                                                <div class="col-xl-6 col-md-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <div class="card-header-left ">
                                                                <h5>Asistencias</h5>
                                                                <span class="text-muted">Asistencias totales de mujeres y hombres en las asesorias.</span>
                                                            </div>
                                                        </div>
                                                        <div class="card-block">
                                                            <canvas id="myChart" width="400" height="400"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-6 col-md-12">
                                                    <div class="card feed-card">
                                                        <div class="card-header">
                                                            <h5>Canalizaciones</h5>
                                                            <span class="text-muted">Canalizaciones completadas por horambre y mujeres.</span>
                                                        </div>
                                                        <div class="card-block">
                                                            <canvas id="myChart2" width="400" height="400"></canvas>
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
    <script type="text/javascript" src="<%=context%>\files\bower_components\chart.js\js\Chart.js"></script>
    <!-- gauge js -->
    <script src="<%=context%>\files\assets\pages\widget\gauge\gauge.min.js"></script>
    <script src="<%=context%>\files\assets\pages\widget\amchart\amcharts.js"></script>
    <script src="<%=context%>\files\assets\pages\widget\amchart\serial.js"></script>
    <script src="<%=context%>\files\assets\pages\widget\amchart\gauge.js"></script>
    <script src="<%=context%>\files\assets\pages\widget\amchart\pie.js"></script>
    <script src="<%=context%>\files\assets\pages\widget\amchart\light.js"></script>
    <script type="text/javascript" src="<%=context%>\js\angular.js"></script>
    <script src="<%=context%>/js/control_coordinador.js"></script>
</body>
</html>
