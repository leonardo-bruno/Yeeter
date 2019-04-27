<%-- 
    Document   : notificaciones
    Created on : 23-Apr-2019, 19:28:05
    Author     : alec
--%>

<%@page import="yeeterapp.entity.Notificaciones"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<% 
    List<Notificaciones> notificaciones = (List) request.getAttribute("notifications");
    long noLeidas = (Long) request.getAttribute("noLeidas");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=(noLeidas != 0)? "(" + Long.toString(noLeidas) + ")":""%> Notificaciones</title>
        <link rel="stylesheet" href="assets/css/loginstyle.css"/>
        <link rel="stylesheet" href="assets/css/estilos.css"/>
        <script src="assets/js/rowSelecter.js"></script>
    </head>
    <body>
        <div class="content">
            <div class="bot-grupos">
                <nav class="navbar navbar-dark bg-dark">
                    <span class="navbar-brand">Notificaciones</span>
                    <form class="inline-form" name="markAsReadNotification" action="MarkAsReadServlet" method="POST">
                        <button class="btn btn-outline-info">
                            Marcar todas como leídas
                        </button>
                    </form>

                </nav>
                <div class="list-group btn-group-vertical">
                    <% 
                        for(Notificaciones not : notificaciones) {
                    %>
                    <form name="markAsReadNotification" action="MarkAsReadServlet" method="POST" class="w-100">
                        <div class="btn-group w-100">
                            <a href="<%= not.getLink() %>" 
                                class="btn <%= (!not.getNotificacionLeida())? "btn-outline-info" : "btn-outline-secondary" %> w-75">
                                <%= not.getContenido() %>
                            </a>
                            <input value="<%= not.getId() %>" type="hidden" name="idNotification"/>
                            <% if(!not.getNotificacionLeida()) { %>
                                <button type="submit" class="btn btn-outline-dark" style="width: 1%!important;"><i class="fas fa-check"></i></button>
                            <% } %>
                        </div>
                    </form>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
