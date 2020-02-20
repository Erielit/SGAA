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
        <title>Bienvenido | Inicio Administrador</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600"/>
        <link rel="stylesheet" href="<%=context%>/files/bower_components/bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="<%=context%>/files/assets/icon/feather/css/feather.css"/>
        <link rel="stylesheet" href="<%=context%>/files/assets/css/style.css"/>
        <link rel="stylesheet" href="<%=context%>/files/assets/css/jquery.mCustomScrollbar.css"/>
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
                            <a href="index.jsp">
                                <h2>SGAA</h2>
                                <!--<img class="img-fluid" src="<%=context%>\files\assets\images\logo.png" alt="Theme-Logo">-->
                            </a>
                            <a class="mobile-options">
                                <i class="feather icon-more-horizontal"></i>
                            </a>
                        </div>
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
                                                <img class="d-flex align-self-center img-radius" src="..\files\assets\images\avatar-4.jpg" alt="Generic placeholder image">
                                                <div class="media-body">
                                                    <h5 class="notification-user">John Doe</h5>
                                                    <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                    <span class="notification-time">30 minutes ago</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="media">
                                                <img class="d-flex align-self-center img-radius" src="..\files\assets\images\avatar-3.jpg" alt="Generic placeholder image">
                                                <div class="media-body">
                                                    <h5 class="notification-user">Joseph William</h5>
                                                    <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                    <span class="notification-time">30 minutes ago</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="media">
                                                <img class="d-flex align-self-center img-radius" src="..\files\assets\images\avatar-4.jpg" alt="Generic placeholder image">
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
                            <li class="header-notification">
                                <div class="dropdown-primary dropdown">
                                    <div class="displayChatbox dropdown-toggle" data-toggle="dropdown">
                                        <i class="feather icon-message-square"></i>
                                        <span class="badge bg-c-green">3</span>
                                    </div>
                                </div>
                            </li>
                            <li class="user-profile header-notification">
                                <div class="dropdown-primary dropdown">
                                    <div class="dropdown-toggle" data-toggle="dropdown">
                                        <img src="..\files\assets\images\avatar-4.jpg" class="img-radius" alt="User-Profile-Image">
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
                                            <a href="auth-normal-sign-in.htm">
                                                <i class="feather icon-log-out"></i> Logout
                                            </a>
                                        </li>
                                    </ul>

                                </div>
                            </li>
                        </ul>
                        <div class="navbar-container container-fluid">
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
                                                    <img class="d-flex align-self-center img-radius" src="..\files\assets\images\avatar-4.jpg" alt="Generic placeholder image">
                                                    <div class="media-body">
                                                        <h5 class="notification-user">John Doe</h5>
                                                        <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                        <span class="notification-time">30 minutes ago</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="media">
                                                    <img class="d-flex align-self-center img-radius" src="..\files\assets\images\avatar-3.jpg" alt="Generic placeholder image">
                                                    <div class="media-body">
                                                        <h5 class="notification-user">Joseph William</h5>
                                                        <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                        <span class="notification-time">30 minutes ago</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="media">
                                                    <img class="d-flex align-self-center img-radius" src="..\files\assets\images\avatar-4.jpg" alt="Generic placeholder image">
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
                                <li class="header-notification">
                                    <div class="dropdown-primary dropdown">
                                        <div class="displayChatbox dropdown-toggle" data-toggle="dropdown">
                                            <i class="feather icon-message-square"></i>
                                            <span class="badge bg-c-green">3</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="user-profile header-notification">
                                    <div class="dropdown-primary dropdown">
                                        <div class="dropdown-toggle" data-toggle="dropdown">
                                            <img src="..\files\assets\images\avatar-4.jpg" class="img-radius" alt="User-Profile-Image">
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
                                                <a href="auth-normal-sign-in.htm">
                                                    <i class="feather icon-log-out"></i> Logout
                                                </a>
                                            </li>
                                        </ul>

                                    </div>
                                </li>
                            </ul>
                            <ul class="nav-right">
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
                                                <a href="auth-normal-sign-in.htm">
                                                    <i class="feather icon-log-out"></i> Logout
                                                </a>
                                            </li>
                                        </ul>

                                    </div>
                                </li>
                            </ul>

                        </div>
                    </div>
                </nav>

                <div class="pcoded-main-container">
                    <div class="pcoded-wrapper">
                        <%--<s:include value="/views/menu.jsp"/>--%>
                        <nav class="pcoded-navbar">
                            <div class="pcoded-inner-navbar main-menu">
                                <div class="pcoded-navigatio-lavel">Navigation</div>
                                <ul class="pcoded-item pcoded-left-item">
                                    <li class="active pcoded-trigger">
                                        <a href="<%=context%>/index.jsp">
                                            <span class="pcoded-micon"><i class="feather icon-home"></i></span>
                                            <span class="pcoded-mtext">Dashboard</span>
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
                                            <div class="row">
                                                <!-- task, page, download counter  start -->
                                                <div class="col-xl-3 col-md-6">
                                                    <div class="card bg-c-yellow update-card">
                                                        <div class="card-block">
                                                            <div class="row align-items-end">
                                                                <div class="col-8">
                                                                    <h4 class="text-white">$30200</h4>
                                                                    <h6 class="text-white m-b-0">All Earnings</h6>
                                                                </div>
                                                                <div class="col-4 text-right">
                                                                    <canvas id="update-chart-1" height="50"></canvas>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-footer">
                                                            <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update : 2:15 am</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 col-md-6">
                                                    <div class="card bg-c-green update-card">
                                                        <div class="card-block">
                                                            <div class="row align-items-end">
                                                                <div class="col-8">
                                                                    <h4 class="text-white">290+</h4>
                                                                    <h6 class="text-white m-b-0">Page Views</h6>
                                                                </div>
                                                                <div class="col-4 text-right">
                                                                    <canvas id="update-chart-2" height="50"></canvas>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-footer">
                                                            <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update : 2:15 am</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 col-md-6">
                                                    <div class="card bg-c-pink update-card">
                                                        <div class="card-block">
                                                            <div class="row align-items-end">
                                                                <div class="col-8">
                                                                    <h4 class="text-white">145</h4>
                                                                    <h6 class="text-white m-b-0">Task Completed</h6>
                                                                </div>
                                                                <div class="col-4 text-right">
                                                                    <canvas id="update-chart-3" height="50"></canvas>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-footer">
                                                            <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update : 2:15 am</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 col-md-6">
                                                    <div class="card bg-c-lite-green update-card">
                                                        <div class="card-block">
                                                            <div class="row align-items-end">
                                                                <div class="col-8">
                                                                    <h4 class="text-white">500</h4>
                                                                    <h6 class="text-white m-b-0">Downloads</h6>
                                                                </div>
                                                                <div class="col-4 text-right">
                                                                    <canvas id="update-chart-4" height="50"></canvas>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-footer">
                                                            <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update : 2:15 am</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- task, page, download counter  end -->

                                                <!--  sale analytics start -->
                                                <div class="col-xl-9 col-md-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h5>Sales Analytics</h5>
                                                            <span class="text-muted">For more details about usage, please refer <a href="https://www.amcharts.com/online-store/" target="_blank">amCharts</a> licences.</span>
                                                            <div class="card-header-right">
                                                                <ul class="list-unstyled card-option">
                                                                    <li><i class="feather icon-maximize full-card"></i></li>
                                                                    <li><i class="feather icon-minus minimize-card"></i></li>
                                                                    <li><i class="feather icon-trash-2 close-card"></i></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="card-block">
                                                            <div id="sales-analytics" style="height: 265px;"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 col-md-12">
                                                    <div class="card user-card2">
                                                        <div class="card-block text-center">
                                                            <h6 class="m-b-15">Project Risk</h6>
                                                            <div class="risk-rate">
                                                                <span><b>5</b></span>
                                                            </div>
                                                            <h6 class="m-b-10 m-t-10">Balanced</h6>
                                                            <a href="#!" class="text-c-yellow b-b-warning">Change Your Risk</a>
                                                            <div class="row justify-content-center m-t-10 b-t-default m-l-0 m-r-0">
                                                                <div class="col m-t-15 b-r-default">
                                                                    <h6 class="text-muted">Nr</h6>
                                                                    <h6>AWS 2455</h6>
                                                                </div>
                                                                <div class="col m-t-15">
                                                                    <h6 class="text-muted">Created</h6>
                                                                    <h6>30th Sep</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button class="btn btn-warning btn-block p-t-15 p-b-15">Download Overall Report</button>
                                                    </div>
                                                </div>
                                                <!--  sale analytics end -->

                                                <div class="col-xl-8 col-md-12">
                                                    <div class="card table-card">
                                                        <div class="card-header">
                                                            <h5>Application Sales</h5>
                                                            <div class="card-header-right">
                                                                <ul class="list-unstyled card-option">
                                                                    <li><i class="feather icon-maximize full-card"></i></li>
                                                                    <li><i class="feather icon-minus minimize-card"></i></li>
                                                                    <li><i class="feather icon-trash-2 close-card"></i></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="card-block">
                                                            <div class="table-responsive">
                                                                <table class="table table-hover  table-borderless">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>
                                                                    <div class="chk-option">
                                                                        <div class="checkbox-fade fade-in-primary">
                                                                            <label class="check-task">
                                                                                <input type="checkbox" value="">
                                                                                <span class="cr">
                                                                                    <i class="cr-icon feather icon-check txt-default"></i>
                                                                                </span>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    Application</th>
                                                                    <th>Sales</th>
                                                                    <th>Change</th>
                                                                    <th>Avg Price</th>
                                                                    <th>Total</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="chk-option">
                                                                                    <div class="checkbox-fade fade-in-primary">
                                                                                        <label class="check-task">
                                                                                            <input type="checkbox" value="">
                                                                                            <span class="cr">
                                                                                                <i class="cr-icon feather icon-check txt-default"></i>
                                                                                            </span>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-inline-block align-middle">
                                                                                    <h6>Able Pro</h6>
                                                                                    <p class="text-muted m-b-0">Powerful Admin Theme</p>
                                                                                </div>
                                                                            </td>
                                                                            <td>16,300</td>
                                                                            <td><canvas id="app-sale1" height="50" width="100"></canvas></td>
                                                                            <td>$53</td>
                                                                            <td class="text-c-blue">$15,652</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="chk-option">
                                                                                    <div class="checkbox-fade fade-in-primary">
                                                                                        <label class="check-task">
                                                                                            <input type="checkbox" value="">
                                                                                            <span class="cr">
                                                                                                <i class="cr-icon feather icon-check txt-default"></i>
                                                                                            </span>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-inline-block align-middle">
                                                                                    <h6>Photoshop</h6>
                                                                                    <p class="text-muted m-b-0">Design Software</p>
                                                                                </div>
                                                                            </td>
                                                                            <td>26,421</td>
                                                                            <td><canvas id="app-sale2" height="50" width="100"></canvas></td>
                                                                            <td>$35</td>
                                                                            <td class="text-c-blue">$18,785</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="chk-option">
                                                                                    <div class="checkbox-fade fade-in-primary">
                                                                                        <label class="check-task">
                                                                                            <input type="checkbox" value="">
                                                                                            <span class="cr">
                                                                                                <i class="cr-icon feather icon-check txt-default"></i>
                                                                                            </span>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-inline-block align-middle">
                                                                                    <h6>Guruable</h6>
                                                                                    <p class="text-muted m-b-0">Best Admin Template</p>
                                                                                </div>
                                                                            </td>
                                                                            <td>8,265</td>
                                                                            <td><canvas id="app-sale3" height="50" width="100"></canvas></td>
                                                                            <td>$98</td>
                                                                            <td class="text-c-blue">$9,652</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="chk-option">
                                                                                    <div class="checkbox-fade fade-in-primary">
                                                                                        <label class="check-task">
                                                                                            <input type="checkbox" value="">
                                                                                            <span class="cr">
                                                                                                <i class="cr-icon feather icon-check txt-default"></i>
                                                                                            </span>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-inline-block align-middle">
                                                                                    <h6>Flatable</h6>
                                                                                    <p class="text-muted m-b-0">Admin App</p>
                                                                                </div>
                                                                            </td>
                                                                            <td>10,652</td>
                                                                            <td><canvas id="app-sale4" height="50" width="100"></canvas></td>
                                                                            <td>$20</td>
                                                                            <td class="text-c-blue">$7,856</td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                                <div class="text-center">
                                                                    <a href="#!" class=" b-b-primary text-primary">View all Projects</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-md-12">
                                                    <div class="card user-activity-card">
                                                        <div class="card-header">
                                                            <h5>User Activity</h5>
                                                        </div>
                                                        <div class="card-block">
                                                            <div class="row m-b-25">
                                                                <div class="col-auto p-r-0">
                                                                    <div class="u-img">
                                                                        <img src="<%=context%>\files\assets\images\breadcrumb-bg.jpg" alt="user image" class="img-radius cover-img">
                                                                        <img src="<%=context%>\files\assets\images\avatar-2.jpg" alt="user image" class="img-radius profile-img">
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <h6 class="m-b-5">John Deo</h6>
                                                                    <p class="text-muted m-b-0">Lorem Ipsum is simply dummy text.</p>
                                                                    <p class="text-muted m-b-0"><i class="feather icon-clock m-r-10"></i>2 min ago</p>
                                                                </div>
                                                            </div>
                                                            <div class="row m-b-25">
                                                                <div class="col-auto p-r-0">
                                                                    <div class="u-img">
                                                                        <img src="<%=context%>\files\assets\images\breadcrumb-bg.jpg" alt="user image" class="img-radius cover-img">
                                                                        <img src="<%=context%>\files\assets\images\avatar-2.jpg" alt="user image" class="img-radius profile-img">
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <h6 class="m-b-5">John Deo</h6>
                                                                    <p class="text-muted m-b-0">Lorem Ipsum is simply dummy text.</p>
                                                                    <p class="text-muted m-b-0"><i class="feather icon-clock m-r-10"></i>2 min ago</p>
                                                                </div>
                                                            </div>
                                                            <div class="row m-b-25">
                                                                <div class="col-auto p-r-0">
                                                                    <div class="u-img">
                                                                        <img src="<%=context%>\files\assets\images\breadcrumb-bg.jpg" alt="user image" class="img-radius cover-img">
                                                                        <img src="<%=context%>\files\assets\images\avatar-2.jpg" alt="user image" class="img-radius profile-img">
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <h6 class="m-b-5">John Deo</h6>
                                                                    <p class="text-muted m-b-0">Lorem Ipsum is simply dummy text.</p>
                                                                    <p class="text-muted m-b-0"><i class="feather icon-clock m-r-10"></i>2 min ago</p>
                                                                </div>
                                                            </div>
                                                            <div class="row m-b-5">
                                                                <div class="col-auto p-r-0">
                                                                    <div class="u-img">
                                                                        <img src="<%=context%>\files\assets\images\breadcrumb-bg.jpg" alt="user image" class="img-radius cover-img">
                                                                        <img src="<%=context%>\files\assets\images\avatar-2.jpg" alt="user image" class="img-radius profile-img">
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <h6 class="m-b-5">John Deo</h6>
                                                                    <p class="text-muted m-b-0">Lorem Ipsum is simply dummy text.</p>
                                                                    <p class="text-muted m-b-0"><i class="feather icon-clock m-r-10"></i>2 min ago</p>
                                                                </div>
                                                            </div>

                                                            <div class="text-center">
                                                                <a href="#!" class="b-b-primary text-primary">View all Projects</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- wather user -->
                                                <div class="col-xl-6 col-md-12">
                                                    <div class="card latest-update-card">
                                                        <div class="card-header">
                                                            <h5>Latest Updates</h5>
                                                            <div class="card-header-right">
                                                                <ul class="list-unstyled card-option">
                                                                    <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                    <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                    <li><i class="fa fa-minus minimize-card"></i></li>
                                                                    <li><i class="fa fa-refresh reload-card"></i></li>
                                                                    <li><i class="fa fa-trash close-card"></i></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="card-block">
                                                            <div class="latest-update-box">
                                                                <div class="row p-b-15">
                                                                    <div class="col-auto text-right update-meta">
                                                                        <p class="text-muted m-b-0 d-inline">4 hrs ago</p>
                                                                        <i class="feather icon-briefcase bg-simple-c-pink update-icon"></i>
                                                                    </div>
                                                                    <div class="col">
                                                                        <h6>+ 5 New Products were added!</h6>
                                                                        <p class="text-muted m-b-0">Congratulations!</p>
                                                                    </div>
                                                                </div>
                                                                <div class="row p-b-15">
                                                                    <div class="col-auto text-right update-meta">
                                                                        <p class="text-muted m-b-0 d-inline">1 day ago</p>
                                                                        <i class="feather icon-check bg-simple-c-yellow  update-icon"></i>
                                                                    </div>
                                                                    <div class="col">
                                                                        <h6>Database backup completed!</h6>
                                                                        <p class="text-muted m-b-0">Download the <span class="text-c-blue">latest backup</span>.</p>
                                                                    </div>
                                                                </div>
                                                                <div class="row p-b-0">
                                                                    <div class="col-auto text-right update-meta">
                                                                        <p class="text-muted m-b-0 d-inline">2 day ago</p>
                                                                        <i class="feather icon-facebook bg-simple-c-green update-icon"></i>
                                                                    </div>
                                                                    <div class="col">
                                                                        <h6>+1 Friend Requests</h6>
                                                                        <p class="text-muted m-b-10">This is great, keep it up!</p>
                                                                        <div class="table-responsive">
                                                                            <table class="table table-hover m-b-0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td class="b-none">
                                                                                            <a href="#!" class="align-middle">
                                                                                                <img src="<%=context%>\files\assets\images\avatar-2.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                                                                <div class="d-inline-block">
                                                                                                    <h6>Jeny William</h6>
                                                                                                    <p class="text-muted m-b-0">Graphic Designer</p>
                                                                                                </div>
                                                                                            </a>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="text-center">
                                                                <a href="#!" class="b-b-primary text-primary">View all Projects</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-xl-6 col-md-12">
                                                    <div class="card user-card-full">
                                                        <div class="row m-l-0 m-r-0">
                                                            <div class="col-sm-4 bg-c-lite-green user-profile">
                                                                <div class="card-block text-center text-white">
                                                                    <div class="m-b-25">
                                                                        <img src="<%=context%>\files\assets\images\avatar-4.jpg" class="img-radius" alt="User-Profile-Image">
                                                                    </div>
                                                                    <h6 class="f-w-600">Jeny William</h6>
                                                                    <p>Web Designer</p>
                                                                    <i class="feather icon-edit m-t-10 f-16"></i>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-8">
                                                                <div class="card-block">
                                                                    <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Information</h6>
                                                                    <div class="row">
                                                                        <div class="col-sm-6">
                                                                            <p class="m-b-10 f-w-600">Email</p>
                                                                            <h6 class="text-muted f-w-400"><a href="<%=context%>\<%=context%>\<%=context%>\cdn-cgi\l\email-protection.htm" class="__cf_email__" data-cfemail="3a505f54437a5d575b535614595557">[email&#160;protected]</a></h6>
                                                                        </div>
                                                                        <div class="col-sm-6">
                                                                            <p class="m-b-10 f-w-600">Phone</p>
                                                                            <h6 class="text-muted f-w-400">0023-333-526136</h6>
                                                                        </div>
                                                                    </div>
                                                                    <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600">Projects</h6>
                                                                    <div class="row">
                                                                        <div class="col-sm-6">
                                                                            <p class="m-b-10 f-w-600">Recent</p>
                                                                            <h6 class="text-muted f-w-400">Guruable Admin</h6>
                                                                        </div>
                                                                        <div class="col-sm-6">
                                                                            <p class="m-b-10 f-w-600">Most Viewed</p>
                                                                            <h6 class="text-muted f-w-400">Able Pro Admin</h6>
                                                                        </div>
                                                                    </div>
                                                                    <ul class="social-link list-unstyled m-t-40 m-b-10">
                                                                        <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="facebook"><i class="feather icon-facebook facebook" aria-hidden="true"></i></a></li>
                                                                        <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="twitter"><i class="feather icon-twitter twitter" aria-hidden="true"></i></a></li>
                                                                        <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="instagram"><i class="feather icon-instagram instagram" aria-hidden="true"></i></a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- wather user -->

                                                <!-- social download  start -->
                                                <div class="col-xl-4 col-md-6">
                                                    <div class="card social-card bg-simple-c-blue">
                                                        <div class="card-block">
                                                            <div class="row align-items-center">
                                                                <div class="col-auto">
                                                                    <i class="feather icon-mail f-34 text-c-blue social-icon"></i>
                                                                </div>
                                                                <div class="col">
                                                                    <h6 class="m-b-0">Mail</h6>
                                                                    <p>231.2w downloads</p>
                                                                    <p class="m-b-0">Lorem Ipsum is simply dummy text of the printing</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <a href="#!" class="download-icon"><i class="feather icon-arrow-down"></i></a>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-md-6">
                                                    <div class="card social-card bg-simple-c-pink">
                                                        <div class="card-block">
                                                            <div class="row align-items-center">
                                                                <div class="col-auto">
                                                                    <i class="feather icon-twitter f-34 text-c-pink social-icon"></i>
                                                                </div>
                                                                <div class="col">
                                                                    <h6 class="m-b-0">twitter</h6>
                                                                    <p>231.2w downloads</p>
                                                                    <p class="m-b-0">Lorem Ipsum is simply dummy text of the printing</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <a href="#!" class="download-icon"><i class="feather icon-arrow-down"></i></a>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-md-12">
                                                    <div class="card social-card bg-simple-c-green">
                                                        <div class="card-block">
                                                            <div class="row align-items-center">
                                                                <div class="col-auto">
                                                                    <i class="feather icon-instagram f-34 text-c-green social-icon"></i>
                                                                </div>
                                                                <div class="col">
                                                                    <h6 class="m-b-0">Instagram</h6>
                                                                    <p>231.2w downloads</p>
                                                                    <p class="m-b-0">Lorem Ipsum is simply dummy text of the printing</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <a href="#!" class="download-icon"><i class="feather icon-arrow-down"></i></a>
                                                    </div>
                                                </div>
                                                <!-- social download  end -->

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
        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery-ui\js\jquery-ui.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\popper.js\js\popper.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\bower_components\bootstrap\js\bootstrap.min.js"></script>
        <!-- jquery slimscroll js -->
        <script type="text/javascript" src="<%=context%>\files\bower_components\jquery-slimscroll\js\jquery.slimscroll.js"></script>
        <!-- modernizr js -->
        <script type="text/javascript" src="<%=context%>\files\bower_components\modernizr\js\modernizr.js"></script>
        <!-- Chart js -->
        <script type="text/javascript" src="<%=context%>\files\bower_components\chart.js\js\Chart.js"></script>
        <!-- amchart js -->
        <script src="<%=context%>\files\assets\pages\widget\amchart\amcharts.js"></script>
        <script src="<%=context%>\files\assets\pages\widget\amchart\serial.js"></script>
        <script src="<%=context%>\files\assets\pages\widget\amchart\light.js"></script>
        <script src="<%=context%>\files\assets\js\jquery.mCustomScrollbar.concat.min.js"></script>
        <!--<script type="text/javascript" src="<%=context%>\files\assets\js\SmoothScroll.js"></script>-->
        <script src="<%=context%>\files\assets\js\pcoded.min.js"></script>
        <!-- custom js -->
        <script src="<%=context%>\files\assets\js\vartical-layout.min.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\pages\dashboard\custom-dashboard.js"></script>
        <script type="text/javascript" src="<%=context%>\files\assets\js\script.min.js"></script>
    </body>
</html>
