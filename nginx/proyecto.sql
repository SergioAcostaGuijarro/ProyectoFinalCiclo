cd ..\..\AppServ\MySQL\bin
mysql -u root -p

cd ..\..\xampp\MySQL\bin
mysql -u root -p

---------------------------------------------------------------------------------
/* BBDD */
DROP DATABASE IF EXISTS educados;

create database educados;
use educados;

CREATE TABLE usuario(
    id_usuario INT(4) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50), 
    correo VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(100) NOT NULL,
    tipo_usuario VARCHAR(20) NOT NULL
);

CREATE TABLE profesor(
    id_usuario INT(4) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    correo VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(100) NOT NULL
);

CREATE TABLE curso(
    id_curso INT(4) PRIMARY KEY AUTO_INCREMENT,
    curso VARCHAR(50) UNIQUE,
    tutor VARCHAR(50)
);

CREATE TABLE materia(
    id_materia INT(4) PRIMARY KEY AUTO_INCREMENT,
    materia VARCHAR(50),
    id_profesor INT(4),
    profesor VARCHAR(50),
    id_curso INT(4),
    curso VARCHAR(50),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_usuario)
);

CREATE TABLE materia_curso (
    id_materia_curso INT(4) PRIMARY KEY AUTO_INCREMENT,
    id_materia INT(4),
    id_curso INT(4),
    FOREIGN KEY (id_materia) REFERENCES materia(id_materia),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE prof_materia(
    id_prof_materia INT(4) PRIMARY KEY AUTO_INCREMENT,
    id_profesor INT(4),
    id_materia INT(4),
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_usuario),
    FOREIGN KEY (id_materia) REFERENCES materia(id_materia)
);

