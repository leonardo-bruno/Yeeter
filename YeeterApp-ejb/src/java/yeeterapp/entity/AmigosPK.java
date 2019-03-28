/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package yeeterapp.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author leonardobruno
 */
@Embeddable
public class AmigosPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idUsuario")
    private int idUsuario;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idAmigo")
    private int idAmigo;

    public AmigosPK() {
    }

    public AmigosPK(int idUsuario, int idAmigo) {
        this.idUsuario = idUsuario;
        this.idAmigo = idAmigo;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdAmigo() {
        return idAmigo;
    }

    public void setIdAmigo(int idAmigo) {
        this.idAmigo = idAmigo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idUsuario;
        hash += (int) idAmigo;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AmigosPK)) {
            return false;
        }
        AmigosPK other = (AmigosPK) object;
        if (this.idUsuario != other.idUsuario) {
            return false;
        }
        if (this.idAmigo != other.idAmigo) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "yeeterapp.entity.AmigosPK[ idUsuario=" + idUsuario + ", idAmigo=" + idAmigo + " ]";
    }
    
}
