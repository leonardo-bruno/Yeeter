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

insert into Amigos(idUsuario, idAmigo) values 
	((select id from Usuario where correo like 'alkasete%'),(select id from Usuario where correo like 'pedro%'));
 
 select * from Amigos left join usuario on amigos.idAmigo = Usuario.id; # amigos de Leonardo

 
 insert into Grupo(nombre, descripcion, fecha_creacion, idCreador) values 
 ('Devs In Pyjamas', 'Grupo de estudiantes de Ingeniería del software que realiza software.', '2018-09-01',
 (select id from Usuario where correo like 'pumuky%')),
 ('Yeeter Developers Group', 'Grupo para el desarrollo de la plataforma', '2019-01-20',
 (select id from Usuario where correo like 'alkasete%')),
 ("Just me lol", "literally just me", '2010-01-01', (select id from usuario where correo like 'alkasete%'));

 
insert into USUARIO_PERTENECE_GRUPO(idUsuario, idGrupo) values
	 ((select id from Usuario where correo like 'wan%'), (select id from grupo where nombre like 'Devs%')),
	 ((select id from Usuario where correo like 'pedro%'), (select id from grupo where nombre like 'Devs%')),
	 ((select id from Usuario where correo like 'leo%'), (select id from grupo where nombre like 'Devs%')), 
	 ((select id from Usuario where correo like 'parejo%'), (select id from grupo where nombre like 'Devs%')),
	 ((select id from Usuario where correo like 'alkasete%'), (select id from grupo where nombre like 'Devs%')),
	 ((select id from Usuario where correo like 'pumuky%'), (select id from grupo where nombre like 'Devs%')),
     ((select id from Usuario where correo like 'wan%'), (select id from grupo where nombre like 'Yeeter%')),
	 ((select id from Usuario where correo like 'pedro%'), (select id from grupo where nombre like 'Yeeter%')),
	 ((select id from Usuario where correo like 'leo%'), (select id from grupo where nombre like 'Yeeter%')), 
	 ((select id from Usuario where correo like 'parejo%'), (select id from grupo where nombre like 'Yeeter%')),
	 ((select id from Usuario where correo like 'alkasete%'), (select id from grupo where nombre like 'Yeeter%')),
	 ((select id from Usuario where correo like 'pumuky%'), (select id from grupo where nombre like 'Yeeter%')),
     ((select id from Usuario where correo like 'alkasete%'), (select id from grupo where nombre like 'Just%')),
     ((select id from Usuario where correo like 'pedro%'), (select id from grupo where nombre like 'Just%'))
     
;

insert into POST(contenido, fecha_publicacion, idAutor) values 
	('Hola mundo!', '2019-01-20', (select id from usuario where correo like 'alkasete%')),
    ('Hola mundo! (me copio del @alkasete)', '2019-01-20', (select id from usuario where correo like 'pedro%')),
    ('JEJEJEJE EL ALKASET!!!', '2018-01-20', (select id from usuario where correo like 'alkasete%')),
    ('Comprobando como van las movidas de las fechas oWo', '2017-01-20', (select id from usuario where correo like 'pedro%')),
    ('Se ha muerto mi abuela YEET 👌🏻😂💯', '2016-01-20', (select id from usuario where correo like 'wan%'));
insert into POST(contenido, fecha_publicacion, idAutor, idGrupo) values
	('Hola grupo!!!', '2019-01-20', (select id from usuario where correo like 'alkasete%'), (select id from grupo where nombre like 'devs%')),
    ('Hola grupo!!!', '2019-01-20', (select id from usuario where correo like 'pedro%'), (select id from grupo where nombre like 'Yeeter%'));
insert into POST(contenido, fecha_publicacion, idAutor, idGrupo) values
('Joder como te foyaba con la poya 😂', '2010-01-20', (select id from usuario where correo like 'alkasete%'), (select id from grupo where nombre like 'Just%'));    
    
 

Select *  from Grupo Left Join USUARIO_PERTENECE_GRUPO ON Grupo.id = USUARIO_PERTENECE_GRUPO.idGrupo Left Join 
 Usuario ON Usuario.id = USUARIO_PERTENECE_GRUPO.idUsuario;

