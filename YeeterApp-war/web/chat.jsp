<%-- 
    Document   : chat
    Created on : 29-abr-2019, 19:42:13
    Author     : jesus
--%>

<%@page import="yeeterapp.entity.Mensaje"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<!DOCTYPE html>
<%
    List<Mensaje> mensajes = (List) request.getAttribute("mensajes");
    Usuario amigo = (Usuario) request.getAttribute("amigo");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chat</title>
    </head>
    <body>
        <div class="content">
            <div class="bot-grupos">
                <nav class="navbar navbar-dark bg-dark mb-5">
                    <span class="navbar-brand">Chat con <%= amigo.getNombre() + " " + amigo.getApellidos() %> </span>
                </nav>
                <% 
                for(Mensaje mensaje : mensajes) {
                %>
                <div class="card w-100 mt-1 mb-1" style="cursor: pointer;" data-href="ChatServlet">
                    <div class="card-body row align-items-center">
                        <div class="col-11">
                            <%= mensaje.getContenido() %>
                        </div>
                    </div>
                </div>
                <%
                }
                %>
            </div>
        </div>
    </body>
</html>
