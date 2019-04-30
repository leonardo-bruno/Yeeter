<%-- 
    Document   : Conversaciones
    Created on : 29-abr-2019, 18:08:35
    Author     : pedro
--%>

<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="yeeterapp.entity.Mensaje"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<!DOCTYPE html>

<%
    Map<Usuario,Mensaje> userCover = (Map) request.getAttribute("userCover");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mensajes</title>
    </head>
    <body>
        <div class="container">
        <div class="row">

            <div class="col-7">
                <% for(Entry<Usuario,Mensaje> userMen: userCover.entrySet()){
                    
               
                %>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">
                            @<%= userMen.getKey().getUsername()
                            %>
                        </h5>
                        <p class="card-text"></p>
                        <button type="button" class="btn btn-outline-secondary">Acceder a Conversación</button>
                    </div>
                </div>
                            <% }%>
            </div>
            <div class="col-3">
            </div>
        </div>
    </div>
    </body>
</html>
