use Yeeter;


## Feed de los usuarios (aka todos los posts de amigos, grupos y posts tuyos (no hay repetidos bc teoría de conjuntos baby))
select * from (
select * from Post where idAutor = (select id from usuario where correo like 'alkasete%')

union

select * from Post where idGrupo in (Select Grupo.id from Grupo Left Join USUARIO_PERTENECE_GRUPO ON Grupo.id = USUARIO_PERTENECE_GRUPO.idGrupo Left Join 
 Usuario ON Usuario.id = USUARIO_PERTENECE_GRUPO.idUsuario where usuario.id = (select id from usuario where correo like 'alkasete%'))
 
 union
 
 select * from Post where idAutor in (select idAmigo from Amigos left join usuario on amigos.idAmigo = Usuario.id))
 xd order by xd.fecha_publicacion desc
 ;
 
 
select * from (
select * from Post where idAutor = (select id from usuario where correo like 'pedro%')

union

select * from Post where idGrupo in (Select Grupo.id from Grupo Left Join USUARIO_PERTENECE_GRUPO ON Grupo.id = USUARIO_PERTENECE_GRUPO.idGrupo Left Join 
 Usuario ON Usuario.id = USUARIO_PERTENECE_GRUPO.idUsuario where usuario.id = (select id from usuario where correo like 'pedro%'))
 
 union
 
 select * from Post where idAutor in (select idAmigo from Amigos left join usuario on amigos.idAmigo = Usuario.id) and idGrupo is null)
 xd order by xd.fecha_publicacion desc
 ;

# grupos a los que pertenece un usuario.
Select * from Grupo Left Join USUARIO_PERTENECE_GRUPO ON Grupo.id = USUARIO_PERTENECE_GRUPO.idGrupo Left Join 
 Usuario ON Usuario.id = USUARIO_PERTENECE_GRUPO.idUsuario where usuario.id = (select id from usuario where correo like 'alkasete%');
 
 

 
 