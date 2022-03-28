-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 28-03-2022 a las 14:33:59
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bar`
--

CREATE TABLE `bar` (
  `id_bar` int(11) NOT NULL,
  `tel_bar` int(11) NOT NULL,
  `dir_bar` varchar(30) NOT NULL,
  `nom_bar` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bar`
--

INSERT INTO `bar` (`id_bar`, `tel_bar`, `dir_bar`, `nom_bar`) VALUES
(345, 287654, 'carr9 23-09', 'delicias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licor`
--

CREATE TABLE `licor` (
  `prec_licor` varchar(30) NOT NULL,
  `fec_licor` date NOT NULL,
  `id_licor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `licor`
--

INSERT INTO `licor` (`prec_licor`, `fec_licor`, `id_licor`) VALUES
('50000', '2022-03-17', 6574);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id_reservas` int(11) NOT NULL,
  `fec_reservas` date NOT NULL,
  `hor_entrada` time NOT NULL,
  `hora_salidad` time NOT NULL,
  `LICOR_id_licor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id_reservas`, `fec_reservas`, `hor_entrada`, `hora_salidad`, `LICOR_id_licor`) VALUES
(3425, '2022-03-14', '03:32:14', '09:32:14', 6574);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nom_usuario` varchar(30) NOT NULL,
  `ed_usuario` int(11) NOT NULL,
  `tel_usuario` int(11) NOT NULL,
  `dir_usuario` varchar(30) NOT NULL,
  `BAR_id_bar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nom_usuario`, `ed_usuario`, `tel_usuario`, `dir_usuario`, `BAR_id_bar`) VALUES
(54, 'fabian', 35, 34526, 'mz3 cs 18', 345);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_reservas`
--

CREATE TABLE `usuario_reservas` (
  `USUARIO_id_usuario` int(11) NOT NULL,
  `RESERVAS_id_reservas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bar`
--
ALTER TABLE `bar`
  ADD PRIMARY KEY (`id_bar`);

--
-- Indices de la tabla `licor`
--
ALTER TABLE `licor`
  ADD PRIMARY KEY (`id_licor`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reservas`,`LICOR_id_licor`),
  ADD KEY `fk_RESERVAS_LICOR1_idx` (`LICOR_id_licor`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`,`BAR_id_bar`),
  ADD KEY `fk_USUARIO_BAR_idx` (`BAR_id_bar`);

--
-- Indices de la tabla `usuario_reservas`
--
ALTER TABLE `usuario_reservas`
  ADD PRIMARY KEY (`USUARIO_id_usuario`,`RESERVAS_id_reservas`),
  ADD KEY `fk_USUARIO_has_RESERVAS_USUARIO1_idx` (`USUARIO_id_usuario`),
  ADD KEY `fk_USUARIO_RESERVAS_RESERVAS1_idx` (`RESERVAS_id_reservas`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `fk_RESERVAS_LICOR1` FOREIGN KEY (`LICOR_id_licor`) REFERENCES `licor` (`id_licor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_USUARIO_BAR` FOREIGN KEY (`BAR_id_bar`) REFERENCES `bar` (`id_bar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_reservas`
--
ALTER TABLE `usuario_reservas`
  ADD CONSTRAINT `fk_USUARIO_RESERVAS_RESERVAS1` FOREIGN KEY (`RESERVAS_id_reservas`) REFERENCES `reservas` (`id_reservas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_USUARIO_has_RESERVAS_USUARIO1` FOREIGN KEY (`USUARIO_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
