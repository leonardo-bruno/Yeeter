/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package yeeterapp.servlet;

import java.io.IOException;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import yeeterapp.ejb.GrupoFacade;
import yeeterapp.ejb.PostFacade;
import yeeterapp.entity.Post;
import yeeterapp.entity.Usuario;

/**
 *
 * @author jesus
 */
@WebServlet(name = "CrearPostServlet", urlPatterns = {"/CrearPost"})
public class CrearPostServlet extends HttpServlet {

    @EJB
    private GrupoFacade grupoFacade;


    @EJB
    private PostFacade postFacade;
    
    
    

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
        Usuario usuario = (Usuario) session.getAttribute("loggedUser");
        String content = request.getParameter("post");
        String grupo = request.getParameter("grupos");
        
        
        Post post = new Post();
        
        post.setContenido(content);
        post.setIdAutor(usuario.getId());
        /**if(grupo != null) {
            * Aquí haría falta comprobar que el grupo no es nullo y si no 
            * lo es, entonces meterlo en el grupo. De momento no lo pongo bc reasons
            * No sé como se pasa la info del .jsp al deste (no sé == me da pereza investigar)
            * @Jesuspa98 es tu trabajete 
        }**/

        Date date = new java.util.Date(System.currentTimeMillis());  
        post.setFechaPublicacion(date);
        
        
        postFacade.create(post);
        
        
        request.setAttribute("publishedPost", "Post publicado correctamente");
        response.sendRedirect("WelcomeServlet");
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
