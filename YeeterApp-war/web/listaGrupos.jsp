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
    
    List<String> fallos=new ArrayList<String>();;
    
    if(usuario.getId()==us.getId()){
        fallos.add("entra1");
        for(Grupo p : gruposTodos){
            fallos.add("entra2");
            for(UsuarioPerteneceGrupo upg : usGruposTodo){
                fallos.add("entra3");
                if(p.getId()==upg.getUsuarioPerteneceGrupoPK().getIdGrupo()){
                    fallos.add("entra4");
                    if(upg.getUsuarioPerteneceGrupoPK().getIdUsuario()==usuario.getId()){
                        grupos.add(p);
                        //grupos.add(gruposTodos.get(0));
                    }
                }
            }
        }
    }else{
        grupos.add(gruposTodos.get(1));
    }
    
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yeeter - Grupos</title>
    </head>
    <body>
        <% for(int i=0;i<grupos.size();i++){
        %>
        <p><%= grupos.get(i).getNombre() %></p>
        <% } %>


    </body>
</html>
