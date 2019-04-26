<%-- 
    Document   : listaMiem
    Created on : 22-abr-2019, 9:26:31
    Author     : leonardobruno
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<%
    List<Usuario> lista=(List)request.getAttribute("usuarios");
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/estilos.css"/>
        <title>Yeeter - Miembros Grupos</title>
    </head>
    <body>
        <div class="content">
            <div class="bot-grupos">
                <nav class="navbar navbar-dark bg-dark">
                    <span class="navbar-brand">Miembros del Grupo</span>
                </nav>
                    
                    <div class="list-group">
                        <% for(int i=0;i<lista.size();i++){
                        %>
                        <a type="button" href="panelUserServlet?id=<%= lista.get(i).getId()%>" class="list-group-item list-group-item-action"><%= lista.get(i).getNombre()%></a>
                        <% } %>
                    </div>
                
            </div>
        </div>
    </body>
</html>
