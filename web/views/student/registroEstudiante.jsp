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
    <body class="fix-menu">
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
                            <div class="card-header">
                                <h5>Registrarse</h5>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div id="wizard3">
                                            <section>
                                                <form class="wizard-form" id="design-wizard" action="#">
                                                    <h3></h3>
                                                    <fieldset>
                                                        <div class="form-row form-group">
                                                            <div class="col-md-4">
                                                                <label>Nombre: </label><br/>
                                                                <input name="nombre" class="form-control" required="">  
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
                                                                <input name="curp" class="form-control" required="">
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Fecha de nacimiento: </label><br/>
                                                                <input name="fecha_nacimiento" required="" id="dropper-default" class="form-control">
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
                                                        
                                                    </fieldset>
                                                    <h3></h3>
                                                    <fieldset>

                                                    </fieldset>
                                                </form>
                                            </section>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--                        <form class="md-float-material form-material">
                                                    <div class="text-center">
                        
                                                    </div>
                                                    <div class="auth-box card">
                                                        <div class="card-block">
                                                            <div class="row m-b-20">
                                                                <div class="col-md-12 text-center">
                                                                    <img src="<%=context%>\images\datic.png" class="" width="250px" alt="logo.png">
                                                                </div>
                                                            </div>
                                                            <div class="form-group form-primary">
                                                                <input type="text" name="user-name" class="form-control" required="" placeholder="Choose Username">
                                                                    <span class="form-bar"></span>
                                                            </div>
                                                            <div class="form-group form-primary">
                                                                <input type="text" name="email" class="form-control" required="" placeholder="Your Email Address">
                                                                    <span class="form-bar"></span>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group form-primary">
                                                                        <input type="password" name="password" class="form-control" required="" placeholder="Password">
                                                                            <span class="form-bar"></span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group form-primary">
                                                                        <input type="password" name="confirm-password" class="form-control" required="" placeholder="Confirm Password">
                                                                            <span class="form-bar"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row m-t-25 text-left">
                                                                <div class="col-md-12">
                                                                    <div class="checkbox-fade fade-in-primary">
                                                                        <label>
                                                                            <input type="checkbox" value="">
                                                                                <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                                                                <span class="text-inverse">I read and accept <a href="#">Terms &amp; Conditions.</a></span>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="checkbox-fade fade-in-primary">
                                                                        <label>
                                                                            <input type="checkbox" value="">
                                                                                <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                                                                <span class="text-inverse">Send me the <a href="#!">Newsletter</a> weekly.</span>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row m-t-30">
                                                                <div class="col-md-12">
                                                                    <button type="button" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">Sign up now</button>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                                <div class="row">
                                                                    <div class="col-md-10">
                                                                        <p class="text-inverse text-left m-b-0">Thank you.</p>
                                                                        <p class="text-inverse text-left"><a href="index-1.htm"><b class="f-w-600">Back to website</b></a></p>
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <img src="..\files\assets\images\auth\Logo-small-bottom.png" alt="small-logo.png">
                                                                    </div>
                                                                </div>
                                                        </div>
                                                    </div>
                                                </form>-->
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

        <script src="<%=context%>\files\bower_components\jquery.cookie\js\jquery.cookie.js"></script>
        <script src="<%=context%>\files\bower_components\jquery.steps\js\jquery.steps.js"></script>
        <script src="<%=context%>\files\bower_components\jquery-validation\js\jquery.validate.js"></script>
        <!-- Validation js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\pages\form-validation\validate.js"></script>
        <!-- Custom js -->
        <script src="<%=context%>\files\assets\pages\forms-wizard-validation\form-wizard.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\datedropper\js\datedropper.min.js"></script>
        <script>
            $("#dropper-default").dateDropper({
                dropWidth: 200,
                dropPrimaryColor: "#1abc9c",
                dropBorder: "1px solid #1abc9c"
            });
        </script>
    </body>
</html>
