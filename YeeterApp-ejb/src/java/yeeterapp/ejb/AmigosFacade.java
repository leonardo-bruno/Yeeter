/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package yeeterapp.ejb;

import java.util.*;
import javax.ejb.Stateless;
import javax.persistence.*;
import yeeterapp.entity.Amigos;

/**
 *
 * @author leonardobruno
 */
@Stateless
public class AmigosFacade extends AbstractFacade<Amigos> {

    @PersistenceContext(unitName = "YeeterApp-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AmigosFacade() {
        super(Amigos.class);
    }
    
    public List<Integer> queryFriendsList(int id) {
        Query q = this.em.createNamedQuery("Amigos.friendsList");
        q.setParameter("id", id);
        try {
            return (List<Integer>) q.getResultList();
        } catch(NoResultException r) {
            return null;
        }
    }
}
