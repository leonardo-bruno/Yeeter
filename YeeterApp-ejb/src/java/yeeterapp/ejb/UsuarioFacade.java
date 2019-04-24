/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package yeeterapp.ejb;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import yeeterapp.entity.Grupo;
import yeeterapp.entity.Post;
import yeeterapp.entity.Usuario;

/**
 *
 * @author leonardobruno
 */
@Stateless
public class UsuarioFacade extends AbstractFacade<Usuario> {

    @PersistenceContext(unitName = "YeeterApp-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }
    
    public Usuario queryUserByEmail(String email){
        Query q = this.em.createNamedQuery("Usuario.findByCorreo");
        q.setParameter("correo", email);
        try {
            return (Usuario) q.getSingleResult();
        } catch(NoResultException e) {
            return null;
        }       
    }
    
    public Usuario queryUserByUsername(String username) {
        Query q = this.em.createNamedQuery("Usuario.findByUsername");
        q.setParameter("username", username);
        try {
            return (Usuario) q.getSingleResult();
        } catch(NoResultException r) {
            return null;
        }
    }
   public List<Post> queryUserFeed(int userID){
       Query q = this.em.createNativeQuery("select * from (\n" +
                "select * from Post where idAutor = ?1\n" +
                "\n" +
                "union\n" +
                "\n" +
                "select * from Post where idGrupo in (Select Grupo.id from Grupo Left Join USUARIO_PERTENECE_GRUPO ON Grupo.id = USUARIO_PERTENECE_GRUPO.idGrupo Left Join \n" +
                " Usuario ON Usuario.id = USUARIO_PERTENECE_GRUPO.idUsuario where usuario.id = ?1)\n" +
                " \n" +
                " union\n" +
                " \n" +
                " select * from Post where idAutor in (select idAmigo from Amigos where ?1 = Amigos.idUsuario)\n" +
                " and idGrupo is null) xd order by xd.fecha_publicacion desc\n" +
                " ;", Post.class);
       q.setParameter(1, userID);
       try {
           return q.getResultList();
       } catch(NoResultException e) {
           return null;
       }
    }
   
   public Usuario queryUserByID(Integer id) {
        Query q = this.em.createNamedQuery("Usuario.findById");
        q.setParameter("id", id);
        try {
            return (Usuario) q.getSingleResult();
        } catch(NoResultException r) {
            return null;
        }
    }
    
   
   public List<Grupo> queryGroups(int userId) {
       Query q = this.em.createNamedQuery("Usuario.findGroupsImIn");
       q.setParameter("id", userId);
       try {
           return q.getResultList();
       } catch(NoResultException e) {
           return null;
       }
   }
}
