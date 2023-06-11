-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 09-06-2023 a las 20:51:36
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `educados`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id_usuario` int(4) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `id_curso` int(4) DEFAULT NULL,
  `curso` varchar(50) DEFAULT NULL,
  `primer_login` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id_usuario`, `nombre`, `correo`, `contraseña`, `id_curso`, `curso`, `primer_login`) VALUES
(2, 'Juan Pérez', 'juanperez@gmail.com', 'b851aa881dd8d23d37eabc83dce1d1fc', 1, 'ASIR1', 1),
(3, 'María Rodríguez', 'maria.rodriguez@gmail.com', '64775da9206a8e87493aa638fc49981b', 2, 'ASIR2', 1),
(4, 'Luis García', 'luisgarcia@gmail.com', '23c92265ae817fb5e7f53e2ad7a9c760', 3, 'BACH', 1),
(5, 'Ana Martínez', 'anamartinez@gmail.com', 'b4e0c0405cf20f83e3f55019d3c9eb79', 1, 'ASIR1', 1),
(6, 'Carlos López', 'carloslopez@gmail.com', '55292574715e303b329c4c9089f3eea5', 2, 'ASIR2', 1),
(7, 'Laura Sánchez', 'laurasanchez@gmail.com', '4a0fc763e4abb007cfc8a24152538101', 3, 'BACH', 1),
(8, 'Pedro González', 'pedrogonzalez@gmail.com', 'c8ed56f7bfb18bcaeca3a88618009acb', 1, 'ASIR1', 1),
(9, 'Paula Torres', 'paulatorres@gmail.com', '5595dece79877f9fe188eacfd44f6f8e', 2, 'ASIR2', 1),
(10, 'Javier Ramírez', 'javierramirez@gmail.com', '5b92d5acb15d9bbc01ec59d249a4a31e', 3, 'BACH', 1),
(11, 'Sofía Vargas', 'sofiavargas@gmail.com', '8bf6f4a269685dc836ebe599f5922af6', 1, 'ASIR1', 1),
(12, 'Diego Morales', 'diegomorales@gmail.com', 'ddb7647ee3d823ea5e5d4699156d9bb1', 2, 'ASIR2', 1),
(13, 'Valentina Gómez', 'valentinagomez@gmail.com', '10ef7feb1e9b87257575a18e1171a027', 3, 'BACH', 1),
(14, 'Manuel Castro', 'manuelcastro@gmail.com', '6fb561ad9fc2dc2601705e6cf3ac6511', 1, 'ASIR1', 1),
(15, 'Lucía Herrera', 'luciaherrera@gmail.com', '5298cd321a6b08a5438895f508e75019', 2, 'ASIR2', 1),
(16, 'Daniel Peralta', 'danielperalta@gmail.com', 'dde7867f7c285e9367e29671debab75a', 3, 'BACH', 1),
(17, 'Camila Ríos', 'camilarios@gmail.com', '99ec6fe185e010800bdd6beb3d1e9426', 1, 'ASIR1', 1),
(18, 'Miguel Silva', 'miguelsilva@gmail.com', 'b5e10f85a97a4c6ae6ea7565b23e9313', 2, 'ASIR2', 1),
(19, 'Isabella Ortega', 'isabellaortega@gmail.com', '2420c2616097584d9176b602c4ef4941', 3, 'BACH', 1),
(20, 'Fernando Soto', 'fernandosoto@gmail.com', '51275a47df0ab7f4b5a769b3c99f7e4e', 1, 'ASIR1', 1),
(21, 'Victoria Cordero', 'victoriacordero@gmail.com', '89fb9d3508dca01f65be18295d18ee3d', 2, 'ASIR2', 1),
(22, 'Andrés Navarro', 'andresnavarro@gmail.com', 'd1b10af1b5fac1bd7edc07aaed0e7dac', 3, 'BACH', 1),
(23, 'Gabriela Rivas', 'gabrielarivas@gmail.com', '0cc548991deedaa736dff7d763e125c0', 1, 'ASIR1', 1),
(24, 'Alejandro Fuentes', 'alejandrofuentes@gmail.com', 'e45b5c13944e49e69efc1c198a49aaf1', 2, 'ASIR2', 1),
(25, 'Catalina Castro', 'catalinacastro@gmail.com', '9f6ed2021127e5472b7ab2cb6686a26e', 3, 'BACH', 1),
(26, 'Emilio Varela', 'emiliovarela@gmail.com', '4b6b599986c469d9b857080290eddd49', 1, 'ASIR1', 1),
(27, 'Josefina Medina', 'josefinamedina@gmail.com', 'e7f52e90975e3289e2f269ac50a0c1b9', 2, 'ASIR2', 1),
(28, 'Hugo Guzmán', 'hugoguzman@gmail.com', '8486641f23e784d132178ddaffda05c2', 3, 'BACH', 1),
(29, 'Antonella Soto', 'antonellasoto@gmail.com', 'a209b8bd8cc3890daab5e0a232a68dc2', 1, 'ASIR1', 1),
(30, 'Sebastián Montes', 'sebastianmontes@gmail.com', '010e0c33ab70dd1923677c11737ef6fe', 2, 'ASIR2', 1),
(31, 'Valeria Vargas', 'valeriavargas@gmail.com', 'fac2e42c507337641d90a5cefa3d938e', 3, 'BACH', 1),
(32, 'Felipe Ramírez', 'feliperamirez@gmail.com', '2be875ec0a292b3b6251b694a37ec9bb', 1, 'ASIR1', 1),
(33, 'Constanza Ríos', 'constanzarios@gmail.com', 'f533740f2aeb29f0d0e33d6ab5906162', 2, 'ASIR2', 1),
(34, 'Nicolás Pizarro', 'nicolaspizarro@gmail.com', '3f2e758c1936ee17fd6e94e26d9211fd', 3, 'BACH', 1),
(35, 'Sara Cortés', 'saracortes@gmail.com', '4178aa123e5deed3dd853bfca414342f', 1, 'ASIR1', 1),
(36, 'Matías Ríos', 'matiasrios@gmail.com', '51d51e5b771668364bf0ba25e306ec3c', 2, 'ASIR2', 1),
(37, 'Amanda Contreras', 'amandacontreras@gmail.com', 'c145794cf85a529e89deaae44286a2a5', 3, 'BACH', 1),
(38, 'Diego Araya', 'diegoaraya@gmail.com', '9d3a763a2b3d52a62bdfeb263a5f5c7b', 1, 'ASIR1', 1),
(39, 'Gabriela Muñoz', 'gabrielamunoz@gmail.com', '5e7fde7f15f8b2a9b3368c63eb3acd66', 2, 'ASIR2', 1),
(40, 'Andrea Orellana', 'andreaorellana@gmail.com', '925e724a7a74ff125aa023a62dd4dda9', 3, 'BACH', 1),
(41, 'Felipe Briceño', 'felipebriceno@gmail.com', '37f927358cf1502fbb9990112e2ddc6c', 1, 'ASIR1', 1),
(42, 'Josefa Rojas', 'josefarojas@gmail.com', '837247465167078fc9188a06eac3a880', 2, 'ASIR2', 1),
(43, 'Ignacio Leiva', 'ignacioleiva@gmail.com', '41aa2b61abb2f55d9ee58a942deb1ec5', 3, 'BACH', 1),
(44, 'Isidora Valenzuela', 'isidoravalenzuela@gmail.com', '0785ea8330421600a135b3d7383d002f', 1, 'ASIR1', 1),
(45, 'Bastián Fuentes', 'bastianfuentes@gmail.com', '8f16b8aa43a2f145476622e1e0c841b2', 2, 'ASIR2', 1),
(46, 'Francisca Sánchez', 'franciscasanchez@gmail.com', '0eae892bd61da214b4b9397ece1eea28', 3, 'BACH', 1),
(47, 'Tomás Castro', 'tomascastro@gmail.com', 'babf2672f7c55711436bfc75725cc82e', 1, 'ASIR1', 1),
(48, 'María José González', 'mariajosegonzalez@gmail.com', '660b99cbf037956f0db886556fc3c5b1', 2, 'ASIR2', 1),
(49, 'Benjamín Herrera', 'benjaminherrera@gmail.com', '94c9876a42b5ec94eaa7dccc14ad26eb', 3, 'BACH', 1),
(50, 'Trinidad Silva', 'trinidadsilva@gmail.com', '7bc15b64006a1a7c9fba677da856713a', 1, 'ASIR1', 1),
(51, 'Maximiliana Ríos', 'maximilianarios@gmail.com', '670507cf0c4c5a48d0b6f746552eb861', 2, 'ASIR2', 1),
(52, 'Felipe Montes', 'felipemontes@gmail.com', 'f9597b55a4974461c869109f2fe2f8e1', 3, 'BACH', 1),
(53, 'Valentina Varela', 'valentinavarela@gmail.com', 'efdb977a585913e21e6fab04ff79c86c', 1, 'ASIR1', 1),
(54, 'Cristóbal Castro', 'cristobalcastro@gmail.com', '1715369f3fe987e36f990de4526b9a15', 2, 'ASIR2', 1),
(55, 'Francisca González', 'franciscagonzalez@gmail.com', 'e271875784afcd31482159c6413f276f', 3, 'BACH', 1),
(56, 'Rodrigo Guzmán', 'rodrigoguzman@gmail.com', 'fc3bcd2744d7c57ae09657d02d49423a', 1, 'ASIR1', 1),
(57, 'Javiera Muñoz', 'javieramunoz@gmail.com', '4ece0f3e36b999eeeabc1705e8d86d86', 2, 'ASIR2', 1),
(58, 'Matías Orellana', 'matiasorellana@gmail.com', '5cefe3feb06ce513b9b1643277beb172', 3, 'BACH', 1),
(59, 'Antonia Briceño', 'antoniabriceno@gmail.com', '2dd9b863ea75b83123e09da08ee6c00b', 1, 'ASIR1', 1),
(60, 'Emilio Araya', 'emilioaraya@gmail.com', '53d8fbe6551d7bf4d9b3a015d6a86dc3', 2, 'ASIR2', 1),
(61, 'Florencia Cortés', 'florenciacortes@gmail.com', '114670e11de849f85a84ad6e222b0c00', 3, 'BACH', 1),
(62, 'Tomás Contreras', 'tomascontreras@gmail.com', 'e5096dd2b010b88cea3d2bfeb6b4f765', 1, 'ASIR1', 1),
(63, 'Valentina Muñoz', 'valentinamunoz@gmail.com', '7b08893d709c21ac3bad7e29baab98b0', 2, 'ASIR2', 1);

