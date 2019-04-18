drop database if exists Yeeter;
create schema Yeeter;
use Yeeter;


drop table if exists Usuario;
create table Usuario (
    id int AUTO_INCREMENT primary key,
    correo varchar(255) unique not null,
    password varchar(64) not null,
    nombre varchar(255) not null,
    apellidos varchar(255) not null,
    fecha_nacimiento date not null,
    username varchar(64) unique not null,
    biografia varchar(564)
)ENGINE = InnoDB;

drop table if exists GRUPO;
create table GRUPO (
    id int AUTO_INCREMENT primary key,
    nombre varchar(255) not null,
    descripcion varchar(255),
    fecha_creacion timestamp not null,
    idCreador int not null unique,
	FOREIGN KEY (idCreador) REFERENCES USUARIO(id)
)ENGINE = InnoDB;

drop table if exists Post;
create table Post (
    id int AUTO_INCREMENT primary key, 
    contenido varchar(255) not null,
    fecha_publicacion timestamp not null
)ENGINE = InnoDB;

drop table if exists Mensaje;
create table Mensaje (
    id int AUTO_INCREMENT primary key, 
    contenido varchar(255) not null,
    fecha datetime not null
)ENGINE = InnoDB;

drop table if exists Notificaciones;
create table Notificaciones (
    id int AUTO_INCREMENT primary key,
    contenido varchar(255) not null,
    link varchar(255) not null,
    notificacionLeida bit not null default false
)ENGINE = InnoDB;

drop table if exists PeticionAmistad;
create table PeticionAmistad(
    usuarioEmisor int not null,
    usuarioReceptor int not null,
    mensaje varchar(255),
    PRIMARY KEY (usuarioEmisor, usuarioReceptor),
    constraint PeticionAmistad_Emisor
        Foreign Key (usuarioEmisor)
        references Usuario (id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    constraint PeticionAmistad_Receptor
        foreign key (usuarioReceptor)
        references Usuario (id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
)ENGINE = InnoDB;

drop table if exists Amigos;
create table Amigos(
    idUsuario int not null,
    idAmigo int not null,
    primary key (idUsuario, idAmigo),
    constraint idUsuario_FK
        Foreign key (idUsuario)
        references Usuario (id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    constraint idAmigo_FK
        Foreign key (idAmigo)
        references Usuario (id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
)ENGINE = InnoDB;


drop TABLE if EXISTS USUARIO_PERTENECE_GRUPO;
CREATE TABLE USUARIO_PERTENECE_GRUPO(
  idUsuario int not null,
  idGrupo int not null,
  PRIMARY KEY(idUsuario,idGrupo),
  CONSTRAINT idUsuario_FK1
  Foreign key (idUsuario)
  references USUARIO (id)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
constraint idGrupo_FK
  Foreign key (idGrupo)
  references GRUPO (id)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  )ENGINE = InnoDB;


-- id inicial de los objetos que se van a introducir en la BD
ALTER TABLE USUARIO AUTO_INCREMENT=0;
ALTER TABLE Grupo AUTO_INCREMENT=1000;
ALTER TABLE POST AUTO_INCREMENT=2000;
ALTER TABLE MENSAJE AUTO_INCREMENT=3000;
ALTER TABLE NOTIFICACIONES AUTO_INCREMENT=4000;


