-- =====================================================
-- Base de datos: tienda_ia
-- Curso: Programando con Claude IA
-- =====================================================

DROP DATABASE IF EXISTS tienda_ia;
CREATE DATABASE tienda_ia CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE tienda_ia;

-- =====================================================
-- Tabla: categorias
-- =====================================================
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    descripcion VARCHAR(255),
    INDEX idx_nombre (nombre)
) ENGINE=InnoDB;

-- =====================================================
-- Tabla: productos
-- =====================================================
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT NOT NULL,
    nombre VARCHAR(120) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    imagen VARCHAR(255),
    activo TINYINT(1) NOT NULL DEFAULT 1,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE CASCADE,
    INDEX idx_activo (activo),
    INDEX idx_precio (precio)
) ENGINE=InnoDB;

-- =====================================================
-- Tabla: usuarios
-- =====================================================
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_email (email)
) ENGINE=InnoDB;

-- =====================================================
-- Tabla: pedidos
-- =====================================================
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    estado ENUM('pendiente','pagado','enviado','entregado','cancelado') DEFAULT 'pendiente',
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    INDEX idx_estado (estado),
    INDEX idx_fecha (fecha)
) ENGINE=InnoDB;

-- =====================================================
-- Tabla: pedido_detalle
-- =====================================================
CREATE TABLE pedido_detalle (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- =====================================================
-- Datos de ejemplo
-- =====================================================

INSERT INTO categorias (nombre, descripcion) VALUES
('Cursos', 'Cursos online de programación e IA'),
('Libros', 'Libros digitales y físicos'),
('Mentorías', 'Sesiones 1 a 1 con expertos');

INSERT INTO productos (categoria_id, nombre, descripcion, precio, stock, imagen, activo) VALUES
(1, 'Curso Programando con Claude IA', 'Curso completo de 3 horas con proyectos reales', 199.00, 100, '/assets/productos/curso-claude.jpg', 1),
(1, 'Curso de Python para principiantes', 'Domina Python desde cero en 8 semanas', 149.00, 50, '/assets/productos/curso-python.jpg', 1),
(2, 'Libro: Prompt Engineering Pro', 'Manual definitivo del prompt engineering', 49.90, 200, '/assets/productos/libro-prompt.jpg', 1),
(2, 'Libro: IA para Negocios', 'Cómo aplicar IA en tu empresa', 59.90, 80, '/assets/productos/libro-ia.jpg', 1),
(3, 'Mentoría 1 hora', 'Sesión personalizada con un experto', 250.00, 20, '/assets/productos/mentoria.jpg', 1);
