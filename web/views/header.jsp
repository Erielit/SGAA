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
                <s:if test="#session.rolActivo == 2">
                    <jsp:include page="./notificaciones.jsp"/>
                </s:if>
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
                                <a href="verPerfil">
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