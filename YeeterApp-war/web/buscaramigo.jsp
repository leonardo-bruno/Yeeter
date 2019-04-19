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
        <form class="form-inline" action="BuscarAmigos">
            <input name = "input" class="form-control mr-sm-2" type="search" placeholder="Buscar Amigos" aria-label="Search">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Buscar</button>
        </form>
        <table>
            <tr>
                <th>NOMBRE</th>
                <th>APELLIDOS</th>
                <th>USERNAME</th>
                <th></th>
            </tr>
            
            <%
                Iterator<Usuario> u = users.iterator();
                Usuario temp = u.next();
                while(temp != null){
            %>
            
            <tr class='clickable-row' data-href='url://'>
                <td>
                    <%
                        temp.getNombre();
                    %>
                </td>
                <td>
                    <%
                        temp.getApellidos();
                    %>
                </td>
                <td>
                    <%
                        temp.getUsername();
                    %>
                </td>
                <td>
                    <%
                        /*Aqui habria que meter el enlace para añadir como amigo*/
                    %>
                </td>
            </tr>
            
            <%
                    temp = u.next();
                }
            %>
        </table>
    </body>
</html>
