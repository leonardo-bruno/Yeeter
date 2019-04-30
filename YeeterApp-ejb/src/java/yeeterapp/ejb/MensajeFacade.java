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
import yeeterapp.entity.Mensaje;

/**
 *
 * @author leonardobruno
 */
@Stateless
public class MensajeFacade extends AbstractFacade<Mensaje> {

    @PersistenceContext(unitName = "YeeterApp-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MensajeFacade() {
        super(Mensaje.class);
    }
    public List<Mensaje> queryByEmisor(int emisor) {
       Query q = this.em.createNamedQuery("Mensaje.findByIdEmisor");
       q.setParameter("emisor", emisor);
       try {
           return q.getResultList();
       } catch(NoResultException e) {
           return null;
       }
   }
    
}
