<%
    String context = request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<li class="header-notification" ng-controller="agendarAsesoria">
    <div class="dropdown-primary dropdown">
        <div class="dropdown-toggle" data-toggle="dropdown">
            <i class="feather icon-bell"></i>
            <span id="totalNotificaciones" class="badge bg-c-pink"></span>
        </div>
        <ul class="show-notification notification-view dropdown-menu" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
            <li>
                <h6>Notificaciones</h6>
                <label id="nuevasNotificaciones" style="visibility: hidden" class="label label-danger">Nuevas</label>
            </li>
            <li>
                <div ng-show="notifications.length === 0">
                    No hay notificaciones
                </div>
                <div class="media" ng-repeat="notificacion in notifications">
                    <img class="d-flex align-self-center img-radius" src="<%=context%>\files\assets\images\avatar-4.jpg" alt="Generic placeholder image">
                    <div class="media-body">
                        <h5 class="notification-user">{{notificacion.asunto}}</h5>
                        <p class="notification-msg">{{notificacion.mensaje}}</p>
                        <span class="notification-time">{{notificacion.fecha_registro}}</span>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</li>