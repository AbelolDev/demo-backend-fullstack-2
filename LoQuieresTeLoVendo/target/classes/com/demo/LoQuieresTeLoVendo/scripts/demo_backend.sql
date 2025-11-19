SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS producto;

CREATE TABLE producto (
  id_producto INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(150) NOT NULL,
  descripcion VARCHAR(1000) NOT NULL,
  precio INT(6) NOT NULL,
  stock INT(6) NOT NULL,
  PRIMARY KEY (id_producto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO productos (id_producto, nombre, descripcion, precio, stock) VALUES
(1, 'polera hombre Sfera algodón manga corta', 'Sfera destaca por su calidad, diseño y variedad en cada una de sus colecciones. El resultado: prenda', 9990, 50),
(2, 'polera hombre ferouch algodón manga cort', 'Desde tonos clásicos hasta colores audaces, tenemos la opción perfecta para cada personalidad. Ferouch está dirigido al hombre de espíritu joven, equilibrado, casual y apasionado por la naturaleza, con un estilo sport casual que además de verse busca sentirse bien.\r\nComposición 100% algodón', 26990, 50),
(3, 'polerón panal mythic hoodie ss beige', 'El Hoodie O\'Neill en color beige es la prenda ideal para quienes buscan estilo, comodidad y un diseño clásico con toques modernos. Confeccionado en 100% algodón, entrega suavidad y abrigo ligero, perfecto para el entretiempo o para complementar tu look diario. Su diseño de manga raglán, capucha, y bolsillo canguro, junto a los detalles en rib en puños y cintura, aseguran libertad de movimiento y un calce cómodo y contemporáneo.', 44990, 30),
(4, 'JEANS HOMBRE ROBERT LEWIS SLIM', 'Crea las mejores combinaciones con Robert Lewis. No lo pienses más, arma tus outfits con gran estilo y calidad, y reluce toda tu personalidad.', 24990, 50),
(5, 'JEANS 511 SLIM FIT HOMBRE LEVI\'S', 'Estos pantalones están destinados a convertirse en un clásico. Estos pantalones se ajustan debajo de la cintura con una pierna Slim de la cadera al tobillo. Estos jeans te brindarán la comodidad y ajuste adecuado para moverte libremente.', 64990, 30),
(6, 'JEANS HOMBRE LEVI\'S ALGODÓN 511 SLIM FIT', 'Estos jeans están destinados a convertirse en un clásico. Se ajustan debajo de la cintura con una pierna slim de la cadera al tobillo. Te brindarán la comodidad y ajuste adecuado para moverte libremente.\r\nCOMPOSICION\r\n99% Algodón / 1% Elastano', 49990, 50),
(7, 'JEANS ALGODÓN REGULAR MUJER RAINDOOR TAC', 'Raindoor es la pasión por la búsqueda de conectar a mujeres con la naturaleza e inspirarlas a recorrer una vida llena de aventuras al aire libre.\r\nCOMPOSICION\r\n98% Algodón / 2% Spandex', 49990, 50),
(8, 'JEANS MUJER MARQUIS BARREL ALGODÓN', 'Marquis es la marca ideal para la mujer contemporánea, con una gran variedad de productos en sus colecciones.\r\nCOMPOSICION\r\n100% Algodón', 39990, 50),
(9, 'JEANS MUJER EFESIS ALGODÓN GAEL', 'Efesis es una marca chilena de diseño y manufactura nacional.\r\nCOMPOSICION\r\n98% Algodón / 2% Spandex', 46990, 50),
(10, 'CARDIGAN MUJER AZIZ', 'Disfruta de la comodidad y autenticidad de una marca como Aziz.\r\nCOMPOSICION\r\n55% Acrílico / 20% Poliéster / 15% Poliamida', 26990, 50),
(11, 'POLERON MUJER OVERSIZE CREW II NEGRO BSOUL', 'BSoul es una marca chilena de ropa deportiva femenina.\r\nComposición: 86% ALGODÓN/14% POLIESTER', 34990, 50),
(12, 'POLERA MUJER BARBADOS ALGODÓN MANGA CORTA VUELOS', 'Barbados refleja el espíritu de una mujer con carácter.\r\nCOMPOSICION\r\n100% Algodón', 21990, 60);

CREATE TABLE roles (
  id_rol INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre_rol VARCHAR(50) NOT NULL,
  descripcion VARCHAR(255),
  creado_en TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_rol),
  UNIQUE KEY nombre_rol (nombre_rol)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO roles (id_rol, nombre_rol, descripcion, creado_en) VALUES
(1, 'admin', 'Administrador del sistema con todos los permisos', '2025-11-18 21:46:06'),
(2, 'cliente', 'Usuario cliente con permisos básicos', '2025-11-18 21:46:06');

CREATE TABLE usuarios (
  id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  correo VARCHAR(150) NOT NULL,
  clave VARCHAR(255) NOT NULL,
  id_rol INT(11) UNSIGNED NOT NULL DEFAULT 2,
  creado_en TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY correo (correo),
  KEY fk_usuarios_rol (id_rol),
  CONSTRAINT fk_usuarios_rol FOREIGN KEY (id_rol) REFERENCES roles (id_rol)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO usuarios (id, nombre, correo, clave, id_rol, creado_en) VALUES
(1, 'Luis Paredes', 'luis.paredes@admin.com', 'admin123', 1, '2025-11-18 21:59:18'),
(2, 'José Rojas', 'jose.rojas@admin.com', 'admin123', 1, '2025-11-18 21:59:18'),
(3, 'Abel Aravena', 'abel.aravena@admin.com', 'admin123', 1, '2025-11-18 21:59:18'),
(4, 'Carlos Ramírez', 'carlos.ramirez@gmail.com', 'user123', 2, '2025-11-18 21:59:18'),
(5, 'María López', 'maria.lopez@gmail.com', 'user123', 2, '2025-11-18 21:59:18'),
(6, 'Javier Díaz', 'javier.diaz@gmail.com', 'user123', 2, '2025-11-18 21:59:18');
