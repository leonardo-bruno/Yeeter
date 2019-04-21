<%-- 
    Document   : welcomepage
    Created on : 16-Apr-2019, 10:56:06
    Author     : alec
--%>

<%@page import="yeeterapp.entity.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="yeeterapp.entity.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>

<% 
List<Post> feed = (List)request.getAttribute("feed");

%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yeeter</title>
    </head>
    <body>
        
        <div class="row">
            <div class="col-1"></div>
</div>
            <div class="col-3" style=" padding-left: 10px;">
                 <div class="card text-white" style="width: 18rem;  background-color:#343A40;">
  <img src="https://i1.sndcdn.com/avatars-000091067179-721zox-t500x500.jpg" class="card-img-top" alt="...">
  <div class="card-body" >
    <h5 class="card-title">Nombre del usuario</h5>
    <p class="card-text">Biografiaputamadre</p>
    <a href="#" class="btn btn-primary">Boton Wan, panel de control</a>
  </div>
</div>
                
                
            </div>
  <div class="col-8"></div>
</div>



<% 
for(Post post: feed){
%>
<div >
    <%=  post.getContenido()%>
</div>


<%
}

%>
<a href="panelUserServlet?id=4">Perfil Prueba</a>
</body>
</html>
