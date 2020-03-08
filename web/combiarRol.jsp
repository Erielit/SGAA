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
        <title>SGAA | Roles</title>
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
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\style.css">
        <!-- Sidebar -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\jquery.mCustomScrollbar.css">
        <!-- tables -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\datatables.net-bs4\css\dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\pages\data-table\css\buttons.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\datatables.net-responsive-bs4\css\responsive.bootstrap4.min.css">
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
                <!-- HEADER -->
                <jsp:include page="views/header.jsp"/>
                <!-- Sidebar inner chat end-->
                <div class="pcoded-main-container">
                        <div class="pcoded-content">
                            <div class="pcoded-inner-content">
                                <div class="main-body">
                                    <div class="page-wrapper">
                                        <!-- CONTENT -->
                                        <div class="page-body">
                                            <div class="row">
                                                <s:iterator value="#session.persona.usuario.roles" status="po"> 
                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                        <div class="card social-card bg-simple-c-blue">
                                                            <div class="card-block">
                                                                <div class="row align-items-center">
                                                                    <div class="col-auto">
                                                                        <i class="feather icon-instagram f-34 text-c-green social-icon"></i>
                                                                    </div>
                                                                    <div class="col">
                                                                        <h6 class="m-b-0"><s:property value="role"/></h6>
                                                                        <p class="m-b-0"><s:property value="descripcion"/></p>
                                                                        <br/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <a href="javascript:void(0)" onclick="cambiarRol(<s:property value="id_role"/>)" class="download-icon"><i class="feather icon-arrow-right"></i></a>
                                                        </div>
                                                    </div>
                                                </s:iterator>
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
        <script type="text/javascript" src="<%=context%>\files\bower_components\popper.js\js\popper.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\bootstrap\js\bootstrap.min.js"></script>
        <!--<script type="text/javascript" src="<%=context%>\files\assets\pages\dashboard\custom-dashboard.js"></script>-->
        <script src="<%=context%>\files\assets\js\jquery.mCustomScrollbar.concat.min.js"></script>
        <!-- Sidebar -->
        <script src="<%=context%>\files\assets\js\pcoded.min.js"></script>
        <script src="<%=context%>\files\assets\js\vartical-layout.min.js"></script>
        <script src="<%=context%>\files\assets\js\jquery.mCustomScrollbar.concat.min.js"></script>

        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery-slimscroll\js\jquery.slimscroll.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\js\script.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery-i18next\js\jquery-i18next.min.js"></script>
        <!-- Tables, data tables-->
        <script src="<%=context%>\files\assets\pages\data-table\js\data-table-custom.js"></script>
        <script src="<%=context%>\files\bower_components\datatables.net\js\jquery.dataTables.min.js"></script>
        <script src="<%=context%>\files\bower_components\datatables.net-buttons\js\dataTables.buttons.min.js"></script>
        <script src="<%=context%>\files\bower_components\datatables.net-bs4\js\dataTables.bootstrap4.min.js"></script>
        <script src="<%=context%>\files\bower_components\datatables.net-responsive\js\dataTables.responsive.min.js"></script>
        <!--<script src="<%=context%>\files\bower_components\datatables.net-responsive-bs4\js\responsive.bootstrap4.min.js"></script>-->
        <script>
                                                                function cambiarRol(id_role) {
                                                                    var form = document.createElement("form");
                                                                    form.action = "cambiar-rol";
                                                                    form.method = "post";
                                                                    var input = document.createElement("input");
                                                                    input.name = "id_rol";
                                                                    input.type = "number";
                                                                    input.value = id_role + "";
                                                                    form.appendChild(input);
                                                                    document.body.appendChild(form);
                                                                    console.log(input);
                                                                    form.submit();
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
