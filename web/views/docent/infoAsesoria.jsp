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
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\pages\list-scroll\list.css"/>
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
    <body ng-app="docent-app" ng-controller="buscarEstudiantes">
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
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h2>Información Asesoría</h2>
                                                    <s:hidden id="idCourse" value="%{respuesta.idCourse}"/>
                                                </div>
                                                <div class="card-block">
                                                    <div class="row">
                                                        <div class="col-lg-12 text-right">
                                                            <button class="btn btn-success" data-toggle="modal" data-target="#agregar-participante">
                                                                <i class=""></i> Agregar participante
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <br/>
                                                    <div class="table-responsive dt-responsive">
                                                        <table id="dt-ajax-array" class="table compact table-striped table-bordered nowrap">
                                                            <thead>
                                                                <tr>
                                                                    <th>No.</th>
                                                                    <th>Estudiante</th>
                                                                    <th>Matrícula</th>
                                                                    <th>Asistencia</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <s:iterator value="respuesta.listStudents" status="po"> 
                                                                    <tr>
                                                                        <td><s:property value="#po.count"/></td>
                                                                        <td><s:property value="nombre"/> <s:property value="primer_apellido"/> <s:property value="segundo_apellido"/></td>
                                                                        <td><s:property value="matricula"/></td>
                                                                        <td class="text-center">
                                                                            <s:if test="respuesta.active == 1">
                                                                                <div class="btn-group-toggle" data-toggle="buttons">
                                                                                    <s:if test="beanAsesoriaEstudiante.assists == 1">
                                                                                        <label id="radio" class="btn btn-success">
                                                                                            <input type="checkbox" value="<s:property value="beanAsesoriaEstudiante.assists"/>" id="btnAttendance<s:property value="id_estudiante"/>" onchange="paseLista(<s:property value="id_estudiante"/>)">
                                                                                            <i id="icon" class="ti-check"></i>
                                                                                        </label>
                                                                                    </s:if><s:else>
                                                                                        <label id="radio" class="btn btn-danger">
                                                                                            <input type="checkbox" value="<s:property value="beanAsesoriaEstudiante.assists"/>" id="btnAttendance<s:property value="id_estudiante"/>" onchange="paseLista(<s:property value="id_estudiante"/>)">
                                                                                            <i id="icon" class="ti-close"></i>
                                                                                        </label>
                                                                                    </s:else>                                                                                
                                                                                </div>
                                                                            </s:if>
                                                                        </td>
                                                                    </tr>
                                                                </s:iterator>
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
            <div class="modal fade" id="agregar-participante" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Agregar estudiante</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <label>Matrícula: </label><br/>
                                    <input hidden="" type="text" value="<s:property value="%{respuesta.idCourse}"/>" id="course" />
                                    <input class="form-control col-md-6" type="text" ng-change="obtenerEstudiantes(bean)" ng-model="bean.matricula"/><br/>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-4" ng-show="loading">
                                            <div class="preloader3 loader-block">
                                                <div class="circ1"></div>
                                                <div class="circ2"></div>
                                                <div class="circ3"></div>
                                                <div class="circ4"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12" ng-show="!loading">
                                            <div ng-repeat="estudiante in estudiantes" class="row" style="margin: 4px;border-top: 1px solid #d1d1d1; border-bottom: 1px solid #d1d1d1; ">
                                                <div class="col-sm-6">
                                                    <label>{{estudiante.matricula}} {{estudiante.nombre + ' ' + estudiante.primer_apellido + ' ' + estudiante.segundo_apellido}} <span>{{estudiante.fecha_nacimiento}}</span></label>
                                                </div>
                                                <div class="col-sm-6 text-center" >
                                                    <input type="hidden" ng-value="estudiante.id_estudiante" id="estudiante" />
                                                    <button class="btn" id="btnAsignar" onclick="deshabilitar(this)" ng-click="asignarEstudiante(bean)"><i class="ti-plus"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
            <form method="post" action="<%=context%>/estudiantesAsesoria" id="recargar">
                <s:hidden name="param_integer" value="%{respuesta.idCourse}"/>
            </form>
            <script type="text/javascript" src="<%=context%>\files\bower_components\jquery\js\jquery.min.js"></script>
            <script type="text/javascript" src="<%=context%>\js\popper.js"></script>
            <script type="text/javascript" src="<%=context%>\js\bootstrap.js"></script>
            <script type="text/javascript" src="<%=context%>\js\sweetalert2.js"></script>
            <script type="text/javascript" src="<%=context%>\js\angular.js"></script>
            <script src="<%=context%>/js/control_docente.js"></script>
<!--<script type="text/javascript" src="<%=context%>\files\assets\pages\dashboard\custom-dashboard.js"></script>-->
            <script src="<%=context%>\files\bower_components\stroll\js\stroll.js"></script>
            <script type="text/javascript" src="<%=context%>\files\assets\pages\list-scroll\list-custom.js"></script>
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
            <script type="text/javascript" src="<%=context%>\js\pase_lista.js"></script>

            <!-- >Modal <-->
               <!--<script src="<%=context%>\files\bower_components\datatables.net-responsive-bs4\js\responsive.bootstrap4.min.js"></script>-->
            <script>
                                                                $("#agregar-participante").on("hidden.bs.modal", function () {
                                                                    $("#recargar").submit();
                                                                });
                                                                function deshabilitar(e) {
                                                                    $("#"+e.id).attr("disabled","disabled");
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
                                                                                                })();
            </script>
    </body>
</html>