--
-- Disparadores `alumno`
--
DELIMITER $$
CREATE TRIGGER `insert_alumno_trigger` AFTER UPDATE ON `alumno` FOR EACH ROW BEGIN
    INSERT INTO calificaciones (id_alumno, alumno, id_materia, materia, primer_ev, segunda_ev, tercer_ev)
    SELECT NEW.id_usuario, NEW.nombre, m.id_materia, m.materia, 0, 0, 0
    FROM materia m
    INNER JOIN curso c ON m.id_curso = c.id_curso
    WHERE c.curso = NEW.curso;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_curso`
--

CREATE TABLE `alumno_curso` (
  `id_relacion` int(4) NOT NULL,
  `id_usuario` int(4) DEFAULT NULL,
  `id_curso` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alum_calif`
--

CREATE TABLE `alum_calif` (
  `id_usuario` int(4) DEFAULT NULL,
  `id_calificaciones` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alum_materia`
--

CREATE TABLE `alum_materia` (
  `id` int(11) NOT NULL,
  `id_alumno` int(4) DEFAULT NULL,
  `id_materia` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id_calificaciones` int(11) NOT NULL,
  `id_alumno` int(4) DEFAULT NULL,
  `alumno` varchar(50) DEFAULT NULL,
  `id_materia` int(4) DEFAULT NULL,
  `materia` varchar(50) DEFAULT NULL,
  `primer_ev` int(2) DEFAULT NULL,
  `segunda_ev` int(2) DEFAULT NULL,
  `tercer_ev` int(2) DEFAULT NULL,
  `actitud` int(2) DEFAULT NULL,
  `comentario` varchar(100) DEFAULT NULL,
  `nota_media` float GENERATED ALWAYS AS ((((`primer_ev` + `segunda_ev`) + `tercer_ev`) / 3)) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`id_calificaciones`, `id_alumno`, `alumno`, `id_materia`, `materia`, `primer_ev`, `segunda_ev`, `tercer_ev`, `actitud`, `comentario`) VALUES
