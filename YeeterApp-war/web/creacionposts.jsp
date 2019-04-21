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
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">
        <link rel="stylesheet" href="assets/css/loginstyle.css"/>
    </head>
    <body>
        <div class="container d-flex justify-content-center">
            <h1 class="mt-5 justify-content-center">Crear un nuevo post</h1>
        </div>
        <div class="body-container">
            <div class="container d-flex justify-content-center" >
                <div style="width: 200px;">
                    <form method="post" action="CrearPost">
                        <textarea name="post" rows="5" cols="50"></textarea>
                        <select name="grupos">
                            <option value="publico" selected>P&uacute;blico</option>
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
                        <div class="btn-group" role="group">
                            <a href="welcomepage.jsp" class="btn btn-lg btn-outline-secondary">
                                Cancelar
                            </a>
                            <button class="btn btn-lg btn-outline-info btn-block" type="submit">
                                Publicar
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>