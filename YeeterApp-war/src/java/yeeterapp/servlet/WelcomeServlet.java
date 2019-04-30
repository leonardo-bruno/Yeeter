    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package yeeterapp.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import yeeterapp.entity.Post;
import yeeterapp.entity.Usuario;
import yeeterapp.ejb.UsuarioFacade;


/**
 *
 * @author alec
 */
@WebServlet(name = "Welcome", urlPatterns = {"/WelcomeServlet"})
public class WelcomeServlet extends HttpServlet {

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

        String username = request.getParameter("username");


        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Usuario user=(Usuario) session.getAttribute("loggedUser");
        List<Post> posts =  usuarioFacade.queryUserFeed(user.getId());
        Map<Post,Usuario> feed = new HashMap<>();
        
        posts.forEach((post) -> {
            feed.put(post,post.getIdAutor());
        });
        request.setAttribute("feed",feed);

        RequestDispatcher rd;
        rd = this.getServletContext().getRequestDispatcher("/welcomepage.jsp");
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
