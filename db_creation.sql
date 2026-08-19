-- ============================================================
-- BASE DE DATOS EVENTOS PREMIER S.A.S.
-- Gestión de reservas de salones para reuniones, fiestas y conferencias
-- ============================================================

-- Crear base de datos
CREATE DATABASE IF NOT EXISTS eventos_premier;
USE eventos_premier;

-- ============================================================
-- TABLAS DEL SISTEMA
-- ============================================================

-- Tabla de salones
CREATE TABLE salones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL,
    precio_hora DECIMAL(10, 2) NOT NULL,
    estado ENUM('Disponible', 'En mantenimiento', 'Ocupado') DEFAULT 'Disponible',
    encargado VARCHAR(100),
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla de clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    identificacion VARCHAR(50) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    correo_electronico VARCHAR(100),
    tipo ENUM('Individual', 'Corporativo') DEFAULT 'Individual',
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de reservas
CREATE TABLE reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    salon_id INT NOT NULL,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,
    total_horas DECIMAL(10, 2) GENERATED ALWAYS AS (
        TIMESTAMPDIFF(HOUR, fecha_inicio, fecha_fin)
    ) VIRTUAL,
    valor_total DECIMAL(12, 2) GENERATED ALWAYS AS (
        ROUND(precio_hora * TIMESTAMPDIFF(HOUR, fecha_inicio, fecha_fin) * 1.19, 2)
    ) VIRTUAL,
    fecha_reserva TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('Confirmada', 'Cancelada', 'Pendiente') DEFAULT 'Confirmada',
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE RESTRICT,
    FOREIGN KEY (salon_id) REFERENCES salones(id) ON DELETE RESTRICT
);

-- Tabla de pagos
CREATE TABLE pagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reserva_id INT NOT NULL,
    fecha_pago DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    monto DECIMAL(12, 2) NOT NULL,
    metodo ENUM('Efectivo', 'Tarjeta', 'Transferencia') NOT NULL,
    FOREIGN KEY (reserva_id) REFERENCES reservas(id) ON DELETE CASCADE
);

-- Tabla de auditoría de precios
CREATE TABLE auditoria_precios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    salon_id INT NOT NULL,
    precio_anterior DECIMAL(10, 2) NOT NULL,
    precio_nuevo DECIMAL(10, 2) NOT NULL,
    usuario VARCHAR(100),
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (salon_id) REFERENCES salones(id)
);

-- Índices para optimizar consultas
CREATE INDEX idx_salon_estado ON salones(estado);
CREATE INDEX idx_reserva_cliente ON reservas(cliente_id);
CREATE INDEX idx_reserva_salon ON reservas(salon_id);
CREATE INDEX idx_pago_reserva ON pagos(reserva_id);
CREATE INDEX idx_auditoria_salon ON auditoria_precios(salon_id);