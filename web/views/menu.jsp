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
        <div class="pcoded-navigatio-lavel">Other</div>
        <ul class="pcoded-item pcoded-left-item">
            <li class="pcoded-hasmenu ">
                <a href="javascript:void(0)">
                    <span class="pcoded-micon"><i class="feather icon-list"></i></span>
                    <span class="pcoded-mtext">Menu Levels</span>
                </a>
                <ul class="pcoded-submenu">
                    <li class="">
                        <a href="javascript:void(0)">
                            <span class="pcoded-mtext">Menu Level 2.1</span>
                        </a>
                    </li>
                    <li class="pcoded-hasmenu ">
                        <a href="javascript:void(0)">
                            <span class="pcoded-mtext">Menu Level 2.2</span>
                        </a>
                        <ul class="pcoded-submenu">
                            <li class="">
                                <a href="javascript:void(0)">
                                    <span class="pcoded-mtext">Menu Level 3.1</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="javascript:void(0)">
                            <span class="pcoded-mtext">Menu Level 2.3</span>
                        </a>
                    </li>

                </ul>
            </li>
            <li class="">
                <a href="javascript:void(0)" class="disabled">
                    <span class="pcoded-micon"><i class="feather icon-power"></i></span>
                    <span class="pcoded-mtext">Disabled Menu</span>
                </a>
            </li>
            <li class="">
                <a href="<%=context%>/asesorias">
                    <span class="pcoded-micon"><i class="feather icon-watch"></i></span>
                    <span class="pcoded-mtext">Agendar asesoría</span>
                </a>
            </li>
        </ul>
    </div>
</nav>
