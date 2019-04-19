<%-- 
    Document   : panelUser
    Created on : 17-abr-2019, 20:37:39
    Author     : leonardobruno
--%>

<%@page import="yeeterapp.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<!DOCTYPE html>
<%
    Usuario usuario=(Usuario)session.getAttribute("loggedUser");
    %>
<html>
    <style>
        .content{
           position: relative;
            top: 50%;
            left: 20%;
        }
        .content .top{
            margin-top: 60px;
            margin-left: 20%;
            font-size: 30px;
        }
        .content .bot{
            width: 60%;
            position: static;
            margin-top: 100px;
        }
        .content .top .btn-primary{
         position: absolute;
         right: 50%;
        }
        
    </style>
    <head>
       <title>Yeeter</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="content">
            <div class="top">
                <p>Perfil
                <a href="#" class="btn btn-primary" role="button">Modificar Contraseña</a></p>
            </div>
            <div class="bot">
        <form action="ModificarPerfilServlet" method="post">
          <div class="form-group row">
            <label for="inputEmail3" class="col-sm-2 col-form-label">Usuario</label>
            <div class="col-sm-7">
                <input readonly="true" type="usuario" class="form-control" id="usuario" value="<%= usuario.getUsername() %>">
            </div>
          </div>
          <div class="form-group row">
            <label for="inputPassword3" class="col-sm-2 col-form-label">Nombre</label>
            <div class="col-sm-7">
              <input readonly="true" type="nombre" class="form-control" id="nombre" value="<%= usuario.getNombre() %>">
            </div>
          </div>
          <div class="form-group row">
            <label for="inputPassword3" class="col-sm-2 col-form-label">Apellidos</label>
            <div class="col-sm-7">
              <input readonly="true" type="apellidos" class="form-control" id="apellidos" value="<%= usuario.getApellidos() %>">
            </div>
          </div>
          <div class="form-group row">
            <label for="inputPassword3" class="col-sm-2 col-form-label">Email</label>
            <div class="col-sm-7">
              <input readonly="true" type="email" class="form-control" id="email" value="<%= usuario.getCorreo() %>">
            </div>
          </div>
          <div class="form-group row">
            <label for="inputPassword3" class="col-sm-2 col-form-label">Fecha de Nacimiento</label>
            <div class="col-sm-7">
              <input readonly="true" type="fechaNacimiento" class="form-control" id="fechaNacimiento" value="<%= usuario.getUsername() %>">
            </div>
          </div>    
          <div class="form-group row">
            <label for="inputPassword3" class="col-sm-2 col-form-label">Biografia</label>
            <div class="col-sm-7">
              <textarea readonly="true" class="form-control" aria-label="biografia" value="<%= usuario.getBiografia() %>"></textarea>
            </div>
          </div>
          <div class="form-group row">
            <div class="col-sm-10">
              <button type="submit" class="btn btn-primary" >Modificar</button>
            </div>
          </div>
        </form>
        </div>
        </div>
    </body>
</html>
