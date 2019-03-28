/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package yeeterapp.ejb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import yeeterapp.entity.UsuarioPerteneceGrupo;

/**
 *
 * @author leonardobruno
 */
@Stateless
public class UsuarioPerteneceGrupoFacade extends AbstractFacade<UsuarioPerteneceGrupo> {

    @PersistenceContext(unitName = "YeeterApp-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioPerteneceGrupoFacade() {
        super(UsuarioPerteneceGrupo.class);
    }
    
}
