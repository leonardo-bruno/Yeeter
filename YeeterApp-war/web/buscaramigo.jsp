<%-- 
    Document   : buscaramigo
    Created on : 18-abr-2019, 11:55:45
    Author     : Juan Garcia Ruiz
--%>

<%@page import="yeeterapp.entity.Amigos"%>
<%@page import="java.util.*"%>
<%@page import="yeeterapp.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>

<!DOCTYPE html>
<%
    session = request.getSession();
    Usuario logUs=(Usuario) session.getAttribute("loggedUser");
    String message = (String) request.getAttribute("message");
    List<Usuario> users = (List<Usuario>)request.getAttribute("users");
    List<Integer> amigosId = (List<Integer>)request.getAttribute("friends");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yeeter</title>
    </head>
    <body class = "text-center">
        <% if (message != null) {
        %>
        
        <div class="alert alert-success"><%=message%></div>
        
        <%
           }
        %>
        <table class = "table">
            <tr>
                <th>NOMBRE</th>
                <th>APELLIDOS</th>
                <th>USERNAME</th>
                <th></th>
            </tr>
            
            <%
                for(Usuario u: users){
                    int idReceptor = u.getId();
            %>
            
            <tr class='clickable-row' data-href='url://'>
                <th><%=u.getNombre()%></th>
                <th><%=u.getApellidos()%></th>
                <th><%=u.getUsername()%></th>
                <th>
                    <%
                        if(!amigosId.contains(u.getId()) && !u.equals(logUs)){    
                    %>
                    
                    <form method = "post" action = "PeticionAmigo">
                        <input type = "hidden" name = "destID" value = <%=idReceptor%>>
                        <div class="input-group-append">
                            <button class="btn btn-outline-dark" style="height: 38px; width: 50px;" type="submit" >
                                <span style="width: 25px; height: 25px; display:inline-block;">
                                    <i class="fas fa-user-plus"></i>
                                </span>
                            </button>
                        </div>
                    </form>
                    
                    <%
                        }
                    %>
                </th>
            </tr>
            
            <%
                }
            %>
        </table>
    </body>
</html>
