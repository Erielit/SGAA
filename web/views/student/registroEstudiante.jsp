<%-- 
    Document   : registroEstudiante
    Created on : 2/03/2020, 09:10:24 AM
    Author     : netmo
--%>
<%
    String context = request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Registro estudiante</title>
        <meta name="viewport" content="width=device-width"/>
        <!-- Favicon icon -->
        <link rel="icon" href="img\favicon.ico" type="image/x-icon"/>
        <link rel="stylesheet" type="text/css" href="<%=context%>/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="<%=context%>/css/sweetalert2.css"/>
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
        <link rel="stylesheet" type="text/css" href="<%=context%>/css/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\jquery.steps\css\jquery.steps.css"/>
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\datedropper\css\datedropper.min.css">
    </head>
    <body class="fix-menu" ng-app="my-app" ng-controller="registroEstudiante">
        <!-- Pre-loader start -->
        <div class="theme-loader">
            <div class="ball-scale">
                <div class='contain'>
                    <div class="ring"><div class="frame"></div></div>
                    <div class="ring"><div class="frame"></div></div>
                    <div class="ring"><div class="frame"></div></div>
                    <div class="ring"><div class="frame"></div></div>
                    <div class="ring"><div class="frame"></div></div>
                    <div class="ring"><div class="frame"></div></div>
                    <div class="ring"><div class="frame"></div></div>
                    <div class="ring"><div class="frame"></div></div>
                    <div class="ring"><div class="frame"></div></div>
                    <div class="ring"><div class="frame"></div></div>
                </div>
            </div>
        </div>
        <!-- Pre-loader end -->
        <section class="login-block">
            <!-- Container-fluid starts -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-8 offset-2">
                        <div class="card">
                            <div class="card-block" >
                                <div class="row">
                                    <div class="col-md-12">
                                        <div id="wizard3">
                                            <section>
                                                <form class="needs-validation" name="formRegistrarse" id="design-wizard" action="<%=context%>/registrarse" method="post"
                                                      oninput='params.setCustomValidity(params.value != confirm.value ? "Las contraseñas no coinciden." : "")'>
                                                    <h3></h3>
                                                    <fieldset>
                                                        <h4>Datos personales</h4><br/>
                                                        <div class="form-row form-group">
                                                            <div class="col-md-4">
                                                                <label>Nombre: </label><br/>
                                                                <input name="nombre" ng-required="true" class="form-control" required="">  
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Primer apellido: </label><br/>
                                                                <input name="primer_apellido" class="form-control" required="">  
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Segundo apellido: </label><br/>
                                                                <input name="segundo_apellido" class="form-control" required="">
                                                            </div>
                                                        </div>
                                                        <div class="form-row form-group">
                                                            <div class="col-md-4">
                                                                <label>Curp: </label><br/>
                                                                <input name="curp" style="text-transform: uppercase" class="form-control" required="">
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Fecha de nacimiento: </label><br/>
                                                                <input name="fecha_nacimiento" type="date" required="" id="dropper-default" class="form-control">
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Género: </label><br/>
                                                                <select class="custom-select" required="" name="genero">
                                                                    <option value="1">Femenino</option>
                                                                    <option value="2">Masculino</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                    <h3></h3>
                                                    <fieldset>
                                                        <h4>Datos académicos</h4><br/>
                                                        <div class="form-row form-group">
                                                            <div class="col-md-12">
                                                                <label>Carrera </label><br/>
                                                                <select name="carrera" required="" ng-model="carrera" ng-change="carreraChange(carrera)"
                                                                        class="custom-select">
                                                                    <option value="">Selecciona...</option>
                                                                    <s:iterator value="respuesta.carreras" status="po">
                                                                        <option value="<s:property value="id_carrera"/>"><s:property value="nombre"/></option> 
                                                                    </s:iterator>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group form-row">
                                                            <div class="col-md-6">
                                                                <label>Matrícula: </label><br/>
                                                                <input name="matricula" type="text" class="form-control" required="">  
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label>Grupo: </label><br/>
                                                                <select class="custom-select" name="grupo" required="">
                                                                    <option value="">Selecciona...</option>
                                                                    <option ng-repeat="grupo in grupos" value="{{grupo.id_grupo}}">{{grupo.numero_cuatri.numero + " " + grupo.letra.letra}}</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                    <h3></h3>
                                                    <fieldset>
                                                        <h4>Datos de sesión</h4><br/>
                                                        <div class="form-row form-group">
                                                            <div class="col-md-4">
                                                                <label>Correo institucional: </label><br/>
                                                                <input name="email" type="email" class="form-control" ng-model="correo" required="">  
                                                            </div><br/>
                                                            <br/>
                                                            <div class="col-md-4">
                                                                <label>Contraseña: </label><br/>
                                                                <input name="params" maxlength="15" ng-model="contrasenia" type="password" class="form-control" required="">  
                                                            </div><br/><br/>
                                                            <div class="col-md-4">
                                                                <label>Confirmar contraseña:  </label><br/>
                                                                <input name="confirm" maxlength="15" type="password" ng-model="confirm" class="form-control" required="">  
                                                            </div>
                                                            <div>

                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                    <div class="row">
                                                        <div class="col text-right">
                                                            <a href="index" class="btn btn-danger">Cancelar</a>
                                                            <button type="button" class="btn btn-success" ng-disabled="formRegistrarse.$invalid" ng-click="confirmarRegistro()">Registrarse</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </section>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end of col-sm-12 -->
                </div>
                <!-- end of row -->
            </div>
            <!-- end of container-fluid -->
        </section>
        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery\js\jquery.min.js"></script>
        <script type="text/javascript" src="<%=context%>\js\popper.js"></script>
        <script type="text/javascript" src="<%=context%>\js\bootstrap.js"></script>
        <script type="text/javascript" src="<%=context%>\js\sweetalert2.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery-slimscroll\js\jquery.slimscroll.js"></script>    
        <!-- Sidebar -->
        <script src="<%=context%>\files\assets\js\pcoded.min.js"></script>
        <script src="<%=context%>\files\assets\js\vartical-layout.min.js"></script>
        <script src="<%=context%>\files\assets\js\jquery.mCustomScrollbar.concat.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\js\script.min.js"></script>
        <script type="text/javascript" src="<%=context%>\js\angular.js"></script>
        <script src="<%=context%>/js/registro_estudiante.js"></script>
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
