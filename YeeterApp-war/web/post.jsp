<%-- 
    Document   : post
    Created on : 29-abr-2019, 19:37:53
    Author     : jugr9
--%>

<%@page import="java.util.Map.Entry"%>
<%@page import="yeeterapp.entity.Post"%>
<%@page import="yeeterapp.entity.Comentario"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>

<%
    Post post = (Post) request.getAttribute("post");
    Usuario autor = (Usuario) request.getAttribute("autor");
    String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yeeter - Post</title>
    </head>
    <body>
        <div class="col-7 mt-5">
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title"><%=autor.getNombre() + " " + autor.getApellidos() + " (" + autor.getUsername() + ")"%></h2>
                    <p class="card-text"><%=post.getContenido()%></p>
                </div>
            </div>
            <form class="form-inline" action="CrearComentarioServlet" method="post">
                <input name = "postID" type = "hidden" value = "<%=post.getId()%>">
                Comentario:
                <textarea class="form-control" name="comentario" rows="5" cols="50" required="true"></textarea>
                <div class="input-group-append">
                    <button class="btn btn-outline-dark" style="height: 38px; width: 50px;" type="submit" >
                        <span style="width: 25px; height: 25px; display:inline-block;">
                            <i class="fas fa-comment"></i>
                        </span>
                    </button>
                </div>
                <div class="checkbox mb-3 mt-3">
                    <% if (error != null) {
                    %>
                    <div class="alert alert-warning"><%=error%></div>
                    <%
                        }
                    %>
                </div>
            </form>
            <div class="col-7 mt-5">
                <% for(Comentario com: post.getComentarioList()){   %>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%=com.getAutor().getUsername()%></h5>
                        <p class="card-text"><%=com.getContenido()%></p>
                    </div>
                </div>
                <% 
                    }
                %>
            </div>
        </div>
    </body>
</html>
