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
@Table(name = "AMIGOS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Amigos.findAll", query = "SELECT a FROM Amigos a")
    , @NamedQuery(name = "Amigos.findByIdUsuario", query = "SELECT a FROM Amigos a WHERE a.amigosPK.idUsuario = :idUsuario")
    , @NamedQuery(name = "Amigos.findByIdAmigo", query = "SELECT a FROM Amigos a WHERE a.amigosPK.idAmigo = :idAmigo")
    , @NamedQuery(name = "Amigos.friendsList", query = "SELECT a FROM Amigos a INNER JOIN Usuario u ON a.amigosPK.idUsuario = u.id WHERE a.amigosPK.idUsuario = :id")})
public class Amigos implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected AmigosPK amigosPK;

    public Amigos() {
    }

    public Amigos(AmigosPK amigosPK) {
        this.amigosPK = amigosPK;
    }

    public Amigos(int idUsuario, int idAmigo) {
        this.amigosPK = new AmigosPK(idUsuario, idAmigo);
    }

    public AmigosPK getAmigosPK() {
        return amigosPK;
    }

    public void setAmigosPK(AmigosPK amigosPK) {
        this.amigosPK = amigosPK;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (amigosPK != null ? amigosPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Amigos)) {
            return false;
        }
        Amigos other = (Amigos) object;
        if ((this.amigosPK == null && other.amigosPK != null) || (this.amigosPK != null && !this.amigosPK.equals(other.amigosPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "yeeterapp.entity.Amigos[ amigosPK=" + amigosPK + " ]";
    }
    
}
