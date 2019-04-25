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
        <link rel="stylesheer" href="assets/css/table.css"/>
        <script src="assets/js/rowSelecter.js"></script>
    </head>
    <body>
        <div class="body-container">
            <table>
                <% 
                    for(Notificaciones not : notificaciones) {
                %>
                <tr data-href="<%= not.getLink() %>" class="btn btn-outline-info" style="cursor:pointer;">
                    <th>
                        <form name="markAsReadNotification" action="MarkAsReadServlet" method="POST">
                            <%= not.getContenido() %>
                            <input value="<%= not.getId() %>" hidden="true" name="idNotification"/>
                            <button type="submit" class="btn btn-outline-dark">Marcar como leída</button>
                        </form>
                    </th>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </body>
</html>