CREATE TABLE alumno(
    id_usuario INT(4) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    correo VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(100) NOT NULL,
    id_curso INT(4),
    curso VARCHAR(50),
    primer_login BOOLEAN DEFAULT true,
    FOREIGN KEY (curso) REFERENCES curso(curso),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE padre (
    id_usuario INT(4) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    correo VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(100) NOT NULL,
    id_hijo INT(4),
    hijo VARCHAR(50),
    primer_login BOOLEAN DEFAULT true,
    FOREIGN KEY (id_hijo) REFERENCES alumno(id_usuario)
);

CREATE TABLE padre_hijo(
    id_relación INT(4) PRIMARY KEY AUTO_INCREMENT,
    id_padre INT(4),
    id_usuario INT(4),
    FOREIGN KEY (id_padre) REFERENCES padre(id_usuario),
    FOREIGN KEY (id_usuario) REFERENCES alumno(id_usuario)
);

CREATE TABLE calificaciones(
    id_calificaciones INT PRIMARY KEY AUTO_INCREMENT,
    id_alumno INT(4),
    alumno VARCHAR(50),
    id_materia INT(4),
    materia VARCHAR(50),
    primer_ev INT(2),
    segunda_ev INT(2),
    tercer_ev INT(2),
    actitud INT(2),
    comentario VARCHAR(100),
    FOREIGN KEY (id_materia) REFERENCES materia(id_materia),
    FOREIGN KEY (id_alumno) REFERENCES alumno(id_usuario)
);

CREATE TABLE materia_calif(
    id_materia INT(4),
    id_calificaciones INT,
    FOREIGN KEY (id_materia) REFERENCES materia(id_materia),
    FOREIGN KEY (id_calificaciones) REFERENCES calificaciones(id_calificaciones)
);

CREATE TABLE alum_calif(
    id_usuario INT(4),
    id_calificaciones INT,
    FOREIGN KEY (id_usuario) REFERENCES alumno(id_usuario),
    FOREIGN KEY (id_calificaciones) REFERENCES calificaciones(id_calificaciones)
);

CREATE TABLE alumno_curso(
    id_relacion INT(4) PRIMARY KEY,
    id_usuario INT(4),
    id_curso INT(4),
    FOREIGN KEY (id_usuario) REFERENCES alumno(id_usuario),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

/*CREATE TABLE incidencia(
    id_incidencia INT(4) PRIMARY KEY AUTO_INCREMENT,
    incidencia VARCHAR(100),
    id_usuario INT(4),
    fecha_incidencia DATE,
    hora TIME,
    tipo_incidencia VARCHAR(100), /Ausencia, retraso/
    descripcion VARCHAR(100),
    FOREIGN KEY (id_usuario) REFERENCES alumno(id_usuario)
);*/

CREATE TABLE alum_materia (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_alumno INT(4),
  id_materia INT(4),
  FOREIGN KEY (id_alumno) REFERENCES alumno(id_usuario),
  FOREIGN KEY (id_materia) REFERENCES materia(id_materia)
);

/* TRIGGERS */
/* INSERTS */
delimiter $$
CREATE TRIGGER insert_alumno AFTER INSERT ON usuario
FOR EACH ROW
BEGIN
   IF NEW.tipo_usuario = 'alumno' THEN
      INSERT INTO alumno (id_usuario, nombre, correo, contrasena)
      VALUES (NEW.id_usuario, NEW.nombre, NEW.correo, NEW.contrasena);
   END IF;
END$$
delimiter ;


delimiter $$
CREATE TRIGGER insert_padre AFTER INSERT ON usuario
FOR EACH ROW
BEGIN
   IF NEW.tipo_usuario = 'padre' THEN
      INSERT INTO padre (id_usuario, nombre, correo, contrasena)
      VALUES (NEW.id_usuario, NEW.nombre, NEW.correo, NEW.contrasena);
   END IF;
END$$
delimiter ;


delimiter $$
CREATE TRIGGER insert_profesor AFTER INSERT ON usuario
FOR EACH ROW
BEGIN
   IF NEW.tipo_usuario = 'profesor' THEN
      INSERT INTO profesor (id_usuario, nombre, correo, contrasena)
      VALUES (NEW.id_usuario, NEW.nombre, NEW.correo, NEW.contrasena);
   END IF;
END$$
delimiter ;


/* UPDATES */
/* USUARIO-PADRE */
delimiter $$
CREATE TRIGGER update_padre_usuario AFTER UPDATE ON usuario
FOR EACH ROW
BEGIN
        UPDATE padre SET nombre = NEW.nombre, correo = NEW.correo WHERE id_usuario = OLD.id_usuario;
END$$
delimiter ;

/* USUARIO-ALUMNO */
delimiter $$
CREATE TRIGGER update_alumno_usuario AFTER UPDATE ON usuario
FOR EACH ROW
BEGIN
      update alumno set nombre=(NEW.nombre), correo=(NEW.correo) where id_usuario=(OLD.id_usuario);
END$$
delimiter ;

/* USUARIO-PROFESOR */
delimiter $$
CREATE TRIGGER update_usuario_profesor AFTER UPDATE ON usuario
FOR EACH ROW
BEGIN
      update profesor set nombre=(NEW.nombre), correo=(NEW.correo) where id_usuario=(OLD.id_usuario);
END$$
delimiter ;

/* DELETES */
/* USUARIO-PADRE */
DELIMITER $$
CREATE TRIGGER delete_padre_usuario AFTER DELETE ON usuario
FOR EACH ROW
BEGIN
    DELETE FROM padre WHERE id_usuario = OLD.id_usuario;
    DELETE FROM calificaciones WHERE id_alumno = OLD.id_usuario;
END$$
DELIMITER ;


/* USUARIO-ALUMNO */
delimiter $$
CREATE TRIGGER delete_alumno_usuario AFTER DELETE ON usuario
FOR EACH ROW
BEGIN
    DELETE FROM alumno WHERE id_usuario=(OLD.id_usuario);
END$$
delimiter ;


/* USUARIO-PROFESOR */
delimiter $$
CREATE TRIGGER delete_usuario_profesor AFTER DELETE ON usuario
FOR EACH ROW
BEGIN
    DELETE FROM profesor WHERE id_usuario=(OLD.id_usuario);
END$$
delimiter ;

/*TRIGGERS CALIFICACIONES*/
/* INSERT */
DELIMITER $$
CREATE TRIGGER insert_alumno_trigger AFTER UPDATE ON alumno FOR EACH ROW
BEGIN
    INSERT INTO calificaciones (id_alumno, alumno, id_materia, materia, primer_ev, segunda_ev, tercer_ev)
    SELECT NEW.id_usuario, NEW.nombre, m.id_materia, m.materia, 0, 0, 0
    FROM materia m
    INNER JOIN curso c ON m.id_curso = c.id_curso
    WHERE c.curso = NEW.curso;
END$$
DELIMITER ;

/* UPDATE */
delimiter $$
CREATE TRIGGER insert_materia_calificaciones AFTER INSERT ON materia
FOR EACH ROW
BEGIN
      update calificaciones set id_materia=(NEW.id_materia), materia=(NEW.materia);
END$$
delimiter ;

/* TRIGGERS POR VER */
drop trigger update_profesor_materia_curso;

DELIMITER $$
CREATE TRIGGER update_profesor_materia_curso 
BEFORE INSERT ON materia
FOR EACH ROW
BEGIN
    SET NEW.id_curso = (SELECT id_curso FROM curso WHERE curso.curso = NEW.curso);
    SET NEW.id_profesor = (SELECT id_usuario FROM profesor WHERE profesor.nombre = NEW.profesor);
END$$
DELIMITER ;


drop trigger actualizar_id_profesor;

DELIMITER $$
CREATE TRIGGER actualizar_id_profesor
BEFORE UPDATE ON materia
FOR EACH ROW
BEGIN
    SET NEW.id_profesor = (SELECT id_usuario FROM profesor WHERE nombre = NEW.profesor);
END $$
DELIMITER ;

ALTER TABLE calificaciones ADD COLUMN nota_media FLOAT AS ((primer_ev + segunda_ev + tercer_ev) / 3) STORED; /* POSIBLE PROBLEMA */

/*---------------------------------------------------------------------------------*/
INSERT INTO curso (curso, tutor) VALUES ('ASIR1', 'Carlos');
INSERT INTO curso (curso, tutor) VALUES ('ASIR2', 'Jose');

INSERT INTO usuario (nombre, correo, contrasena, tipo_usuario) 
VALUES ('Carlos', 'carlos@gmail.com', MD5('carlos'), 'profesor');

INSERT INTO usuario (nombre, correo, contrasena, tipo_usuario) 
VALUES ('Jose', 'jose@gmail.com', MD5('josem'), 'profesor');

INSERT INTO materia (materia, profesor, curso) VALUES
    ('BBDD', 'Jose', 'ASIR1'),
    ('SO', 'Carlos', 'ASIR1');

INSERT INTO materia (materia, profesor, curso) VALUES
    ('ABBDD', 'Jose', 'ASIR2'),
    ('ASO', 'Crlos', 'ASIR2');

INSERT INTO usuario (nombre, correo, contrasena, tipo_usuario) 
VALUES ('Admin', 'admin@educados.com', MD5('admin'), 'admintech644394412');

INSERT INTO usuario (nombre, correo, contrasena, tipo_usuario) 
VALUES ('Sergio', 'sergio@gmail.com', MD5('sergio'), 'alumno');

INSERT INTO usuario (nombre, correo, contrasena, tipo_usuario) 
VALUES ('Ale', 'ale@gmail.com', MD5('alejandra'), 'alumno');

INSERT INTO usuario (nombre, correo, contrasena, tipo_usuario) 
VALUES ('Elena', 'elena@gmail.com', MD5('elena'), 'padre');

INSERT INTO usuario (nombre, correo, contrasena, tipo_usuario) 
VALUES ('Julio', 'julio@gmail.com', MD5('julio'), 'padre');


UPDATE alumno SET curso='ASIR1', id_curso=1 where id_usuario=4;

UPDATE alumno SET curso='ASIR2', id_curso=2 where id_usuario=5;

INSERT INTO usuario (nombre, correo, contrasena, tipo_usuario) 
VALUES ('Jordan', 'jordan@gmail.com', MD5('jordan'), 'alumno');

INSERT INTO usuario (nombre, correo, contrasena, tipo_usuario) 
VALUES ('Marcos', 'marcos@gmail.com', MD5('marcos'), 'alumno');

UPDATE alumno SET curso='ASIR1', id_curso=1 where correo='marcos@gmail.com';

UPDATE alumno SET curso='ASIR2', id_curso=2 where correo='jordan@gmail.com';

UPDATE calificaciones SET primer_ev = '5', comentario = 'Trabajador', actitud = '10' WHERE id_alumno =9 and materia = 'BBDD';

UPDATE calificaciones SET segunda_ev = '5', comentario = 'Trabajador', actitud = '10' WHERE id_alumno = 9 and materia = 'BBDD';

UPDATE calificaciones SET tercer_ev = '5', comentario = 'Trabajador', actitud = '10' WHERE id_alumno = 9 and materia = 'BBDD';

UPDATE calificaciones SET primer_ev = '5', comentario = 'Trabajador', actitud = '10' WHERE id_alumno = 9 and materia = 'SO';

UPDATE calificaciones SET segunda_ev = '5', comentario = 'Trabajador', actitud = '10' WHERE id_alumno = 9 and materia = 'SO';

UPDATE calificaciones SET tercer_ev = '5', comentario = 'Trabajador', actitud = '10' WHERE id_alumno = 9 and materia = 'SO';

UPDATE padre SET id_hijo = "4", hijo = "Sergio" where id_usuario="6";

INSERT INTO usuario (nombre, correo, contrasena, tipo_usuario) 
VALUES ('SERGIO', 'acostaguijarrosergio@gmail.com', MD5('sergio'), 'alumno');

UPDATE alumno SET curso='ASIR1', id_curso=1 where correo='acostaguijarrosergio@gmail.com';

UPDATE padre SET id_hijo = "10", hijo = "SERGIO" where id_usuario="10";

---------------------------------------------------------------------------------
/* TRIGGERS */
/*
INSERTS 
DROP TRIGGER IF EXISTS insert_alumno;
DROP TRIGGER IF EXISTS insert_padre;
DROP TRIGGER IF EXISTS insert_profesor;

UPDATE
DROP TRIGGER IF EXISTS update_padre_usuario;
DROP TRIGGER IF EXISTS update_alumno_usuario;
DROP TRIGGER IF EXISTS update_usuario_profesor;

DELETES
DROP TRIGGER IF EXISTS delete_padre_usuario;
DROP TRIGGER IF EXISTS delete_alumno_usuario;
DROP TRIGGER IF EXISTS delete_usuario_profesor;

/TRIGGERS CALIFICACIONES/
INSERT
DROP TRIGGER IF EXISTS insert_calificaciones;

UPDATE
DROP TRIGGER IF EXISTS insert_materia_calificaciones;
*/