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
import yeeterapp.entity.Grupo;

/**
 *
 * @author leonardobruno
 */
@Stateless
public class GrupoFacade extends AbstractFacade<Grupo> {

    @PersistenceContext(unitName = "YeeterApp-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public GrupoFacade() {
        super(Grupo.class);
    }
    
    public Grupo queryByName(String name) {
        Query q = this.em.createNamedQuery("Grupo.findByNombre");
        q.setParameter("nombre", name);
        try {
            return (Grupo) q.getSingleResult();
        } catch(NoResultException e) {
            return null;
        }  
    }
    
    public Grupo queryById(int grupoID) {
        Query q = this.em.createNamedQuery("Grupo.findById");
        q.setParameter("id", grupoID);
        try {
            return (Grupo) q.getSingleResult();
        } catch(NoResultException e) {
            return null;
        }  
    }
}
