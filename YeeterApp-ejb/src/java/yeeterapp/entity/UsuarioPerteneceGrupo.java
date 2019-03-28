/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package yeeterapp.entity;

import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author leonardobruno
 */
@Entity
@Table(name = "USUARIO_PERTENECE_GRUPO")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UsuarioPerteneceGrupo.findAll", query = "SELECT u FROM UsuarioPerteneceGrupo u")
    , @NamedQuery(name = "UsuarioPerteneceGrupo.findByIdUsuario", query = "SELECT u FROM UsuarioPerteneceGrupo u WHERE u.usuarioPerteneceGrupoPK.idUsuario = :idUsuario")
    , @NamedQuery(name = "UsuarioPerteneceGrupo.findByIdGrupo", query = "SELECT u FROM UsuarioPerteneceGrupo u WHERE u.usuarioPerteneceGrupoPK.idGrupo = :idGrupo")})
public class UsuarioPerteneceGrupo implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected UsuarioPerteneceGrupoPK usuarioPerteneceGrupoPK;

    public UsuarioPerteneceGrupo() {
    }

    public UsuarioPerteneceGrupo(UsuarioPerteneceGrupoPK usuarioPerteneceGrupoPK) {
        this.usuarioPerteneceGrupoPK = usuarioPerteneceGrupoPK;
    }

    public UsuarioPerteneceGrupo(int idUsuario, int idGrupo) {
        this.usuarioPerteneceGrupoPK = new UsuarioPerteneceGrupoPK(idUsuario, idGrupo);
    }

    public UsuarioPerteneceGrupoPK getUsuarioPerteneceGrupoPK() {
        return usuarioPerteneceGrupoPK;
    }

    public void setUsuarioPerteneceGrupoPK(UsuarioPerteneceGrupoPK usuarioPerteneceGrupoPK) {
        this.usuarioPerteneceGrupoPK = usuarioPerteneceGrupoPK;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (usuarioPerteneceGrupoPK != null ? usuarioPerteneceGrupoPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UsuarioPerteneceGrupo)) {
            return false;
        }
        UsuarioPerteneceGrupo other = (UsuarioPerteneceGrupo) object;
        if ((this.usuarioPerteneceGrupoPK == null && other.usuarioPerteneceGrupoPK != null) || (this.usuarioPerteneceGrupoPK != null && !this.usuarioPerteneceGrupoPK.equals(other.usuarioPerteneceGrupoPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "yeeterapp.entity.UsuarioPerteneceGrupo[ usuarioPerteneceGrupoPK=" + usuarioPerteneceGrupoPK + " ]";
    }
    
}
