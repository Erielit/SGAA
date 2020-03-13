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
                            <div class="pcoded-inner-content"  ng-controller="administrador">
                                <div class="main-body">
                                    <div class="page-wrapper">
                                        <div class="page-body">
                                            <div class="row">
                                                <!-- statustic-card start -->
                                                <div class="col-xl-3 col-md-6">
                                                    <div class="card bg-c-yellow text-white">
                                                        <div class="card-block">
                                                            <div class="row align-items-center">
                                                                <div class="col">
                                                                    <p class="m-b-5">New Customer</p>
                                                                    <h4 class="m-b-0">852</h4>
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
                                                                    <p class="m-b-5">Income</p>
                                                                    <h4 class="m-b-0">$5,852</h4>
                                                                </div>
                                                                <div class="col col-auto text-right">
                                                                    <i class="feather icon-credit-card f-50 text-c-green"></i>
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
                                                                    <p class="m-b-5">Ticket</p>
                                                                    <h4 class="m-b-0">42</h4>
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
                                                                    <p class="m-b-5">Orders</p>
                                                                    <h4 class="m-b-0">$5,242</h4>
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
                                                <div class="col-xl-8 col-md-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <div class="card-header-left ">
                                                                <h5>Monthly View</h5>
                                                                <span class="text-muted">For more details about usage, please refer <a href="https://www.amcharts.com/online-store/" target="_blank">amCharts</a> licences.</span>
                                                            </div>
                                                        </div>
                                                        <div class="card-block-big">
                                                            <div id="monthly-graph" style="height:250px"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-md-12">
                                                    <div class="card feed-card">
                                                        <div class="card-header">
                                                            <h5>Feeds</h5>
                                                        </div>
                                                        <div class="card-block">
                                                            <div class="row m-b-30">
                                                                <div class="col-auto p-r-0">
                                                                    <i class="feather icon-bell bg-simple-c-blue feed-icon"></i>
                                                                </div>
                                                                <div class="col">
                                                                    <h6 class="m-b-5">You have 3 pending tasks. <span class="text-muted f-right f-13">Just Now</span></h6>
                                                                </div>
                                                            </div>
                                                            <div class="row m-b-30">
                                                                <div class="col-auto p-r-0">
                                                                    <i class="feather icon-shopping-cart bg-simple-c-pink feed-icon"></i>
                                                                </div>
                                                                <div class="col">
                                                                    <h6 class="m-b-5">New order received <span class="text-muted f-right f-13">Just Now</span></h6>
                                                                </div>
                                                            </div>
                                                            <div class="row m-b-30">
                                                                <div class="col-auto p-r-0">
                                                                    <i class="feather icon-file-text bg-simple-c-green feed-icon"></i>
                                                                </div>
                                                                <div class="col">
                                                                    <h6 class="m-b-5">You have 3 pending tasks. <span class="text-muted f-right f-13">Just Now</span></h6>
                                                                </div>
                                                            </div>
                                                            <div class="row m-b-30">
                                                                <div class="col-auto p-r-0">
                                                                    <i class="feather icon-shopping-cart bg-simple-c-pink feed-icon"></i>
                                                                </div>
                                                                <div class="col">
                                                                    <h6 class="m-b-5">New order received <span class="text-muted f-right f-13">Just Now</span></h6>
                                                                </div>
                                                            </div>
                                                            <div class="row m-b-30">
                                                                <div class="col-auto p-r-0">
                                                                    <i class="feather icon-file-text bg-simple-c-green feed-icon"></i>
                                                                </div>
                                                                <div class="col">
                                                                    <h6 class="m-b-5">You have 3 pending tasks. <span class="text-muted f-right f-13">Just Now</span></h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- statustic-card start -->

                                                <!-- income start -->
                                                <div class="col-xl-4 col-md-6">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h5>Total Leads</h5>
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
                                                            <p class="text-c-green f-w-500"><i class="feather icon-chevrons-up m-r-5"></i> 18% High than last month</p>
                                                            <div class="row">
                                                                <div class="col-4 b-r-default">
                                                                    <p class="text-muted m-b-5">Overall</p>
                                                                    <h5>76.12%</h5>
                                                                </div>
                                                                <div class="col-4 b-r-default">
                                                                    <p class="text-muted m-b-5">Monthly</p>
                                                                    <h5>16.40%</h5>
                                                                </div>
                                                                <div class="col-4">
                                                                    <p class="text-muted m-b-5">Day</p>
                                                                    <h5>4.56%</h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <canvas id="tot-lead" height="150"></canvas>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-md-6">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h5>Total Vendors</h5>
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
                                                            <p class="text-c-pink f-w-500"><i class="feather icon-chevrons-down m-r-15"></i> 24% High than last month</p>
                                                            <div class="row">
                                                                <div class="col-4 b-r-default">
                                                                    <p class="text-muted m-b-5">Overall</p>
                                                                    <h5>68.52%</h5>
                                                                </div>
                                                                <div class="col-4 b-r-default">
                                                                    <p class="text-muted m-b-5">Monthly</p>
                                                                    <h5>28.90%</h5>
                                                                </div>
                                                                <div class="col-4">
                                                                    <p class="text-muted m-b-5">Day</p>
                                                                    <h5>13.50%</h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <canvas id="tot-vendor" height="150"></canvas>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-md-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h5>Invoice Generate</h5>
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
                                                            <p class="text-c-green f-w-500"><i class="feather icon-chevrons-up m-r-15"></i> 20% High than last month</p>
                                                            <div class="row">
                                                                <div class="col-4 b-r-default">
                                                                    <p class="text-muted m-b-5">Overall</p>
                                                                    <h5>68.52%</h5>
                                                                </div>
                                                                <div class="col-4 b-r-default">
                                                                    <p class="text-muted m-b-5">Monthly</p>
                                                                    <h5>28.90%</h5>
                                                                </div>
                                                                <div class="col-4">
                                                                    <p class="text-muted m-b-5">Day</p>
                                                                    <h5>13.50%</h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <canvas id="invoice-gen" height="150"></canvas>
                                                    </div>
                                                </div>
                                                <!-- income end -->

                                                <!-- ticket and update start -->
                                                <div class="col-xl-6 col-md-12">
                                                    <div class="card table-card">
                                                        <div class="card-header">
                                                            <h5>Recent Tickets</h5>
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
                                                            <div class="table-responsive">
                                                                <table class="table table-hover table-borderless">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Status</th>
                                                                            <th>Subject</th>
                                                                            <th>Department</th>
                                                                            <th>Date</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td><label class="label label-success">open</label></td>
                                                                            <td>Website down for one week</td>
                                                                            <td>Support</td>
                                                                            <td>Today 2:00</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="label label-primary">progress</label></td>
                                                                            <td>Loosing control on server</td>
                                                                            <td>Support</td>
                                                                            <td>Yesterday</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="label label-danger">closed</label></td>
                                                                            <td>Authorizations keys</td>
                                                                            <td>Support</td>
                                                                            <td>27, Aug</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="label label-success">open</label></td>
                                                                            <td>Restoring default settings</td>
                                                                            <td>Support</td>
                                                                            <td>Today 9:00</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="label label-primary">progress</label></td>
                                                                            <td>Loosing control on server</td>
                                                                            <td>Support</td>
                                                                            <td>Yesterday</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="label label-success">open</label></td>
                                                                            <td>Restoring default settings</td>
                                                                            <td>Support</td>
                                                                            <td>Today 9:00</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="label label-danger">closed</label></td>
                                                                            <td>Authorizations keys</td>
                                                                            <td>Support</td>
                                                                            <td>27, Aug</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="label label-success">open</label></td>
                                                                            <td>Restoring default settings</td>
                                                                            <td>Support</td>
                                                                            <td>Today 9:00</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="label label-primary">progress</label></td>
                                                                            <td>Loosing control on server</td>
                                                                            <td>Support</td>
                                                                            <td>Yesterday</td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                                <div class="text-right m-r-20">
                                                                    <a href="#!" class=" b-b-primary text-primary">View all Projects</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
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
                                                                <div class="row p-t-20 p-b-30">
                                                                    <div class="col-auto text-right update-meta">
                                                                        <p class="text-muted m-b-0 d-inline">2 hrs ago</p>
                                                                        <i class="feather icon-twitter bg-info update-icon"></i>
                                                                    </div>
                                                                    <div class="col">
                                                                        <h6>+ 1652 Followers</h6>
                                                                        <p class="text-muted m-b-0">You’re getting more and more followers, keep it up!</p>
                                                                    </div>
                                                                </div>
                                                                <div class="row p-b-30">
                                                                    <div class="col-auto text-right update-meta">
                                                                        <p class="text-muted m-b-0 d-inline">4 hrs ago</p>
                                                                        <i class="feather icon-briefcase bg-simple-c-pink update-icon"></i>
                                                                    </div>
                                                                    <div class="col">
                                                                        <h6>+ 5 New Products were added!</h6>
                                                                        <p class="text-muted m-b-0">Congratulations!</p>
                                                                    </div>
                                                                </div>
                                                                <div class="row p-b-30">
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
                                                                        <h6>+2 Friend Requests</h6>
                                                                        <p class="text-muted m-b-10">This is great, keep it up!</p>
                                                                        <div class="table-responsive">
                                                                            <table class="table table-hover">
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
                                                                                <tr>
                                                                                    <td class="b-none">
                                                                                        <a href="#!" class="align-middle">
                                                                                            <img src="<%=context%>\files\assets\images\avatar-1.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                                                            <div class="d-inline-block">
                                                                                                <h6>John Deo</h6>
                                                                                                <p class="text-muted m-b-0">Web Designer</p>
                                                                                            </div>
                                                                                        </a>
                                                                                    </td>
                                                                                </tr>
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
                                                <!-- ticket and update end -->

                                                <!-- latest activity end -->
                                                <div class="col-xl-8 col-md-12">
                                                    <div class="card latest-activity-card">
                                                        <div class="card-header">
                                                            <h5>Latest Activity</h5>
                                                        </div>
                                                        <div class="card-block">
                                                            <div class="latest-update-box">
                                                                <div class="row p-t-20 p-b-30">
                                                                    <div class="col-auto text-right update-meta">
                                                                        <p class="text-muted m-b-0 d-inline">just now</p>
                                                                        <i class="feather icon-sunrise bg-simple-c-blue update-icon"></i>
                                                                    </div>
                                                                    <div class="col">
                                                                        <h6>John Deo</h6>
                                                                        <p class="text-muted m-b-15">The trip was an amazing and a life changing experience!!</p>
                                                                        <img src="<%=context%>\files\assets\images\mega-menu\01.jpg" alt="" class="img-fluid img-100 m-r-15 m-b-10">
                                                                        <img src="<%=context%>\files\assets\images\mega-menu\03.jpg" alt="" class="img-fluid img-100 m-r-15 m-b-10">
                                                                    </div>
                                                                </div>
                                                                <div class="row p-b-30">
                                                                    <div class="col-auto text-right update-meta">
                                                                        <p class="text-muted m-b-0 d-inline">5 min ago</p>
                                                                        <i class="feather icon-file-text bg-simple-c-blue update-icon"></i>
                                                                    </div>
                                                                    <div class="col">
                                                                        <h6>Administrator</h6>
                                                                        <p class="text-muted m-b-0">Free courses for all our customers at A1 Conference Room - 9:00 am tomorrow!</p>
                                                                    </div>
                                                                </div>
                                                                <div class="row p-b-30">
                                                                    <div class="col-auto text-right update-meta">
                                                                        <p class="text-muted m-b-0 d-inline">3 hours ago</p>
                                                                        <i class="feather icon-map-pin bg-simple-c-blue update-icon"></i>
                                                                    </div>
                                                                    <div class="col">
                                                                        <h6>Jeny William</h6>
                                                                        <p class="text-muted m-b-15">Happy Hour! Free drinks at <span class="text-c-blue">Cafe-Bar all </span>day long!</p>
                                                                        <div id="markers-map" style="height:200px;width:100%"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="text-right">
                                                                <a href="#!" class=" b-b-primary text-primary">View all Activity</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-md-12">
                                                    <div class="card per-task-card">
                                                        <div class="card-header">
                                                            <h5>Your Tasks</h5>
                                                        </div>
                                                        <div class="card-block">
                                                            <div class="row per-task-block text-center">
                                                                <div class="col-6">
                                                                    <div data-label="45%" class="radial-bar radial-bar-45 radial-bar-lg radial-bar-primary"></div>
                                                                    <h6 class="text-muted">Finished</h6>
                                                                    <p class="text-muted">642</p>
                                                                    <button class="btn btn-primary btn-round btn-sm">Manage</button>
                                                                </div>
                                                                <div class="col-6">
                                                                    <div data-label="30%" class="radial-bar radial-bar-30 radial-bar-lg radial-bar-primary"></div>
                                                                    <h6 class="text-muted">Remaining</h6>
                                                                    <p class="text-muted">495</p>
                                                                    <button class="btn btn-primary btn-outline-primary btn-round btn-sm">Manage</button>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="card feed-card">
                                                        <div class="card-header">
                                                            <h5>Upcoming Deadlines</h5>
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
                                                            <div class="row m-b-25">
                                                                <div class="col-auto p-r-0">
                                                                    <img src="<%=context%>\files\assets\images\mega-menu\01.jpg" alt="" class="img-fluid img-50">
                                                                </div>
                                                                <div class="col">
                                                                    <h6 class="m-b-5">New able - Redesign</h6>
                                                                    <p class="text-c-pink m-b-0">2 Days Remaining</p>
                                                                </div>
                                                            </div>
                                                            <div class="row m-b-25">
                                                                <div class="col-auto p-r-0">
                                                                    <img src="<%=context%>\files\assets\images\mega-menu\02.jpg" alt="" class="img-fluid img-50">
                                                                </div>
                                                                <div class="col">
                                                                    <h6 class="m-b-5">New Admin Dashboard</h6>
                                                                    <p class="text-c-pink m-b-0">Proposal in 6 Days</p>
                                                                </div>
                                                            </div>
                                                            <div class="row m-b-25">
                                                                <div class="col-auto p-r-0">
                                                                    <img src="<%=context%>\files\assets\images\mega-menu\03.jpg" alt="" class="img-fluid img-50">
                                                                </div>
                                                                <div class="col">
                                                                    <h6 class="m-b-5">Logo Design</h6>
                                                                    <p class="text-c-green m-b-0">10 Days Remaining</p>
                                                                </div>
                                                            </div>

                                                            <div class="text-center">
                                                                <a href="#!" class="b-b-primary text-primary">View all Feeds</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <!-- latest activity end -->
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
    <!-- Google map js -->
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
    <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=true"></script>
    <script type="text/javascript" src="<%=context%>\files\assets\pages\google-maps\gmaps.js"></script>
    <!-- gauge js -->
    <script src="<%=context%>\files\assets\pages\widget\gauge\gauge.min.js"></script>
    <script src="<%=context%>\files\assets\pages\widget\amchart\amcharts.js"></script>
    <script src="<%=context%>\files\assets\pages\widget\amchart\serial.js"></script>
    <script src="<%=context%>\files\assets\pages\widget\amchart\gauge.js"></script>
    <script src="<%=context%>\files\assets\pages\widget\amchart\pie.js"></script>
    <script src="<%=context%>\files\assets\pages\widget\amchart\light.js"></script>
    <script>

                                $(document).ready(function () {
                                    console.log('mensaje');
                                    var mensaje = '<s:property value="respuesta.mensaje" />' + "";
                                    var Toast = Swal.mixin({
                                        toast: true,
                                        position: 'top-end',
                                        showConfirmButton: false,
                                        timer: 3000,
                                        timerProgressBar: true,
                                        onOpen: function (toast) {
                                            toast.addEventListener('mouseenter', Swal.stopTimer);
                                            toast.addEventListener('mouseleave', Swal.resumeTimer);
                                        }
                                    });
                                    if (mensaje === "1") {
                                        Toast.fire({
                                            icon: 'success',
                                            title: 'Acción realizada correctamente.'
                                        });
                                    } else if (mensaje === "2") {
                                        Toast.fire({
                                            icon: 'error',
                                            title: 'Ha ocurrido un error, inténtelo nuevamente.'
                                        });
                                    }

                                    $("#simpletable").DataTable({
                                        "language": {
                                            "sProcessing": "Procesando<%=context%>.",
                                            "sLengthMenu": "Mostrar _MENU_ registros",
                                            "sZeroRecords": "No se encontraron resultados",
                                            "sEmptyTable": "Ningún dato disponible en esta tabla",
                                            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                                            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                                            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                                            "sInfoPostFix": "",
                                            "sSearch": "Buscar:",
                                            "sUrl": "",
                                            "sInfoThousands": ",",
                                            "sLoadingRecords": "Cargando<%=context%>.",
                                            "oPaginate": {
                                                "sFirst": "Primero",
                                                "sLast": "Último",
                                                "sNext": "Siguiente",
                                                "sPrevious": "Anterior"
                                            },
                                            "oAria": {
                                                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                                                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                                            }
                                        }
                                    });
                                });
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
