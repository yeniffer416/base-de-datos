-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 31-03-2022 a las 21:59:14
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
-- Base de datos: `empresa2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cod_cliente` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `tel_cliente` int(11) NOT NULL,
  `nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cod_cliente`, `id_cliente`, `tel_cliente`, `nombre`) VALUES
(5432, 321567, 654231, 'laura'),
(6529, 437654, 266413, 'mya');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `cod_productos` int(11) NOT NULL,
  `nom_producto` varchar(15) NOT NULL,
  `marca_producto` varchar(15) NOT NULL,
  `fec_vec` date NOT NULL,
  `prec_producto` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`cod_productos`, `nom_producto`, `marca_producto`, `fec_vec`, `prec_producto`) VALUES
(2346, 'arroz', 'roa', '2022-03-08', 2000),
(3465, 'chocolate', 'jet', '2022-03-16', 3000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `num_sucursal` int(11) NOT NULL,
  `nom_sucursal` varchar(15) NOT NULL,
  `dir_surculsal` varchar(20) NOT NULL,
  `clientes_cod_cliente` int(11) NOT NULL,
  `ventas_cod_ventas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`num_sucursal`, `nom_sucursal`, `dir_surculsal`, `clientes_cod_cliente`, `ventas_cod_ventas`) VALUES
(5, 'caviota', 'calle 24 avenida 42 ', 6529, 643);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `cod_ventas` int(11) NOT NULL,
  `clientes_cod_cliente` int(11) NOT NULL,
  `productos_cod_productos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`cod_ventas`, `clientes_cod_cliente`, `productos_cod_productos`) VALUES
(643, 5432, 2346),
(765, 6529, 2346);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`cod_productos`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`num_sucursal`,`clientes_cod_cliente`,`ventas_cod_ventas`),
  ADD KEY `fk_sucursales_clientes1_idx` (`clientes_cod_cliente`),
  ADD KEY `fk_sucursales_ventas1_idx` (`ventas_cod_ventas`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`cod_ventas`,`clientes_cod_cliente`,`productos_cod_productos`),
  ADD KEY `fk_ventas_clientes1_idx` (`clientes_cod_cliente`),
  ADD KEY `fk_ventas_productos1_idx` (`productos_cod_productos`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD CONSTRAINT `fk_sucursales_clientes1` FOREIGN KEY (`clientes_cod_cliente`) REFERENCES `clientes` (`cod_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sucursales_ventas1` FOREIGN KEY (`ventas_cod_ventas`) REFERENCES `ventas` (`cod_ventas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_ventas_clientes1` FOREIGN KEY (`clientes_cod_cliente`) REFERENCES `clientes` (`cod_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ventas_productos1` FOREIGN KEY (`productos_cod_productos`) REFERENCES `productos` (`cod_productos`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
