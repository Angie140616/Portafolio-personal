-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2026 a las 03:35:43
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
-- Base de datos: `panem`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `RtConsultarIngredientes` ()   BEGIN

	SELECT * FROM ingredientes;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RtConsultarProducto` ()   BEGIN

	SELECT * FROM producto;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RtConsultarUsuario` ()   BEGIN

	SELECT COD_EMPLEADO, CEDULA, NOMBRE, APELLIDO, NUMERO_CONTACTO, CORREO, CONTRASEÑA FROM usuario ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RtEliminarIngrediente` (IN `_codIngrediente` INT(11))   DELETE FROM ingredientes WHERE cod_Ingrediente = _codIngrediente$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RtEliminarProducto` (IN `_codProducto` INT(10))   DELETE FROM producto WHERE COD_PRODUCTO = _codProducto$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RtEliminarUsuario` (IN `_codUsuario` INT(8))   BEGIN

	DELETE FROM usuario WHERE COD_EMPLEADO = _codUsuario;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RtInsertarIngrediente` (IN `_nombreIngrediente` VARCHAR(250) CHARSET utf8mb4, IN `_pesoIngrediente` VARCHAR(10), IN `_costo` INT(30))   BEGIN

	INSERT INTO ingredientes(
    
    	nombre,
    	peso,
        costo
    	)
    
    VALUES(
    _nombreIngrediente,
    _pesoIngrediente,
    _costo
    );
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RtInsertarProducto` (IN `_nombre` VARCHAR(100) CHARSET utf8mb4, IN `_descripcion` VARCHAR(250) CHARSET utf8mb4, IN `_precio` VARCHAR(10) CHARSET utf8mb4, IN `_img` LONGBLOB)   BEGIN

	INSERT INTO producto(
    	NOMBRE,
        DESCRIPCION,
        PRECIO,
    	IMG)
    
        VALUES(
        	_nombre,
            _descripcion,
            _precio,
        	_img);
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RtInsertarReceta` (IN `_nombreReceta` VARCHAR(120) CHARSET utf8mb4, IN `_cantidadTotal` INT(11))   BEGIN

	  INSERT INTO receta (nombre, cantidadTotal) VALUES (_nombreReceta,_cantidadTotal);
    	SELECT LAST_INSERT_ID() AS idRecetaInsertada;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RtInsertarUsuario` (IN `_cedula` INT(10), IN `_nombre` VARCHAR(60) CHARSET utf8mb4, IN `_apellido` VARCHAR(60) CHARSET utf8mb4, IN `_numeroContacto` INT(10), IN `_correo` VARCHAR(150) CHARSET utf8mb4, IN `_contraseña` VARCHAR(150) CHARSET utf8mb4)   BEGIN
    INSERT INTO usuario(

        CEDULA,
        NOMBRE,
        APELLIDO,
        NUMERO_CONTACTO,
        CORREO,
        CONTRASEÑA)

    VALUES(
        _cedula,
        _nombre,
        _apellido,
        _numeroContacto,
        _correo,
        _contraseña);
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RtModificarIngrediente` (IN `_codIngrediente` INT(11), IN `_nombre` VARCHAR(255) CHARSET utf8, IN `_peso` VARCHAR(10), IN `_costo` INT(30))   BEGIN

	UPDATE ingredientes SET
    cod_Ingrediente = _codIngrediente,
    nombre = _Nombre,
    peso = _peso,
    costo = _costo
    WHERE cod_Ingrediente = _codIngrediente;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RtModificarProducto` (IN `_codProducto` INT(10), IN `_nombre` VARCHAR(100) CHARSET utf8mb4, IN `_descripcion` VARCHAR(250) CHARSET utf8mb4, IN `_precio` VARCHAR(10), IN `_img` LONGBLOB)   BEGIN

	UPDATE producto SET
        NOMBRE = _nombre, 
        DESCRIPCION = _descripcion,
        PRECIO = _precio,
        IMG = _img
    WHERE COD_PRODUCTO = _codProducto;
    

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RtModificarUsuario` (IN `_codUsuario` INT, IN `_cedula` INT(10), IN `_nombre` VARCHAR(60) CHARSET utf8mb4, IN `_apellido` VARCHAR(60) CHARSET utf8mb4, IN `_numeroContacto` INT(10), IN `_correo` VARCHAR(150) CHARSET utf8mb4, IN `_contraseña` VARCHAR(50))   BEGIN
    UPDATE usuario SET

        CEDULA = _cedula,
        NOMBRE = _nombre,
        APELLIDO = _apellido,
        NUMERO_CONTACTO = _numeroContacto,
        CORREO = _correo,
        CONTRASEÑA = _contraseña
        WHERE COD_EMPLEADO = _codUsuario;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega`
--

CREATE TABLE `bodega` (
  `COD_BODEGA` int(8) DEFAULT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_devolucion`
--

