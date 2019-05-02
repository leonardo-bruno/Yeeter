<%-- 
    Document   : Conversaciones
    Created on : 29-abr-2019, 18:08:35
    Author     : pedro
--%>


<%@page import="yeeterapp.entity.Mensaje"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<!DOCTYPE html>

<%    List<Mensaje> listaMensajes = (List) request.getAttribute("listaMensajes");
    List<Usuario> listaAmigos = (List) request.getAttribute("listaAmigos");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mensajes</title>
    </head>
    <body>
        <div class="container">
            <div class="row">

                <div class="col-7">
                    <% if (listaMensajes.isEmpty()) {

                    %>
                    <div class="alert alert-secondary" role="alert">
                        No hay conversaciones disponibles
                    </div>

                    <% } else {
                    for (Mensaje mens : listaMensajes) {%>

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">
                                @<%= mens.getIdReceptor().getUsername()%>
                            </h5>
                            <p class="card-text"></p>
                            <button type="button" class="btn btn-outline-secondary">Acceder a Conversación</button>
                        </div>
                    </div>
                    <% }
                                }%>
                </div>
                <div class="col-3">
                    <button type="button" class="btn btn-info btn-lg" onclick="ChatServlet" >Nuevo Mensaje</button>
                </div>
            </div>

        </div>
  
</body>
</html>

