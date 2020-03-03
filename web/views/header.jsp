<%
    String context = request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<nav class="navbar header-navbar pcoded-header" id="themee">
    <div class="navbar-wrapper">

        <div class="navbar-logo">
            <a class="mobile-menu" id="mobile-collapse" href="#!">
                <i class="feather icon-menu"></i>
            </a>
            <a href="index-1.htm">
                <img class="img-fluid" width="120" height="40" src="<%=context%>\images\logo_blanco_utez.png" alt="Theme-Logo">
            </a>
            <a class="mobile-options">
                <i class="feather icon-more-horizontal"></i>
            </a>
        </div>

        <div class="navbar-container container-fluid">
            <ul class="nav-right">
                <jsp:include page="./notificaciones.jsp"/>
                <li class="header-notification">
                    <div class="dropdown-primary dropdown">
                        <div class="dropdown-toggle" data-toggle="dropdown">
                            <i class="feather icon-bell"></i>
                            <span class="badge bg-c-pink"><s:property value="respuesta.noNotifications"/></span>
                        </div>
                        <ul class="show-notification notification-view dropdown-menu" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                            <li>
                                <h6>Notificaciones</h6>
                                <label class="label label-danger">Sin atender</label>
                            </li>
                            <s:iterator value="respuesta.notifications" status="po">
                                <li>
                                    <div class="media">
                                        <img class="d-flex align-self-center img-radius" src="<%=context%>/images/U_AZUL.png" alt="Generic placeholder image">
                                        <div class="media-body">
                                            <h5 class="notification-user"><s:property value="asunto"/></h5>
                                            <p class="notification-msg"><s:property value="mensaje"/></p>
                                            <span class="notification-time"><s:property value="fecha_registro"/></span>
                                        </div>
                                    </div>
                                </li>    
                            </s:iterator>

                        </ul>
                    </div>
                </li>
                <li class="user-profile header-notification">
                    <div class="dropdown-primary dropdown">
                        <div class="dropdown-toggle" data-toggle="dropdown">
                            <img src="<%=context%>\images\user-64.png" class="img-radius" alt="User-Profile-Image">
                            <span><s:property value="#session.persona.nombre + ' ' +#session.persona.primer_apellido + ' ' +#session.persona.segundo_apellido"/></span>
                            <i class="feather icon-chevron-down"></i>
                        </div>
                        <ul class="show-notification profile-notification dropdown-menu" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                            <s:if test="#session.persona.usuario.roles.size() > 1">
                                <li>
                                    <a href="vista-cambiar-rol">
                                        <i class="feather icon-settings"></i> Cambiar rol
                                    </a>
                                </li>
                            </s:if>

                            <li>
                                <a href="user-profile.htm">
                                    <i class="feather icon-user"></i> Perfil
                                </a>
                            </li>
                            <li>
                                <a href="cerrar-sesion">
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
<style>
    /*@media only screen and (min-width: 992px){.nav-right{display: block} }*/
</style>