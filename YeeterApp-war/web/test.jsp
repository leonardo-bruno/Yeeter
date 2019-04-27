<%-- 
    Document   : test
    Created on : 21-abr-2019, 17:58:52
    Author     : leonardobruno
--%>

<%@page import="yeeterapp.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Usuario us=(Usuario)session.getAttribute("loggedUser");
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%= us.getId() %>
    </body>
</html>
