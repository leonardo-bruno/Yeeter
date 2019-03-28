package yeeterapp.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.6.1.v20150605-rNA", date="2019-03-28T11:58:33")
@StaticMetamodel(Mensaje.class)
public class Mensaje_ { 

    public static volatile SingularAttribute<Mensaje, Date> fecha;
    public static volatile SingularAttribute<Mensaje, String> contenido;
    public static volatile SingularAttribute<Mensaje, Integer> idReceptor;
    public static volatile SingularAttribute<Mensaje, Integer> idEmisor;
    public static volatile SingularAttribute<Mensaje, Integer> id;

}