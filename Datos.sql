use Yeeter;
insert into Usuario(correo, password, nombre, apellidos, fecha_nacimiento, username, biografia)
 values ('leo@uma.es', '1234', 'Leonardo', '', '1990-01-01', 'leo2019', 'Ingeniero del software'),
 ('wan@uma.es', '1234', 'Juan', 'García Ruíz','1990-01-01', 'wan2010', 'Ingeniero del software y presidente de IAESTE informática'),
 ('pedro@uma.es', '1234', 'Pedro', 'Díaz', '1990-01-01', 'pedro2019', 'Ingeniero del software y del betis hasta la muerte!!'),
 ('parejo@uma.es', '1234', 'Jesús', 'Parejo', '1990-01-01', 'parejo2019', 'Ingeniero del software y lucentino'),
 ('alkasete@uma.es', '1234', 'Alejandro', 'Garau', '1990-01-01', 'alkasete', 'Un maricón de categoría'),
 ('pumuky@uma.es', '1234', 'Samuel', 'Jurado', '1990-01-01', 'pumuky12', 'El mendelson');
 

 
 insert into Amigos(idUsuario, idAmigo) values 
 ((select id from Usuario where correo like 'leo%'), (select id from Usuario where correo like 'wan%')),
 ((select id from Usuario where correo like 'leo%'), (select id from Usuario where correo like 'pedro%')),
 ((select id from Usuario where correo like 'leo%'), (select id from Usuario where correo like 'parejo%')),
 ((select id from Usuario where correo like 'leo%'), (select id from Usuario where correo like 'alkasete%')),
 ((select id from Usuario where correo like 'leo%'), (select id from Usuario where correo like 'pumuky%'));
 
 select * from Amigos left join usuario on amigos.idAmigo = Usuario.id; # amigos de Leonardo

 
 insert into Grupo(nombre, descripcion, fecha_creacion, idCreador) values 
 ('Devs In Pyjamas', 'Grupo de estudiantes de Ingeniería del software que realiza software.', '2018-09-01',
 (select id from Usuario where correo like 'pumuky%'));

 
insert into USUARIO_PERTENECE_GRUPO(idUsuario, idGrupo) values
	 ((select id from Usuario where correo like 'wan%'), (select id from grupo where nombre like 'Devs%')),
	 ((select id from Usuario where correo like 'pedro%'), (select id from grupo where nombre like 'Devs%')),
	 ((select id from Usuario where correo like 'leo%'), (select id from grupo where nombre like 'Devs%')), 
	 ((select id from Usuario where correo like 'parejo%'), (select id from grupo where nombre like 'Devs%')),
	 ((select id from Usuario where correo like 'alkasete%'), (select id from grupo where nombre like 'Devs%')),
	 ((select id from Usuario where correo like 'pumuky%'), (select id from grupo where nombre like 'Devs%'))
;
 

Select *  from Grupo Left Join USUARIO_PERTENECE_GRUPO ON Grupo.id = USUARIO_PERTENECE_GRUPO.idGrupo Left Join 
 Usuario ON Usuario.id = USUARIO_PERTENECE_GRUPO.idUsuario;

