<%-- 
    Document   : menu.jsp
    Created on : 16/01/2020, 10:25:01 PM
    Author     : netmo
--%>
<%
    String context = request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<nav class="pcoded-navbar">
    <div class="pcoded-inner-navbar main-menu">
        <s:if test="#session.rolActivo == 2">
            <div class="pcoded-navigatio-lavel">Asesorias</div>
            <ul class="pcoded-item pcoded-left-item">
                <li class="">
                    <a href="<%=context%>/asesorias">
                        <span class="pcoded-micon"><i class="feather icon-plus-square"></i></span>
                        <span class="pcoded-mtext">Agendar asesoria</span>
                    </a>
                </li>
                <li class="">
                    <a href="<%=context%>/historial-estudiante">
                        <span class="pcoded-micon"><i class="feather icon-book"></i></span>
                        <span class="pcoded-mtext">Historial asesorias</span>
                    </a>
                </li>
            </ul>
        </s:if>
        <s:if test="#session.rolActivo == 1">
            <div class="pcoded-navigatio-lavel"></div>
            <ul class="pcoded-item pcoded-left-item">
                <li class="">
                    <a href="list-horarios">
                        <span class="pcoded-micon"><i class="feather icon-calendar"></i></span>
                        <span class="pcoded-mtext">Horarios</span>
                    </a>
                </li>
                <li class="">
                    <a href="<%=context%>/inicioPeriodos">
                        <span class="pcoded-micon"><i class="feather icon-clock"></i></span>
                        <span class="pcoded-mtext">Periodos</span>
                    </a>
                </li>
            </ul>
        </s:if>
        <s:if test="#session.rolActivo == 3">
            <div class="pcoded-navigatio-lavel">Docente</div>   
            <ul class="pcoded-item pcoded-left-item">
                <li class="">
                    <a href="<%=context%>/inicioDocente">
                        <span class="pcoded-micon"><i class="feather icon-watch"></i></span>
                        <span class="pcoded-mtext">Solicitudes Pendientes</span>
                    </a>
                </li>
            </ul>  
            <ul class="pcoded-item pcoded-left-item">
                <li class="">
                    <a href="<%=context%>/asesoriasActivas">
                        <span class="pcoded-micon"><i class="feather icon-watch"></i></span>
                        <span class="pcoded-mtext">Asesorias Activas</span>
                    </a>
                </li>
            </ul>

            <ul class="pcoded-item pcoded-left-item">
                <li class="">
                    <a href="<%=context%>/historialAsesorias">
                        <span class="pcoded-micon"><i class="feather icon-watch"></i></span>
                        <span class="pcoded-mtext">Historial de Asesorias</span>
                    </a>
                </li>
            </ul>

        </s:if>
        <s:if test="#session.rolActivo == 4">
            <div class="pcoded-navigatio-lavel">Asesorias</div>
            <ul class="pcoded-item pcoded-left-item">
                <li class="">
                    <a href="<%=context%>/inicioTutor">
                        <span class="pcoded-micon"><i class="feather icon-plus-square"></i></span>
                        <span class="pcoded-mtext">Alumnos Tutorados</span>
                    </a>
                </li>
            </ul>
        </s:if>
        <s:if test="#session.rolActivo == 5">
            <div class="pcoded-navigatio-lavel">Asesorias</div>
            <ul class="pcoded-item pcoded-left-item">
                <li class="">
                    <a href="#">
                        <span class="pcoded-micon"><i class="feather icon-book"></i></span>
                        <span class="pcoded-mtext">Mete link del coordinador</span>
                    </a>
                </li>
            </ul>
        </s:if>
    </div>
</nav>
