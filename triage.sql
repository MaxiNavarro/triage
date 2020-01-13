-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2019 a las 23:35:50
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `triage`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_urgencia`
--

CREATE TABLE `nivel_urgencia` (
  `id` int(10) UNSIGNED NOT NULL,
  `color` varchar(20) NOT NULL,
  `tipo_urgencia` varchar(50) NOT NULL,
  `espera_maxima` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nivel_urgencia`
--

INSERT INTO `nivel_urgencia` (`id`, `color`, `tipo_urgencia`, `espera_maxima`, `deleted_at`) VALUES
(1, 'Rojo', 'Resucitacion', 0, NULL),
(2, 'Naranja', 'Emergencia', 15, NULL),
(3, 'Amarillo', 'Urgencia', 60, NULL),
(4, 'Verde', 'Urgencia menor', 120, NULL),
(5, 'Azul', 'Sin urgencia', 240, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `edad` int(11) NOT NULL,
  `descripcion_estado` varchar(500) NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `fecha_egreso` datetime DEFAULT NULL,
  `nivel_urgencia_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellido`, `edad`, `descripcion_estado`, `fecha_ingreso`, `fecha_egreso`, `nivel_urgencia_id`, `deleted_at`) VALUES
(1, 'Maximiliano', 'Navarro', 36, 'Con dolor de cabeza', '2019-11-17 01:54:08', NULL, 5, NULL),
(2, 'Susana', 'Pallero', 46, 'Asma', '2019-11-17 01:59:10', NULL, 2, NULL),
(3, 'Lucía', 'Navarro', 13, 'Apendicitis', '2019-11-17 02:01:16', '2019-11-18 23:30:12', 2, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `nivel_urgencia`
--
ALTER TABLE `nivel_urgencia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nivel_urgencia_id` (`nivel_urgencia_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `nivel_urgencia`
--
ALTER TABLE `nivel_urgencia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`nivel_urgencia_id`) REFERENCES `nivel_urgencia` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
