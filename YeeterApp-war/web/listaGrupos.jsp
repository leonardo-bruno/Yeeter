<%-- 
    Document   : listaGrupos
    Created on : 22-abr-2019, 9:23:53
    Author     : leonardobruno
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="yeeterapp.entity.Grupo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<!DOCTYPE html>
<%
    List<Grupo> usGruposTodo=(List)request.getAttribute("usuariosGrupos");
    List<Grupo> gruposTodos=(List)request.getAttribute("grupos");
    int todos=0;
    todos=(Integer)request.getAttribute("todos");    
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/estilos.css"/>
        <title>Yeeter - Grupos</title>
    </head>
    <body>
        <div class="container">
            <div class="bot-grupos">

                    
                <div class="list-group">
                    <% for(int i=0;i<usGruposTodo.size();i++){
                    %>
                    <a href="GrupoServlet?id=<%= usGruposTodo.get(i).getId() %>" class="list-group-item list-group-item-action btn-outline-dark"><%= usGruposTodo.get(i).getNombre() %></a>
                    <% } %>
                </div>
                
            </div>
        </div>
    </body>
</html>
