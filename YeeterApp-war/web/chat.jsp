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
        <link rel="stylesheet" href="assets/css/loginstyle.css"/>
        <link rel="stylesheet" href="assets/css/estilos.css"/>
        <title>Chat</title>
    </head>
    <body>
        <div class="content">
            <div class="bot-grupos">
                <nav class="navbar navbar-dark bg-dark mb-5">
                    <span class="navbar-brand">Chat con <%= amigo.getNombre() + " " + amigo.getApellidos() %> </span>
                </nav>
                <%
                    if (!mensajes.isEmpty()) {
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
                    } else {
                %>
                <div class="alert alert-warning mb-4">No hay mensajes con este usuario</div>
                <%
                    }
                %>
                <form method="post" action="EnviarMensaje">
                    <textarea name="mensaje" rows="5" cols="160"></textarea><br/>
                    <div class="btn-group" role="group">
                        <button class="btn btn-lg btn-outline-info btn-block" type="submit">
                            Enviar
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
