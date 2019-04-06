/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package yeeterapp.ejb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
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
    
}
