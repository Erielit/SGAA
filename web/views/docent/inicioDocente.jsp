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
        <title>SGAA | Docente</title>
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
        <link href='<%=context%>/packages/core/main.css' rel='stylesheet' />
        <link href='<%=context%>/packages/daygrid/main.css' rel='stylesheet' />
        <link href='<%=context%>/packages/timegrid/main.css' rel='stylesheet' />
        <link href='<%=context%>/packages/list/main.css' rel='stylesheet' />
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\style.css"/>
        <!-- Sidebar -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\jquery.mCustomScrollbar.css"/>
    </head>
    <body >
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
                        <div class="pcoded-content" ng-app="docent-app">
                            <div class="pcoded-inner-content"  ng-controller="asesorias">
                                <div class="main-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <h2>Solicitudes de Asesoría</h2>
                                        </div>
                                        <s:if test="respuesta.mensaje != null">
                                            <div class="col-md-4">
                                                <label><s:property value="respuesta.mensaje"/></label>
                                            </div>
                                        </s:if>
                                        <s:else>
                                            <s:iterator value="respuesta.listCourses" status="po">                       
                                                <div class="col-md-4">
                                                    <div class="card text-center">
                                                        <div class="card-header">
                                                            <h4>Asesoria <s:property value="#po.count"/></h4>
                                                        </div>
                                                        <div class="card-body">
                                                            <h5>Materia </h5>
                                                            <h4><s:property value="materia.nombre"/></h4>
                                                            <h5>Fecha</h5>
                                                            <h5><s:property value="date"/></h5>
                                                            <h5> <s:property value="horario.hora_inicio"/> - <s:property value="horario.hora_fin"/></h5>
                                                        </div>
                                                        <div class="card-footer">
                                                            <a href="#" ng-click="aceptarAsesoria(<s:property value="id_asesoria"/>)" class="btn btn-primary">Aceptar</a>                                            
                                                            <a href="#" ng-click="rechazarAsesoria(<s:property value="id_asesoria"/>)" class="btn btn-danger">Rechazar</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </s:iterator>
                                        </s:else>
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
        <script type="text/javascript" src="<%=context%>\js\angular.js"></script>
        <script type="text/javascript" src="<%=context%>\js\control_docente.js"></script>
           <!--<script src="<%=context%>\files\bower_components\datatables.net-responsive-bs4\js\responsive.bootstrap4.min.js"></script>-->
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
