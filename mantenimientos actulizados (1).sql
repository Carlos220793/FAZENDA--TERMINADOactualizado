-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-08-2025 a las 18:49:43
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mantenimientos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `nombre`) VALUES
(2, 'En Progreso'),
(1, 'Finalizado'),
(3, 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `nombre`) VALUES
(1, 'HP'),
(3, 'Lenovo'),
(4, 'Epson'),
(6, 'Hytera'),
(7, 'Motorola'),
(9, 'Dell'),
(12, 'Mikrotik'),
(13, 'Canon'),
(15, 'Dell Latitude'),
(16, 'Powest'),
(17, 'Legrand'),
(18, 'Unipower'),
(19, 'Powest Titan'),
(20, 'Apc'),
(21, 'Access Poin'),
(22, 'Zebra'),
(23, 'Hikvision'),
(25, 'Ryotel'),
(27, 'ThinkPad'),
(28, 'TP-LINK'),
(29, 'MINUTEMAN'),
(30, 'NUROUM'),
(31, 'Samsung'),
(32, 'Otro...');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modelo`
--

INSERT INTO `modelo` (`id`, `nombre`) VALUES
(1, 'EliteBook 840 G5'),
(2, 'OptiPlex 7070'),
(3, 'ThinkPad T480'),
(4, 'L3150'),
(5, 'Pixma MG2522'),
(6, 'E14'),
(7, 'OPTIPLEX'),
(8, 'Thinkcentre M'),
(9, 'V50S'),
(10, 'M705'),
(11, 'R2'),
(12, 'BD506'),
(13, 'DEP-250'),
(14, 'v14'),
(15, 'L390'),
(16, 'RB750'),
(17, 'DEP-450'),
(18, 'G6010'),
(19, 'ProBook'),
(20, 'Latitude'),
(21, '1kva'),
(22, '2kva'),
(23, '3kva'),
(24, 'M428fdw'),
(25, 'M130fw'),
(26, 'M426fdw'),
(27, 'M428'),
(28, '402'),
(29, 'BD507'),
(30, 'V330-20ICB AIO'),
(31, '3200'),
(32, 'Aruba'),
(33, '43809'),
(34, 'TL-SG1008D'),
(35, 'Otro...');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `id` int(11) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `placa` varchar(100) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `serial` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tecnico` varchar(100) DEFAULT NULL,
  `tipo_mantenimiento` varchar(100) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `centro_costo` varchar(100) DEFAULT NULL,
  `url_ticket` text DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `usuario_registro` varchar(100) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `id_sede` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registros`
--

INSERT INTO `registros` (`id`, `tipo`, `placa`, `marca`, `serial`, `fecha`, `tecnico`, `tipo_mantenimiento`, `estado`, `ubicacion`, `centro_costo`, `url_ticket`, `observaciones`, `fecha_registro`, `usuario_registro`, `modelo`, `id_sede`) VALUES
(53, 'Impresora', 'EC-01647', 'Hp Laser', '000063857-000', '2025-04-16', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Tecnología', '11A0406001', 'https://aliar.freshservice.com/a/tickets/65189?current_tab=details', '', '2025-06-03 20:03:02', 'tecnico', '402', 1),
(54, 'Computador portátil', 'EC-02454', 'ThinkPad', 'R90V402Y', '2025-04-16', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Tecnología', '11A0704001', 'https://aliar.freshservice.com/a/tickets/65178?current_tab=details', '', '2025-06-03 20:06:53', 'tecnico', 'L390', 1),
(55, 'Impresora', 'EC-01647', 'Hp Laser', '000063857-000', '2025-03-18', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Tecnología', '11A0406001', 'https://aliar.freshservice.com/a/tickets/65189%C2%A0?current_tab=details', '', '2025-06-03 20:09:51', 'tecnico', '402', 1),
(56, 'Radio', 'EC-03840', 'Hytera', '000134836-000', '2025-04-30', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Agricultura FZ', '11A0101010', 'https://aliar.freshservice.com/a/tickets/65699?current_tab=details', '', '2025-06-03 20:12:25', 'tecnico', 'BD506', 1),
(57, 'Radio', 'EC-03831', 'Hytera', '000134827-000', '2025-04-30', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Agricultura FZ', '11A0101010', 'https://aliar.freshservice.com/a/tickets/65701?current_tab=details', '', '2025-06-03 20:14:58', 'tecnico', 'BD507', 1),
(58, 'Computador portátil', 'EC-02634', 'Lenovo', 'S1H06ZGB', '2025-05-14', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0404007', 'https://aliar.freshservice.com/a/tickets/66021?current_tab=details', '', '2025-06-03 20:18:36', 'tecnico', 'V330-20ICB AIO', 1),
(59, 'Impresora', 'EC-03047', 'HP', 'CNDRP4T4Q8', '2025-05-14', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Taller', '11A0502001', 'https://aliar.freshservice.com/a/tickets/66253?current_tab=details', '', '2025-06-03 20:23:21', 'tecnico', 'Otro...', 1),
(60, 'Computador portátil', 'EC-04714', 'Lenovo', 'PF39GVMA', '2025-05-13', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Taller', '11A0201003', 'https://aliar.freshservice.com/a/tickets/66072?current_tab=details', '', '2025-06-03 20:25:04', 'tecnico', 'v14', 1),
(61, 'Ups', 'EC-01115', 'MINUTEMAN ', '000000244-000', '2025-05-14', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Tecnología', '11A0402001', 'https://aliar.freshservice.com/a/tickets/66382?current_tab=details', '', '2025-06-03 20:29:16', 'tecnico', '3200', 1),
(62, 'Radio', 'EC-01709', 'Motorola', '7521SY5814', '2025-05-16', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Tecnología', '11A0103070', 'https://aliar.freshservice.com/a/tickets/66368?current_tab=assets', '', '2025-06-03 20:31:25', 'tecnico', 'DEP-450', 1),
(63, 'Radio', 'EC-01559', 'Motorola', '7521SQ5210', '2025-05-16', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Tecnología', '11A0103070', 'https://aliar.freshservice.com/a/tickets/66368?current_tab=assets', '', '2025-06-03 20:36:55', 'tecnico', 'DEP-450', 1),
(64, 'Radio', 'EC-01573', 'Motorola', '7521SS7585', '2025-05-16', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Tecnología', '11A0501001', 'https://aliar.freshservice.com/a/tickets/66368?current_tab=assets', '', '2025-06-03 20:37:57', 'tecnico', 'DEP-450', 1),
(65, 'Computador de escritorio', 'EC-04310', 'ThinkPad', 'MJ0HVFPE', '2025-05-22', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Admin Fincas', '11A0102002', 'https://aliar.freshservice.com/a/tickets/66482?current_tab=details', '', '2025-06-03 20:39:58', 'tecnico', 'Otro...', 1),
(66, 'AP', 'EC-04744', 'Access Poin', 'EC-04744', '2025-05-22', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'PLanta Semilla', '11A0102002', 'https://aliar.freshservice.com/a/tickets/66482?current_tab=assets', '', '2025-06-03 21:38:02', 'tecnico', 'Aruba', 1),
(67, 'Impresora', 'EC-05197', 'HP', 'VNG3L76848', '2025-05-22', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'PLanta Semilla', '4500059773', 'https://aliar.freshservice.com/a/tickets/66482?current_tab=assets', '', '2025-06-03 21:42:04', 'tecnico', 'Otro...', 1),
(68, 'Nvr', 'EC-01222', 'Otro...', '43809', '2025-05-22', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'PLanta Semilla', '11A0102002', 'https://aliar.freshservice.com/a/tickets/66482?current_tab=assets', '', '2025-06-03 21:44:53', 'tecnico', '43809', 1),
(69, 'Router / Switch', 'EC-01704', 'TP-LINK', '65674000', '2025-05-22', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'PLanta Semilla', '11A0102002', 'https://aliar.freshservice.com/a/tickets/66482?current_tab=assets', '', '2025-06-04 13:08:33', 'tecnico', 'TL-SG1008D', 1),
(70, 'Router / Switch', 'EC-01642', 'TP-LINK', '240000906', '2025-05-22', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'PLanta Semilla', '11A0102002', 'https://aliar.freshservice.com/a/tickets/66482?current_tab=assets', '', '2025-06-04 13:09:48', 'tecnico', 'TL-SG1008D', 1),
(71, 'Computador portátil', 'EC-02938 ', 'ThinkPad', 'R90VR3YS', '2025-05-29', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Salud Integral', 'NO ENCONTRADO', 'https://aliar.freshservice.com/a/tickets/66859?current_tab=details', '', '2025-06-04 13:14:12', 'tecnico', 'L390', 1),
(72, 'Impresora', 'EC-03802', 'Hp Laser', 'XAGZ077208', '2025-05-29', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'PLanta Semilla', '11A0102002', 'https://aliar.freshservice.com/a/tickets/66861?current_tab=assets', '', '2025-06-04 13:16:44', 'tecnico', 'M426fdw', 1),
(73, 'Impresora', 'EC-01760', 'Hp Laser', 'PHB8K213QF', '2025-05-30', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103007', 'https://aliar.freshservice.com/a/tickets/66902?current_tab=details', '', '2025-06-04 13:22:50', 'Administrador', 'M426fdw', 1),
(74, 'VideoCoferencia', 'EC-04738', 'NUROUM', 'AW11LCA999A8013398', '2025-05-30', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103061', 'https://aliar.freshservice.com/a/tickets/66902?current_tab=details', '', '2025-06-04 13:27:06', 'tecnico', 'Otro...', 1),
(75, 'Computador de escritorio', 'EC-04648', 'ThinkPad', 'YJ01BQRX', '2025-05-30', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103061', 'https://aliar.freshservice.com/a/tickets/66902?current_tab=details', '', '2025-06-04 13:28:29', 'tecnico', 'Otro...', 1),
(76, 'Radio de comunicación', 'EC-03891', 'Hytera', '21615A3291', '2025-05-30', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103007', 'https://aliar.freshservice.com/a/tickets/66902?current_tab=details', '', '2025-06-04 13:30:11', 'tecnico', 'BD506', 1),
(77, 'Impresora', 'EC-04517', 'Hp Laser', 'CNDRQ821YQ', '2025-05-30', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103060', 'https://aliar.freshservice.com/a/tickets/66905?current_tab=details', '', '2025-06-04 13:32:00', 'tecnico', 'M428fdw', 1),
(78, 'VideoCoferencia', 'EC-04737', 'NUROUM', 'AW11HLA98GA1003862', '2025-05-30', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103061', 'https://aliar.freshservice.com/a/tickets/66905?current_tab=details', '', '2025-06-04 13:38:06', 'tecnico', 'Otro...', 1),
(79, 'Impresora', 'EC-03309', 'Hp Laser', 'CNDRP149VX', '2025-05-30', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103060', 'https://aliar.freshservice.com/a/tickets/66905?current_tab=details', '', '2025-06-04 13:39:06', 'tecnico', 'M428fdw', 1),
(83, 'Computador de escritorio', 'EC-01482', 'Dell', '000054515-000	', '2025-06-20', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103034', 'https://aliar.freshservice.com/helpdesk/tickets/67538', 'SITIO 1D Se le añadio 4 de ram y se le cambioe el disco mecanico por uno de ultima generacion ', '2025-06-20 16:48:28', 'tecnico', 'Otro...', 1),
(84, 'Computador de escritorio', 'EC-01481', 'Dell', '000054515-000	', '2025-06-20', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103034', 'https://aliar.freshservice.com/helpdesk/tickets/67538', 'SITIO 1D se le cambioe el disco mecanico por uno de ultima generacion ', '2025-06-20 16:50:45', 'tecnico', 'Otro...', 1),
(85, 'Impresora', 'EC-03233', 'Hp Laser', '000125485-000	', '2025-07-01', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103034', ' Ticket: https://aliar.freshservice.com/helpdesk/tickets/67328 ', '', '2025-07-02 13:04:58', 'Administrador', 'Otro...', 1),
(86, 'Computador de escritorio', 'EC-01481', 'Lenovo', '000054515-000	', '2025-07-01', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103034', 'Ticket: https://aliar.freshservice.com/helpdesk/tickets/67328 ', '', '2025-07-02 13:07:07', 'tecnico', 'Otro...', 1),
(87, 'Computador de escritorio', 'EC-01482', 'Dell', '000054516-000	', '2025-07-02', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103034', 'Ticket: https://aliar.freshservice.com/helpdesk/tickets/67328', '', '2025-07-02 13:36:20', 'tecnico', 'Otro...', 1),
(88, 'Computador de escritorio', 'EC-01483', 'Dell', '000054517-000	', '2025-07-02', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103034', 'Ticket: https://aliar.freshservice.com/helpdesk/tickets/67328', '', '2025-07-02 13:40:38', 'tecnico', 'Otro...', 1),
(89, 'Computador de escritorio', 'EC-01489', 'Dell', '000040748-000	', '2025-07-02', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103034', 'Ticket: https://aliar.freshservice.com/helpdesk/tickets/67328', '', '2025-07-02 13:42:21', 'tecnico', 'Otro...', 1),
(90, 'Radio', 'EC-01487', 'Motorola', '000054522-000	', '2025-07-02', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103034', 'Ticket: https://aliar.freshservice.com/helpdesk/tickets/67328', '', '2025-07-02 13:45:15', 'tecnico', 'DEP-450', 1),
(91, 'Radio', 'EC-01486', 'Motorola', '000054521-000	', '2025-07-02', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103034', 'Ticket: https://aliar.freshservice.com/helpdesk/tickets/67328', '', '2025-07-02 13:46:14', 'tecnico', 'DEP-450', 1),
(92, 'Radio', 'EC-04839', 'Motorola', '752EZCA882', '2025-07-02', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0501003', 'Ticket: https://aliar.freshservice.com/helpdesk/tickets/67328', '', '2025-07-02 13:48:24', 'tecnico', 'DEP-450', 1),
(93, 'Radio', 'EC-01493', 'Motorola', '000054525-000', '2025-07-02', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103034	', 'Ticket: https://aliar.freshservice.com/helpdesk/tickets/67328', '', '2025-07-02 13:49:52', 'tecnico', 'DEP-450', 1),
(94, 'Radio', 'EC-01488', 'Motorola', '000054523-000	', '2025-07-02', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103034', 'Ticket: https://aliar.freshservice.com/helpdesk/tickets/67328', '', '2025-07-02 13:50:45', 'tecnico', 'DEP-450', 1),
(95, 'Computador de escritorio', 'EC-05224	', 'Lenovo', 'YJ01LHPP', '2025-07-15', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103024', '', '', '2025-07-15 19:14:39', 'Administrador', 'Otro...', 1),
(96, 'Computador de escritorio', 'EC-03680', 'Lenovo', '000133596-000	', '2025-07-15', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103024', '', '', '2025-07-15 19:15:43', 'Administrador', 'Otro...', 1),
(97, 'Impresora', 'EC-03366', 'Epson', '000129049-000	', '2025-07-15', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103024', '', '', '2025-07-15 19:16:56', 'Administrador', 'M428fdw', 1),
(98, 'Radio', 'EC-04748', 'Motorola', '278TZF6766', '2025-07-15', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103024', '', '', '2025-07-15 19:18:57', 'Administrador', 'DEP-250', 1),
(99, 'Computador de escritorio', 'EC-02580', 'Lenovo', '000107188-000	', '2025-07-15', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103024', '', '', '2025-07-15 19:21:06', 'Administrador', 'Otro...', 1),
(100, 'Router / Switch', 'EC-03317', 'Otro...', '000127561-000	', '2025-07-15', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0302003', '', '', '2025-07-15 19:22:06', 'Administrador', 'Otro...', 1),
(101, 'Tablet', 'EC-04986', 'Samsung', 'R83WA10VWEA', '2025-07-15', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103024', '', '', '2025-07-15 19:30:15', 'tecnico', 'Otro...', 1),
(102, 'Radio', 'EC-04902', 'Motorola', '752ZZN7346', '2025-07-15', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103022', '', '', '2025-07-15 19:31:59', 'tecnico', 'DEP-450', 1),
(103, 'Radio de comunicación', 'EC-04772', 'Motorola', '278TZPD762', '2025-07-17', 'Wuilmer Andres Roman', 'Preventivo', 'Finalizado', 'Taller', '11A0101010', 'https://aliar.freshservice.com/a/tickets/68673?current_tab=details', '', '2025-07-17 16:48:19', 'Administrador', 'DEP-250', 1),
(104, 'Radio de comunicación', 'EC-03839', 'Hytera', '21427C0279', '2025-07-17', 'Wuilmer Andres Roman', 'Preventivo', 'Finalizado', 'Taller', '1110101010', 'https://aliar.freshservice.com/a/tickets/68672?current_tab=details', '', '2025-07-17 16:51:36', 'Administrador', 'BD506', 1),
(105, 'Radio de comunicación', 'EC-03836', 'Hytera', 'EC03836', '2025-07-17', 'Wuilmer Andres Roman', 'Preventivo', 'Finalizado', 'Taller', '11A0101010', 'https://aliar.freshservice.com/a/tickets/68671?current_tab=assets', '', '2025-07-17 16:56:40', 'Administrador', 'BD506', 1),
(106, 'Radio de comunicación', 'EC-00324', 'Motorola', '752TPRJ095', '2025-07-16', 'Wuilmer Andres Roman', 'Preventivo', 'Finalizado', 'Logística', '11A0301001', 'https://aliar.freshservice.com/a/tickets/68659?current_tab=details', 'Se realizó la verificación del radio en mención, identificándose que el micrófono se encontraba averiado. Se procedió con el cambio del mismo y posteriormente se revisó su funcionalidad mediante pruebas.', '2025-07-17 17:00:47', 'Administrador', 'DEP-450', 1),
(107, 'Radio de comunicación', 'EC-03844', 'Hytera', '21427C0284', '2025-07-07', 'Wuilmer Andres Roman', 'Preventivo', 'Finalizado', 'Taller', '11A0101010', 'https://aliar.freshservice.com/a/tickets/68244?current_tab=details', 'Se realizó la actualización de frecuencias análogas a tecnología digital, con la cual se viene trabajando actualmente en la finca Fazenda para la comunicación por radioteléfono.\nSe  realizó limpieza  general del radio y sus  accesorios.', '2025-07-17 17:04:53', 'Administrador', 'BD506', 1),
(108, 'Radio de comunicación', 'EC-00892', 'Motorola', '752IRL2903', '2025-07-15', 'Wuilmer Andres Roman', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103001', 'https://aliar.freshservice.com/a/tickets/64082?current_tab=details', 'El equipo se encontraba en proceso de reparación.\nTeniendo en cuenta lo anterior, se procederá a realizar las pruebas de funcionalidad. De acuerdo con los resultados, se informará oportunamente para coordinar su entrega.', '2025-07-17 17:13:40', 'Administrador', 'DEP-450', 1),
(109, 'Radio de comunicación', 'EC-02790', 'Motorola', '278TWT9432', '2025-04-26', 'Wuilmer Andres Roman', 'Preventivo', 'Finalizado', 'Mantenimiento', '11A0501002', 'https://aliar.freshservice.com/a/tickets/65560?current_tab=details', '', '2025-07-17 17:22:43', 'Administrador', 'DEP-250', 1),
(110, 'Radio de comunicación', 'EC-01622', 'Motorola', '7521SW6426', '2025-04-26', 'Wuilmer Andres Roman', 'Preventivo', 'Finalizado', 'Mantenimiento', '11A0501002', 'https://aliar.freshservice.com/a/tickets/65560?current_tab=details', '', '2025-07-17 17:25:41', 'Administrador', 'DEP-450', 1),
(111, 'Radio de comunicación', 'EC-03049', 'Motorola', '278TWB0578', '2025-04-26', 'Wuilmer Andres Roman', 'Preventivo', 'Finalizado', 'Mantenimiento', '11A0501002', 'https://aliar.freshservice.com/a/tickets/65560?current_tab=assets', '', '2025-07-17 17:28:23', 'Administrador', 'DEP-250', 1),
(112, 'Radio de comunicación', 'EC-05782', 'Motorola', '902ZAGD732', '2025-07-18', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Planta Balanceados BARL', '11A0102014', 'https://aliar.freshservice.com/a/tickets/68718?current_tab=assets', '', '2025-07-18 16:01:09', 'Administrador', 'R2', 1),
(113, 'Computador portátil', 'EC-05896', 'Lenovo', 'PF4WYVHG', '2025-07-18', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Admin Fincas', '11A0101001', 'https://aliar.freshservice.com/a/tickets/68714?current_tab=assets', '', '2025-07-18 16:05:24', 'Administrador', 'Thinkcentre M', 1),
(114, 'Radio', 'EC-04772', 'Motorola', '278TZPD762', '2025-07-21', 'Wuilmer Andres Roman', 'Preventivo', 'Finalizado', 'Agricultura FZ', '11A0101010', 'https://aliar.freshservice.com/a/tickets/68768?current_tab=assets', '', '2025-07-21 14:52:03', 'Administrador', 'DEP-250', 1),
(115, 'Radio', 'EC-03834', 'Hytera', '21427C0274', '2025-07-21', 'Wuilmer Andres Roman', 'Preventivo', 'Finalizado', 'Tecnología', '11A0101010', 'https://aliar.freshservice.com/cmdb/items/1271', '', '2025-07-21 15:10:39', 'tecnico', 'BD506', 1),
(116, 'Computador de escritorio', 'EC-02469', 'Lenovo', '000098642-000	', '2025-07-21', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103019', 'https://aliar.freshservice.com/helpdesk/tickets/68850 ', '', '2025-07-22 19:24:53', 'Administrador', 'Otro...', 1),
(117, 'Radio', 'EC-03890', 'Hytera', '000136190-000	', '2025-07-22', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103019', 'https://aliar.freshservice.com/helpdesk/tickets/68850 ', '', '2025-07-22 19:25:54', 'Administrador', 'BD506', 1),
(118, 'Computador de escritorio', 'EC-02017', 'Dell', '000072557-000	', '2025-07-22', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103019', 'https://aliar.freshservice.com/helpdesk/tickets/68850 ', '', '2025-07-22 19:27:12', 'Administrador', 'Otro...', 1),
(119, 'Radio', 'EC-05625', 'Motorola', '752ZZU7690', '2025-07-22', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103002', 'https://aliar.freshservice.com/helpdesk/tickets/68850 ', '', '2025-07-22 19:28:10', 'Administrador', 'DEP-450', 1),
(120, 'Radio', 'EC-03515', 'Motorola', '000132513-000	', '2025-07-22', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103019', 'https://aliar.freshservice.com/helpdesk/tickets/68850 ', '', '2025-07-22 19:29:28', 'Administrador', 'DEP-450', 1),
(121, 'Computador de escritorio', 'EC-02469', 'Lenovo', '000098642-000	', '2025-07-22', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103019', 'https://aliar.freshservice.com/helpdesk/tickets/68850 ', '', '2025-07-22 19:30:14', 'Administrador', 'Otro...', 1),
(122, 'Radio', 'EC-01532', 'Motorola', '000056232-000	', '2025-07-22', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103019	', 'https://aliar.freshservice.com/helpdesk/tickets/68850 ', '', '2025-07-22 19:31:10', 'Administrador', 'DEP-450', 1),
(123, 'Computador de escritorio', 'EC-01873', 'Dell', '000068723-000	', '2025-07-22', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103019', 'https://aliar.freshservice.com/helpdesk/tickets/68850 ', '', '2025-07-22 19:31:59', 'Administrador', 'Otro...', 1),
(124, 'Computador de escritorio', 'EC-04998', 'Dell', 'MJ0KQBA8', '2025-07-22', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103019', 'https://aliar.freshservice.com/helpdesk/tickets/68850 ', '', '2025-07-22 19:33:26', 'Administrador', 'Otro...', 1),
(125, 'Radio', 'EC-05022', 'Motorola', '278TZPB989', '2025-07-22', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Porcicultura', '278TZPB989', 'https://aliar.freshservice.com/helpdesk/tickets/68850 ', '', '2025-07-22 19:34:23', 'Administrador', 'DEP-250', 1),
(126, 'Impresora', 'EC-02817', 'Hp Laser', '000117507-000	', '2025-07-24', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Taller', '11A0502002', 'https://aliar.freshservice.com/helpdesk/tickets/68882 ', '', '2025-07-24 15:11:43', 'tecnico', 'M428fdw', 1),
(127, 'Impresora', 'EC-03047', 'Hp Laser', '000123381-000	', '2025-07-24', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Taller', '11A0502001', 'https://aliar.freshservice.com/helpdesk/tickets/68882 ', '', '2025-07-24 15:12:37', 'tecnico', 'M428fdw', 1),
(128, 'Computador portátil', 'EC-03713', 'Lenovo', '000133632-000	', '2025-07-24', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Taller', '11A0502001', 'https://aliar.freshservice.com/helpdesk/tickets/68882 ', '', '2025-07-24 15:14:13', 'tecnico', 'Otro...', 1),
(129, 'Computador portátil', 'EC-03637', 'Lenovo', '000133554-000	', '2025-07-24', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Taller', '11A0502002', 'https://aliar.freshservice.com/helpdesk/tickets/68882 ', '', '2025-07-24 15:17:10', 'tecnico', 'Otro...', 1),
(130, 'Computador portátil', 'EC-04637', 'Lenovo', 'MP21D9K4', '2025-07-24', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Taller', '11A0402001', 'https://aliar.freshservice.com/helpdesk/tickets/68882 ', '', '2025-07-24 15:18:26', 'tecnico', 'Otro...', 1),
(131, 'Impresora', 'EC-03357', 'Epson', '000129040-000', '2025-07-26', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Santa Clara', '11A0301014', 'https://aliar.freshservice.com/helpdesk/tickets/66030', 'Se realizo mantenimiento en bascula Santa Clara ', '2025-07-26 13:48:52', 'tecnico', 'M428fdw', 1),
(132, 'Computador de escritorio', 'EC-03364	', 'Lenovo', '000129047-000	', '2025-07-26', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Santa Clara', '11A0301014', 'https://aliar.freshservice.com/helpdesk/tickets/66030', 'Se realizo mantenimiento en Santa Clara bascula ', '2025-07-26 13:51:07', 'tecnico', 'Otro...', 1),
(133, 'Router / Switch', 'EC-06233	', 'Mikrotik', 'HEJ08J0ZMDH', '2025-07-26', 'Maicol Esteban Cardenas', 'Preventivo', 'Finalizado', 'Santa Clara', '11A0301014', 'https://aliar.freshservice.com/helpdesk/tickets/66030', 'Se realizo mantenimiento en Santa Clara Bascula ', '2025-07-26 14:18:30', 'tecnico', 'RB750', 1),
(134, 'Nvr', 'EC-04054	', 'Hikvision', '000138842-000	', '2025-07-26', 'Maicol Esteban Cardenas', 'Preventivo', 'Finalizado', 'Santa Clara', '11A0402001', 'https://aliar.freshservice.com/helpdesk/tickets/66030', 'Se realizo mantenimiento Santa Clara bascula ', '2025-07-26 14:20:19', 'tecnico', 'Otro...', 1),
(135, 'Cámara de seguridad', 'EC-03726	', 'Hikvision', '000133622-000	', '2025-07-26', 'Maicol Esteban Cardenas', 'Preventivo', 'Finalizado', 'Santa Clara', '11A0301014', 'https://aliar.freshservice.com/helpdesk/tickets/66030', 'Se realiza mantenimiento en Santa Clara bascula ', '2025-07-26 14:22:16', 'tecnico', 'Otro...', 1),
(136, 'Cámara de seguridad', 'EC-03684	', 'Hikvision', '000133600-000	', '2025-07-26', 'Maicol Esteban Cardenas', 'Preventivo', 'Finalizado', 'Santa Clara', '11A0301014', 'https://aliar.freshservice.com/helpdesk/tickets/66030', 'Se realizo mantenimiento en Santa Clara bascula', '2025-07-26 14:25:17', 'tecnico', 'Otro...', 1),
(137, 'Radio', 'EC-05786	', 'Motorola', '902ZAGD735', '2025-07-26', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Planta Balanceados BARL', '11A0102014', 'https://aliar.freshservice.com/helpdesk/tickets/66030', '', '2025-07-26 14:40:03', 'tecnico', 'R2', 1),
(138, 'Radio', 'EC-05777	', 'Motorola', '902ZAGG235', '2025-07-26', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Planta Balanceados BARL', '11A0102014', 'https://aliar.freshservice.com/helpdesk/tickets/66030', '', '2025-07-26 14:45:25', 'tecnico', 'R2', 1),
(139, 'Radio', 'EC-05780	', 'Motorola', '902ZAGD747', '2025-07-26', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Planta Balanceados BARL', '11A0102014', 'https://aliar.freshservice.com/helpdesk/tickets/66030', '', '2025-07-26 14:46:56', 'tecnico', 'R2', 1),
(140, 'Impresora', 'EC-03309', 'Epson', '000127553-000	', '2025-07-24', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103060	', 'https://aliar.freshservice.com/a/tickets/69147?current_tab=details', '', '2025-07-30 17:25:08', 'Administrador', 'M428fdw', 1),
(141, 'Computador de escritorio', 'EC-02691', 'Lenovo', '000112735-000	', '2025-07-30', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Planta Extractora', '11A0102008	', 'https://aliar.freshservice.com/helpdesk/tickets/68755 ', 'QUEDO PENDIENTE EL CAMBIO DE DISCO ', '2025-07-31 16:45:26', 'Administrador', 'Otro...', 1),
(142, 'Impresora', 'EC-05005 ', 'Lenovo', 'CNCRQDD138', '2025-08-06', 'Pasante 2 Comunicaciones', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103002', 'https://aliar.freshservice.com/helpdesk/tickets/68889', '', '2025-08-06 17:05:36', 'tecnico', 'M428fdw', 1),
(143, 'Computador de escritorio', 'EC-05227	', 'Lenovo', 'YJ01LHMM', '2025-08-06', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103002	', 'https://aliar.freshservice.com/helpdesk/tickets/68889 ', '', '2025-08-06 17:06:39', 'tecnico', 'Thinkcentre M', 1),
(144, 'Computador de escritorio', 'EC-02292	', 'Dell', '000084946-000	', '2025-08-06', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103029', 'https://aliar.freshservice.com/helpdesk/tickets/68889 ', '', '2025-08-06 17:11:43', 'tecnico', 'OPTIPLEX', 1),
(145, 'Radio', 'EC-00891	', 'Motorola', '000039617-000	', '2025-08-06', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103029', 'https://aliar.freshservice.com/helpdesk/tickets/68889 ', '', '2025-08-06 17:14:39', 'tecnico', 'DEP-450', 1),
(146, 'Radio', 'EC-04685	', 'Motorola', '278TZF2251', '2025-08-06', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0103073', 'https://aliar.freshservice.com/helpdesk/tickets/68889 ', '', '2025-08-06 17:15:36', 'tecnico', 'DEP-250', 1),
(148, 'Computador de escritorio', 'EC-04040	', 'Lenovo', '000138812-000	', '2025-08-06', 'Pasante 1 Infraestructura', 'Preventivo', 'Finalizado', 'Porcicultura', '11A0302002', 'https://aliar.freshservice.com/helpdesk/tickets/68889 ', '', '2025-08-06 17:18:11', 'tecnico', 'Otro...', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `id_sede` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`id_sede`, `nombre`) VALUES
(4, 'Regional Cundinamarca Bogotá'),
(1, 'Regional Meta Fincas'),
(2, 'Regional Meta Frigorífico'),
(3, 'Regional Santander Sede Principal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico`
--

