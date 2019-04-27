<%-- 
    Document   : listaGrupos
    Created on : 22-abr-2019, 9:23:53
    Author     : leonardobruno
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="yeeterapp.entity.Grupo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="yeeterapp.entity.UsuarioPerteneceGrupo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<!DOCTYPE html>
<%
    List<UsuarioPerteneceGrupo> usGruposTodo=(List)request.getAttribute("usuariosGrupos");
    List<Grupo> gruposTodos=(List)request.getAttribute("grupos");
    Usuario us=(Usuario)request.getAttribute("usuario");
    List<Grupo> grupos=new ArrayList<Grupo>();
    int todos=0;
    todos=(Integer)request.getAttribute("todos");
    

        for(Grupo p : gruposTodos){
            if(todos==1){
                grupos.add(p);
            }else{
                for(UsuarioPerteneceGrupo upg : usGruposTodo){
                    if(p.getId()==upg.getUsuarioPerteneceGrupoPK().getIdGrupo()){
                        if(usuario.getId()==us.getId()){
                            if(upg.getUsuarioPerteneceGrupoPK().getIdUsuario()==usuario.getId()){ //SI EL USUARIO ES EL QUE SE LOGEA
                                grupos.add(p);
                            }
                        }else{
                            if(upg.getUsuarioPerteneceGrupoPK().getIdUsuario()==us.getId()){ // SI EL USUARIO ES EL QUE SE ENTRA POR PEFIL AJENO
                                grupos.add(p);
                            }
                        }
                    }
                }
            }
        }
    
    
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/estilos.css"/>
        <title>Yeeter - Grupos</title>
    </head>
    <body>
        <div class="content">
            <div class="bot-grupos">
                <nav class="navbar navbar-dark bg-dark">
                    <span class="navbar-brand">Grupos</span>
                    <form class="form-inline my-2 my-lg-0" action="ListaGruposServlet">
                        <button class="btn btn-outline-info my-2 my-sm-0" type="submit" id="todos" value="1">Todos</button>
                    </form>
                </nav>
                    
                <div class="list-group">
                    <% for(int i=0;i<grupos.size();i++){
                    %>
                    <a href="GrupoServlet?id=<%= grupos.get(i).getId() %>" class="list-group-item list-group-item-action btn-outline-dark"><%= grupos.get(i).getNombre() %></a>
                    <% } %>
                </div>
                
            </div>
        </div>
    </body>
</html>
