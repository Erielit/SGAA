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
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\pages\menu-search\css\component.css">
        <link rel="stylesheet" href="<%=context%>/files/assets/icon/feather/css/feather.css"/>
        <!-- Callendar -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\bower_components\fullcalendar\css\fullcalendar.css">
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\style.css">
        <!-- Sidebar -->
        <link rel="stylesheet" type="text/css" href="<%=context%>\files\assets\css\jquery.mCustomScrollbar.css">

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

                <nav class="navbar header-navbar pcoded-header">
                    <div class="navbar-wrapper">

                        <div class="navbar-logo">
                            <a class="mobile-menu" id="mobile-collapse" href="#!">
                                <i class="feather icon-menu"></i>
                            </a>
                            <a href="index-1.htm">
                                <img class="img-fluid" src="<%=context%>\files\assets\images\logo.png" alt="Theme-Logo">
                            </a>
                            <a class="mobile-options">
                                <i class="feather icon-more-horizontal"></i>
                            </a>
                        </div>

                        <div class="navbar-container container-fluid">
                            <ul class="nav-left">
                                <li class="header-search">
                                    <div class="main-search morphsearch-search">
                                        <div class="input-group">
                                            <span class="input-group-addon search-close"><i class="feather icon-x"></i></span>
                                            <input type="text" class="form-control">
                                            <span class="input-group-addon search-btn"><i class="feather icon-search"></i></span>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <a href="#!" onclick="javascript:toggleFullScreen()">
                                        <i class="feather icon-maximize full-screen"></i>
                                    </a>
                                </li>
                            </ul>
                            <ul class="nav-right">
                                <li class="header-notification">
                                    <div class="dropdown-primary dropdown">
                                        <div class="dropdown-toggle" data-toggle="dropdown">
                                            <i class="feather icon-bell"></i>
                                            <span class="badge bg-c-pink">5</span>
                                        </div>
                                        <ul class="show-notification notification-view dropdown-menu" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                                            <li>
                                                <h6>Notifications</h6>
                                                <label class="label label-danger">New</label>
                                            </li>
                                            <li>
                                                <div class="media">
                                                    <img class="d-flex align-self-center img-radius" src="<%=context%>\files\assets\images\avatar-4.jpg" alt="Generic placeholder image">
                                                    <div class="media-body">
                                                        <h5 class="notification-user">John Doe</h5>
                                                        <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                        <span class="notification-time">30 minutes ago</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="media">
                                                    <img class="d-flex align-self-center img-radius" src="<%=context%>\files\assets\images\avatar-3.jpg" alt="Generic placeholder image">
                                                    <div class="media-body">
                                                        <h5 class="notification-user">Joseph William</h5>
                                                        <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                        <span class="notification-time">30 minutes ago</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="media">
                                                    <img class="d-flex align-self-center img-radius" src="<%=context%>\files\assets\images\avatar-4.jpg" alt="Generic placeholder image">
                                                    <div class="media-body">
                                                        <h5 class="notification-user">Sara Soudein</h5>
                                                        <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                        <span class="notification-time">30 minutes ago</span>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="user-profile header-notification">
                                    <div class="dropdown-primary dropdown">
                                        <div class="dropdown-toggle" data-toggle="dropdown">
                                            <img src="<%=context%>\files\assets\images\avatar-4.jpg" class="img-radius" alt="User-Profile-Image">
                                            <span>John Doe</span>
                                            <i class="feather icon-chevron-down"></i>
                                        </div>
                                        <ul class="show-notification profile-notification dropdown-menu" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                                            <li>
                                                <a href="#!">
                                                    <i class="feather icon-settings"></i> Settings
                                                </a>
                                            </li>
                                            <li>
                                                <a href="user-profile.htm">
                                                    <i class="feather icon-user"></i> Profile
                                                </a>
                                            </li>
                                            <li>
                                                <a href="email-inbox.htm">
                                                    <i class="feather icon-mail"></i> My Messages
                                                </a>
                                            </li>
                                            <li>
                                                <a href="auth-lock-screen.htm">
                                                    <i class="feather icon-lock"></i> Lock Screen
                                                </a>
                                            </li>
                                            <li>
                                                <a href="cerrarSesion">
                                                    <i class="feather icon-log-out"></i> Cerrar sesión
                                                </a>
                                            </li>
                                        </ul>

                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Sidebar inner chat end-->
                <div class="pcoded-main-container">
                    <div class="pcoded-wrapper">
                        <nav class="pcoded-navbar">
                            <div class="pcoded-inner-navbar main-menu">
                                <div class="pcoded-navigatio-lavel">Other</div>
                                <ul class="pcoded-item pcoded-left-item">
                                    <li class="">
                                        <a href="javascript:void(0)" class="disabled">
                                            <span class="pcoded-micon"><i class="feather icon-power"></i></span>
                                            <span class="pcoded-mtext">Disabled Menu</span>
                                        </a>
                                    </li>
                                    <li class="active">
                                        <a href="asesorias">
                                            <span class="pcoded-micon"><i class="feather icon-watch"></i></span>
                                            <span class="pcoded-mtext">Agendar asesoría</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                        <div class="pcoded-content">
                            <div class="pcoded-inner-content">
                                <div class="main-body">
                                    <div class="page-wrapper">
                                        <div class="page-body">
                                            <div class="">
                                                <!-- Todo el contenido aquí-->
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5>Full Calender</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="feather icon-maximize full-card"></i></li>
                                                                <li><i class="feather icon-minus minimize-card"></i></li>
                                                                <li><i class="feather icon-trash-2 close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <div class="row">
                                                            <div class="col-xl-2 col-md-12">
                                                                <div id="external-events">
                                                                    <h6 class="m-b-30 m-t-20">Events</h6>
                                                                    <div class="fc-event ui-draggable ui-draggable-handle">My Event 1</div>
                                                                    <div class="fc-event ui-draggable ui-draggable-handle">My Event 2</div>
                                                                    <div class="fc-event ui-draggable ui-draggable-handle">My Event 3</div>
                                                                    <div class="fc-event ui-draggable ui-draggable-handle">My Event 4</div>
                                                                    <div class="fc-event ui-draggable ui-draggable-handle">My Event 5</div>
                                                                    <div class="checkbox-fade fade-in-primary m-t-10">
                                                                        <label>
                                                                            <input type="checkbox" value="">
                                                                            <span class="cr">
                                                                                <i class="cr-icon icofont icofont-ui-check txt-primary"></i>
                                                                            </span>
                                                                            <span>Remove After Drop</span>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-10 col-md-12">
                                                                <div id='calendar'></div>
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
    <!-- Callendar-->
    <script type="text/javascript" src="<%=context%>\files\assets\js\classie.js"></script>
    <script type="text/javascript" src="<%=context%>\files\bower_components\moment\js\moment.min.js"></script>
    <script type="text/javascript" src="<%=context%>\files\bower_components\fullcalendar\js\fullcalendar.js"></script>
    <script type="text/javascript" src="<%=context%>\files\assets\pages\full-calender\calendar.js"></script>
    <script type="text/javascript" src="<%=context%>\files\bower_components\i18next\js\i18next.min.js"></script>
    <script type="text/javascript" src="<%=context%>\files\bower_components\i18next-xhr-backend\js\i18nextXHRBackend.min.js"></script>
    <script type="text/javascript" src="<%=context%>\files\bower_components\i18next-browser-languagedetector\js\i18nextBrowserLanguageDetector.min.js"></script>
    <script type="text/javascript" src="<%=context%>\files\bower_components\jquery-i18next\js\jquery-i18next.min.js"></script>
   <!--<script src="<%=context%>\files\bower_components\datatables.net-responsive-bs4\js\responsive.bootstrap4.min.js"></script>-->
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
