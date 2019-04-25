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
import yeeterapp.entity.Notificaciones;

/**
 *
 * @author leonardobruno
 */
@Stateless
public class NotificacionesFacade extends AbstractFacade<Notificaciones> {

    @PersistenceContext(unitName = "YeeterApp-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public NotificacionesFacade() {
        super(Notificaciones.class);
    }
    
    
    public List<Notificaciones> queryNonReadNotificationsByUsername(int id) {
        Query q = this.em.createNamedQuery("Notificaciones.findAllNotificationsByUser");
        q.setParameter("idUsuario", q);
        try {
            return q.getResultList();
        } catch(NoResultException e) {
            return null;
        }
    }

    public List<Notificaciones> queryByUsername(Integer id) {
        Query q = this.em.createNamedQuery("Notificaciones.findByIdUsuario");
        q.setParameter("idUsuario", id);
        try {
            return q.getResultList();
        } catch(NoResultException e) {
            return null;
        }
    }
}
