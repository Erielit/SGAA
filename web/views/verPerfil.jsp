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
        <title>SGAA | Perfil</title>
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
        <div id="pcoded" class="pcoded">
            <div class="pcoded-overlay-box"></div>
            <div class="pcoded-container navbar-wrapper">
                <jsp:include page="header.jsp"/>
                <!-- Sidebar inner chat end-->
                <div class="pcoded-main-container">
                    <div class="pcoded-wrapper">
                        <jsp:include page="menu.jsp"/>
                        <div class="pcoded-content">
                            <div class="pcoded-inner-content">
                                <div class="main-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h2>Información Personal</h2>
                                                </div>
                                                <div class="card-block">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <form class="needs-validation">
                                                                <div class="form-group">
                                                                    <label for="nombre">Nombre</label>
                                                                    <input type="text" value="<s:property value="respuesta.persona.nombre"/>" class="form-control" required="" id="nombre" placeholder="Nombre...">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="apellidoM">Apellido Materno</label>
                                                                    <input type="text" value="<s:property value="respuesta.persona.primer_apellido"/>" class="form-control" required="" id="apellidoM" placeholder="Apellido Materno...">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="apellidoP">Apellido Paterno</label>
                                                                    <input type="text" value="<s:property value="respuesta.persona.segundo_apellido"/>" class="form-control" required="" id="apellidoP" placeholder="Apellido Paterno...">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="curp">CURP</label>
                                                                    <input type="text" value="<s:property value="respuesta.persona.curp"/>" class="form-control" required="" id="curp" placeholder="CURP...">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="fechaNac">Fecha de Nacimiento</label>
                                                                    <input type="date" value="<s:property value="respuesta.persona.fecha_nacimiento"/>" class="form-control" required="" id="fechaNac" placeholder="Fecha de Nacimiento...">
                                                                </div>
                                                            </form>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <form class="needs-validation">
                                                                <input type="hidden" value="<s:property value="respuesta.persona.usuario.password"/>" class="form-control" id="contraActual"/>
                                                                <div class="form-group">
                                                                    <label for="email">Email</label>
                                                                    <input type="email" value="<s:property value="respuesta.persona.usuario.username"/>" class="form-control" required="" id="email" placeholder="Email...">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="contra">Contraseña Actual</label>
                                                                    <input type="password" class="form-control" required="" id="contra" placeholder="Contraseña...">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="password1">Contraseña Nueva</label>
                                                                    <input type="password" disabled="true" class="form-control" required="" id="password1" placeholder="Nueva Contraseña...">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="password2">Repite la Contraseña Nueva</label>
                                                                    <input type="password" disabled="true" class="form-control" required="" id="password2" placeholder="Nueva Contraseña...">
                                                                </div>
                                                                <div class="form-group text-right">
                                                                    <button type="button" id="aceptar" onclick="pModificar()" class="btn btn-primary">Confirmar</button>
                                                                    <button type="button" id="cancelar" onclick="back()" class="btn btn-secondary">Cancelar</button>
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
        </div>

        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery\js\jquery.min.js"></script>
        <script type="text/javascript" src="<%=context%>\js\popper.js"></script>
        <script type="text/javascript" src="<%=context%>\js\bootstrap.js"></script>
        <script type="text/javascript" src="<%=context%>\js\sweetalert2.js"></script>

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
        <script type="text/javascript" src="<%=context%>\js\gestion_perfil.js"></script>

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
