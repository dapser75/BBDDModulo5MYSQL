-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-01-2021 a las 12:26:59
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pizzeria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_categoriapizza`
--

CREATE TABLE `tb_categoriapizza` (
  `id_categoriapizza` int(11) NOT NULL,
  `categoriapizza` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_categoriapizza`
--

INSERT INTO `tb_categoriapizza` (`id_categoriapizza`, `categoriapizza`) VALUES
(1, 'Grande'),
(2, 'Mediana'),
(3, 'Pequeña'),
(4, 'Grande Masa fina'),
(5, 'Mediana masa fina'),
(6, 'Pequeña masa fina'),
(13, 'Pequeña borde queso'),
(14, 'Mediana borde queso'),
(15, 'Grande borde queso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_clientes`
--

CREATE TABLE `tb_clientes` (
  `id_cliente` int(8) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `codigopostal_id` int(9) NOT NULL,
  `telefono` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_clientes`
--

INSERT INTO `tb_clientes` (`id_cliente`, `nombre`, `apellidos`, `direccion`, `codigopostal_id`, `telefono`) VALUES
(1, 'Pepe', 'Garcia Presas', 'Calle numancia 45 piso 5 escalera izq puerta B', 3, 933333333),
(2, 'Juan', 'Amor Garcia', 'Calle gran via nº 1 piso 5 escalera izq puerta B', 1, 933333335),
(3, 'Pedro', 'Sanchez', 'Calle Joan Serraima 25, 1-5', 2, 933333338),
(4, 'Maria', 'Serra Pujol', 'Calle Angel Guimera 25 1-2', 4, 913333335);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cpostales`
--

CREATE TABLE `tb_cpostales` (
  `id_codigopostal` int(9) NOT NULL,
  `codigopostal` varchar(12) DEFAULT NULL,
  `poblacion` varchar(22) DEFAULT NULL,
  `provincia_id` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_cpostales`
--

INSERT INTO `tb_cpostales` (`id_codigopostal`, `codigopostal`, `poblacion`, `provincia_id`) VALUES
(1, '08620', 'Sant vicenç dels horts', 9),
(2, '08038', 'Barcelona', 9),
(3, '08027', 'Barcelona', 9),
(4, '20010', 'Madrid', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_empleados`
--

CREATE TABLE `tb_empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `tienda_id` int(11) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `nif` varchar(9) NOT NULL,
  `telefono` int(12) NOT NULL,
  `tipoempleo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_empleados`
--

INSERT INTO `tb_empleados` (`id_empleado`, `nombre`, `tienda_id`, `apellidos`, `nif`, `telefono`, `tipoempleo_id`) VALUES
(14, 'Empleado 1', 7, 'Apellido 1', '12345678A', 111222333, 1),
(15, 'Empleado 2', 9, 'Apellido 2', '12345678Q', 222111333, 1),
(16, 'Empleado 3', 10, 'Apellido 4', '12345678W', 999888777, 1),
(17, 'Empleado 4', 11, 'Apellidos 4', '12345678E', 777888666, 1),
(18, 'Empleado 5', 7, 'Apellidos 5', '12345678R', 666444777, 2),
(19, 'Empelado 6', 9, 'Apellido 6', '12345678P', 666777889, 2),
(20, 'Empleado 7', 10, 'Apellidos 7', '12345678L', 222333111, 2),
(21, 'Empleado 8', 11, 'Apellido 8', '12345678M', 123456999, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_entregadomicilio`
--

CREATE TABLE `tb_entregadomicilio` (
  `id_entregadomicilio` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `hora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_entregadomicilio`
--

INSERT INTO `tb_entregadomicilio` (`id_entregadomicilio`, `pedido_id`, `empleado_id`, `hora`) VALUES
(1, 1, 14, '2021-01-20 12:20:26'),
(2, 4, 18, '2021-01-20 12:20:26'),
(3, 5, 18, '2021-01-25 12:11:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_lineapedidos`
--

CREATE TABLE `tb_lineapedidos` (
  `id_linea` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_lineapedidos`
--

INSERT INTO `tb_lineapedidos` (`id_linea`, `pedido_id`, `producto_id`) VALUES
(1, 1, 6),
(4, 1, 11),
(5, 1, 34),
(6, 1, 25),
(8, 3, 38),
(9, 3, 38),
(10, 4, 6),
(11, 4, 25),
(12, 4, 9),
(13, 4, 36),
(14, 5, 38),
(15, 5, 10),
(16, 5, 11),
(17, 5, 23),
(22, 5, 34),
(23, 5, 6),
(24, 6, 22),
(25, 6, 21),
(26, 7, 33),
(27, 7, 35),
(28, 7, 37),
(29, 7, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_pedidos`
--

CREATE TABLE `tb_pedidos` (
  `id_pedido` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `reparto` tinyint(1) NOT NULL DEFAULT 0,
  `tienda_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_pedidos`
--

INSERT INTO `tb_pedidos` (`id_pedido`, `cliente_id`, `fecha`, `reparto`, `tienda_id`) VALUES
(1, 2, '2021-01-19 10:30:36', 0, 7),
(3, 4, '2021-01-20 10:01:35', 1, 10),
(4, 2, '2021-01-20 10:57:55', 0, 7),
(5, 2, '2021-01-20 10:57:55', 0, 7),
(6, 4, '2021-01-20 10:57:55', 1, 10),
(7, 3, '2021-01-24 22:07:02', 1, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_producto`
--

CREATE TABLE `tb_producto` (
  `id_producto` int(11) NOT NULL,
  `tipoproducto_id` int(3) NOT NULL,
  `nombreproducto` varchar(50) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `precio` decimal(3,2) NOT NULL,
  `imagen` varchar(80) DEFAULT NULL,
  `categoriapizza_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_producto`
--

INSERT INTO `tb_producto` (`id_producto`, `tipoproducto_id`, `nombreproducto`, `descripcion`, `precio`, `imagen`, `categoriapizza_id`) VALUES
(6, 1, 'Coca cola 2L', NULL, '3.00', NULL, NULL),
(7, 3, 'Cuatro Quesos', 'tomàquet, roquefort, grana padano, emental i mozzarella', '9.99', NULL, 1),
(8, 3, 'Cuatro Quesos', 'tomàquet, roquefort, grana padano, emental i mozzarella', '9.99', NULL, 2),
(9, 3, 'Cuatro Quesos', 'tomàquet, roquefort, grana padano, emental i mozzarella', '8.00', NULL, 3),
(10, 1, 'Cerveza Lata 33cl Heineken', NULL, '2.00', NULL, NULL),
(11, 1, 'Lambrusco Rosado', NULL, '9.99', NULL, NULL),
(12, 1, 'Sprite 2L', NULL, '3.00', NULL, NULL),
(13, 1, 'Lambrusco tinto', NULL, '9.99', NULL, NULL),
(19, 3, 'Campera', 'salsa barbacoa, bacó, pollastre marinat i mozzarella', '9.99', NULL, 1),
(21, 3, 'Marinera', ' tomàquet, tonyina, gambes, cranc i mozzarella', '9.99', '', 1),
(22, 3, 'Mallorquina', 'tomàquet, grana padano, doble sobrassada, mel i mozzarella', '9.99', '', 1),
(23, 3, 'Del huerto', ' tomàquet natural, xampinyons, ceba, olives i mozzarella', '9.99', '', 1),
(24, 3, 'Campera', 'salsa barbacoa, bacó, pollastre marinat i mozzarella', '8.00', NULL, 2),
(25, 3, 'Campera', 'salsa barbacoa, bacó, pollastre marinat i mozzarella', '9.99', NULL, 4),
(26, 3, 'Mallorquina', 'tomàquet, grana padano, doble sobrassada, mel i mozzarella', '9.99', '', 14),
(33, 2, 'Burguer de pollo', 'Pollo rebozado, mezclum, mayonesa de curry miel y mostaza', '9.99', NULL, NULL),
(34, 2, 'Burguer americana', '200 gr de ternera de Girona con huevo, bacon, tomate y cebolla caramelizada', '9.99', NULL, NULL),
(35, 2, 'Burguer Transilvania', '200 gr de ternera de Girona alioli, jamon iberico, queso de cabra y miel', '9.99', NULL, NULL),
(36, 2, 'Premium burguer XL', '300 gr de ternera de Girona, mezclum, salsa bbq, triple cheedar, triple bacon tomate y cebolla caramelizada al pedro ximenez', '9.99', NULL, NULL),
(37, 2, 'Burguer vegetal green', 'Hamburguesa de tomate seco, arándanos y cilantro con guacamole y pico de gallo al chumichurri', '9.99', NULL, NULL),
(38, 2, 'Burger vegetal mex-vegan', 'Hamburguesa de aguacate, maiz y jalapeño rebozado, con guacamole, pico de gallo y crema de queso fresco', '9.99', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_provincia`
--

CREATE TABLE `tb_provincia` (
  `id_provincia` int(14) NOT NULL,
  `codigoprovincia` varchar(12) DEFAULT NULL,
  `provincia` varchar(22) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_provincia`
--

INSERT INTO `tb_provincia` (`id_provincia`, `codigoprovincia`, `provincia`) VALUES
(1, '02', 'Albacete'),
(2, '03', 'Alicante'),
(3, '04', 'Almeria'),
(4, '01', 'Araba'),
(5, '33', 'Asturias'),
(6, '05', 'Asturias'),
(7, '06', 'Badajoz'),
(8, '07', 'Islas baleares'),
(9, '08', 'Barcelona'),
(10, '48', 'Vizcaya'),
(11, '09', 'Burgos'),
(12, '10', 'Caceres'),
(13, '11', 'Cadiz'),
(14, '39', 'Cantabria'),
(15, '12', 'Castellon'),
(16, '13', 'Ciudad Real'),
(17, '14', 'Cordoba'),
(18, '15', 'La Coruña'),
(19, '16', 'Cuenca'),
(20, '20', 'Gipuzkoa'),
(21, '17', 'Girona'),
(22, '18', 'Granada'),
(23, '19', 'Guadalajara'),
(24, '21', 'Huelva'),
(25, '22', 'Huesca'),
(26, '23', 'Jaen'),
(27, '24', 'Leon'),
(28, '25', 'Lleida'),
(29, '27', 'Lugo'),
(30, '28', 'Madrid'),
(31, '29', 'Malaga'),
(32, '30', 'Murcia'),
(33, '31', 'Navarra'),
(34, '32', 'Ourense'),
(35, '34', 'Palencia'),
(36, '35', 'Las Palmas'),
(37, '36', 'Pontevedra'),
(38, '26', 'La Rioja'),
(39, '37', 'Salamanca'),
(40, '39', 'Santa Cruz de Tenerife'),
(41, '40', 'Segovia'),
(42, '41', 'Sevilla'),
(43, '42', 'Soria'),
(44, '43', 'Tarragona'),
(45, '44', 'Teruel'),
(46, '45', 'Toledo'),
(47, '46', 'Valencia'),
(48, '47', 'Valladolid'),
(49, '49', 'Zamora'),
(50, '50', 'Zaragoza'),
(51, '51', 'Ceuta'),
(52, '52', 'Melilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tienda`
--

CREATE TABLE `tb_tienda` (
  `id_tienda` int(11) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `codigopostal_id` int(9) NOT NULL,
  `telefono` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_tienda`
--

INSERT INTO `tb_tienda` (`id_tienda`, `direccion`, `codigopostal_id`, `telefono`) VALUES
(7, 'Angel Guimera 25', 1, 936725489),
(9, 'Av. Josep Tarrdellas 63', 3, 933333341),
(10, 'Av. Museo del Prado 69', 4, 916725489),
(11, 'Mineria 28 tienda 1', 2, 933333333);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tipoempleo`
--

CREATE TABLE `tb_tipoempleo` (
  `id_tipoempleo` int(11) NOT NULL,
  `puestotrabajo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_tipoempleo`
--

INSERT INTO `tb_tipoempleo` (`id_tipoempleo`, `puestotrabajo`) VALUES
(1, 'Cocinero'),
(2, 'Repartidor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tipoproducto`
--

CREATE TABLE `tb_tipoproducto` (
  `id_tipoproducto` int(3) NOT NULL,
  `tipoproductodesc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_tipoproducto`
--

INSERT INTO `tb_tipoproducto` (`id_tipoproducto`, `tipoproductodesc`) VALUES
(1, 'Bebida'),
(2, 'Hamburguesa'),
(3, 'Pizza');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `totalpedidosinfo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `totalpedidosinfo` (
`id_pedido` int(11)
,`fecha` timestamp
,`reparto` tinyint(1)
,`tienda_id` int(11)
,`cliente_id` int(11)
,`Bebidas` decimal(22,0)
,`Hamburguesas` decimal(22,0)
,`Pizzas` decimal(22,0)
,`importe` decimal(25,2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `totalpedidosinfo`
--
DROP TABLE IF EXISTS `totalpedidosinfo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `totalpedidosinfo`  AS SELECT `tb_pedidos`.`id_pedido` AS `id_pedido`, `tb_pedidos`.`fecha` AS `fecha`, `tb_pedidos`.`reparto` AS `reparto`, `tb_pedidos`.`tienda_id` AS `tienda_id`, `tb_pedidos`.`cliente_id` AS `cliente_id`, sum(case when `tb_producto`.`tipoproducto_id` = 1 then 1 else 0 end) AS `Bebidas`, sum(case when `tb_producto`.`tipoproducto_id` = 2 then 1 else 0 end) AS `Hamburguesas`, sum(case when `tb_producto`.`tipoproducto_id` = 3 then 1 else 0 end) AS `Pizzas`, sum(`tb_producto`.`precio`) AS `importe` FROM ((`tb_pedidos` join `tb_lineapedidos`) join `tb_producto`) WHERE `tb_pedidos`.`id_pedido` = `tb_lineapedidos`.`pedido_id` AND `tb_lineapedidos`.`producto_id` = `tb_producto`.`id_producto` GROUP BY `tb_pedidos`.`id_pedido`, `tb_pedidos`.`fecha` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_categoriapizza`
--
ALTER TABLE `tb_categoriapizza`
  ADD PRIMARY KEY (`id_categoriapizza`);

--
-- Indices de la tabla `tb_clientes`
--
ALTER TABLE `tb_clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `telefono` (`telefono`),
  ADD KEY `fk_codpostal_id_tbcliente_tb_codpostal` (`codigopostal_id`) USING BTREE;

--
-- Indices de la tabla `tb_cpostales`
--
ALTER TABLE `tb_cpostales`
  ADD PRIMARY KEY (`id_codigopostal`),
  ADD KEY `fk_provinciaid_tb_cpostales_tb_provincias` (`provincia_id`) USING BTREE;

--
-- Indices de la tabla `tb_empleados`
--
ALTER TABLE `tb_empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `nif` (`nif`),
  ADD KEY `fk_tienda_id_tb_empleados_tb_tienda` (`tienda_id`) USING BTREE,
  ADD KEY `fk_tipoempleo_id_tb_empleaods_tb_tipoempleo` (`tipoempleo_id`);

--
-- Indices de la tabla `tb_entregadomicilio`
--
ALTER TABLE `tb_entregadomicilio`
  ADD PRIMARY KEY (`id_entregadomicilio`),
  ADD UNIQUE KEY `fk_pedido_id_tbentregasdomicilio_tb_pedido` (`pedido_id`) USING BTREE,
  ADD KEY `fk_empleado_id_tb_tbentregadomicilio_tb_empleado` (`empleado_id`) USING BTREE;

--
-- Indices de la tabla `tb_lineapedidos`
--
ALTER TABLE `tb_lineapedidos`
  ADD PRIMARY KEY (`id_linea`),
  ADD KEY `fk_producto_id_tblineaped_tb_producto` (`producto_id`) USING BTREE,
  ADD KEY `fk_pedido_id_tb_pedido_lineapedido` (`pedido_id`) USING BTREE;

--
-- Indices de la tabla `tb_pedidos`
--
ALTER TABLE `tb_pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_tienda_id_tbpedido_tbtienda` (`tienda_id`) USING BTREE,
  ADD KEY `fk_cliente_id_tbpedido_tbcliente` (`cliente_id`) USING BTREE;

--
-- Indices de la tabla `tb_producto`
--
ALTER TABLE `tb_producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_categoriaproducto_id_tbprod_tbcatprod` (`tipoproducto_id`) USING BTREE,
  ADD KEY `fk_categoriapizza_id_tbprod_tbcategoriapizza` (`categoriapizza_id`) USING BTREE;

--
-- Indices de la tabla `tb_provincia`
--
ALTER TABLE `tb_provincia`
  ADD PRIMARY KEY (`id_provincia`);

--
-- Indices de la tabla `tb_tienda`
--
ALTER TABLE `tb_tienda`
  ADD PRIMARY KEY (`id_tienda`),
  ADD UNIQUE KEY `telefono` (`telefono`),
  ADD KEY `fk_codigopostalid_tbtienda_tbcpostal` (`codigopostal_id`);

--
-- Indices de la tabla `tb_tipoempleo`
--
ALTER TABLE `tb_tipoempleo`
  ADD PRIMARY KEY (`id_tipoempleo`);

--
-- Indices de la tabla `tb_tipoproducto`
--
ALTER TABLE `tb_tipoproducto`
  ADD PRIMARY KEY (`id_tipoproducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_categoriapizza`
--
ALTER TABLE `tb_categoriapizza`
  MODIFY `id_categoriapizza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tb_clientes`
--
ALTER TABLE `tb_clientes`
  MODIFY `id_cliente` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tb_cpostales`
--
ALTER TABLE `tb_cpostales`
  MODIFY `id_codigopostal` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tb_empleados`
--
ALTER TABLE `tb_empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `tb_entregadomicilio`
--
ALTER TABLE `tb_entregadomicilio`
  MODIFY `id_entregadomicilio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tb_lineapedidos`
--
ALTER TABLE `tb_lineapedidos`
  MODIFY `id_linea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `tb_pedidos`
--
ALTER TABLE `tb_pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tb_producto`
--
ALTER TABLE `tb_producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `tb_provincia`
--
ALTER TABLE `tb_provincia`
  MODIFY `id_provincia` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `tb_tienda`
--
ALTER TABLE `tb_tienda`
  MODIFY `id_tienda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tb_tipoempleo`
--
ALTER TABLE `tb_tipoempleo`
  MODIFY `id_tipoempleo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_tipoproducto`
--
ALTER TABLE `tb_tipoproducto`
  MODIFY `id_tipoproducto` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_clientes`
--
ALTER TABLE `tb_clientes`
  ADD CONSTRAINT `tb_clientes_ibfk_1` FOREIGN KEY (`codigopostal_id`) REFERENCES `tb_cpostales` (`id_codigopostal`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_cpostales`
--
ALTER TABLE `tb_cpostales`
  ADD CONSTRAINT `tb_cpostales_ibfk_1` FOREIGN KEY (`provincia_id`) REFERENCES `tb_provincia` (`id_provincia`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_empleados`
--
ALTER TABLE `tb_empleados`
  ADD CONSTRAINT `tb_empleados_ibfk_1` FOREIGN KEY (`tipoempleo_id`) REFERENCES `tb_tipoempleo` (`id_tipoempleo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_empleados_ibfk_2` FOREIGN KEY (`tienda_id`) REFERENCES `tb_tienda` (`id_tienda`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_entregadomicilio`
--
ALTER TABLE `tb_entregadomicilio`
  ADD CONSTRAINT `tb_entregadomicilio_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `tb_pedidos` (`id_pedido`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_entregadomicilio_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `tb_empleados` (`id_empleado`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_lineapedidos`
--
ALTER TABLE `tb_lineapedidos`
  ADD CONSTRAINT `tb_lineapedidos_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `tb_pedidos` (`id_pedido`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_lineapedidos_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `tb_producto` (`id_producto`);

--
-- Filtros para la tabla `tb_pedidos`
--
ALTER TABLE `tb_pedidos`
  ADD CONSTRAINT `tb_pedidos_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `tb_clientes` (`id_cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pedidos_ibfk_3` FOREIGN KEY (`tienda_id`) REFERENCES `tb_tienda` (`id_tienda`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_producto`
--
ALTER TABLE `tb_producto`
  ADD CONSTRAINT `tb_producto_ibfk_1` FOREIGN KEY (`tipoproducto_id`) REFERENCES `tb_tipoproducto` (`id_tipoproducto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_producto_ibfk_2` FOREIGN KEY (`categoriapizza_id`) REFERENCES `tb_categoriapizza` (`id_categoriapizza`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_tienda`
--
ALTER TABLE `tb_tienda`
  ADD CONSTRAINT `tb_tienda_ibfk_2` FOREIGN KEY (`codigopostal_id`) REFERENCES `tb_cpostales` (`id_codigopostal`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
