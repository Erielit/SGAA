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
        <div class="pcoded-navigatio-lavel">Docente</div>
        <ul class="pcoded-item pcoded-left-item">
            <li class="">
                <a href="<%=context%>/asesorias">
                    <span class="pcoded-micon"><i class="feather icon-watch"></i></span>
                    <span class="pcoded-mtext">Asesorias Pendientes</span>
                </a>
            </li>
        </ul>
        <ul class="pcoded-item pcoded-left-item">
            <li class="">
                <a href="<%=context%>/asesorias">
                    <span class="pcoded-micon"><i class="feather icon-watch"></i></span>
                    <span class="pcoded-mtext">Historial de Asesorias</span>
                </a>
            </li>
        </ul>
    </div>
</nav>
