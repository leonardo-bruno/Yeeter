<%-- 
    Document   : modificarPerfil
    Created on : 19-abr-2019, 15:32:38
    Author     : leonardobruno
--%>

<%@page import="yeeterapp.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<!DOCTYPE html>
<%
    Usuario usuario=(Usuario)session.getAttribute("loggedUser");
    %>
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
        
    </style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yeeter - Modificar Perfil</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="content">
            <div class="top">
            </div>
            <div class="bot">
        <form action="ModificarPerfilServlet?id=<%= usuario.getId()%>" method="post">
          <div class="form-group row">
            <label for="inputEmail3" class="col-sm-2 col-form-label">Usuario</label>
            <div class="col-sm-7">
                <input type="text" class="form-control" id="userName" name="userName" value="<%= usuario.getUsername() %>">
            </div>
          </div>
          <div class="form-group row">
            <label for="inputPassword3" class="col-sm-2 col-form-label">Nombre</label>
            <div class="col-sm-7">
              <input type="text" class="form-control" id="nombreM" name="nombreM" value="<%= usuario.getNombre() %>">
            </div>
          </div>
          <div class="form-group row">
            <label for="inputPassword3" class="col-sm-2 col-form-label">Apellidos</label>
            <div class="col-sm-7">
              <input type="text" class="form-control" id="apellidosM" name="apellidosM" value="<%= usuario.getApellidos() %>">
            </div>
          </div>
          <div class="form-group row">
            <label for="inputPassword3" class="col-sm-2 col-form-label">Email</label>
            <div class="col-sm-7">
              <input type="text" class="form-control" id="emailM" name="emailM" value="<%= usuario.getCorreo() %>">
            </div>
          </div>
          <div class="form-group row">
            <label for="inputPassword3" class="col-sm-2 col-form-label">Fecha de Nacimiento</label>
            <div class="col-sm-7">
              <input type="text" class="form-control" id="fechaNacimientoM" name="fechaNacimientoM" value="<%= usuario.getUsername() %>">
            </div>
          </div>    
          <div class="form-group row">
            <label for="inputPassword3" class="col-sm-2 col-form-label">Biografia</label>
            <div class="col-sm-7">
              <textarea class="form-control" aria-label="biografia" id="bibliografiaM" name="bibliografiaM" value="<%= usuario.getBiografia() %>"></textarea>
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
