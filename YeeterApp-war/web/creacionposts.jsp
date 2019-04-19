<%-- 
    Document   : creacionposts
    Created on : 18-abr-2019, 12:15:32
    Author     : jesus
--%>

<%@page import="java.util.List"%>
<%@page import="yeeterapp.entity.Grupo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<!DOCTYPE html>
<%
    List<Grupo> grupos = (List) request.getAttribute("grupos");
%>
<html>
    <head>
        <title>Creaci&oacute;n de posts</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="container d-flex justify-content-center">
            <h1 class="mt-5 justify-content-center">Crear un nuevo post</h1>
        </div>
        <div class="body-container">
            <form method="post" action="CrearPost">
                <textarea name="post" rows="5" cols="50"></textarea>
                <select name="grupos">
                    <%
                        for(Grupo grupo: grupos) {
                    %>
                    <option value="<%= grupo.getNombre() %>">
                        <%= grupo.getNombre() %>
                    </option>
                    <%
                        }
                    %>
                </select>
                <a href="welcomepage.jsp" class="btn btn-lg btn-outline-secondary">
                    Cancelar
                </a>
                <button class="btn btn-lg btn-outline-info btn-block" type="submit">
                    Publicar
                </button>
            </form>
        </div>
    </body>
</html>
