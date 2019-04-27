<%-- 
    Document   : grupo
    Created on : 22-abr-2019, 9:25:39
    Author     : leonardobruno
--%>

<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="yeeterapp.entity.Post"%>
<%@page import="yeeterapp.entity.Grupo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<%
    Grupo grupo=(Grupo)request.getAttribute("grupo");
    boolean esAdmin=false;
    if(usuario.getId()==grupo.getIdCreador()) esAdmin=true;
    Map<Post,Usuario> groupFeed = (Map) request.getAttribute("groupFeed");
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">   
        <link rel="stylesheet" href="assets/css/estilos.css"/>
        <title>Yeeter - Grupo</title>
    </head>
    <body>
        <div class="content">
            <div class="bot-grupos">
                <nav class="navbar navbar-dark bg-dark">
                    <span class="navbar-brand"><%= grupo.getNombre() %></span>
                </nav>
                <p><%= grupo.getDescripcion()%></p>
                <nav class="nav nav-pills flex-column flex-sm-row">
                    <a class="nav-item nav-link active" href="ListaMiemServlet?id=<%= grupo.getId() %>">Miembros</a>
                    <% if(esAdmin){ %>
                    <a class="nav-item nav-link active" href="#" style="margin-left: 20px">Modificar</a>
                    <% } %>
                </nav>                
            </div>
            <div class="col-7">
                <% for(Entry<Post,Usuario> post: groupFeed.entrySet()){   %>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%=post.getValue().getUsername()%></h5>
                        <p class="card-text"><%=post.getKey().getContenido()%></p>
                    </div>
                </div>
                <% }  %>
            </div>
        </div>
    </body>
</html>
