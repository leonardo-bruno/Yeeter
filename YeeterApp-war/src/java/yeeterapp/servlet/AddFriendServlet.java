/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package yeeterapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import yeeterapp.ejb.PeticionAmistadFacade;
import yeeterapp.entity.PeticionAmistad;
import yeeterapp.entity.Usuario;

/**
 *
 * @author jugr9
 */
@WebServlet(name = "AddFriendServlet", urlPatterns = {"/PeticionAmigo"})
public class AddFriendServlet extends HttpServlet {

    @EJB
    private PeticionAmistadFacade peticionFacade;
    
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
        Usuario us=(Usuario) session.getAttribute("loggedUser");
        RequestDispatcher rd;
        
        if(us == null){
            rd = this.getServletContext().getRequestDispatcher("/login.jsp");
            request.setAttribute("error", "Por favor inicie sesión.");
            rd.forward(request, response);
        }else{
            String destinatario = request.getParameter("destinatario");
            peticionFacade.create(new PeticionAmistad(us.getId(), Integer.parseInt(destinatario)));
            rd = this.getServletContext().getRequestDispatcher("/buscaramigo.jsp");
            request.setAttribute("message", "La solicitud se ha enviado con exito.");
            rd.forward(request, response);
        }   
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
