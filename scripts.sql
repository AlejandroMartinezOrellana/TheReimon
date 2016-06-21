-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-06-2016 a las 02:06:38
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `scripts`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Rut_cliente` int(11) NOT NULL,
  `Clave_cliente` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Nombre` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Apellido` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `E_mail` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Direccion` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Ciudad` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Telefono` varchar(45) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `idReserva` int(11) NOT NULL,
  `Hora_Inicio` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Hora_Final` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Precio_idPrecio` int(11) NOT NULL,
  `Cliente_Rut_cliente` int(11) NOT NULL,
  `Stock_idStock` int(11) NOT NULL,
  `Usuario_id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `idStock` int(11) NOT NULL,
  `Id_Vehiculo` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `chasis` varchar(45) COLLATE utf8_bin NOT NULL,
  `Vehiculo_idVehiculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nom_usuario` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Cargo_usuario` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `clave_usuario` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `tipo_usuario` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `idVehiculo` int(11) NOT NULL,
  `marca` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Color` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Modelo` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `precio` int(11) NOT NULL,
  `fotografia` varchar(45) COLLATE utf8_bin NOT NULL,
  `tipo_vehiculo` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Rut_cliente`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idReserva`,`Stock_idStock`,`Usuario_id_usuario`),
  ADD KEY `fk_Reserva_Cliente1_idx` (`Cliente_Rut_cliente`),
  ADD KEY `fk_Reserva_Stock1_idx` (`Stock_idStock`),
  ADD KEY `fk_Reserva_Usuario1_idx` (`Usuario_id_usuario`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`idStock`),
  ADD KEY `fk_Stock_Vehiculo1_idx` (`Vehiculo_idVehiculo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`idVehiculo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_Reserva_Cliente1` FOREIGN KEY (`Cliente_Rut_cliente`) REFERENCES `cliente` (`Rut_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Reserva_Stock1` FOREIGN KEY (`Stock_idStock`) REFERENCES `stock` (`idStock`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Reserva_Usuario1` FOREIGN KEY (`Usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `fk_Stock_Vehiculo1` FOREIGN KEY (`Vehiculo_idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
