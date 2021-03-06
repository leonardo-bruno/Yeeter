/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package yeeterapp.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import yeeterapp.ejb.GrupoFacade;
import yeeterapp.ejb.UsuarioFacade;
import yeeterapp.entity.Grupo;
import yeeterapp.entity.Usuario;

/**
 *
 * @author alec
 */
@WebServlet(name = "AddMemberServlet", urlPatterns = {"/AddMemberServlet"})
public class AddMemberServlet extends HttpServlet {

    @EJB
    private GrupoFacade grupoFacade;

    @EJB
    private UsuarioFacade usuarioFacade;

    
    
    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Integer loggedID = (Integer) session.getAttribute("loggedUserID");
        String idValue = request.getParameter("id");
        RequestDispatcher rd;
        if(idValue == null) {
            rd = this.getServletContext().getRequestDispatcher("/login.jsp");
            request.setAttribute("error", "Por favor inicie sesión primero.");
            rd.forward(request, response);
            return;
        }
        Usuario loggedUser = usuarioFacade.find(loggedID);
        
        Grupo currentGroup = grupoFacade.find(new Integer(idValue));
        
        List<Usuario> amigos = loggedUser.getUsuarioList1();
        
        List<Usuario> amigosNoEnGrupo = new ArrayList<>();
        
        amigos.forEach(amigo -> {
            if(!currentGroup.getUsuarioList().contains(amigo)) amigosNoEnGrupo.add(amigo);
        });
        
        request.setAttribute("amigos", amigosNoEnGrupo);
        request.setAttribute("idGrupo", currentGroup.getId());
        
        rd = this.getServletContext().getRequestDispatcher("/addUser.jsp");
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