CREATE TABLE `detalle_devolucion` (
  `COD_DTDEVOLUCION` int(8) NOT NULL,
  `CANTIDAD_UNIDAD` int(20) NOT NULL,
  `COD_DEVOLUCION` int(8) NOT NULL,
  `COD_EMPLEADO` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_entrada`
--

CREATE TABLE `detalle_entrada` (
  `COD_DTENTRADA` int(8) NOT NULL,
  `CANTIDAD_UNIDAD` int(20) DEFAULT NULL,
  `COD_PRODUCTO` int(10) DEFAULT NULL,
  `COD_ENTRADA` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_salida`
--

CREATE TABLE `detalle_salida` (
  `COD_DTSALIDA` int(8) NOT NULL,
  `CANTIDAD_UNIDAD` int(20) NOT NULL,
  `COD_PRODUCTO` int(10) NOT NULL,
  `COD_SALIDA` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_traslado`
--

CREATE TABLE `detalle_traslado` (
  `COD_DTTRASLADO` int(8) NOT NULL,
  `CANTIDAD_UNIDAD` int(20) NOT NULL,
  `COD_PRODUCTO` int(10) DEFAULT NULL,
  `COD_EMPLEADO` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devolucion`
--

CREATE TABLE `devolucion` (
  `COD_DEVOLUCION` int(8) NOT NULL,
  `CANTIDAD_TOTAL` int(20) NOT NULL,
  `COD_PROVEEDOR` int(8) NOT NULL,
  `COD_EMPLEADO` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE `entrada` (
  `COD_ENTRADA` int(8) NOT NULL,
  `CANTIDAD_TOTAL` int(8) DEFAULT NULL,
  `COD_EMPLEADO` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `cod_Ingrediente` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Peso` varchar(10) NOT NULL,
  `Costo` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`cod_Ingrediente`, `Nombre`, `Peso`, `Costo`) VALUES
(1, 'Harina', '20kg', 14396),
(2, 'harina suprema', '0', 0),
(3, 'AzucarXXX', '0', 55000),
(4, 'Azucar', '50kg', 160650),
(5, 'Sal', '50kg', 48300),
(6, 'Pasas', '10kg', 98000),
(7, 'Ajonjoli', '25kg', 0),
(8, 'Nuez', '20kg', 700000),
(9, 'vitina', '15kg', 126200),
(10, 'Levadura', '500 gr', 4000),
(11, 'Jamon', '25gr', 0),
(12, 'Salchicha', '25gr', 0),
(13, 'Salchicha picada', '25gr', 0),
(14, 'Yuca rallada', '12kg', 59000),
(19, 'SAD', '21231', 212131),
(20, 'Botella agua', '1 litro', 4000),
(21, 'Pimienta', '250gr', 4000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientesreceta`
--

CREATE TABLE `ingredientesreceta` (
  `id` int(11) NOT NULL,
  `cod_receta` int(11) DEFAULT NULL,
  `cod_ingrediente` int(11) DEFAULT NULL,
  `cantidadIngredientes` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingredientesreceta`
--

INSERT INTO `ingredientesreceta` (`id`, `cod_receta`, `cod_ingrediente`, `cantidadIngredientes`) VALUES
(38, 19, 12, '12g'),
(39, 19, 1, '12g'),
(103, 18, 10, '13g'),
(104, 18, 7, '40gr'),
(420, 17, 1, '12g'),
(421, 17, 7, '12b'),
(422, 17, 8, '40g'),
(423, 17, 3, '213g'),
(424, 17, 5, '40ggg'),
(425, 17, 14, '1gg'),
(426, 17, 6, '12ggg'),
(431, 20, 2, '200gr'),
(432, 20, 9, '2 cdt'),
(433, 20, 13, '2 cdt'),
(436, 21, 1, '25gr');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `cod_Inventario` int(11) NOT NULL,
  `cod_Ingrediente` int(11) DEFAULT NULL,
  `Cantidad_Inicial` int(11) DEFAULT 0,
  `Entradas` int(11) DEFAULT 0,
  `Salidas` int(11) DEFAULT 0,
  `Traslados` int(11) DEFAULT 0,
  `Cantidad_Final` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`cod_Inventario`, `cod_Ingrediente`, `Cantidad_Inicial`, `Entradas`, `Salidas`, `Traslados`, `Cantidad_Final`) VALUES
(68, 6, 50, 790, 200, 0, 910),
(69, 5, 80, 963, 500, 120, 543),
(70, 1, 400, 1399, 900, 0, 899);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventariopanes`
--

CREATE TABLE `inventariopanes` (
  `cod_inventario` int(11) NOT NULL,
  `cod_producto` int(11) DEFAULT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  `inventario_inicial` int(11) DEFAULT NULL,
  `inventario_recibido` int(11) DEFAULT NULL,
  `productos_vendidos` int(11) DEFAULT NULL,
  `inventario_disponible` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasosreceta`
--

CREATE TABLE `pasosreceta` (
  `id` int(11) NOT NULL,
  `cod_receta` int(11) DEFAULT NULL,
  `paso_num` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pasosreceta`
--

INSERT INTO `pasosreceta` (`id`, `cod_receta`, `paso_num`, `descripcion`) VALUES
(36, 19, 1, 'sdsd'),
(54, 18, NULL, 'dfsds'),
(55, 18, NULL, 'lolazo'),
(56, 18, NULL, 'jaja'),
(137, 17, NULL, 'Amasar el pan'),
(142, 20, NULL, 'Perfecto'),
(143, 20, NULL, 'qwqq'),
(146, 21, NULL, 'aaa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `COD_PRODUCTO` int(10) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `DESCRIPCION` varchar(250) DEFAULT NULL,
  `PRECIO` varchar(10) DEFAULT NULL,
  `IMG` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`COD_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `PRECIO`, `IMG`) VALUES
(8, 'Pan leche', ' dulzura y la suavidad de nuestro Pan de Leche, una delicia artesanal que conquistará tus sentidos desde el primer bocado. ', '2000', 0x696d67436174616c6f676f2f363661313966323563623638332d70616e206c656368652e6a7067),
(9, 'Pan chocolate', 'eleita tus sentidos con nuestro exquisito Pan de Chocolate, una auténtica indulgencia que combina la suavidad de un pan recién horneado con el rico sabor del chocolate. ', '3500', 0x696d67436174616c6f676f2f363661316134623435373062342d70616e2063686f636f6c6174652e6a7067),
(19, 'Pan', 'Es un pan dulce', '2500', 0x696d67436174616c6f676f2f363966653730383763633531332d696d6167657320283132292e6a7067),
(20, 'Pan de bono', 'Hola', '3000', 0x696d67436174616c6f676f2f363966656138313764663738382d696d6167657320283132292e6a7067);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `cod_receta` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `imagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`cod_receta`, `nombre`, `imagen`) VALUES
(17, 'Pan de chocolate', 'imgCatalogo/pan chocolate.jpg'),
(18, 'settcito', 'imgCatalogo/1722988869_mamadisimp.jpg'),
(19, 'ola', 'imgCatalogo/1722989825_Slimeee.jpg'),
(20, 'Pasta napolitana', 'imgCatalogo/mvc.png'),
(21, 'Pan de bono', 'imgCatalogo/images (12).jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `cod_Transaccion` int(11) NOT NULL,
  `cod_Ingrediente` int(11) DEFAULT NULL,
  `Tipo_Transaccion` enum('Entrada','Salida','Traslado') DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transacciones`
--

INSERT INTO `transacciones` (`cod_Transaccion`, `cod_Ingrediente`, `Tipo_Transaccion`, `Cantidad`, `Fecha`) VALUES
(17, NULL, NULL, NULL, '2024-07-29 20:20:19'),
(18, NULL, NULL, NULL, '2024-07-29 20:23:18'),
(19, NULL, NULL, NULL, '2024-07-29 20:34:45'),
(20, NULL, NULL, NULL, '2024-07-29 20:37:25'),
(21, NULL, NULL, NULL, '2024-07-29 20:38:58'),
(22, NULL, NULL, NULL, '2024-07-29 20:39:41'),
(23, NULL, NULL, NULL, '2024-07-29 20:39:59'),
(24, NULL, NULL, NULL, '2024-07-29 20:40:15'),
(25, NULL, NULL, NULL, '2024-07-29 20:40:40'),
(26, NULL, NULL, NULL, '2024-07-29 20:41:27'),
(27, NULL, NULL, NULL, '2024-07-29 20:41:56'),
(28, NULL, NULL, NULL, '2024-07-29 20:42:30'),
(29, NULL, NULL, NULL, '2024-07-29 20:45:29'),
(30, NULL, NULL, NULL, '2024-07-29 20:47:57'),
(31, NULL, NULL, NULL, '2024-07-29 20:48:45'),
(32, NULL, NULL, NULL, '2024-07-29 20:50:24'),
(33, NULL, NULL, NULL, '2024-07-29 20:51:43'),
(34, NULL, NULL, NULL, '2024-07-29 20:53:06'),
(35, NULL, NULL, NULL, '2024-07-29 20:53:25'),
(36, NULL, NULL, NULL, '2024-07-29 20:55:22'),
(87, 6, 'Entrada', 90, '2024-07-31 02:35:54'),
(88, 5, 'Traslado', 120, '2024-07-31 16:41:16'),
(90, 5, 'Entrada', 50, '2024-08-08 20:48:52'),
(91, 1, 'Entrada', 400, '2024-08-08 21:00:04'),
(92, 1, 'Entrada', 899, '2024-08-08 21:48:36'),
(93, 1, 'Salida', 500, '2024-08-08 21:48:48'),
(94, 1, 'Entrada', 500, '2024-08-08 22:00:22'),
(95, 1, 'Salida', 400, '2024-08-08 22:00:36'),
(96, 5, 'Entrada', 213, '2024-08-09 00:03:44'),
(97, 5, 'Salida', 400, '2024-08-09 00:16:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccionespanes`
--

CREATE TABLE `transaccionespanes` (
  `cod_transaccion` int(11) NOT NULL,
  `cod_producto` int(11) DEFAULT NULL,
  `tipo_transaccion` enum('entrada','salida') DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `COD_EMPLEADO` int(8) NOT NULL,
  `CEDULA` int(10) NOT NULL,
  `NOMBRE` varchar(60) NOT NULL,
  `APELLIDO` varchar(60) NOT NULL,
  `NUMERO_CONTACTO` int(10) NOT NULL,
  `CORREO` varchar(150) NOT NULL,
  `CONTRASEÑA` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`COD_EMPLEADO`, `CEDULA`, `NOMBRE`, `APELLIDO`, `NUMERO_CONTACTO`, `CORREO`, `CONTRASEÑA`) VALUES
(1, 343423423, 'Jaz', 'Patiño', 2147483647, 'fjpatino@gmail.com', 'Jaz2000.'),
(31, 0, 'Angie ', 'Buitrago', 2147483647, 'angie@gmail.com', 'Angie20'),
(32, 1000442548, 'Angie', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$PEOMyQ8O6bsJGCCZM5s03uZrunCBlV2e8rWoBlyjJVh'),
(39, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$jkvTX.OTNu2kxjehHpiriut5vVEy6Mk54RD8wAadqPdLRr6GSmQma'),
(40, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$bff.AhDrfPBqE5.ThNmGr.afvXg1yH68o3zeidxoytUTkPIlse/NG'),
(41, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$34q5EsD3jjBajtPShE1Jhu/TWOjBKg2L6hRBG/jGlHSQZGp/wdANG'),
(42, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$v5Eb1n5RdBuy/u6TIAYlYe0MeoJmJ7MQh6wHCsA82rWn.Wmfjc7FO'),
(43, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$ScDrKxHD0TFdkc/6Ulagb.sEX48GCdmKq06cU6Gyi9wnUoIftH.l2'),
(44, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$EMPoqlbsTw9/8gS7ov4rDO8GfQ5EnGs.QDZoYjh2fhmET2iEugBHu'),
(45, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$tRnnAckpvbyaftLXs8X3eOiNN9Eu/aAzckGneKtsDiPzK5rKaDdqq'),
(46, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$SChQDWX8ovOQn6VnIdXTZuEqhuBrVPrwPUzv0ztWoDhSzgZxSPSp6'),
(47, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$pjGSzL6n15y9Y4xnTk1vl.2swzorcLR9bI27wOu1vjkLp7sZGR9S.'),
(48, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$Km/BCwcoopdpf6nXTXrwHeTXsjTncl6zJuLqI1klaHMezq3mDZIge'),
(49, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$THu.otrGCKSxdnw1uCxH2evmGnlOYPDQ7Tsl00yaiSlv3L6Q4ahkq'),
(50, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$fSa4WIowV7mLFeS4jWq4v.OChcoqDY6W4Lzj/AjjpB0O/WvmRRXAS'),
(51, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$hvv/5mZ8DSMpCm0BHGCFSuLmLTKRDf8imnjjNUlNOc8s3olHwgo5K'),
(52, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$SXB6/rhPv2MrX6qXPhGypuIpUmcb.wIJQp3aDa1mS9iMGhsl5Hb7y'),
(53, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$8wJjKLxgpoPASMctxSrRRuYkosYIj6yZf4k67XwPLF/F1vc85Lrca'),
(54, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$ebbQ0U2S7W31vYG8mxI.quJXc7SBH6K9jGIxmEABTGxeQ6.bQJqwW'),
(55, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$X9ZdQ1voyL3gBVzRJ4BSs.d3KYa6.pkgTVOsTJryQyn1XKFsRZoSm'),
(56, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$f/p3Dqfqk1cLwOtGLuonduCobWwl3AYNob0ZKNzA1I7lY/T1pGqli'),
(57, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$bJ4kbg6E1OJGL1XmkZLF0OcWrrVlCR7d9WqAutWce0doFZJk55Gt6'),
(58, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$96N3ej7Hjb4yyLfWxdFNteH6voORiLhnoeZkjNfbltP9PL1dgl15O'),
(59, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$tTku6P3RkMqMmqlpszepieklEu1Sy23RwpMZ/l1wsth9rNTG0oSHi'),
(60, 25, 'lsds', 'ksdfdf', 1234567890, 'angie@gmail.com', '$2y$10$jjke1XsQA7Qpdn8c9hpLYOJLoKh.OV4QuUxfjiCy/440VoSveCc8q'),
(65, 40, 'jaja', 'aja', 1212121212, 'angie@gmail.com', '$2y$10$tPqWuTJ36VMKJCqCkRPBuez.waC9i4u70UKi/DNzAeP9rBK0VwrYy'),
(66, 40, 'jaja', 'aja', 1212121212, 'angie@gmail.com', '$2y$10$JJ6dr5ik43SCP7jFaKvKH.m9KqVoYA6cxeY7TN9PEEuci8C/q6rCy'),
(67, 90, 'ff', 'jaja', 987654321, 'angie@gmail.com', '$2y$10$etwcXgg1s1J.jXBKVq63m.068bJoLPB2ls4pMdCOee4wpdE1gh2AG'),
(68, 90, 'ff', 'jaja', 987654321, 'angie@gmail.com', '$2y$10$APGAmBbHcdXNJaYew2FaUOG0uWUsAby7Tl3vCmvKroZM8URO28dzS'),
(69, 9, 'jajaja', 'f', 1234567890, 'angie@gmail.com', '$2y$10$XVEv7SkTJ5kf.1aqeZ/VkuuE0KC5uzZvcQ6EQswk9c.u7UyzfGFaa'),
(70, 12, 'k', 'a', 1234567890, 'angie@gmail.com', '$2y$10$iPyq6KfQYtkTU8Zp57vdkuPqvG9ePssydttJ5Ho9RuOGUyo.1ynpu'),
(71, 12, 'k', 'a', 1234567890, 'angie@gmail.com', '$2y$10$PdIcJhKN.CSuzmTOEgzwQerMdRVBaPea294Qnx4QmQRWtyQTdNYvq'),
(72, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$PP8IG5lk6Pw6F9g1Knz5..FKOiAfnZMXV0IpyIsQubY6t5zMlwTxO'),
(73, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$HHN6Q9VQnAt.j3Wk50Jzies8/CMp2N6lBbznE1yyzN4FXo0T2DuUa'),
(74, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$JH.ulXkm6rGzvi1IaWtO4eIxwDrLFTmpflqwwULk9xH6Wd/.rtyM2'),
(75, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$z05DP1Ge7na.gFPoS6piRewrRGmNE4ww3KtCAX9qz4XmmpZJg5mv6'),
(76, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$HWLaVUwetMlvQ7Vs22T0s./g4ELCk6PDO9cmNJKIxHKd.w5AN3XjS'),
(77, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$Ni3j5k2ow4qTCw857QWPK.mm6RwT4ZZUEy.klpc0BIiOZgelLpVGi'),
(78, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$VZb/cvix9SZecjSwWefal.DxiK.xBQLzmYlzrLe/i0QzK4vgkBoFa'),
(79, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$Z9wAbKE1Fnqvrur7U.dZr.4XeTy.dF3o5tHBnK0WBZoGfzA5CCn6S'),
(80, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$RYJT.I2D5hTEMui3fjuhJOeDB.VGuzu0F0rPfdqZdqSqJCIUNYeae'),
(81, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$JcTh2KwQsw42ZnvfqQTnZe5A/CJnNm/d4c7WVEtV5BBC93rdcyb12'),
(82, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$VaOnQBJtxCDpGLKft5U/H.NeZS/wH25pW5nAyunWzQbwY3PsSb8r2'),
(83, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$NaaBUVPfPENAuLRA209HdeXoDUnQfZwBIS2eaBpAjB8aV.ez9uQz6'),
(84, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$29/eVaU9wq/jRPj/pTUhKOgn4lPRqf4jS3nEzojeCwYVdVL8VNhAi'),
(85, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$0ROnZJMxhKuND5Bz26a21ed66AQs9V2sJr78jMehjNmYtDmlBA71C'),
(86, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$CGIyKPsC/9Ho6EyNrsU4deBueHxTvGRMhTTUANjB4YxL1ndzCrOhi'),
(87, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$9YIxDyF7Asgf5Pe1E/26z.FfB43EieDkkJQRmLWdVM3Ctk2GQ15zO'),
(88, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$uSUuNm9RN36FZjwmWUZRXe/HvlPp.oIWnxFRVclFFkKVKlBNalege'),
(89, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$dF8cJNDlnTv1YFaXubaybej5./FZAUj7LoA8MtcnrMZZaiZCJajqO'),
(90, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$OV9CZH8UdOzpRPJV4Kw0He6n28x7kk3Vgohwmk5zso/4QjYB9LPtC'),
(91, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$9Z9gQPqxSfzTE9HhtNSDQu97iIRc2XtqzppmyYPaf4/EzNRx0xay2'),
(92, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$xxSmobqcQjsHQOwUkbxodOVSZz9VipM29cAJndNtgLEa0HQ3Ck8EC'),
(93, 12, 'ff', 'ass', 1221223456, 'angie@gmail.com', '$2y$10$VYG/TpAZUlqqr9BKWYM67uU0p/q7gDuX7bdjZZ6yMXO6s0QK5HiTq'),
(94, 1234567890, 'jajas', 'alv', 1234567890, 'angie@gmail.com', '$2y$10$0/j6nx3Qw9QWCwD7f7AuqulJU0HZqpnmtsJT/t6v/rt3Fi9UGaa6m'),
(95, 12, 'Maria', 'asas', 1234567890, 'angie@gmail.com', '$2y$10$YvzkTAmbI3qhFALZaeEprOFhJsQl20H.sEW7Rfi0l7rzT489VG.Py'),
(96, 12, 'Maria', 'asas', 1234567890, 'angie@gmail.com', '$2y$10$pJ4dwpP.AiJoMq7t/ZILBe1t/2VZLwMk7JoIFFAW1vnYw6MUdpddS'),
(97, 12, 'Maria', 'asas', 1234567890, 'angie@gmail.com', '$2y$10$OzcX/wiIlnPwu2gQmjl5fekrc1Pyiigf10K0.haFBnGvjXJZz8uA.'),
(98, 12, 'Maria', 'asas', 1234567890, 'angie@gmail.com', '$2y$10$YDdJ6IkP.gfqiC9RHaiEK.pn9kQNHEoqq3dENt4sbuuTJTjgsIOxy'),
(99, 12, 'Maria', 'asas', 1234567890, 'angie@gmail.com', '$2y$10$38E/uDviajexytnqIJF3oeXLQT1lLxNBvuInkCgtDBzgf0VmayFGu'),
(100, 12, 'Maria', 'asas', 1234567890, 'angie@gmail.com', '$2y$10$kd2L5pK8wWlST5bnIhNo6eoml1LGaOsPOo9TAYbe9K4jXvso.wBza'),
(101, 12, 'Maria', 'asas', 1234567890, 'angie@gmail.com', '$2y$10$XOJ3tPUPEDR4JpZcc1dvl.9fuq3fNmqqlG9Po3QZtI8.9bwEH83Im'),
(102, 12, 'Maria', 'asas', 1234567890, 'angie@gmail.com', '$2y$10$8XijKbFNpd..DOlKd/ZiAOIn0J.gGoiMIkMpj64TItjpV5jh3Upnu'),
(103, 12, 'Maria', 'asas', 1234567890, 'angie@gmail.com', '$2y$10$1KozbmoxAXvPrwrsZc6xF.56/LIoPi37T4PwTaBLGiViq5NVzmAFO'),
(104, 12, 'Maria', 'asas', 1234567890, 'angie@gmail.com', '$2y$10$zp8G9bBgD9X9GjwwTl4jre9dNtxmH40bB5m2VLqtiScSk5Xs/7hBa'),
(105, 12, 'Maria', 'asas', 1234567890, 'angie@gmail.com', '$2y$10$OYXHJ/Rp3vr.IZoJAJzNj.1xobY/IHEMmDsMszBNTBuxcTOVSjUC.'),
(106, 12, 'Maria', 'asas', 1234567890, 'angie@gmail.com', '$2y$10$LgKiRyjIHOyyEulifTmvzO51eQo9b9Tu/0MwC.FCQ.6HE2yjowTLy'),
(107, 12, 'Maria', 'asas', 1234567890, 'angie@gmail.com', '$2y$10$orkqGABm4RRmnNS4hnuG5..p1eaOnrOdaRFglzpaweAZaoO/cxX0C'),
(108, 12, 'Maria', 'asas', 1234567890, 'angie@gmail.com', '$2y$10$69tVO3DgQ099tOAc6OsjHehGDLbtJcc4gfvCuxJ5y84Ol83puzn4O'),
(109, 123, 'kasds', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$L.hss0aUc8RMH3Dd7uzq/uF5uCfuAk3gSuiIzGHgKJBy/lDZl7DIG'),
(110, 123, 'kasds', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$kp/30b6gDy2ljCkoIfnCuuLH4h8NT2uNQM4G8/eoBDUnEw2cJBpE2'),
(111, 123, 'kasds', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$FaWA.V/yeW2MEyjARbP4ieTEXyPKCP9oKxpLDP7sE7gIjXVJWy7re'),
(112, 123, 'kasds', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$/2D.G59sH4mADfrvyKSpB.Ym0rlnteBev6MmoWFVOdUFD2ZBs6W9e'),
(113, 123, 'kasds', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$LIlGxLz5zQvX9Rx9b46KO.VAtCifidKsaHKF.cmhZ1RgBDp09p7zu'),
(114, 123, 'kasds', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$SCJa.tnva0jqXPblICV.DuZxZasV7yb1CaZ09POsD9DldjOtuVXBS'),
(115, 123, 'kasds', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$Y7G54SfMEUi/fu1oaI/wpOrF2FynQFlpNfymSu3WTsyvOohjKhSFq'),
(116, 123, 'kasds', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$FzsFqDzBDpw5ZjZQ4TgRh.gDRpn9Gj9g45QPI0Q4tJTCOpNNzNPrO'),
(117, 123, 'kasds', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$9wZgtlK28vuEXjSVkKLNOuZZu1Vf0cDbRgUOv9mpbP4ZJ6o2fvDTy'),
(118, 123, 'kasds', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$2RJljH000Bsc/pCikvL8YOSohWECl6jN0BtWqhXqxk7073RRrob8m'),
(119, 123, 'kasds', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$2w2/A70Nf7gpOMKmtLe2T.mgjL2/Dj2H1q4FZLh0xgCdMg62pL4n2'),
(120, 123, 'kasds', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$rQ0JcF5kjw1PrY8DQ3.EvumvYl2haCVuzN5z3a31NcS0ZhtSSBklO'),
(121, 123, 'kasds', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$iRSFyl0wPoB9TZfegJ/4NuA/dozf8o4jvPcCjKFRVzBcVqfS0SMfS'),
(122, 123, 'kasds', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$aBPWW/IlUNmkiVeJPCc.GeCgpp.1hyDXbvu5tLrOx.vCxxjwSSIqu'),
(123, 123, 'kasds', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$H1fR1Z9nn6q5pJRi93/bzOExkJC/qTp4OsbA.qgchn01XrQl2EAW6'),
(124, 123, 'kasds', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$pCNxa8gUuKoXItf0moiru.wiaSCeXL4MZGeob9BXVP8/C2u1O0uWm'),
(125, 123, 'kasds', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$rF9kn7uTLHwxoLpKDOH5XOU2C7hcLgTk1CLv0TKfqIrSFHIaJERPq'),
(126, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$Z7V0.WbRbPYYcjQYA8oH4.nYO5rj/oiQeECkpUnrzh30W2G5no4zi'),
(127, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$nQF41dAof14dy8sSPP9wF.XtZf090d6e5XJJm098s5idOke3ew8ZW'),
(128, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$JsMaBAEgfk1OsT6ZaMdQLO8ofE3XFjcl9C041NWoU7615RXn3hM6O'),
(129, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$prbCOAytvrKveqlv7.LdL.RXjI5QoFARPFwYIuk/pN.9UlGBqvfM2'),
(130, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$nD/s0HmFWhGTMYNay/6O3.0vTQdFZwAzgU2w/tNd2SL/Wx50YnO36'),
(131, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$Ju7bCeocEQTpT62Die5EeuAm59LnGNUL3VaFE8cgjcQGfOrXFsL3W'),
(132, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$ihCmqaKg.wEe6rCR2YLrguNwBCJG.uC69BOGpmC3cj6cwnKjaMyWq'),
(133, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$ggUhO0q8Rg9FR.XPdjnXm.7/fyqzVoCVamYDSk4Hb/5D7Wo0Dz91S'),
(134, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$6o2uqpDmWkhnQwDIoqMqmuZ/S/v7/7/8Wk/NRWdHvb8jCBgV45PdS'),
(135, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$RVShtuwe5FIHEwchJN0BIuIwVk.be7lReVrMpGFp6xtyIT1HwHUcW'),
(136, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$d5157cawu.6BVSHc74hPy.U2iuwBmWQAUKsdTXtICFcDKzQmqz4Yy'),
(137, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$r8KTpI7ajiGe1Lo96ZiDXuSJezr33zfocxOEXadAH.7Q8XdSAcyUC'),
(138, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$gTyHw3KuDfxV2CwmG4aLNevIdaNikiLsivR7ZnkxIvCWhl88l0JHW'),
(139, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$F50zldHw0VY.MfiuESUduuPiTpbsVzBa6LFhmeQJlFqyEhmW5djRW'),
(140, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$qySOLSaBI/ELE0WTnCz.IuB7w8TpnPp8/pEurBuIFdrxcwmyzNNdi'),
(141, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$tq984mAXNsvZYOw2cTF.DuEky4cbzwCzdWRTzP0uJmgGM7Xuf2Qyi'),
(142, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$r3kC9GE9656gEZ0/J6lCIOTaeYHq/m8M4VevZ935Fw0fzaS2M6p8i'),
(143, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$ITMCLstaPqbzI5/j5h12ku9.hpBq74fU67w4awVDITG0cvpTtlWFa'),
(144, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$bXHBsKPFscRJdtWhLB3EpezqtcaoHDYe00cKJZ9AIk.xpU2Xk6Ft.'),
(145, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$RJ8AfUHLG3WGhbGpWdPfguNu.arJ4ch4HePgzHbMR37R59vB9XL0W'),
(146, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$ZF1hJgP2m5ucGULUoJQD5eKSBD2vntKynjT/37P5hQteRefzMFnyK'),
(147, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$EyVCP3tlb3/pi8arK3D.meGN2Q5r8LcIKLGhZkF1PBHL/KRJHnQiG'),
(148, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$KpXNTHXgD9mVtyTuNOWbC.lrtD73G3KhmvKGZIAAdJvf0m.yGbhje'),
(149, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$BOoSdnSSs4VASVHYryE5XONWjMlMLOw7FT6q3kZ/TYewCbM2MAaf2'),
(150, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$W7EGf0nkWKVs7kaQ/4HywOyOht9U4iOx19jAry/HXugnSrMTVf5e.'),
(151, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$m6YG627DuSQUA4nGIyNpaOXHXn2WKXm5xoLDxqiGT6XwmvRwVvEHa'),
(152, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$tBNwCF3atwm9EoqdqUc9BO4.4/4p.WVTTnrKvGnLYKojEM2jRlHBi'),
(153, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$HnKxGMuVzK.YWJvpOT2nZeruBbaQiSe1uEKhROLYBmp3zBKwCKHly'),
(154, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$TToeEy1g4C4fqRwQ9RwtHOtgtijR4W10zTYpFy8l.WcFeQYFlxUGK'),
(155, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$dPQf7BOOVUmsqvUWfVBRtu2eMEgkq1ppO3CxnFLASZeurAvHkmsEq'),
(156, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$hA5aoFp74HBtyaI.wohnpOfew3c8ICOqAAEcGZj.pOr.UQCshxw4C'),
(157, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$nY3bpx6eqRlTN2PLsca.0e.0NGBhBvx2qMjECIgL5YOS1r6sc6T0e'),
(158, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$m4N7Wyu.3G6crTbbXSPMsO1r4RsGy0Rwyo2FUqvUIfByVoUCbhbRm'),
(159, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$j0XbCz.UEuUYpNYEXyv1iuAPMOex6GRBnZVcEuQI4HNCY/V1mcD76'),
(160, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$Vu0Js1riRrc0QX5xk5LDSOV99PA6nyhIOn6lTQvpm0E7R3gsm5DWC'),
(161, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$wykk0uz2AYJ6jsq9d3wYlu79fpbfawfU2nBTq.iMpXPt5ikH2ZPvi'),
(162, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$w6BzkW4dl39gQK8BURF0wO9PTQFpVpw./CUck.Jg3w1MRwC87TdHC'),
(163, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$OUJ7sKm1CL4bL0Nz6ZXXyOshsIM0OICrf/I4mD6KjpeTyg8K1jG/K'),
(164, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$oJmng37VUOt/35YNdbA9E.AzezbnZaEgytQR3/cRQbq8DfO6UIgZu'),
(165, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$AH66LAnAkBuPvmeuB3kO5u5c2kyMCayZAx14nyv4d7ZD4rUWaREh.'),
(166, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$NZjrTDxTMwB.oLki.d4IaeBSeajkUHaRe8iLgiIZw77WwbxwfNldu'),
(167, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$HflSWXzVMceIU7SlrFS7gOX2t0G41y5RrO1cwXL7Ogmg8gyPLO.mq'),
(168, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$rhUV1TFdE4rOY2Cpwp5N2O7mJHKJ2JhsY8/P6.8Cb.yV1htUzBpTO'),
(169, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$cfnU6.GhcUoQpggQvOpwG.lLBoa1bKxlQw.m2C.HuLssct1jALQzO'),
(170, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$40rJlr83cC0g24udmTga5.09xCJxTXIs6reTPlT/DvKAuqiqPwgiS'),
(171, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$rOynvm51VcvSu6B6GR5OyesBHwsWs/3/scZvOl.wyu38KtNBr95Bu'),
(172, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$.z5gks1OxWP2PouLPVQBQuNE79Xvz2vuhX0/WHb8s8df7H.4XqJOa'),
(173, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$vpKrNWUHLcHDFvfPqloISuum3P7Hq0VcHQ.G8/Uf4R3.AHy6LW0Ne'),
(174, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$YBkDWwxdihmxUdi51kVoBuydiS9G7CQYsvuhfmjcHJ6Ial5VOvQ6W'),
(175, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$f2YAAlvY7TiQCagay1QK5OUX8R7gTX7rlgEHilp5Fwb16slNfA4au'),
(176, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$YkuLROewD1iTWP4E9eA8A.l0TOSSgp6zisDE59PlNWTrofNpwMvxe'),
(177, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$CPYeAXoHYOnfSEGoFYjK5uwjb//RnMJHl1xvxUkj/O7RfJC2Nng0K'),
(178, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$K716VmFA.bd/F2O0gasC7.cXcrujKDP.KCc4mzsgGvwR2dWjV07/i'),
(179, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$cIP1vJsOIY/HlKSvEhk4EuzrnH8ge0wUN1.WpREVQR37U9OAb1olm'),
(180, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$adFYHR46YuzlMC8dgjxMmOneVFeHBXXEVjyIQO2iUGGJhID6ARs4K'),
(181, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$yhu9DVnVqaWHtJCwie7ca.3z5QA6uJnrwy1uYgCMshWPZ7KFQAPT6'),
(182, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$/gdvlAjdcszIUzhFHRcxYOj93zCL10cJMPdnozAnpE2H4x2sqgVv2'),
(183, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$otxsl3s900xmCjjx4Z.SZOqjOW/Y6Ut7EemtXBpThwNlTp56Ml9je'),
(184, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$jEv7KDKS9oVa.u3ibTeeCergc9Um6dIVY6Qh6B7siho6e6KAzV3rm'),
(185, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$TpX1SBfQcyBC4uPoVvfMbebKUaWK/T8RPrRiucs5ixPvHfhxbK2uy'),
(186, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$Rn.o5MOFNyy1WvgHQSSHA.Nv7GAnlsDZarhncaU0/vkUGXEg4zTF6'),
(187, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$jh0vWuAUTvo5F/RhLMVuOuOTvOi1m/Xn7UBDDMOf9ZqqYKlnR.7o2'),
(188, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$PGcQM/foCykcJQrvbHO2rO1QPa2uiRkADVE95xCzme97zvPPjdiIW'),
(189, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$DzAKf2osmAaDwdmEWxPMGezoIxbf7AauDfkClS7X4MMnF8vIdodhS'),
(190, 123, 'js', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$8sA1U7m4ijD5H1teFEXMvu2myRRGCj3gF8qERjQB9XG6jOmyRDHHS'),
(191, 12, 'k', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$eS1r8HK5bpTihZWG36CoUujE1YV0GINJH9YG8DA78hF070vIHssiG'),
(192, 12, 'Angie', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$GFn0TDJZ6o8xcMtsUBmc7O3m0E48Lm/WJwTW.2niXHEC4xaBojOAm'),
(193, 12, 'Angie', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$wacRtxbWdVUdwyyBeUQJEOL37MxwBmNJmTKYfY8y8/N30wbwXjKWG'),
(194, 1212221212, 'Angie', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$4XtBboOlDqCoqAi1WH6CSuh6Zefn/Y3kZIAoyUCBUlkRTjfrMFdc6'),
(195, 12, 'Caremonda', 'Patiño', 2147483647, 'angie@gmail.com', '$2y$10$9aUI5OQlbOYQgBBkutgq7O5os18OUre7wVMPzDaiYvC');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`cod_Ingrediente`);

--
-- Indices de la tabla `ingredientesreceta`
--
ALTER TABLE `ingredientesreceta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cod_receta` (`cod_receta`),
  ADD KEY `cod_ingrediente` (`cod_ingrediente`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`cod_Inventario`),
  ADD KEY `cod_Ingrediente` (`cod_Ingrediente`);

--
-- Indices de la tabla `inventariopanes`
--
ALTER TABLE `inventariopanes`
  ADD PRIMARY KEY (`cod_inventario`),
  ADD KEY `cod_producto` (`cod_producto`);

--
-- Indices de la tabla `pasosreceta`
--
ALTER TABLE `pasosreceta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cod_receta` (`cod_receta`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`COD_PRODUCTO`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`cod_receta`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`cod_Transaccion`),
  ADD KEY `cod_Ingrediente` (`cod_Ingrediente`);

--
-- Indices de la tabla `transaccionespanes`
--
ALTER TABLE `transaccionespanes`
  ADD PRIMARY KEY (`cod_transaccion`),
  ADD KEY `cod_producto` (`cod_producto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`COD_EMPLEADO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `cod_Ingrediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `ingredientesreceta`
--
ALTER TABLE `ingredientesreceta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `cod_Inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `inventariopanes`
--
ALTER TABLE `inventariopanes`
  MODIFY `cod_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pasosreceta`
--
ALTER TABLE `pasosreceta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `COD_PRODUCTO` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `cod_receta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `cod_Transaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de la tabla `transaccionespanes`
--
ALTER TABLE `transaccionespanes`
  MODIFY `cod_transaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `COD_EMPLEADO` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ingredientesreceta`
--
ALTER TABLE `ingredientesreceta`
  ADD CONSTRAINT `ingredientesreceta_ibfk_1` FOREIGN KEY (`cod_receta`) REFERENCES `receta` (`cod_receta`),
  ADD CONSTRAINT `ingredientesreceta_ibfk_2` FOREIGN KEY (`cod_ingrediente`) REFERENCES `ingredientes` (`cod_Ingrediente`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`cod_Ingrediente`) REFERENCES `ingredientes` (`cod_Ingrediente`);

--
-- Filtros para la tabla `inventariopanes`
--
ALTER TABLE `inventariopanes`
  ADD CONSTRAINT `inventariopanes_ibfk_1` FOREIGN KEY (`cod_producto`) REFERENCES `producto` (`COD_PRODUCTO`);

--
-- Filtros para la tabla `pasosreceta`
--
ALTER TABLE `pasosreceta`
  ADD CONSTRAINT `pasosreceta_ibfk_1` FOREIGN KEY (`cod_receta`) REFERENCES `receta` (`cod_receta`);

--
-- Filtros para la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`cod_Ingrediente`) REFERENCES `ingredientes` (`cod_Ingrediente`);

--
-- Filtros para la tabla `transaccionespanes`
--
ALTER TABLE `transaccionespanes`
  ADD CONSTRAINT `transaccionespanes_ibfk_1` FOREIGN KEY (`cod_producto`) REFERENCES `producto` (`COD_PRODUCTO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
