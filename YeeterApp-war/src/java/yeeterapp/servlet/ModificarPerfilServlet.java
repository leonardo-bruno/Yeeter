/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package yeeterapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import yeeterapp.ejb.UsuarioFacade;
import yeeterapp.entity.Usuario;

/**
 *
 * @author leonardobruno
 */
@WebServlet(name = "ModificarPerfilServlet", urlPatterns = {"/ModificarPerfilServlet"})
public class ModificarPerfilServlet extends HttpServlet {

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
        RequestDispatcher rd;
        
        Usuario us=null;
        
        try{
            int id=Integer.valueOf(request.getParameter("id"));
            us=this.usuarioFacade.find(id);
            String userName=request.getParameter("userName");
            String name=request.getParameter("nombreM");
            String apell=request.getParameter("apellidoM");
            String correo=request.getParameter("emailM");
            String bio=request.getParameter("bibliografiaM");
            String fechaNacimiento=request.getParameter("");
            
            us.setUsername(userName);
            this.usuarioFacade.edit(us);
            //this.usuarioFacade.remove(us);
            /*Usuario usu=new Usuario();
            usu.setUsername("leonardo");
            this.usuarioFacade.create(usu);*/
            
            
            
            
            session.setAttribute("loggedUser", us);
            request.setAttribute("usuario", us);
            rd = this.getServletContext().getRequestDispatcher("/panelUser.jsp");
            rd.forward(request, response);
            
        }catch(Exception e){
            rd = this.getServletContext().getRequestDispatcher("/modificarPerfil.jsp");
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
