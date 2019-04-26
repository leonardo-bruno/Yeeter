<%-- 
    Document   : grupo
    Created on : 22-abr-2019, 9:25:39
    Author     : leonardobruno
--%>

<%@page import="yeeterapp.entity.Grupo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<%
    Grupo grupo = (Grupo)request.getAttribute("grupo");
    boolean esAdmin= usuario.getId() == grupo.getIdCreador();
    boolean editing = (Boolean) request.getAttribute("editing") != null && (Boolean) request.getAttribute("editing");
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
                        <textarea name="descripcion"><%= grupo.getDescripcion() %></textarea>
                        <input type="hidden" value="<%= grupo.getId() %>" name="idGrupo">
                        <div class="btn-group mt-5 mr-auto" role="group">
                            <button type="submit" class="btn btn-lg btn-outline-info"> Modificar </button>
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
                        <a class="nav-item nav-link active" href="ListaMiemServlet?id=<%= grupo.getId() %>">Miembros</a>
                        <% if(esAdmin){ %>
                            <form action="GrupoServlet" method="post">
                                <input type="hidden" value="true" name="editing">
                                <input type="hidden" value ="<%= grupo.getId() %>" name="id">
                                <input type="submit"> Modificar
                            </form>
                        <% } %>
                    </nav>
                <% } 
                %>
            </div>
        </div>
    </body>
</html>
