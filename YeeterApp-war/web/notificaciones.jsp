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
    // long noLeidas = notificaciones.stream().filter(notificacion -> !notificacion.getNotificacionLeida()).count(); a jsp no le gusta
    // la programación funcional ;)
    int noLeidas = 0;
    for(Notificaciones n : notificaciones) {
        if(!n.getNotificacionLeida())
            noLeidas += 1;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>(<%= noLeidas %>) Notificaciones</title>
    </head>
    <body>
        <% 
            for(Notificaciones not : notificaciones) {
        %>
            <div><%= not.getContenido() %>          </div>
            <div><%= not.getLink()%>                </div>
            <div><%= not.getNotificacionLeida() %>  </div>
            <form name="markAsReadNotification" action="MarkAsReadServlet" method="POST">
                <input value="<%= not.getId() %>" hidden="true" name="idNotification"/>
                <button type="submit">Marcar como leída</button>
            </form>
        <%
            }
        %>
    </body>
</html>