(1, 2, 'Juan Pérez', 1, 'BBDD', 5, 9, 9, NULL, 'Comportamiento malo'),
(2, 2, 'Juan Pérez', 2, 'SO', 6, 6, 9, NULL, 'Comportamiento regular'),
(3, 2, 'Juan Pérez', 3, 'REDES', 4, 3, 4, NULL, 'Comportamiento malo'),
(4, 2, 'Juan Pérez', 4, 'FOL', 3, 9, 3, NULL, 'Comportamiento malo'),
(8, 3, 'María Rodríguez', 5, 'ABBDD', 3, 7, 2, NULL, 'Comportamiento bueno'),
(9, 3, 'María Rodríguez', 6, 'SERVICIOS', 10, 8, 1, NULL, 'Comportamiento excelente'),
(10, 3, 'María Rodríguez', 7, 'INGLÉS', 0, 0, 2, NULL, 'Comportamiento malo'),
(11, 3, 'María Rodríguez', 8, 'ASO', 2, 1, 0, NULL, 'Comportamiento insatisfactorio'),
(15, 4, 'Luis García', 9, 'ABBDD', 9, 4, 1, NULL, 'Comportamiento regular'),
(16, 4, 'Luis García', 10, 'SERVICIOS', 6, 0, 5, NULL, 'Comportamiento regular'),
(17, 4, 'Luis García', 11, 'Religión', 9, 10, 1, NULL, 'Comportamiento insatisfactorio'),
(18, 4, 'Luis García', 12, 'Geografía', 10, 7, 8, NULL, 'Comportamiento malo'),
(22, 5, 'Ana Martínez', 1, 'BBDD', 0, 3, 4, NULL, 'Comportamiento bueno'),
(23, 5, 'Ana Martínez', 2, 'SO', 0, 4, 10, NULL, 'Comportamiento regular'),
(24, 5, 'Ana Martínez', 3, 'REDES', 3, 5, 3, NULL, 'Comportamiento excelente'),
(25, 5, 'Ana Martínez', 4, 'FOL', 1, 9, 9, NULL, 'Comportamiento regular'),
(29, 6, 'Carlos López', 5, 'ABBDD', 3, 7, 5, NULL, 'Comportamiento bueno'),
(30, 6, 'Carlos López', 6, 'SERVICIOS', 9, 6, 3, NULL, 'Comportamiento malo'),
(31, 6, 'Carlos López', 7, 'INGLÉS', 9, 5, 8, NULL, 'Comportamiento bueno'),
(32, 6, 'Carlos López', 8, 'ASO', 0, 4, 0, NULL, 'Comportamiento insatisfactorio'),
(36, 7, 'Laura Sánchez', 9, 'ABBDD', 0, 5, 2, NULL, 'Comportamiento insatisfactorio'),
(37, 7, 'Laura Sánchez', 10, 'SERVICIOS', 2, 7, 9, NULL, 'Comportamiento bueno'),
(38, 7, 'Laura Sánchez', 11, 'Religión', 1, 4, 10, NULL, 'Comportamiento bueno'),
(39, 7, 'Laura Sánchez', 12, 'Geografía', 9, 2, 5, NULL, 'Comportamiento malo'),
(43, 8, 'Pedro González', 1, 'BBDD', 2, 4, 5, NULL, 'Comportamiento excelente'),
(44, 8, 'Pedro González', 2, 'SO', 2, 8, 0, NULL, 'Comportamiento malo'),
(45, 8, 'Pedro González', 3, 'REDES', 8, 0, 10, NULL, 'Comportamiento regular'),
(46, 8, 'Pedro González', 4, 'FOL', 9, 5, 0, NULL, 'Comportamiento regular'),
(50, 9, 'Paula Torres', 5, 'ABBDD', 9, 0, 6, NULL, 'Comportamiento insatisfactorio'),
(51, 9, 'Paula Torres', 6, 'SERVICIOS', 2, 8, 2, NULL, 'Comportamiento insatisfactorio'),
(52, 9, 'Paula Torres', 7, 'INGLÉS', 1, 3, 3, NULL, 'Comportamiento insatisfactorio'),
(53, 9, 'Paula Torres', 8, 'ASO', 0, 5, 4, NULL, 'Comportamiento regular'),
(57, 10, 'Javier Ramírez', 9, 'ABBDD', 0, 3, 5, NULL, 'Comportamiento regular'),
(58, 10, 'Javier Ramírez', 10, 'SERVICIOS', 1, 1, 2, NULL, 'Comportamiento insatisfactorio'),
(59, 10, 'Javier Ramírez', 11, 'Religión', 1, 4, 5, NULL, 'Comportamiento bueno'),
(60, 10, 'Javier Ramírez', 12, 'Geografía', 7, 10, 5, NULL, 'Comportamiento insatisfactorio'),
(64, 11, 'Sofía Vargas', 1, 'BBDD', 8, 0, 2, NULL, 'Comportamiento insatisfactorio'),
(65, 11, 'Sofía Vargas', 2, 'SO', 9, 4, 5, NULL, 'Comportamiento bueno'),
(66, 11, 'Sofía Vargas', 3, 'REDES', 5, 0, 8, NULL, 'Comportamiento regular'),
(67, 11, 'Sofía Vargas', 4, 'FOL', 3, 2, 10, NULL, 'Comportamiento excelente'),
(71, 12, 'Diego Morales', 5, 'ABBDD', 5, 9, 8, NULL, 'Comportamiento excelente'),
(72, 12, 'Diego Morales', 6, 'SERVICIOS', 5, 1, 0, NULL, 'Comportamiento insatisfactorio'),
(73, 12, 'Diego Morales', 7, 'INGLÉS', 7, 2, 1, NULL, 'Comportamiento excelente'),
(74, 12, 'Diego Morales', 8, 'ASO', 10, 4, 1, NULL, 'Comportamiento regular'),
(78, 13, 'Valentina Gómez', 9, 'ABBDD', 9, 4, 4, NULL, 'Comportamiento malo'),
(79, 13, 'Valentina Gómez', 10, 'SERVICIOS', 0, 7, 1, NULL, 'Comportamiento insatisfactorio'),
(80, 13, 'Valentina Gómez', 11, 'Religión', 4, 9, 9, NULL, 'Comportamiento insatisfactorio'),
(81, 13, 'Valentina Gómez', 12, 'Geografía', 7, 6, 7, NULL, 'Comportamiento malo'),
(85, 14, 'Manuel Castro', 1, 'BBDD', 5, 4, 4, NULL, 'Comportamiento excelente'),
(86, 14, 'Manuel Castro', 2, 'SO', 9, 2, 5, NULL, 'Comportamiento malo'),
(87, 14, 'Manuel Castro', 3, 'REDES', 6, 6, 2, NULL, 'Comportamiento regular'),
(88, 14, 'Manuel Castro', 4, 'FOL', 4, 6, 7, NULL, 'Comportamiento insatisfactorio'),
(92, 15, 'Lucía Herrera', 5, 'ABBDD', 5, 9, 8, NULL, 'Comportamiento excelente'),
(93, 15, 'Lucía Herrera', 6, 'SERVICIOS', 6, 4, 3, NULL, 'Comportamiento regular'),
(94, 15, 'Lucía Herrera', 7, 'INGLÉS', 1, 4, 7, NULL, 'Comportamiento excelente'),
(95, 15, 'Lucía Herrera', 8, 'ASO', 5, 1, 2, NULL, 'Comportamiento malo'),
(99, 16, 'Daniel Peralta', 9, 'ABBDD', 6, 0, 4, NULL, 'Comportamiento malo'),
(100, 16, 'Daniel Peralta', 10, 'SERVICIOS', 0, 8, 6, NULL, 'Comportamiento insatisfactorio'),
(101, 16, 'Daniel Peralta', 11, 'Religión', 9, 10, 3, NULL, 'Comportamiento regular'),
(102, 16, 'Daniel Peralta', 12, 'Geografía', 8, 4, 8, NULL, 'Comportamiento regular'),
(106, 17, 'Camila Ríos', 1, 'BBDD', 5, 2, 9, NULL, 'Comportamiento regular'),
(107, 17, 'Camila Ríos', 2, 'SO', 7, 10, 7, NULL, 'Comportamiento regular'),
(108, 17, 'Camila Ríos', 3, 'REDES', 5, 9, 0, NULL, 'Comportamiento insatisfactorio'),
(109, 17, 'Camila Ríos', 4, 'FOL', 10, 0, 1, NULL, 'Comportamiento regular'),
(113, 18, 'Miguel Silva', 5, 'ABBDD', 2, 10, 9, NULL, 'Comportamiento insatisfactorio'),
(114, 18, 'Miguel Silva', 6, 'SERVICIOS', 4, 0, 2, NULL, 'Comportamiento malo'),
(115, 18, 'Miguel Silva', 7, 'INGLÉS', 1, 8, 3, NULL, 'Comportamiento regular'),
(116, 18, 'Miguel Silva', 8, 'ASO', 7, 9, 0, NULL, 'Comportamiento malo'),
(120, 19, 'Isabella Ortega', 9, 'ABBDD', 6, 0, 5, NULL, 'Comportamiento regular'),
(121, 19, 'Isabella Ortega', 10, 'SERVICIOS', 7, 10, 8, NULL, 'Comportamiento malo'),
(122, 19, 'Isabella Ortega', 11, 'Religión', 1, 2, 6, NULL, 'Comportamiento bueno'),
(123, 19, 'Isabella Ortega', 12, 'Geografía', 0, 0, 1, NULL, 'Comportamiento bueno'),
(127, 20, 'Fernando Soto', 1, 'BBDD', 4, 3, 3, NULL, 'Comportamiento malo'),
(128, 20, 'Fernando Soto', 2, 'SO', 3, 0, 0, NULL, 'Comportamiento bueno'),
(129, 20, 'Fernando Soto', 3, 'REDES', 2, 1, 10, NULL, 'Comportamiento regular'),
(130, 20, 'Fernando Soto', 4, 'FOL', 6, 4, 2, NULL, 'Comportamiento malo'),
(134, 21, 'Victoria Cordero', 5, 'ABBDD', 10, 4, 1, NULL, 'Comportamiento bueno'),
(135, 21, 'Victoria Cordero', 6, 'SERVICIOS', 0, 4, 9, NULL, 'Comportamiento bueno'),
(136, 21, 'Victoria Cordero', 7, 'INGLÉS', 5, 9, 8, NULL, 'Comportamiento excelente'),
(137, 21, 'Victoria Cordero', 8, 'ASO', 3, 1, 8, NULL, 'Comportamiento regular'),
(141, 22, 'Andrés Navarro', 9, 'ABBDD', 5, 5, 1, NULL, 'Comportamiento malo'),
(142, 22, 'Andrés Navarro', 10, 'SERVICIOS', 6, 10, 10, NULL, 'Comportamiento malo'),
(143, 22, 'Andrés Navarro', 11, 'Religión', 1, 5, 1, NULL, 'Comportamiento excelente'),
(144, 22, 'Andrés Navarro', 12, 'Geografía', 0, 9, 3, NULL, 'Comportamiento excelente'),
(148, 23, 'Gabriela Rivas', 1, 'BBDD', 0, 2, 2, NULL, 'Comportamiento bueno'),
(149, 23, 'Gabriela Rivas', 2, 'SO', 9, 3, 0, NULL, 'Comportamiento bueno'),
(150, 23, 'Gabriela Rivas', 3, 'REDES', 4, 1, 3, NULL, 'Comportamiento bueno'),
(151, 23, 'Gabriela Rivas', 4, 'FOL', 5, 7, 8, NULL, 'Comportamiento insatisfactorio'),
(155, 24, 'Alejandro Fuentes', 5, 'ABBDD', 9, 10, 0, NULL, 'Comportamiento insatisfactorio'),
(156, 24, 'Alejandro Fuentes', 6, 'SERVICIOS', 8, 1, 5, NULL, 'Comportamiento malo'),
(157, 24, 'Alejandro Fuentes', 7, 'INGLÉS', 4, 3, 0, NULL, 'Comportamiento bueno'),
(158, 24, 'Alejandro Fuentes', 8, 'ASO', 6, 9, 8, NULL, 'Comportamiento excelente'),
(162, 25, 'Catalina Castro', 9, 'ABBDD', 4, 8, 8, NULL, 'Comportamiento bueno'),
(163, 25, 'Catalina Castro', 10, 'SERVICIOS', 3, 6, 1, NULL, 'Comportamiento malo'),
(164, 25, 'Catalina Castro', 11, 'Religión', 2, 5, 6, NULL, 'Comportamiento regular'),
(165, 25, 'Catalina Castro', 12, 'Geografía', 6, 6, 2, NULL, 'Comportamiento regular'),
(169, 26, 'Emilio Varela', 1, 'BBDD', 2, 2, 5, NULL, 'Comportamiento malo'),
(170, 26, 'Emilio Varela', 2, 'SO', 9, 8, 0, NULL, 'Comportamiento excelente'),
(171, 26, 'Emilio Varela', 3, 'REDES', 6, 4, 2, NULL, 'Comportamiento malo'),
(172, 26, 'Emilio Varela', 4, 'FOL', 9, 7, 7, NULL, 'Comportamiento regular'),
(176, 27, 'Josefina Medina', 5, 'ABBDD', 1, 3, 1, NULL, 'Comportamiento malo'),
(177, 27, 'Josefina Medina', 6, 'SERVICIOS', 4, 2, 10, NULL, 'Comportamiento excelente'),
(178, 27, 'Josefina Medina', 7, 'INGLÉS', 2, 2, 4, NULL, 'Comportamiento regular'),
(179, 27, 'Josefina Medina', 8, 'ASO', 8, 8, 3, NULL, 'Comportamiento bueno'),
(183, 28, 'Hugo Guzmán', 9, 'ABBDD', 6, 4, 2, NULL, 'Comportamiento excelente'),
(184, 28, 'Hugo Guzmán', 10, 'SERVICIOS', 6, 8, 2, NULL, 'Comportamiento insatisfactorio'),
(185, 28, 'Hugo Guzmán', 11, 'Religión', 5, 8, 3, NULL, 'Comportamiento bueno'),
(186, 28, 'Hugo Guzmán', 12, 'Geografía', 2, 6, 0, NULL, 'Comportamiento regular'),
(190, 29, 'Antonella Soto', 1, 'BBDD', 5, 0, 5, NULL, 'Comportamiento regular'),
(191, 29, 'Antonella Soto', 2, 'SO', 6, 9, 5, NULL, 'Comportamiento malo'),
(192, 29, 'Antonella Soto', 3, 'REDES', 3, 5, 6, NULL, 'Comportamiento bueno'),
(193, 29, 'Antonella Soto', 4, 'FOL', 2, 1, 0, NULL, 'Comportamiento regular'),
(197, 30, 'Sebastián Montes', 5, 'ABBDD', 7, 5, 6, NULL, 'Comportamiento excelente'),
(198, 30, 'Sebastián Montes', 6, 'SERVICIOS', 3, 9, 6, NULL, 'Comportamiento excelente'),
(199, 30, 'Sebastián Montes', 7, 'INGLÉS', 8, 5, 1, NULL, 'Comportamiento excelente'),
(200, 30, 'Sebastián Montes', 8, 'ASO', 5, 1, 1, NULL, 'Comportamiento excelente'),
(204, 31, 'Valeria Vargas', 9, 'ABBDD', 7, 6, 1, NULL, 'Comportamiento insatisfactorio'),
(205, 31, 'Valeria Vargas', 10, 'SERVICIOS', 4, 8, 6, NULL, 'Comportamiento insatisfactorio'),
(206, 31, 'Valeria Vargas', 11, 'Religión', 4, 3, 1, NULL, 'Comportamiento malo'),
(207, 31, 'Valeria Vargas', 12, 'Geografía', 2, 4, 2, NULL, 'Comportamiento malo'),
(211, 32, 'Felipe Ramírez', 1, 'BBDD', 7, 9, 1, NULL, 'Comportamiento excelente'),
(212, 32, 'Felipe Ramírez', 2, 'SO', 0, 9, 2, NULL, 'Comportamiento regular'),
(213, 32, 'Felipe Ramírez', 3, 'REDES', 0, 6, 10, NULL, 'Comportamiento malo'),
(214, 32, 'Felipe Ramírez', 4, 'FOL', 9, 4, 3, NULL, 'Comportamiento regular'),
(218, 33, 'Constanza Ríos', 5, 'ABBDD', 6, 3, 7, NULL, 'Comportamiento regular'),
(219, 33, 'Constanza Ríos', 6, 'SERVICIOS', 6, 2, 5, NULL, 'Comportamiento insatisfactorio'),
(220, 33, 'Constanza Ríos', 7, 'INGLÉS', 1, 4, 9, NULL, 'Comportamiento excelente'),
(221, 33, 'Constanza Ríos', 8, 'ASO', 4, 1, 5, NULL, 'Comportamiento malo'),
(225, 34, 'Nicolás Pizarro', 9, 'ABBDD', 0, 5, 1, NULL, 'Comportamiento bueno'),
(226, 34, 'Nicolás Pizarro', 10, 'SERVICIOS', 9, 8, 0, NULL, 'Comportamiento malo'),
(227, 34, 'Nicolás Pizarro', 11, 'Religión', 7, 7, 0, NULL, 'Comportamiento regular'),
(228, 34, 'Nicolás Pizarro', 12, 'Geografía', 10, 7, 3, NULL, 'Comportamiento regular'),
(232, 35, 'Sara Cortés', 1, 'BBDD', 4, 5, 6, NULL, 'Comportamiento excelente'),
(233, 35, 'Sara Cortés', 2, 'SO', 10, 3, 10, NULL, 'Comportamiento malo'),
(234, 35, 'Sara Cortés', 3, 'REDES', 0, 10, 7, NULL, 'Comportamiento bueno'),
(235, 35, 'Sara Cortés', 4, 'FOL', 5, 6, 7, NULL, 'Comportamiento regular'),
(239, 36, 'Matías Ríos', 5, 'ABBDD', 5, 5, 1, NULL, 'Comportamiento bueno'),
(240, 36, 'Matías Ríos', 6, 'SERVICIOS', 8, 1, 4, NULL, 'Comportamiento bueno'),
(241, 36, 'Matías Ríos', 7, 'INGLÉS', 9, 1, 0, NULL, 'Comportamiento malo'),
(242, 36, 'Matías Ríos', 8, 'ASO', 7, 6, 9, NULL, 'Comportamiento regular'),
(246, 37, 'Amanda Contreras', 9, 'ABBDD', 2, 10, 2, NULL, 'Comportamiento excelente'),
(247, 37, 'Amanda Contreras', 10, 'SERVICIOS', 5, 4, 6, NULL, 'Comportamiento malo'),
(248, 37, 'Amanda Contreras', 11, 'Religión', 5, 7, 1, NULL, 'Comportamiento regular'),
(249, 37, 'Amanda Contreras', 12, 'Geografía', 9, 9, 9, NULL, 'Comportamiento insatisfactorio'),
(253, 38, 'Diego Araya', 1, 'BBDD', 3, 1, 8, NULL, 'Comportamiento insatisfactorio'),
(254, 38, 'Diego Araya', 2, 'SO', 6, 2, 2, NULL, 'Comportamiento regular'),
(255, 38, 'Diego Araya', 3, 'REDES', 9, 7, 8, NULL, 'Comportamiento insatisfactorio'),
(256, 38, 'Diego Araya', 4, 'FOL', 4, 10, 3, NULL, 'Comportamiento malo'),
(260, 39, 'Gabriela Muñoz', 5, 'ABBDD', 2, 6, 1, NULL, 'Comportamiento excelente'),
(261, 39, 'Gabriela Muñoz', 6, 'SERVICIOS', 7, 5, 2, NULL, 'Comportamiento insatisfactorio'),
(262, 39, 'Gabriela Muñoz', 7, 'INGLÉS', 7, 3, 8, NULL, 'Comportamiento malo'),
(263, 39, 'Gabriela Muñoz', 8, 'ASO', 10, 2, 1, NULL, 'Comportamiento malo'),
(267, 40, 'Andrea Orellana', 9, 'ABBDD', 9, 3, 10, NULL, 'Comportamiento insatisfactorio'),
(268, 40, 'Andrea Orellana', 10, 'SERVICIOS', 8, 7, 0, NULL, 'Comportamiento bueno'),
(269, 40, 'Andrea Orellana', 11, 'Religión', 4, 9, 4, NULL, 'Comportamiento excelente'),
(270, 40, 'Andrea Orellana', 12, 'Geografía', 7, 0, 0, NULL, 'Comportamiento excelente'),
(274, 41, 'Felipe Briceño', 1, 'BBDD', 3, 9, 3, NULL, 'Comportamiento bueno'),
(275, 41, 'Felipe Briceño', 2, 'SO', 0, 5, 5, NULL, 'Comportamiento malo'),
(276, 41, 'Felipe Briceño', 3, 'REDES', 3, 6, 10, NULL, 'Comportamiento excelente'),
(277, 41, 'Felipe Briceño', 4, 'FOL', 3, 4, 0, NULL, 'Comportamiento malo'),
(281, 42, 'Josefa Rojas', 5, 'ABBDD', 5, 5, 0, NULL, 'Comportamiento regular'),
(282, 42, 'Josefa Rojas', 6, 'SERVICIOS', 10, 9, 4, NULL, 'Comportamiento insatisfactorio'),
(283, 42, 'Josefa Rojas', 7, 'INGLÉS', 10, 9, 3, NULL, 'Comportamiento excelente'),
(284, 42, 'Josefa Rojas', 8, 'ASO', 8, 4, 8, NULL, 'Comportamiento regular'),
(288, 43, 'Ignacio Leiva', 9, 'ABBDD', 3, 5, 4, NULL, 'Comportamiento insatisfactorio'),
(289, 43, 'Ignacio Leiva', 10, 'SERVICIOS', 4, 8, 7, NULL, 'Comportamiento excelente'),
(290, 43, 'Ignacio Leiva', 11, 'Religión', 5, 1, 0, NULL, 'Comportamiento excelente'),
(291, 43, 'Ignacio Leiva', 12, 'Geografía', 8, 0, 9, NULL, 'Comportamiento malo'),
(295, 44, 'Isidora Valenzuela', 1, 'BBDD', 6, 0, 5, NULL, 'Comportamiento regular'),
(296, 44, 'Isidora Valenzuela', 2, 'SO', 2, 6, 2, NULL, 'Comportamiento bueno'),
(297, 44, 'Isidora Valenzuela', 3, 'REDES', 4, 5, 3, NULL, 'Comportamiento excelente'),
(298, 44, 'Isidora Valenzuela', 4, 'FOL', 4, 10, 3, NULL, 'Comportamiento malo'),
(302, 45, 'Bastián Fuentes', 5, 'ABBDD', 10, 4, 2, NULL, 'Comportamiento malo'),
(303, 45, 'Bastián Fuentes', 6, 'SERVICIOS', 5, 0, 7, NULL, 'Comportamiento excelente'),
(304, 45, 'Bastián Fuentes', 7, 'INGLÉS', 10, 3, 6, NULL, 'Comportamiento malo'),
(305, 45, 'Bastián Fuentes', 8, 'ASO', 9, 6, 4, NULL, 'Comportamiento bueno'),
(309, 46, 'Francisca Sánchez', 9, 'ABBDD', 4, 3, 1, NULL, 'Comportamiento insatisfactorio'),
(310, 46, 'Francisca Sánchez', 10, 'SERVICIOS', 3, 3, 5, NULL, 'Comportamiento insatisfactorio'),
(311, 46, 'Francisca Sánchez', 11, 'Religión', 7, 7, 1, NULL, 'Comportamiento malo'),
(312, 46, 'Francisca Sánchez', 12, 'Geografía', 8, 3, 2, NULL, 'Comportamiento bueno'),
(316, 47, 'Tomás Castro', 1, 'BBDD', 5, 9, 8, NULL, 'Comportamiento excelente'),
(317, 47, 'Tomás Castro', 2, 'SO', 5, 1, 1, NULL, 'Comportamiento excelente'),
(318, 47, 'Tomás Castro', 3, 'REDES', 2, 9, 8, NULL, 'Comportamiento excelente'),
(319, 47, 'Tomás Castro', 4, 'FOL', 1, 3, 3, NULL, 'Comportamiento regular'),
(323, 48, 'María José González', 5, 'ABBDD', 2, 4, 3, NULL, 'Comportamiento regular'),
(324, 48, 'María José González', 6, 'SERVICIOS', 1, 2, 7, NULL, 'Comportamiento malo'),
(325, 48, 'María José González', 7, 'INGLÉS', 7, 4, 0, NULL, 'Comportamiento malo'),
(326, 48, 'María José González', 8, 'ASO', 5, 6, 6, NULL, 'Comportamiento bueno'),
(330, 49, 'Benjamín Herrera', 9, 'ABBDD', 4, 4, 10, NULL, 'Comportamiento bueno'),
(331, 49, 'Benjamín Herrera', 10, 'SERVICIOS', 8, 0, 8, NULL, 'Comportamiento insatisfactorio'),
(332, 49, 'Benjamín Herrera', 11, 'Religión', 4, 8, 5, NULL, 'Comportamiento bueno'),
(333, 49, 'Benjamín Herrera', 12, 'Geografía', 8, 10, 6, NULL, 'Comportamiento malo'),
(337, 50, 'Trinidad Silva', 1, 'BBDD', 7, 7, 6, NULL, 'Comportamiento insatisfactorio'),
(338, 50, 'Trinidad Silva', 2, 'SO', 9, 0, 6, NULL, 'Comportamiento malo'),
(339, 50, 'Trinidad Silva', 3, 'REDES', 0, 2, 0, NULL, 'Comportamiento regular'),
(340, 50, 'Trinidad Silva', 4, 'FOL', 0, 1, 4, NULL, 'Comportamiento regular'),
(344, 51, 'Maximiliana Ríos', 5, 'ABBDD', 9, 2, 6, NULL, 'Comportamiento bueno'),
(345, 51, 'Maximiliana Ríos', 6, 'SERVICIOS', 7, 7, 1, NULL, 'Comportamiento insatisfactorio'),
(346, 51, 'Maximiliana Ríos', 7, 'INGLÉS', 0, 2, 8, NULL, 'Comportamiento regular'),
(347, 51, 'Maximiliana Ríos', 8, 'ASO', 6, 10, 8, NULL, 'Comportamiento malo'),
(351, 52, 'Felipe Montes', 9, 'ABBDD', 10, 9, 5, NULL, 'Comportamiento excelente'),
(352, 52, 'Felipe Montes', 10, 'SERVICIOS', 7, 1, 8, NULL, 'Comportamiento bueno'),
(353, 52, 'Felipe Montes', 11, 'Religión', 4, 10, 4, NULL, 'Comportamiento bueno'),
(354, 52, 'Felipe Montes', 12, 'Geografía', 5, 5, 9, NULL, 'Comportamiento malo'),
(358, 53, 'Valentina Varela', 1, 'BBDD', 7, 9, 0, NULL, 'Comportamiento malo'),
(359, 53, 'Valentina Varela', 2, 'SO', 1, 1, 1, NULL, 'Comportamiento bueno'),
(360, 53, 'Valentina Varela', 3, 'REDES', 1, 7, 2, NULL, 'Comportamiento malo'),
(361, 53, 'Valentina Varela', 4, 'FOL', 10, 0, 1, NULL, 'Comportamiento insatisfactorio'),
(365, 54, 'Cristóbal Castro', 5, 'ABBDD', 7, 4, 10, NULL, 'Comportamiento insatisfactorio'),
(366, 54, 'Cristóbal Castro', 6, 'SERVICIOS', 10, 3, 9, NULL, 'Comportamiento bueno'),
(367, 54, 'Cristóbal Castro', 7, 'INGLÉS', 0, 1, 8, NULL, 'Comportamiento bueno'),
(368, 54, 'Cristóbal Castro', 8, 'ASO', 3, 6, 2, NULL, 'Comportamiento excelente'),
(372, 55, 'Francisca González', 9, 'ABBDD', 6, 3, 1, NULL, 'Comportamiento regular'),
(373, 55, 'Francisca González', 10, 'SERVICIOS', 1, 3, 1, NULL, 'Comportamiento insatisfactorio'),
(374, 55, 'Francisca González', 11, 'Religión', 9, 5, 10, NULL, 'Comportamiento excelente'),
(375, 55, 'Francisca González', 12, 'Geografía', 8, 7, 10, NULL, 'Comportamiento insatisfactorio'),
(379, 56, 'Rodrigo Guzmán', 1, 'BBDD', 4, 9, 9, NULL, 'Comportamiento insatisfactorio'),
(380, 56, 'Rodrigo Guzmán', 2, 'SO', 0, 2, 9, NULL, 'Comportamiento regular'),
(381, 56, 'Rodrigo Guzmán', 3, 'REDES', 2, 5, 10, NULL, 'Comportamiento excelente'),
(382, 56, 'Rodrigo Guzmán', 4, 'FOL', 3, 4, 4, NULL, 'Comportamiento regular'),
(386, 57, 'Javiera Muñoz', 5, 'ABBDD', 8, 7, 2, NULL, 'Comportamiento malo'),
(387, 57, 'Javiera Muñoz', 6, 'SERVICIOS', 5, 10, 3, NULL, 'Comportamiento insatisfactorio'),
(388, 57, 'Javiera Muñoz', 7, 'INGLÉS', 7, 3, 3, NULL, 'Comportamiento insatisfactorio'),
(389, 57, 'Javiera Muñoz', 8, 'ASO', 9, 10, 1, NULL, 'Comportamiento malo'),
(393, 58, 'Matías Orellana', 9, 'ABBDD', 10, 3, 9, NULL, 'Comportamiento bueno'),
(394, 58, 'Matías Orellana', 10, 'SERVICIOS', 1, 7, 8, NULL, 'Comportamiento excelente'),
(395, 58, 'Matías Orellana', 11, 'Religión', 0, 1, 4, NULL, 'Comportamiento regular'),
(396, 58, 'Matías Orellana', 12, 'Geografía', 8, 10, 5, NULL, 'Comportamiento regular'),
(400, 59, 'Antonia Briceño', 1, 'BBDD', 4, 7, 10, NULL, 'Comportamiento malo'),
(401, 59, 'Antonia Briceño', 2, 'SO', 7, 6, 8, NULL, 'Comportamiento bueno'),
(402, 59, 'Antonia Briceño', 3, 'REDES', 1, 7, 2, NULL, 'Comportamiento malo'),
(403, 59, 'Antonia Briceño', 4, 'FOL', 5, 2, 5, NULL, 'Comportamiento insatisfactorio'),
(407, 60, 'Emilio Araya', 5, 'ABBDD', 1, 9, 8, NULL, 'Comportamiento regular'),
(408, 60, 'Emilio Araya', 6, 'SERVICIOS', 8, 8, 2, NULL, 'Comportamiento malo'),
(409, 60, 'Emilio Araya', 7, 'INGLÉS', 2, 3, 7, NULL, 'Comportamiento regular'),
(410, 60, 'Emilio Araya', 8, 'ASO', 6, 4, 1, NULL, 'Comportamiento bueno'),
(414, 61, 'Florencia Cortés', 9, 'ABBDD', 3, 0, 2, NULL, 'Comportamiento malo'),
(415, 61, 'Florencia Cortés', 10, 'SERVICIOS', 7, 7, 6, NULL, 'Comportamiento insatisfactorio'),
(416, 61, 'Florencia Cortés', 11, 'Religión', 6, 0, 3, NULL, 'Comportamiento regular'),
(417, 61, 'Florencia Cortés', 12, 'Geografía', 9, 6, 4, NULL, 'Comportamiento excelente'),
(421, 62, 'Tomás Contreras', 1, 'BBDD', 3, 2, 2, NULL, 'Comportamiento bueno'),
(422, 62, 'Tomás Contreras', 2, 'SO', 10, 8, 2, NULL, 'Comportamiento insatisfactorio'),
(423, 62, 'Tomás Contreras', 3, 'REDES', 9, 0, 6, NULL, 'Comportamiento malo'),
(424, 62, 'Tomás Contreras', 4, 'FOL', 8, 10, 6, NULL, 'Comportamiento excelente'),
(428, 63, 'Valentina Muñoz', 5, 'ABBDD', 5, 5, 0, NULL, 'Comportamiento regular'),
(429, 63, 'Valentina Muñoz', 6, 'SERVICIOS', 4, 5, 2, NULL, 'Comportamiento insatisfactorio'),
(430, 63, 'Valentina Muñoz', 7, 'INGLÉS', 9, 3, 10, NULL, 'Comportamiento insatisfactorio'),
(431, 63, 'Valentina Muñoz', 8, 'ASO', 0, 9, 1, NULL, 'Comportamiento excelente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id_curso` int(4) NOT NULL,
  `curso` varchar(50) DEFAULT NULL,
  `tutor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id_curso`, `curso`, `tutor`) VALUES
