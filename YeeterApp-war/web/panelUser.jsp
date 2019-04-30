<%-- 
    Document   : panelUser
    Created on : 17-abr-2019, 20:37:39
    Author     : leonardobruno
--%>

<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="yeeterapp.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
    
    <%
        Usuario us=(Usuario)request.getAttribute("usuario");
        boolean mismoUsuario=false;
        Format formatter = new SimpleDateFormat("dd-MM-yyyy");
        %>
    <head>
       <title>Yeeter</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        
        <link rel="stylesheet" href="assets/css/estilos.css"/>
    </head>
    <body>
        <div class="content">
            <div class="top">
                <p>Perfil<% if(mismoUsuario) { %>
                    <a href="ModificarPasswordServlet" class="btn btn-primary" role="button" > Modificar Contraseña</a></p>
                <% } else{ %>
                    </p>
                    <% } %> 
            </div>
            <div class="bot">
                <form action="ModificarPerfilServlet" method="post">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Usuario</label>
                    <div class="col-sm-7">
                        <input readonly="true" type="usuario" class="form-control" id="usuario" value="<%= us.getUsername() %>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Nombre</label>
                    <div class="col-sm-7">
                      <input readonly="true" type="nombre" class="form-control" id="nombre" value="<%= us.getNombre() %>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Apellidos</label>
                    <div class="col-sm-7">
                      <input readonly="true" type="apellidos" class="form-control" id="apellidos" value="<%= us.getApellidos() %>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-7">
                      <input readonly="true" type="email" class="form-control" id="email" value="<%= us.getCorreo() %>">
                    </div>
                  </div>
                  <div class="form-group row">
                      
                        <label for="inputPassword3" class="col-sm-2 col-form-label">Fecha Nacimiento</label>
                        <div class="col-sm-7">
                        <input id="fechaNacimiento" readonly="true" type="date" class="form-control" value="<%= us.getFechaNacimiento() %>" format="DD-MM-YYYY">
                        <span class="result"></span>
                        </div>
                  </div>    
                  <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Biografia</label>
                    <div class="col-sm-7">
                      <textarea readonly="true" class="form-control" aria-label="biografia" ><%= us.getBiografia() %></textarea>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-sm-10">
                        <% if(mismoUsuario) { %>
                        <a href="ModificarPerfilServlet"  class="btn btn-primary">Modificar</a>
                        <% } else { %>
                        <a href="#" class="btn btn-primary" >Enviar Mensaje</a>
                        <a href="#" class="btn btn-primary" >Añadir Amigo</a>
                        <% } %>
                    </div>
                  </div>
                </form>
        </div>
        </div>
    </body>
</html>
