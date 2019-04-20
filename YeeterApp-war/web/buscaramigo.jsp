<%-- 
    Document   : buscaramigo
    Created on : 18-abr-2019, 11:55:45
    Author     : Juan Garcia Ruiz
--%>

<%@page import="java.util.*"%>
<%@page import="yeeterapp.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>

<!DOCTYPE html>
<%
    List<Usuario> users = (List<Usuario>)request.getAttribute("users");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yeeter</title>
    </head>
    <body class = "text-center">
        <table class = "table">
            <tr>
                <th>NOMBRE</th>
                <th>APELLIDOS</th>
                <th>USERNAME</th>
                <th></th>
            </tr>
            
            <%
                for(Usuario u: users){
            %>
            
            <tr class='clickable-row' data-href='url://'>
                <th>
                    <%
                        u.getNombre();
                    %>
                </th>
                <th>
                    <%
                        u.getApellidos();
                    %>
                </th>
                <th>
                    <%
                        u.getUsername();
                    %>
                </th>
                <th>
                    <%
                        /*Aqui habria que meter el enlace para añadir como amigo*/
                    %>
                </th>
            </tr>
            
            <%
                }
            %>
        </table>
    </body>
</html>
