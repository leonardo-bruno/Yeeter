<%-- 
    Document   : Conversaciones
    Created on : 29-abr-2019, 18:08:35
    Author     : pedro
--%>


<%@page import="yeeterapp.entity.Mensaje"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<!DOCTYPE html>

<%
   List<Mensaje> listaMensajes = (List) request.getAttribute("listaMensajes");
   List<Usuario> listaAmigos = (List) request.getAttribute("listaAmigos");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>Mensajes</title>
    </head>
    <body>
        <div class="container">
        <div class="row">

            <div class="col-7">
                <% if(listaMensajes.isEmpty()){
                    
                %>
               <div class="alert alert-secondary" role="alert">
 No hay conversaciones disponibles
</div>
                
                <% }else{
                        for(Mensaje mens : listaMensajes){%>
                    
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">
                            @<%= mens.getIdReceptor().getUsername() %>
                        </h5>
                        <p class="card-text"></p>
                        <button type="button" class="btn btn-outline-secondary">Acceder a Conversación</button>
                    </div>
                </div>
                            <% }}%>
            </div>
            <div class="col-3">
                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Nuevo Mensaje</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog" style="overflow-y: initial !important">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" style="font-weight: bold;">Nuevo Mensaje</h4>
          
        </div>
          <div class="modal-body" style="height: 250px; overflow-y: auto;">
              <% if(listaAmigos.isEmpty()){
                  %> Sin amigos campeón
                  
                  <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div></div>
      </div>
                  
                  <%
              }else{                  
                  for(Usuario amigos: listaAmigos){ %>
          <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">
                            @<%= amigos.getUsername() %>
                        <button type="button" class="btn btn-outline-secondary float-right">+</button>
                        </h5>
                        <% }}%>
                    </div>
                </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

            </div>
        </div>
    </div>
    </body>
</html>
 

