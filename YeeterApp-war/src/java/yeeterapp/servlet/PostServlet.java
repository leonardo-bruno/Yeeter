/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package yeeterapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import yeeterapp.ejb.ComentarioFacade;
import yeeterapp.ejb.PostFacade;
import yeeterapp.ejb.UsuarioFacade;
import yeeterapp.entity.Comentario;
import yeeterapp.entity.Post;
import yeeterapp.entity.Usuario;

/**
 *
 * @author jugr9
 */
@WebServlet(name = "PostServlet", urlPatterns = {"/PostServlet"})
public class PostServlet extends HttpServlet {
    
    @EJB
    private PostFacade postFacade;
    @EJB
    private ComentarioFacade comentarioFacade;
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
        RequestDispatcher rd;
        HttpSession session = request.getSession();
        Usuario user = (Usuario) session.getAttribute("loggedUser");
        if(user == null) {
            rd = this.getServletContext().getRequestDispatcher("/login.jsp");
            request.setAttribute("error", "Por favor inicie sesión primero.");
            rd.forward(request, response);
        }
        
        String idPostValue = request.getParameter("postID");
        int idP;
        if(idPostValue == null) {
            idP = (Integer) request.getAttribute("postID");
        } else {
            idP = Integer.valueOf(idPostValue);
        }
        
        String error = request.getParameter("error");
        request.setAttribute("error", error);
        
        Post post = postFacade.find(idP);
        request.setAttribute("post", post);
        
        Usuario autor = usuarioFacade.queryUserByID(post.getIdAutor());
        request.setAttribute("autor", autor);
        
        List<Comentario> postComments = comentarioFacade.queryPostFeed(post);
        Map<Comentario,Usuario> postFeed = new HashMap<>();
        
        for(Comentario c: postComments){
            Usuario u = usuarioFacade.queryUserByID(c.getAutor());
            postFeed.put(c, u);
        }
        
        request.setAttribute("postFeed", postFeed);

        rd = this.getServletContext().getRequestDispatcher("/post.jsp");
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