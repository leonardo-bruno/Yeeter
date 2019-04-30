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
import yeeterapp.entity.Post;
import yeeterapp.entity.Usuario;

/**
 *
 * @author jugr9
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

    public Usuario queryUserByEmail(String email) {
        Query q = this.em.createNamedQuery("Usuario.findByCorreo");
        q.setParameter("correo", email);
        try {
            int id = q.getFirstResult();
            return new Usuario(id);
        } catch(NoResultException e) {
            return null;
        }
    }

    public Usuario queryUserByUsername(String username) {
        Query q = this.em.createNamedQuery("Usuario.findByUsername");
        q.setParameter("username", username);
        try {
            int id = q.getFirstResult();
            return new Usuario(id);
        } catch(NoResultException e) {
            return null;
        }
    }

    public List<Post> queryUserFeed(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
