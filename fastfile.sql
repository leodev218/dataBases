-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 06-08-2022 a las 04:12:03
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fastfile`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `idCargo` int(11) NOT NULL,
  `cargo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`idCargo`, `cargo`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `documento_cliente` varchar(20) NOT NULL,
  `nombre_cliente` varchar(30) NOT NULL,
  `apellido_cliente` varchar(20) NOT NULL,
  `telefono_cliente` varchar(20) NOT NULL,
  `creado_por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `documento_cliente`, `nombre_cliente`, `apellido_cliente`, `telefono_cliente`, `creado_por`) VALUES
(1, '12322344', 'raul', 'sanchez', '3231344444', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_orden`
--

CREATE TABLE `detalle_orden` (
  `id_detalle` int(11) NOT NULL,
  `cantidad_p` int(11) NOT NULL,
  `numero_o` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_orden`
--

INSERT INTO `detalle_orden` (`id_detalle`, `cantidad_p`, `numero_o`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `numero_orden` int(11) NOT NULL,
  `f_cliente` int(11) DEFAULT NULL,
  `f_proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `fecha_entrega`, `fecha_pago`, `numero_orden`, `f_cliente`, `f_proveedor`) VALUES
(1, NULL, NULL, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id_orden` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `creado_por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id_orden`, `fecha_creacion`, `fecha_entrega`, `fecha_pago`, `creado_por`) VALUES
(1, '2022-08-05', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(25) NOT NULL,
  `descripcion_producto` varchar(200) NOT NULL,
  `valor_producto` float NOT NULL,
  `cantidad_producto` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre_producto`, `descripcion_producto`, `valor_producto`, `cantidad_producto`, `creado_por`) VALUES
(1, 'taladro', 'fuente: 1123 cargador:12 caracteristicas, etc.', 170000, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `documento_proveedor` varchar(20) NOT NULL,
  `nombre_proveedor` varchar(30) NOT NULL,
  `apellido_proveedor` varchar(20) NOT NULL,
  `telefono_proveedor` varchar(20) NOT NULL,
  `creado_por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `documento_proveedor`, `nombre_proveedor`, `apellido_proveedor`, `telefono_proveedor`, `creado_por`) VALUES
(1, '121321314', 'lol', 'wild rift', '321321321', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `documento_usuario` varchar(20) NOT NULL,
  `nombre_usuario` varchar(25) NOT NULL,
  `apellido_usuario` varchar(25) NOT NULL,
  `correo_usuario` varchar(60) NOT NULL,
  `telefono_usuario` varchar(10) NOT NULL,
  `rol` int(11) DEFAULT NULL,
  `contraseña` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `documento_usuario`, `nombre_usuario`, `apellido_usuario`, `correo_usuario`, `telefono_usuario`, `rol`, `contraseña`) VALUES
(1, '1022992391', 'leonardo', 'tamayo', 'leonardo.dev218@gmail.com', '3133383734', 1, '1234'),
(2, '1234556', 'jose', 'lara', 'lkefoekf@grkorkgrg.com', '2323156', 2, 'qwerty');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `worktime`
--

CREATE TABLE `worktime` (
  `id_worktime` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `logueo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idCargo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `FK_cliente_creado_por` (`creado_por`);

--
-- Indices de la tabla `detalle_orden`
--
ALTER TABLE `detalle_orden`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `FK_detalle_orden_cantidad_p` (`cantidad_p`),
  ADD KEY `FK_detalle_orden_numero_o` (`numero_o`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `FK_factura_numero_orden` (`numero_orden`),
  ADD KEY `FK_factura_f_cliente` (`f_cliente`),
  ADD KEY `FK_factura_f_proveedor` (`f_proveedor`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `FK_orden_creado_por` (`creado_por`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `FK_id_producto_creado_por` (`creado_por`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `FK_proveedor_creado_por` (`creado_por`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `FK_rol_ud_usuario` (`rol`);

--
-- Indices de la tabla `worktime`
--
ALTER TABLE `worktime`
  ADD PRIMARY KEY (`id_worktime`),
  ADD KEY `FK_worktime_logueo` (`logueo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_orden`
--
ALTER TABLE `detalle_orden`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `worktime`
--
ALTER TABLE `worktime`
  MODIFY `id_worktime` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK_cliente_creado_por` FOREIGN KEY (`creado_por`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `detalle_orden`
--
ALTER TABLE `detalle_orden`
  ADD CONSTRAINT `FK_detalle_orden_cantidad_p` FOREIGN KEY (`cantidad_p`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `FK_detalle_orden_numero_o` FOREIGN KEY (`numero_o`) REFERENCES `orden` (`id_orden`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `FK_factura_f_cliente` FOREIGN KEY (`f_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `FK_factura_f_proveedor` FOREIGN KEY (`f_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  ADD CONSTRAINT `FK_factura_numero_orden` FOREIGN KEY (`numero_orden`) REFERENCES `orden` (`id_orden`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `FK_orden_creado_por` FOREIGN KEY (`creado_por`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FK_id_producto_creado_por` FOREIGN KEY (`creado_por`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `FK_proveedor_creado_por` FOREIGN KEY (`creado_por`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_rol_ud_usuario` FOREIGN KEY (`rol`) REFERENCES `cargo` (`idCargo`);

--
-- Filtros para la tabla `worktime`
--
ALTER TABLE `worktime`
  ADD CONSTRAINT `FK_worktime_logueo` FOREIGN KEY (`logueo`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
