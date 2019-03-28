package yeeterapp.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.6.1.v20150605-rNA", date="2019-03-28T11:58:33")
@StaticMetamodel(Post.class)
public class Post_ { 

    public static volatile SingularAttribute<Post, String> contenido;
    public static volatile SingularAttribute<Post, Integer> idAutor;
    public static volatile SingularAttribute<Post, Integer> id;
    public static volatile SingularAttribute<Post, Date> fechaPublicacion;
    public static volatile SingularAttribute<Post, Integer> idGrupo;

}