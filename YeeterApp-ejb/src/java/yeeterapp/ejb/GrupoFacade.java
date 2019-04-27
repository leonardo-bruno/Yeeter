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
    
    public List<Post> queryGroupFeed(int idGroup){
        Query q = this.em.createNamedQuery("Grupo.getGroupPosts");
        q.setParameter("idGroup", idGroup);
        try{
            return q.getResultList();
        }catch(NoResultException e){
            return null;
        }
    }
}
