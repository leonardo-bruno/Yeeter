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
    Grupo grupo = (Grupo)request.getAttribute("grupo");
    boolean esAdmin= usuario.getId() == grupo.getIdCreador();
    boolean editing = (Boolean) request.getAttribute("editing") != null && (Boolean) request.getAttribute("editing");
    Map<Post,Usuario> groupFeed = (Map) request.getAttribute("groupFeed");
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/estilos.css"/>
        <title>Yeeter - Grupo</title>
    </head>
    <body>
        <div class="content">
            <div class="bot-grupos">
                <% if(!editing) {%>
                    <nav class="navbar navbar-dark bg-dark">
                        <span class="navbar-brand"><%= grupo.getNombre() %></span>
                    </nav>
                    <p><%= grupo.getDescripcion() %></p>
                <%
                } else {
                %>
                    <form action="EditarGrupoServlet" method="post">
                        <nav class="navbar navbar-dark bg-dark">
                            <input name="nombre" value="<%= grupo.getNombre() %>">
                        </nav>
                        <textarea name="descripcion" class="w-100 h-100"><%= grupo.getDescripcion() %></textarea>
                        <input type="hidden" value="<%= grupo.getId() %>" name="idGrupo">
                        <div class="btn-group mt-5 mr-auto" role="group">
                            <button class="btn btn-lg btn-outline-info btn-block" type="submit"> Modificar </button>
                            <a class="btn btn-lg btn-outline-secondary" href="WelcomeServlet">
                                Cancelar
                            </a>
                        </div>
                    </form>
                <%
                    }
                %>
                <% if(!editing){ %>
                    <nav class="nav nav-pills flex-column flex-sm-row">
                        <a class="btn btn-lg btn-outline-info" href="ListaMiemServlet?id=<%= grupo.getId() %>">Miembros</a>
                        <% if(esAdmin){ %>
                            <form action="GrupoServlet" method="post">
                                <input type="hidden" value="true" name="editing">
                                <input type="hidden" value ="<%= grupo.getId() %>" name="id">
                                <button class="btn btn-lg btn-outline-info btn-block" type="submit"> Modificar </button>
                            </form>
                        <% } %>
                    </nav>
                <% }
                %>
            </div>
            <div class="col-7">
                <% for(Entry<Post,Usuario> post: groupFeed.entrySet()){   %>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%=post.getValue().getUsername()%></h5>
                        <p class="card-text"><%=post.getKey().getContenido()%></p>
                    </div>
                </div>
                <% } %>
			      </div>
        </div>
    </body>
</html>