CREATE TABLE `tecnico` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tecnico`
--

INSERT INTO `tecnico` (`id`, `nombre`) VALUES
(1, 'Wuilmer Andres Roman'),
(2, 'Maicol Esteban Cardenas'),
(3, 'Johel Fernando Garnica'),
(4, 'Jesus Ricardo'),
(5, 'Pasante 1 Infraestructura'),
(6, 'Pasante 2 Comunicaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id_ticket` int(11) NOT NULL,
  `numero_ticket` varchar(50) DEFAULT NULL,
  `fecha_recepcion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_equipo`
--

CREATE TABLE `tipo_equipo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_equipo`
--

INSERT INTO `tipo_equipo` (`id`, `nombre`, `estado`) VALUES
(4, 'Router / Switch', 'activo'),
(6, 'Computador portátil', 'activo'),
(7, 'Computador de escritorio', 'activo'),
(8, 'Impresora', 'activo'),
(9, 'Teléfono IP', 'activo'),
(10, 'Tablet', 'activo'),
(13, 'Cámara de seguridad', 'activo'),
(14, 'Proyector', 'activo'),
(15, 'Ups', 'activo'),
(16, 'AP', 'activo'),
(18, 'Terminal Facial', 'activo'),
(20, 'Servidores', 'activo'),
(21, 'Rack de comunicaciones', 'activo'),
(22, 'Radio', 'activo'),
(23, 'VideoCoferencia', 'activo'),
(24, 'Otro...', 'activo'),
(25, 'Nvr', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_mantenimiento`
--

CREATE TABLE `tipo_mantenimiento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_mantenimiento`
--

INSERT INTO `tipo_mantenimiento` (`id`, `nombre`) VALUES
(1, 'Preventivo'),
(2, 'Correctivo'),
(3, 'Correctivo / Preventivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id`, `nombre`) VALUES
(1, 'Admin Fincas'),
(2, 'Oficinas Auteco'),
(3, 'Gestión Humana'),
(4, 'Tecnología'),
(5, 'Mantenimiento'),
(6, 'Agricultura FZ'),
(7, 'Santa Clara'),
(8, 'Taller'),
(9, 'Logística'),
(10, 'Porcicultura'),
(11, 'Bioprocesos'),
(12, 'Proyectos'),
(13, 'Planta Extractora'),
(14, 'Planta Balanceados FZ'),
(15, 'Planta Balanceados BARL'),
(16, 'Planta Secamiento FZ'),
(17, 'Planta Secamiento BARL'),
(18, 'Taller SF'),
(19, 'Agricultura SF'),
(20, 'Agricultura SC'),
(21, 'Ganderia'),
(22, 'Calidad'),
(23, 'Obra Civil'),
(24, 'Salud Integral'),
(25, 'Control Interno'),
(26, 'Fundacion Pervivir'),
(27, 'PLanta Semilla'),
(28, 'Otra..');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `rol` enum('admin','usuario') NOT NULL DEFAULT 'usuario',
  `id_sede` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_registros_id_sede` (`id_sede`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id_sede`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id_ticket`),
  ADD UNIQUE KEY `numero_ticket` (`numero_ticket`);

--
-- Indices de la tabla `tipo_equipo`
--
ALTER TABLE `tipo_equipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_mantenimiento`
--
ALTER TABLE `tipo_mantenimiento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `idx_usuarios_id_sede` (`id_sede`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `registros`
--
ALTER TABLE `registros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `id_sede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_equipo`
--
ALTER TABLE `tipo_equipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `tipo_mantenimiento`
--
ALTER TABLE `tipo_mantenimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `registros`
--
ALTER TABLE `registros`
  ADD CONSTRAINT `fk_registros_sedes` FOREIGN KEY (`id_sede`) REFERENCES `sedes` (`id_sede`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_sedes` FOREIGN KEY (`id_sede`) REFERENCES `sedes` (`id_sede`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
