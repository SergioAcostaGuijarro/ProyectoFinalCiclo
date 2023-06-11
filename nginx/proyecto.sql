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
    contraseña VARCHAR(100) NOT NULL,
    tipo_usuario VARCHAR(20) NOT NULL
);

CREATE TABLE profesor(
    id_usuario INT(4) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    correo VARCHAR(100) NOT NULL UNIQUE,
    contraseña VARCHAR(100) NOT NULL
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
    contraseña VARCHAR(100) NOT NULL,
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
    contraseña VARCHAR(100) NOT NULL,
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
      INSERT INTO alumno (id_usuario, nombre, correo, contraseña)
      VALUES (NEW.id_usuario, NEW.nombre, NEW.correo, NEW.contraseña);
   END IF;
END$$
delimiter ;


delimiter $$
CREATE TRIGGER insert_padre AFTER INSERT ON usuario
FOR EACH ROW
BEGIN
   IF NEW.tipo_usuario = 'padre' THEN
      INSERT INTO padre (id_usuario, nombre, correo, contraseña)
      VALUES (NEW.id_usuario, NEW.nombre, NEW.correo, NEW.contraseña);
   END IF;
END$$
delimiter ;


delimiter $$
CREATE TRIGGER insert_profesor AFTER INSERT ON usuario
FOR EACH ROW
BEGIN
   IF NEW.tipo_usuario = 'profesor' THEN
      INSERT INTO profesor (id_usuario, nombre, correo, contraseña)
      VALUES (NEW.id_usuario, NEW.nombre, NEW.correo, NEW.contraseña);
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

ALTER TABLE calificaciones ADD COLUMN nota_media
FLOAT AS ((primer_ev + segunda_ev + tercer_ev) / 3) STORED; /* POSIBLE PROBLEMA */

/*---------------------------------------------------------------------------------*/
/*ADMIN*/
INSERT INTO usuario (nombre, correo, contraseña, tipo_usuario)
VALUES ('Admin', 'admin@educados.com', MD5('admin'), 'admintech644394412');

/*BASE DE DATOS DE 58 ALUMNOS(3 CLASES, 20 POR CLASE)*/
INSERT INTO usuario (nombre, correo, contraseña, tipo_usuario)
VALUES
('Juan Pérez', 'juanperez@gmail.com', MD5('Juan Pérez'), 'alumno'),
('María Rodríguez', 'maria.rodriguez@gmail.com', MD5('María Rodríguez'), 'alumno'),
('Luis García', 'luisgarcia@gmail.com', MD5('Luis García'), 'alumno'),
('Ana Martínez', 'anamartinez@gmail.com', MD5('Ana Martínez'), 'alumno'),
('Carlos López', 'carloslopez@gmail.com', MD5('Carlos López'), 'alumno'),
('Laura Sánchez', 'laurasanchez@gmail.com', MD5('Laura Sánchez'), 'alumno'),
('Pedro González', 'pedrogonzalez@gmail.com', MD5('Pedro González'), 'alumno'),
('Paula Torres', 'paulatorres@gmail.com', MD5('Paula Torres'), 'alumno'),
('Javier Ramírez', 'javierramirez@gmail.com', MD5('Javier Ramírez'), 'alumno'),
('Sofía Vargas', 'sofiavargas@gmail.com', MD5('Sofía Vargas'), 'alumno'),
('Diego Morales', 'diegomorales@gmail.com', MD5('Diego Morales'), 'alumno'),
('Valentina Gómez', 'valentinagomez@gmail.com', MD5('Valentina Gómez'), 'alumno'),
('Manuel Castro', 'manuelcastro@gmail.com', MD5('Manuel Castro'), 'alumno'),
('Lucía Herrera', 'luciaherrera@gmail.com', MD5('Lucía Herrera'), 'alumno'),
('Daniel Peralta', 'danielperalta@gmail.com', MD5('Daniel Peralta'), 'alumno'),
('Camila Ríos', 'camilarios@gmail.com', MD5('Camila Ríos'), 'alumno'),
('Miguel Silva', 'miguelsilva@gmail.com', MD5('Miguel Silva'), 'alumno'),
('Isabella Ortega', 'isabellaortega@gmail.com', MD5('Isabella Ortega'), 'alumno'),
('Fernando Soto', 'fernandosoto@gmail.com', MD5('Fernando Soto'), 'alumno'),
('Victoria Cordero', 'victoriacordero@gmail.com', MD5('Victoria Cordero'), 'alumno'),
('Andrés Navarro', 'andresnavarro@gmail.com', MD5('Andrés Navarro'), 'alumno'),
('Gabriela Rivas', 'gabrielarivas@gmail.com', MD5('Gabriela Rivas'), 'alumno'),
('Alejandro Fuentes', 'alejandrofuentes@gmail.com', MD5('Alejandro Fuentes'), 'alumno'),
('Catalina Castro', 'catalinacastro@gmail.com', MD5('Catalina Castro'), 'alumno'),
('Emilio Varela', 'emiliovarela@gmail.com', MD5('Emilio Varela'), 'alumno'),
('Josefina Medina', 'josefinamedina@gmail.com', MD5('Josefina Medina'), 'alumno'),
('Hugo Guzmán', 'hugoguzman@gmail.com', MD5('Hugo Guzmán'), 'alumno'),
('Antonella Soto', 'antonellasoto@gmail.com', MD5('Antonella Soto'), 'alumno'),
('Sebastián Montes', 'sebastianmontes@gmail.com', MD5('Sebastián Montes'), 'alumno'),
('Valeria Vargas', 'valeriavargas@gmail.com', MD5('Valeria Vargas'), 'alumno'),
('Felipe Ramírez', 'feliperamirez@gmail.com', MD5('Felipe Ramírez'), 'alumno'),
('Constanza Ríos', 'constanzarios@gmail.com', MD5('Constanza Ríos'), 'alumno'),
('Nicolás Pizarro', 'nicolaspizarro@gmail.com', MD5('Nicolás Pizarro'), 'alumno'),
('Sara Cortés', 'saracortes@gmail.com', MD5('Sara Cortés'), 'alumno'),
('Matías Ríos', 'matiasrios@gmail.com', MD5('Matías Ríos'), 'alumno'),
('Amanda Contreras', 'amandacontreras@gmail.com', MD5('Amanda Contreras'), 'alumno'),
('Diego Araya', 'diegoaraya@gmail.com', MD5('Diego Araya'), 'alumno'),
('Gabriela Muñoz', 'gabrielamunoz@gmail.com', MD5('Gabriela Muñoz'), 'alumno'),
('Andrea Orellana', 'andreaorellana@gmail.com', MD5('Andrea Orellana'), 'alumno'),
('Felipe Briceño', 'felipebriceno@gmail.com', MD5('Felipe Briceño'), 'alumno'),
('Josefa Rojas', 'josefarojas@gmail.com', MD5('Josefa Rojas'), 'alumno'),
('Ignacio Leiva', 'ignacioleiva@gmail.com', MD5('Ignacio Leiva'), 'alumno'),
('Isidora Valenzuela', 'isidoravalenzuela@gmail.com', MD5('Isidora Valenzuela'), 'alumno'),
('Bastián Fuentes', 'bastianfuentes@gmail.com', MD5('Bastián Fuentes'), 'alumno'),
('Francisca Sánchez', 'franciscasanchez@gmail.com', MD5('Francisca Sánchez'), 'alumno'),
('Tomás Castro', 'tomascastro@gmail.com', MD5('Tomás Castro'), 'alumno'),
('María José González', 'mariajosegonzalez@gmail.com', MD5('María José González'), 'alumno'),
('Benjamín Herrera', 'benjaminherrera@gmail.com', MD5('Benjamín Herrera'), 'alumno'),
('Trinidad Silva', 'trinidadsilva@gmail.com', MD5('Trinidad Silva'), 'alumno'),
('Maximiliana Ríos', 'maximilianarios@gmail.com', MD5('Maximiliana Ríos'), 'alumno'),
('Felipe Montes', 'felipemontes@gmail.com', MD5('Felipe Montes'), 'alumno'),
('Valentina Varela', 'valentinavarela@gmail.com', MD5('Valentina Varela'), 'alumno'),
('Cristóbal Castro', 'cristobalcastro@gmail.com', MD5('Cristóbal Castro'), 'alumno'),
('Francisca González', 'franciscagonzalez@gmail.com', MD5('Francisca González'), 'alumno'),
('Rodrigo Guzmán', 'rodrigoguzman@gmail.com', MD5('Rodrigo Guzmán'), 'alumno'),
('Javiera Muñoz', 'javieramunoz@gmail.com', MD5('Javiera Muñoz'), 'alumno'),
('Matías Orellana', 'matiasorellana@gmail.com', MD5('Matías Orellana'), 'alumno'),
('Antonia Briceño', 'antoniabriceno@gmail.com', MD5('Antonia Briceño'), 'alumno'),
('Emilio Araya', 'emilioaraya@gmail.com', MD5('Emilio Araya'), 'alumno'),
('Florencia Cortés', 'florenciacortes@gmail.com', MD5('Florencia Cortés'), 'alumno'),
('Tomás Contreras', 'tomascontreras@gmail.com', MD5('Tomás Contreras'), 'alumno'),
('Valentina Muñoz', 'valentinamunoz@gmail.com', MD5('Valentina Muñoz'), 'alumno');

/*Profesores*/
INSERT INTO usuario (nombre, correo, contraseña, tipo_usuario)
VALUES ('Carlos', 'carlos@gmail.com', MD5('carlos'), 'profesor');
INSERT INTO usuario (nombre, correo, contraseña, tipo_usuario)
VALUES ('Jose', 'jose@gmail.com', MD5('josem'), 'profesor');


/*18 Padres*/
INSERT INTO usuario (nombre, correo, contraseña, tipo_usuario)
VALUES
('Juan Pérez', 'juanperez@gmail.com', MD5('Juan Pérez'), 'padre'),
('María Rodríguez', 'maria.rodriguez@gmail.com', MD5('María Rodríguez'), 'padre'),
('Luis García', 'luisgarcia@gmail.com', MD5('Luis García'), 'padre'),
('Ana Martínez', 'anamartinez@gmail.com', MD5('Ana Martínez'), 'padre'),
('Carlos López', 'carloslopez@gmail.com', MD5('Carlos López'), 'padre'),
('Laura Sánchez', 'laurasanchez@gmail.com', MD5('Laura Sánchez'), 'padre'),
('Pedro González', 'pedrogonzalez@gmail.com', MD5('Pedro González'), 'padre'),
('Paula Torres', 'paulatorres@gmail.com', MD5('Paula Torres'), 'padre'),
('Javier Ramírez', 'javierramirez@gmail.com', MD5('Javier Ramírez'), 'padre'),
('Sofía Vargas', 'sofiavargas@gmail.com', MD5('Sofía Vargas'), 'padre'),
('Diego Morales', 'diegomorales@gmail.com', MD5('Diego Morales'), 'padre'),
('Valentina Gómez', 'valentinagomez@gmail.com', MD5('Valentina Gómez'), 'padre'),
('Manuel Castro', 'manuelcastro@gmail.com', MD5('Manuel Castro'), 'padre'),
('Lucía Herrera', 'luciaherrera@gmail.com', MD5('Lucía Herrera'), 'padre'),
('Daniel Peralta', 'danielperalta@gmail.com', MD5('Daniel Peralta'), 'padre'),
('Camila Ríos', 'camilarios@gmail.com', MD5('Camila Ríos'), 'padre'),
('Miguel Silva', 'miguelsilva@gmail.com', MD5('Miguel Silva'), 'padre'),
('Isabella Ortega', 'isabellaortega@gmail.com', MD5('Isabella Ortega'), 'padre'),
('Julio', 'julio@gmail.com', MD5('julio'), 'padre');

/*CURSOS*/
INSERT INTO curso (curso, tutor) VALUES ('ASIR1', 'Carlos');
INSERT INTO curso (curso, tutor) VALUES ('ASIR2', 'Jose');
INSERT INTO curso (curso, tutor) VALUES ('BACH', 'Marta');

INSERT INTO materia (materia, profesor, curso) VALUES
    ('BBDD', 'Jose', 'ASIR1'),
    ('SO', 'Carlos', 'ASIR1'),
    ('REDES', 'Samuel', 'ASIR1'),
    ('FOL', 'Camacho', 'ASIR1');

/*MATERIAS*/
INSERT INTO materia (materia, profesor, curso) VALUES
    ('ABBDD', 'Jose', 'ASIR2'),
    ('SERVICIOS', 'Jose', 'ASIR2'),
    ('INGLÉS', 'Maria', 'ASIR2'),
    ('ASO', 'Carlos', 'ASIR2');

INSERT INTO materia (materia, profesor, curso) VALUES
    ('ABBDD', 'Marta', 'BACH'),
    ('SERVICIOS', 'Cristina', 'BACH'),
    ('Religión', 'Santiago', 'BACH'),
    ('Geografía', 'Anselmo', 'BACH');

/*Curso para cada alumno*/
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='juanperez@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='maria.rodriguez@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='luisgarcia@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='anamartinez@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='carloslopez@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='laurasanchez@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='pedrogonzalez@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='paulatorres@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='javierramirez@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='sofiavargas@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='diegomorales@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='valentinagomez@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='manuelcastro@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='luciaherrera@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='danielperalta@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='camilarios@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='miguelsilva@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='isabellaortega@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='fernandosoto@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='victoriacordero@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='andresnavarro@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='gabrielarivas@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='alejandrofuentes@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='catalinacastro@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='emiliovarela@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='josefinamedina@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='hugoguzman@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='antonellasoto@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='sebastianmontes@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='valeriavargas@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='feliperamirez@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='constanzarios@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='nicolaspizarro@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='saracortes@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='matiasrios@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='amandacontreras@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='diegoaraya@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='gabrielamunoz@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='andreaorellana@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='felipebriceno@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='josefarojas@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='ignacioleiva@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='isidoravalenzuela@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='bastianfuentes@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='franciscasanchez@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='tomascastro@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='mariajosegonzalez@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='benjaminherrera@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='trinidadsilva@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='maximilianarios@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='felipemontes@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='valentinavarela@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='cristobalcastro@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='franciscagonzalez@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='rodrigoguzman@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='javieramunoz@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='matiasorellana@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='antoniabriceno@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='emilioaraya@gmail.com';
UPDATE alumno SET curso='BACH', id_curso=3 WHERE correo='florenciacortes@gmail.com';
UPDATE alumno SET curso='ASIR1', id_curso=1 WHERE correo='tomascontreras@gmail.com';
UPDATE alumno SET curso='ASIR2', id_curso=2 WHERE correo='valentinamunoz@gmail.com';

/*NOTAS*/
UPDATE calificaciones
SET primer_ev = FLOOR(RAND() * 11),
    segunda_ev = FLOOR(RAND() * 11),
    tercer_ev = FLOOR(RAND() * 11),
    comentario = CONCAT('Comportamiento ', ELT(FLOOR(RAND() * 5) + 1, 'excelente', 'bueno', 'regular', 'insatisfactorio', 'malo'))
WHERE id_materia IN (SELECT id_materia FROM materia WHERE curso = 'ASIR1');


UPDATE calificaciones
SET primer_ev = FLOOR(RAND() * 11),
    segunda_ev = FLOOR(RAND() * 11),
    tercer_ev = FLOOR(RAND() * 11),
    comentario = CONCAT('Comportamiento ', ELT(FLOOR(RAND() * 5) + 1, 'excelente', 'bueno', 'regular', 'insatisfactorio', 'malo'))
WHERE id_materia IN (SELECT id_materia FROM materia WHERE curso = 'ASIR2');


UPDATE calificaciones
SET primer_ev = FLOOR(RAND() * 11),
    segunda_ev = FLOOR(RAND() * 11),
    tercer_ev = FLOOR(RAND() * 11),
    comentario = CONCAT('Comportamiento ', ELT(FLOOR(RAND() * 5) + 1, 'excelente', 'bueno', 'regular', 'insatisfactorio', 'malo'))
WHERE id_materia IN (SELECT id_materia FROM materia WHERE curso = 'BACH');