(1, 'ASIR1', 'Carlos'),
(2, 'ASIR2', 'Jose'),
(3, 'BACH', 'Marta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id_materia` int(4) NOT NULL,
  `materia` varchar(50) DEFAULT NULL,
  `id_profesor` int(4) DEFAULT NULL,
  `profesor` varchar(50) DEFAULT NULL,
  `id_curso` int(4) DEFAULT NULL,
  `curso` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id_materia`, `materia`, `id_profesor`, `profesor`, `id_curso`, `curso`) VALUES
(1, 'BBDD', 65, 'Jose', 1, 'ASIR1'),
(2, 'SO', 64, 'Carlos', 1, 'ASIR1'),
(3, 'REDES', NULL, 'Samuel', 1, 'ASIR1'),
(4, 'FOL', NULL, 'Camacho', 1, 'ASIR1'),
(5, 'ABBDD', 65, 'Jose', 2, 'ASIR2'),
(6, 'SERVICIOS', 65, 'Jose', 2, 'ASIR2'),
(7, 'INGLÉS', NULL, 'Maria', 2, 'ASIR2'),
(8, 'ASO', 64, 'Carlos', 2, 'ASIR2'),
(9, 'ABBDD', NULL, 'Marta', 3, 'BACH'),
(10, 'SERVICIOS', NULL, 'Cristina', 3, 'BACH'),
(11, 'Religión', NULL, 'Santiago', 3, 'BACH'),
(12, 'Geografía', NULL, 'Anselmo', 3, 'BACH');

--
-- Disparadores `materia`
--
DELIMITER $$
CREATE TRIGGER `actualizar_id_profesor` BEFORE UPDATE ON `materia` FOR EACH ROW BEGIN
    SET NEW.id_profesor = (SELECT id_usuario FROM profesor WHERE nombre = NEW.profesor);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_materia_calificaciones` AFTER INSERT ON `materia` FOR EACH ROW BEGIN
      update calificaciones set id_materia=(NEW.id_materia), materia=(NEW.materia);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_profesor_materia_curso` BEFORE INSERT ON `materia` FOR EACH ROW BEGIN
    SET NEW.id_curso = (SELECT id_curso FROM curso WHERE curso.curso = NEW.curso);
    SET NEW.id_profesor = (SELECT id_usuario FROM profesor WHERE profesor.nombre = NEW.profesor);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_calif`
--

CREATE TABLE `materia_calif` (
  `id_materia` int(4) DEFAULT NULL,
  `id_calificaciones` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_curso`
--

CREATE TABLE `materia_curso` (
  `id_materia_curso` int(4) NOT NULL,
  `id_materia` int(4) DEFAULT NULL,
  `id_curso` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `padre`
--

CREATE TABLE `padre` (
  `id_usuario` int(4) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `id_hijo` int(4) DEFAULT NULL,
  `hijo` varchar(50) DEFAULT NULL,
  `primer_login` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `padre_hijo`
--

CREATE TABLE `padre_hijo` (
  `id_relación` int(4) NOT NULL,
  `id_padre` int(4) DEFAULT NULL,
  `id_usuario` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id_usuario` int(4) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id_usuario`, `nombre`, `correo`, `contraseña`) VALUES
(64, 'Carlos', 'carlos@gmail.com', 'dc599a9972fde3045dab59dbd1ae170b'),
(65, 'Jose', 'jose@gmail.com', 'd27c9589143b57f1954d0d0ca655cda7');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prof_materia`
--

CREATE TABLE `prof_materia` (
  `id_prof_materia` int(4) NOT NULL,
  `id_profesor` int(4) DEFAULT NULL,
  `id_materia` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(4) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `tipo_usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `correo`, `contraseña`, `tipo_usuario`) VALUES
(1, 'Admin', 'admin@educados.com', '21232f297a57a5a743894a0e4a801fc3', 'admintech644394412'),
(2, 'Juan Pérez', 'juanperez@gmail.com', 'b851aa881dd8d23d37eabc83dce1d1fc', 'alumno'),
(3, 'María Rodríguez', 'maria.rodriguez@gmail.com', '64775da9206a8e87493aa638fc49981b', 'alumno'),
(4, 'Luis García', 'luisgarcia@gmail.com', '23c92265ae817fb5e7f53e2ad7a9c760', 'alumno'),
(5, 'Ana Martínez', 'anamartinez@gmail.com', 'b4e0c0405cf20f83e3f55019d3c9eb79', 'alumno'),
(6, 'Carlos López', 'carloslopez@gmail.com', '55292574715e303b329c4c9089f3eea5', 'alumno'),
(7, 'Laura Sánchez', 'laurasanchez@gmail.com', '4a0fc763e4abb007cfc8a24152538101', 'alumno'),
(8, 'Pedro González', 'pedrogonzalez@gmail.com', 'c8ed56f7bfb18bcaeca3a88618009acb', 'alumno'),
(9, 'Paula Torres', 'paulatorres@gmail.com', '5595dece79877f9fe188eacfd44f6f8e', 'alumno'),
(10, 'Javier Ramírez', 'javierramirez@gmail.com', '5b92d5acb15d9bbc01ec59d249a4a31e', 'alumno'),
(11, 'Sofía Vargas', 'sofiavargas@gmail.com', '8bf6f4a269685dc836ebe599f5922af6', 'alumno'),
(12, 'Diego Morales', 'diegomorales@gmail.com', 'ddb7647ee3d823ea5e5d4699156d9bb1', 'alumno'),
(13, 'Valentina Gómez', 'valentinagomez@gmail.com', '10ef7feb1e9b87257575a18e1171a027', 'alumno'),
(14, 'Manuel Castro', 'manuelcastro@gmail.com', '6fb561ad9fc2dc2601705e6cf3ac6511', 'alumno'),
(15, 'Lucía Herrera', 'luciaherrera@gmail.com', '5298cd321a6b08a5438895f508e75019', 'alumno'),
(16, 'Daniel Peralta', 'danielperalta@gmail.com', 'dde7867f7c285e9367e29671debab75a', 'alumno'),
(17, 'Camila Ríos', 'camilarios@gmail.com', '99ec6fe185e010800bdd6beb3d1e9426', 'alumno'),
(18, 'Miguel Silva', 'miguelsilva@gmail.com', 'b5e10f85a97a4c6ae6ea7565b23e9313', 'alumno'),
(19, 'Isabella Ortega', 'isabellaortega@gmail.com', '2420c2616097584d9176b602c4ef4941', 'alumno'),
(20, 'Fernando Soto', 'fernandosoto@gmail.com', '51275a47df0ab7f4b5a769b3c99f7e4e', 'alumno'),
(21, 'Victoria Cordero', 'victoriacordero@gmail.com', '89fb9d3508dca01f65be18295d18ee3d', 'alumno'),
(22, 'Andrés Navarro', 'andresnavarro@gmail.com', 'd1b10af1b5fac1bd7edc07aaed0e7dac', 'alumno'),
(23, 'Gabriela Rivas', 'gabrielarivas@gmail.com', '0cc548991deedaa736dff7d763e125c0', 'alumno'),
(24, 'Alejandro Fuentes', 'alejandrofuentes@gmail.com', 'e45b5c13944e49e69efc1c198a49aaf1', 'alumno'),
(25, 'Catalina Castro', 'catalinacastro@gmail.com', '9f6ed2021127e5472b7ab2cb6686a26e', 'alumno'),
(26, 'Emilio Varela', 'emiliovarela@gmail.com', '4b6b599986c469d9b857080290eddd49', 'alumno'),
(27, 'Josefina Medina', 'josefinamedina@gmail.com', 'e7f52e90975e3289e2f269ac50a0c1b9', 'alumno'),
(28, 'Hugo Guzmán', 'hugoguzman@gmail.com', '8486641f23e784d132178ddaffda05c2', 'alumno'),
(29, 'Antonella Soto', 'antonellasoto@gmail.com', 'a209b8bd8cc3890daab5e0a232a68dc2', 'alumno'),
(30, 'Sebastián Montes', 'sebastianmontes@gmail.com', '010e0c33ab70dd1923677c11737ef6fe', 'alumno'),
(31, 'Valeria Vargas', 'valeriavargas@gmail.com', 'fac2e42c507337641d90a5cefa3d938e', 'alumno'),
(32, 'Felipe Ramírez', 'feliperamirez@gmail.com', '2be875ec0a292b3b6251b694a37ec9bb', 'alumno'),
(33, 'Constanza Ríos', 'constanzarios@gmail.com', 'f533740f2aeb29f0d0e33d6ab5906162', 'alumno'),
(34, 'Nicolás Pizarro', 'nicolaspizarro@gmail.com', '3f2e758c1936ee17fd6e94e26d9211fd', 'alumno'),
(35, 'Sara Cortés', 'saracortes@gmail.com', '4178aa123e5deed3dd853bfca414342f', 'alumno'),
(36, 'Matías Ríos', 'matiasrios@gmail.com', '51d51e5b771668364bf0ba25e306ec3c', 'alumno'),
(37, 'Amanda Contreras', 'amandacontreras@gmail.com', 'c145794cf85a529e89deaae44286a2a5', 'alumno'),
(38, 'Diego Araya', 'diegoaraya@gmail.com', '9d3a763a2b3d52a62bdfeb263a5f5c7b', 'alumno'),
(39, 'Gabriela Muñoz', 'gabrielamunoz@gmail.com', '5e7fde7f15f8b2a9b3368c63eb3acd66', 'alumno'),
(40, 'Andrea Orellana', 'andreaorellana@gmail.com', '925e724a7a74ff125aa023a62dd4dda9', 'alumno'),
(41, 'Felipe Briceño', 'felipebriceno@gmail.com', '37f927358cf1502fbb9990112e2ddc6c', 'alumno'),
(42, 'Josefa Rojas', 'josefarojas@gmail.com', '837247465167078fc9188a06eac3a880', 'alumno'),
(43, 'Ignacio Leiva', 'ignacioleiva@gmail.com', '41aa2b61abb2f55d9ee58a942deb1ec5', 'alumno'),
(44, 'Isidora Valenzuela', 'isidoravalenzuela@gmail.com', '0785ea8330421600a135b3d7383d002f', 'alumno'),
(45, 'Bastián Fuentes', 'bastianfuentes@gmail.com', '8f16b8aa43a2f145476622e1e0c841b2', 'alumno'),
(46, 'Francisca Sánchez', 'franciscasanchez@gmail.com', '0eae892bd61da214b4b9397ece1eea28', 'alumno'),
(47, 'Tomás Castro', 'tomascastro@gmail.com', 'babf2672f7c55711436bfc75725cc82e', 'alumno'),
(48, 'María José González', 'mariajosegonzalez@gmail.com', '660b99cbf037956f0db886556fc3c5b1', 'alumno'),
(49, 'Benjamín Herrera', 'benjaminherrera@gmail.com', '94c9876a42b5ec94eaa7dccc14ad26eb', 'alumno'),
(50, 'Trinidad Silva', 'trinidadsilva@gmail.com', '7bc15b64006a1a7c9fba677da856713a', 'alumno'),
(51, 'Maximiliana Ríos', 'maximilianarios@gmail.com', '670507cf0c4c5a48d0b6f746552eb861', 'alumno'),
(52, 'Felipe Montes', 'felipemontes@gmail.com', 'f9597b55a4974461c869109f2fe2f8e1', 'alumno'),
(53, 'Valentina Varela', 'valentinavarela@gmail.com', 'efdb977a585913e21e6fab04ff79c86c', 'alumno'),
(54, 'Cristóbal Castro', 'cristobalcastro@gmail.com', '1715369f3fe987e36f990de4526b9a15', 'alumno'),
(55, 'Francisca González', 'franciscagonzalez@gmail.com', 'e271875784afcd31482159c6413f276f', 'alumno'),
(56, 'Rodrigo Guzmán', 'rodrigoguzman@gmail.com', 'fc3bcd2744d7c57ae09657d02d49423a', 'alumno'),
(57, 'Javiera Muñoz', 'javieramunoz@gmail.com', '4ece0f3e36b999eeeabc1705e8d86d86', 'alumno'),
(58, 'Matías Orellana', 'matiasorellana@gmail.com', '5cefe3feb06ce513b9b1643277beb172', 'alumno'),
(59, 'Antonia Briceño', 'antoniabriceno@gmail.com', '2dd9b863ea75b83123e09da08ee6c00b', 'alumno'),
(60, 'Emilio Araya', 'emilioaraya@gmail.com', '53d8fbe6551d7bf4d9b3a015d6a86dc3', 'alumno'),
(61, 'Florencia Cortés', 'florenciacortes@gmail.com', '114670e11de849f85a84ad6e222b0c00', 'alumno'),
(62, 'Tomás Contreras', 'tomascontreras@gmail.com', 'e5096dd2b010b88cea3d2bfeb6b4f765', 'alumno'),
(63, 'Valentina Muñoz', 'valentinamunoz@gmail.com', '7b08893d709c21ac3bad7e29baab98b0', 'alumno'),
(64, 'Carlos', 'carlos@gmail.com', 'dc599a9972fde3045dab59dbd1ae170b', 'profesor'),
(65, 'Jose', 'jose@gmail.com', 'd27c9589143b57f1954d0d0ca655cda7', 'profesor');

--
-- Disparadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `delete_alumno_usuario` AFTER DELETE ON `usuario` FOR EACH ROW BEGIN
    DELETE FROM alumno WHERE id_usuario=(OLD.id_usuario);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_padre_usuario` AFTER DELETE ON `usuario` FOR EACH ROW BEGIN
    DELETE FROM padre WHERE id_usuario = OLD.id_usuario;
    DELETE FROM calificaciones WHERE id_alumno = OLD.id_usuario;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_usuario_profesor` AFTER DELETE ON `usuario` FOR EACH ROW BEGIN
    DELETE FROM profesor WHERE id_usuario=(OLD.id_usuario);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_alumno` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
   IF NEW.tipo_usuario = 'alumno' THEN
      INSERT INTO alumno (id_usuario, nombre, correo, contraseña)
      VALUES (NEW.id_usuario, NEW.nombre, NEW.correo, NEW.contraseña);
   END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_padre` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
   IF NEW.tipo_usuario = 'padre' THEN
      INSERT INTO padre (id_usuario, nombre, correo, contraseña)
      VALUES (NEW.id_usuario, NEW.nombre, NEW.correo, NEW.contraseña);
   END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_profesor` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
   IF NEW.tipo_usuario = 'profesor' THEN
      INSERT INTO profesor (id_usuario, nombre, correo, contraseña)
      VALUES (NEW.id_usuario, NEW.nombre, NEW.correo, NEW.contraseña);
   END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_alumno_usuario` AFTER UPDATE ON `usuario` FOR EACH ROW BEGIN
      update alumno set nombre=(NEW.nombre), correo=(NEW.correo) where id_usuario=(OLD.id_usuario);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_padre_usuario` AFTER UPDATE ON `usuario` FOR EACH ROW BEGIN
        UPDATE padre SET nombre = NEW.nombre, correo = NEW.correo WHERE id_usuario = OLD.id_usuario;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_usuario_profesor` AFTER UPDATE ON `usuario` FOR EACH ROW BEGIN
      update profesor set nombre=(NEW.nombre), correo=(NEW.correo) where id_usuario=(OLD.id_usuario);
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `curso` (`curso`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indices de la tabla `alumno_curso`
--
ALTER TABLE `alumno_curso`
  ADD PRIMARY KEY (`id_relacion`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indices de la tabla `alum_calif`
--
ALTER TABLE `alum_calif`
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_calificaciones` (`id_calificaciones`);

--
-- Indices de la tabla `alum_materia`
--
ALTER TABLE `alum_materia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_alumno` (`id_alumno`),
  ADD KEY `id_materia` (`id_materia`);

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id_calificaciones`),
  ADD KEY `id_materia` (`id_materia`),
  ADD KEY `id_alumno` (`id_alumno`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`),
  ADD UNIQUE KEY `curso` (`curso`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id_materia`),
  ADD KEY `id_curso` (`id_curso`),
  ADD KEY `id_profesor` (`id_profesor`);

--
-- Indices de la tabla `materia_calif`
--
ALTER TABLE `materia_calif`
  ADD KEY `id_materia` (`id_materia`),
  ADD KEY `id_calificaciones` (`id_calificaciones`);

--
-- Indices de la tabla `materia_curso`
--
ALTER TABLE `materia_curso`
  ADD PRIMARY KEY (`id_materia_curso`),
  ADD KEY `id_materia` (`id_materia`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indices de la tabla `padre`
--
ALTER TABLE `padre`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `id_hijo` (`id_hijo`);

--
-- Indices de la tabla `padre_hijo`
--
ALTER TABLE `padre_hijo`
  ADD PRIMARY KEY (`id_relación`),
  ADD KEY `id_padre` (`id_padre`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `prof_materia`
--
ALTER TABLE `prof_materia`
  ADD PRIMARY KEY (`id_prof_materia`),
  ADD KEY `id_profesor` (`id_profesor`),
  ADD KEY `id_materia` (`id_materia`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id_usuario` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `alum_materia`
--
ALTER TABLE `alum_materia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id_calificaciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=435;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id_curso` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id_materia` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `materia_curso`
--
ALTER TABLE `materia_curso`
  MODIFY `id_materia_curso` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `padre`
--
ALTER TABLE `padre`
  MODIFY `id_usuario` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `padre_hijo`
--
ALTER TABLE `padre_hijo`
  MODIFY `id_relación` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `id_usuario` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `prof_materia`
--
ALTER TABLE `prof_materia`
  MODIFY `id_prof_materia` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`curso`) REFERENCES `curso` (`curso`),
  ADD CONSTRAINT `alumno_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`);

--
-- Filtros para la tabla `alumno_curso`
--
ALTER TABLE `alumno_curso`
  ADD CONSTRAINT `alumno_curso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `alumno` (`id_usuario`),
  ADD CONSTRAINT `alumno_curso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`);

--
-- Filtros para la tabla `alum_calif`
--
ALTER TABLE `alum_calif`
  ADD CONSTRAINT `alum_calif_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `alumno` (`id_usuario`),
  ADD CONSTRAINT `alum_calif_ibfk_2` FOREIGN KEY (`id_calificaciones`) REFERENCES `calificaciones` (`id_calificaciones`);

--
-- Filtros para la tabla `alum_materia`
--
ALTER TABLE `alum_materia`
  ADD CONSTRAINT `alum_materia_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_usuario`),
  ADD CONSTRAINT `alum_materia_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`);

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`),
  ADD CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_usuario`);

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`),
  ADD CONSTRAINT `materia_ibfk_2` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_usuario`);

--
-- Filtros para la tabla `materia_calif`
--
ALTER TABLE `materia_calif`
  ADD CONSTRAINT `materia_calif_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`),
  ADD CONSTRAINT `materia_calif_ibfk_2` FOREIGN KEY (`id_calificaciones`) REFERENCES `calificaciones` (`id_calificaciones`);

--
-- Filtros para la tabla `materia_curso`
--
ALTER TABLE `materia_curso`
  ADD CONSTRAINT `materia_curso_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`),
  ADD CONSTRAINT `materia_curso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`);

--
-- Filtros para la tabla `padre`
--
ALTER TABLE `padre`
  ADD CONSTRAINT `padre_ibfk_1` FOREIGN KEY (`id_hijo`) REFERENCES `alumno` (`id_usuario`);

--
-- Filtros para la tabla `padre_hijo`
--
ALTER TABLE `padre_hijo`
  ADD CONSTRAINT `padre_hijo_ibfk_1` FOREIGN KEY (`id_padre`) REFERENCES `padre` (`id_usuario`),
  ADD CONSTRAINT `padre_hijo_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `alumno` (`id_usuario`);

--
-- Filtros para la tabla `prof_materia`
--
ALTER TABLE `prof_materia`
  ADD CONSTRAINT `prof_materia_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_usuario`),
  ADD CONSTRAINT `prof_materia_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
