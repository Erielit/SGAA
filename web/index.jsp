<%-- 
    Document   : index
    Created on : 14/01/2020, 09:31:59 AM
    Author     : netmo
--%>

<%
    String context = request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido | Iniciar Sesión</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
        <!-- Required Fremwork -->

        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\bootstrap\css\bootstrap.min.css">
        <!-- themify-icons line icon -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\icon\themify-icons\themify-icons.css">
        <!-- ico font -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\icon\icofont\css\icofont.css">
        <!-- Style.css -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\style.css">
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
        <section class="login-block">
            <!-- Container-fluid starts -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <!-- Authentication card start -->
                        <form id="main"action="iniciar-sesion" method="post" class="md-float-material form-material needs-validation"  novalidate="" >
                            <div class="auth-box card">
                                <div class="card-block">
                                    <div class="row m-b-20">
                                        <div class=" col-md-12 text-center">
                                            <img src="<%=context%>\images\datic.png" class="" width="250px" alt="logo.png">
                                        </div>
                                        <div class="col-md-12 m-t-30">
                                            <h3 class="text-center txt-primary">Iniciar Sesión</h3>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="email" name="username" pattern="[a-z0-9]{10,15}@utez.edu.mx" class="form-control" required="" placeholder="Correo institucional">
                                        <div class="invalid-feedback">
                                            Ingrese su correo institucional.
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" class="form-control" required="" placeholder="Contraseña">
                                        <div class="invalid-feedback">
                                            Ingrese su contraseña.
                                        </div>
                                    </div>
                                    <div class="row m-t-25 text-left">
                                        <div class="col-6">
                                            <div class="forgot-phone text-right f-right">
                                                <a href="#" class="text-right f-w-600">¿Olvidaste tu contraseña?</a>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="forgot-phone text-right f-right">
                                                <a href="" class="text-right f-w-600">Prueba</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-t-30">
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">Acceder</button>
                                        </div>
                                    </div>
                                    <p class="text-inverse text-left">¿No tienes una cuenta?<a href="auth-sign-up-social.htm"> <b class="f-w-600">Registrate aquí </b></a>!</p>
                                    <div class="row m-t-30">
                                        <div class="col-md-12">
                                            <s:if test="respuesta.mensaje != ''">
                                                <div class="alert alert-danger background-danger">
                                                    <button id="close" type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                        <i class="icofont icofont-close-line-circled text-white"></i>
                                                    </button>
                                                    <s:property value="respuesta.mensaje" />
                                                </div>
                                            </s:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery\js\jquery.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\popper.js\js\popper.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\bootstrap\js\bootstrap.min.js"></script>
        <!--<script type="text/javascript" src="<%=context%>\files\assets\pages\dashboard\custom-dashboard.js"></script>-->
        <script src="<%=context%>\files\assets\js\jquery.mCustomScrollbar.concat.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery-slimscroll\js\jquery.slimscroll.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\js\script.min.js"></script>
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
            $(document).ready(function () {
                setTimeout(function(){
                    document.getElementById('close').click();
                }, 2000);
            });
        </script>
    </body>
</html>
