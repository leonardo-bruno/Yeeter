<%-- 
    Document   : welcomepage
    Created on : 16-Apr-2019, 10:56:06
    Author     : alec
--%>

<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="yeeterapp.entity.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="yeeterapp.entity.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>

<%
Map<Post,Usuario> feed = (Map) request.getAttribute("feed");
%>
<!DOCTYPE html>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Yeeter</title>
</head>

<body>
    <div class="container">
        <div class="row">

            <div class="col-3">
                <button type="button" class="btn btn-secondary">Boton Panel de Control</button>
            </div>
            <div class="col-7">
                <% for(Entry<Post,Usuario> post: feed.entrySet()){   %>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%=post.getValue().getUsername()      %></h5>
                        <p class="card-text"><%=post.getKey().getContenido()%></p>
                    </div>
                </div>
                <% }  %>
            </div>
        </div>
    </div>
</body>

</html>
