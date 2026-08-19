-- ============================================================
-- DATOS SIMULADOS PARA EVENTOS PREMIER S.A.S.
-- 50 registros por categoría para pruebas completas
-- ============================================================
-- Ejecutar DESPUÉS de db_creation.sql

USE eventos_premier;

-- ============================================================
-- 1. SALONES (50 salones con capacidad y precios variados)
-- ============================================================
INSERT INTO salones (nombre, capacidad, precio_hora, estado, encargado) VALUES
('Salón de Fiestas Grande', 200, 55000, 'Disponible', 'María Gómez'),
('Salón de Conferencias A', 50, 35000, 'Disponible', 'Carlos Ruiz'),
('Salón de Reuniones B', 20, 25000, 'Disponible', 'Laura Martínez'),
('Salón de Yoga', 30, 20000, 'Disponible', 'Ana Silva'),
('Salón de Boda', 350, 80000, 'En mantenimiento', 'Pedro Torres'),
('Salón Ejecutivo', 40, 45000, 'Disponible', 'Sofía Hernández'),
('Salón Colonial', 80, 60000, 'Disponible', 'José Martínez'),
('Salón Moderno', 60, 48000, 'Disponible', 'Diego Castro'),
('Salón Classic', 100, 58000, 'Ocupado', 'María Gómez'),
('Salón Premium', 120, 75000, 'Disponible', 'Laura Martínez'),
('Salón Imperial', 150, 90000, 'Disponible', 'Carlos Ruiz'),
('Salón Vista', 70, 42000, 'Disponible', 'Ana Silva'),
('Salón Norte', 55, 38000, 'Disponible', 'Pedro Torres'),
('Salón Sur', 45, 32000, 'Disponible', 'Sofía Hernández'),
('Salón Este', 65, 40000, 'Disponible', 'José Martínez'),
('Salón Oeste', 58, 36000, 'Disponible', 'Diego Castro'),
('Salón Este-Oeste', 95, 52000, 'En mantenimiento', 'María Gómez'),
('Salón Norte-Sur', 75, 46000, 'Disponible', 'Laura Martínez'),
('Salón Deluxe', 110, 68000, 'Disponible', 'Carlos Ruiz'),
('Salón Ejecutivo 2', 42, 47000, 'Disponible', 'Ana Silva'),
('Salón Reuniones 2', 25, 28000, 'Disponible', 'Pedro Torres'),
('Salón Fiestas Chicas', 35, 22000, 'Disponible', 'Sofía Hernández'),
('Salón Conferencias 2', 52, 36000, 'Disponible', 'José Martínez'),
('Salón Boda Chica', 100, 55000, 'Ocupado', 'Diego Castro'),
('Salón Tech', 68, 50000, 'Disponible', 'María Gómez'),
('Salón Verde', 40, 30000, 'Disponible', 'Laura Martínez'),
('Salón Azul', 50, 35000, 'Disponible', 'Carlos Ruiz'),
('Salón Rojo', 70, 45000, 'Disponible', 'Ana Silva'),
('Salón Blanco', 80, 50000, 'Disponible', 'Pedro Torres'),
('Salón Negro', 60, 42000, 'Disponible', 'Sofía Hernández'),
('Salón Dorado', 90, 65000, 'Disponible', 'José Martínez'),
('Salón Plateado', 55, 38000, 'Disponible', 'Diego Castro'),
('Salón de Oro', 120, 70000, 'Disponible', 'María Gómez'),
('Salón de Plata', 85, 55000, 'Disponible', 'Laura Martínez'),
('Salón Bronce', 45, 30000, 'En mantenimiento', 'Carlos Ruiz'),
('Salón Madera', 70, 48000, 'Disponible', 'Ana Silva'),
('Salón Piedra', 65, 43000, 'Disponible', 'Pedro Torres'),
('Salón Cristal', 95, 62000, 'Disponible', 'Sofía Hernández'),
('Salón Aluminio', 58, 39000, 'Disponible', 'José Martínez'),
('Salón Compos', 100, 58000, 'Disponible', 'María Gómez'),
('Salón Acero', 75, 52000, 'Disponible', 'Laura Martínez'),
('Salón Titanio', 88, 68000, 'Disponible', 'Carlos Ruiz'),
('Salón Cobre', 62, 46000, 'Disponible', 'Ana Silva'),
('Salón Bronce 2', 48, 32000, 'Disponible', 'Pedro Torres'),
('Salón Aluminio 2', 56, 37000, 'Disponible', 'Sofía Hernández');

-- ============================================================
-- 2. CLIENTES (50 clientes: mix de Individual y Corporativo)
-- ============================================================
INSERT INTO clientes (nombre_completo, identificacion, telefono, correo_electronico, tipo) VALUES
('Juan Pérez', '12345678', '3001234567', 'juan.perez@email.com', 'Individual'),
('María Gómez', '87654321', '3017654321', 'maria.gomez@email.com', 'Individual'),
('Carlos Ruiz', '11223344', '3022334455', 'carlos.ruiz@email.com', 'Individual'),
('Laura Martínez', '22334455', '3033445566', 'laura.martinez@email.com', 'Individual'),
('Pedro Torres', '33445566', '3044556677', 'pedro.torres@email.com', 'Individual'),
('Sofía Hernández', '44556677', '3055667788', 'sofia.hernandez@email.com', 'Individual'),
('José Martínez', '55667788', '3066778899', 'jose.martinez@email.com', 'Individual'),
('Ana Silva', '66778899', '3077889900', 'ana.silva@email.com', 'Individual'),
('Diego Castro', '77889900', '3088990011', 'diego.castro@email.com', 'Individual'),
('María Fernández', '88990011', '3099001122', 'maria.fernandez@email.com', 'Individual'),
('Roberto Díaz', '99001122', '3100112233', 'roberto.diaz@email.com', 'Individual'),
('Carmen Villamil', '11002233', '3111223344', 'carmen.villamil@email.com', 'Corporativo'),
('Empresa XYZ Ltda', '12003344', '3122334455', 'contacto@xyz.com.co', 'Corporativo'),
'Banco de Bogotá', '22004455', '3133445566', 'atencion@bb.com.co', 'Corporativo'),
'Grupo Aval', '33005566', '3144556677', 'contacto@grupoav.com.co', 'Corporativo'),
'Constructora ICA', '44006677', '3155667788', 'icaca@ica.com.co', 'Corporativo'),
'Distribuidorela S.A.', '55007788', '3166778899', 'venta@distriela.com', 'Corporativo'),
'Supermercados Éxito', '66008899', '3177889900', 'marketing@exito.com.co', 'Corporativo',
'Farmavita S.A.', '77009900', '3188990011', 'farmacia@farmavita.com', 'Corporativo',
'Transporte Bogotá', '88001122', '3199001122', 'logistica@transbog.com', 'Corporativo'),
'Comercial Pacífico', '99001122', '3200112233', 'ventas@comercialpacifico.com', 'Corporativo',
'Licores Néctar', '11223344', '3100223344', 'ventas@nectar.com.co', 'Corporativo',
'Editoriales Planeta', '22334455', '3110334455', 'contacto@planeta.co', 'Corporativo',
'Constructuras Carnaval', '33445566', '3120445566', 'eventos@carneval.com', 'Corporativo',
'Restaurante Gourmet', '44556677', '3130556677', 'gastronomia@gourmet.com', 'Corporativo',
'Boutique Moda', '55667788', '3140667788', 'ventas@boutiquemoda.com', 'Corporativo',
'Inmobiliaria Bogotá', '66778899', '3150778899', 'ventas@inmo-bogota.com', 'Corporativo',
'Centro de Eventos Ágora', '77889900', '3160889900', 'info@agora.com.co', 'Corporativo',
'Seguros Sura', '88990011', '3170990011', 'siniestros@sura.com.co', 'Corporativo',
'Bancolombia', '99001122', '3180112233', 'banca@bancolombia.com.co', 'Corporativo',
'AXA Colpatria', '11002233', '3190223344', 'asesoria@axa.com.co', 'Corporativo',
'Protección', '22334455', '3100334455', 'servicios@proteccion.com.co', 'Corporativo',
'BBVA', '33445566', '3110445566', 'atencion@bbva.com.co', 'Corporativo',
'Davivienda', '44556677', '3120556677', 'banca@davivienda.com.co', 'Corporativo',
'Financiera Aval', '55667788', '3130667788', 'contacto@avalfinanciera.com', 'Corporativo');

-- ============================================================
-- 3. RESERVAS (50 reservas distribuidas en fechas)
-- ==========================================================--
INSERT INTO reservas (cliente_id, salon_id, fecha_inicio, fecha_fin, estado) VALUES
(1, 1, '2024-12-15 10:00:00', '2024-12-15 14:00:00', 'Confirmada'),
(2, 2, '2024-12-15 09:00:00', '2024-12-15 12:00:00', 'Confirmada'),
(3, 3, '2024-12-15 14:00:00', '2024-12-15 18:00:00', 'Confirmada'),
(4, 4, '2024-12-16 08:00:00', '2024-12-16 10:00:00', 'Confirmada'),
(5, 5, '2024-12-16 11:00:00', '2024-12-16 15:00:00', 'Confirmada'),
(6, 6, '2024-12-17 09:00:00', '2024-12-17 13:00:00', 'Confirmada'),
(7, 7, '2024-12-17 14:00:00', '2024-12-17 19:00:00', 'Confirmada'),
(8, 8, '2024-12-18 08:00:00', '2024-12-18 12:00:00', 'Confirmada'),
(9, 9, '2024-12-18 14:00:00', '2024-12-18 18:00:00', 'Confirmada'),
(10, 10, '2024-12-19 09:00:00', '2024-12-19 13:00:00', 'Confirmada'),
(11, 11, '2024-12-19 11:00:00', '2024-12-19 15:00:00', 'Confirmada'),
(12, 12, '2024-12-20 08:00:00', '2024-12-20 12:00:00', 'Confirmada'),
(13, 13, '2024-12-20 14:00:00', '2024-12-20 18:00:00', 'Confirmada'),
(14, 14, '2024-12-21 09:00:00', '2024-12-21 13:00:00', 'Confirmada'),
(15, 15, '2024-12-21 11:00:00', '2024-12-21 15:00:00', 'Confirmada'),
(16, 1, '2024-12-22 08:00:00', '2024-12-22 12:00:00', 'Confirmada'),
(17, 2, '2024-12-22 14:00:00', '2024-12-22 18:00:00', 'Confirmada'),
(18, 3, '2024-12-23 09:00:00', '2024-12-23 13:00:00', 'Confirmada'),
(19, 4, '2024-12-23 11:00:00', '2024-12-23 15:00:00', 'Confirmada'),
(20, 5, '2024-12-24 08:00:00', '2024-12-24 14:00:00', 'Confirmada'),
(21, 6, '2024-12-24 11:00:00', '2024-12-24 16:00:00', 'Confirmada'),
(22, 7, '2024-12-25 09:00:00', '2024-12-25 13:00:00', 'Confirmada'),
(23, 8, '2024-12-25 14:00:00', '2024-12-25 18:00:00', 'Confirmada'),
(24, 9, '2024-12-26 08:00:00', '2024-12-26 12:00:00', 'Confirmada'),
(25, 10, '2024-12-26 11:00:00', '2024-12-26 15:00:00', 'Confirmada'),
(26, 11, '2024-12-27 09:00:00', '2024-12-27 13:00:00', 'Confirmada'),
(27, 12, '2024-12-27 14:00:00', '2024-12-27 18:00:00', 'Confirmada'),
(28, 13, '2024-12-28 08:00:00', '2024-12-28 12:00:00', 'Confirmada'),
(29, 14, '2024-12-28 11:00:00', '2024-12-28 15:00:00', 'Confirmada'),
(30, 15, '2024-12-29 09:00:00', '2024-12-29 13:00:00', 'Confirmada'),
(31, 1, '2024-12-29 14:00:00', '2024-12-29 18:00:00', 'Confirmada'),
(32, 2, '2024-12-30 08:00:00', '2024-12-30 12:00:00', 'Confirmada'),
(33, 3, '2024-12-30 14:00:00', '2024-12-30 18:00:00', 'Confirmada'),
(34, 4, '2025-01-01 08:00:00', '2025-01-01 12:00:00', 'Confirmada'),
(35, 5, '2025-01-01 11:00:00', '2025-01-01 16:00:00', 'Confirmada'),
(36, 6, '2025-01-02 09:00:00', '2025-01-02 13:00:00', 'Confirmada'),
(37, 7, '2025-01-02 14:00:00', '2025-01-02 18:00:00', 'Confirmada'),
(38, 8, '2025-01-03 08:00:00', '2025-01-03 12:00:00', 'Confirmada'),
(39, 9, '2025-01-03 11:00:00', '2025-01-03 16:00:00', 'Confirmada'),
(40, 10, '2025-01-04 09:00:00', '2025-01-04 13:00:00', 'Confirmada'),
(41, 11, '2025-01-04 14:00:00', '2025-01-04 18:00:00', 'Confirmada'),
(42, 12, '2025-01-05 08:00:00', '2025-01-05 12:00:00', 'Pendiente'),
(43, 13, '2025-01-05 11:00:00', '2025-01-05 16:00:00', 'Cancelada'),
(44, 14, '2025-01-06 09:00:00', '2025-01-06 13:00:00', 'Confirmada'),
(45, 15, '2025-01-06 14:00:00', '2025-01-06 18:00:00', 'Confirmada'),
(46, 16, '2025-01-07 08:00:00', '2025-01-07 12:00:00', 'Confirmada'),
(47, 17, '2025-01-07 11:00:00', '2025-01-07 16:00:00', 'Confirmada'),
(48, 18, '2025-01-08 09:00:00', '2025-01-08 13:00:00', 'Confirmada'),
(49, 19, '2025-01-08 14:00:00', '2025-01-08 18:00:00', 'Confirmada'),
(50, 20, '2025-01-09 08:00:00', '2025-01-09 14:00:00', 'Confirmada');

-- ============================================================
-- 4. PAGOS (50 pagos relacionados a reservas)
-- ============================================================
INSERT INTO pagos (reserva_id, fecha_pago, monto, metodo) VALUES
(1, '2024-12-10 14:30:00', 83790, 'Tarjeta'),
(2, '2024-12-11 09:15:00', 66500, 'Efectivo'),
(3, '2024-12-12 16:45:00', 75000, 'Transferencia'),
(4, '2024-12-13 10:30:00', 50000, 'Efectivo'),
(5, '2024-12-14 11:00:00', 95000, 'Tarjeta'),
(6, '2024-12-15 09:00:00', 52500, 'Transferencia'),
(7, '2024-12-16 14:30:00', 72000, 'Tarjeta'),
(8, '2024-12-17 08:00:00', 60000, 'Efectivo'),
(9, '2024-12-18 15:00:00', 81000, 'Transferencia'),
(10, '2024-12-19 10:00:00', 56560, 'Efectivo'),
(11, '2024-12-20 11:00:00', 90000, 'Tarjeta'),
(12, '2024-12-21 14:30:00', 64680, 'Efectivo'),
(13, '2024-12-22 09:00:00', 78000, 'Transferencia'),
(14, '2024-12-23 16:00:00', 54000, 'Tarjeta'),
(15, '2024-12-24 10:00:00', 89250, 'Efectivo'),
(16, '2024-12-25 11:00:00', 66000, 'Tarjeta'),
(17, '2024-12-26 14:00:00', 90000, 'Transferencia'),
(18, '2024-12-27 09:00:00', 56100, 'Efectivo'),
(19, '2024-12-28 16:00:00', 82500, 'Transferencia'),
(20, '2024-12-29 10:00:00', 63240, 'Efectivo'),
(21, '2024-12-30 11:00:00', 95700, 'Tarjeta'),
(22, '2025-01-02 14:30:00', 71500, 'Efectivo'),
(23, '2025-01-03 09:00:00', 88500, 'Transferencia'),
(24, '2025-01-04 16:00:00', 60500, 'Efectivo'),
(25, '2025-01-05 10:00:00', 93500, 'Tarjeta'),
(26, '2025-01-06 11:00:00', 55000, 'Efectivo'),
(27, '2025-01-07 14:00:00', 85800, 'Transferencia'),
(28, '2025-01-08 09:00:00', 72600, 'Efectivo'),
(29, '2025-01-09 16:00:00', 99000, 'Tarjeta'),
(30, '2025-01-10 10:00:00', 58300, 'Efectivo'),
(31, '2025-01-11 11:00:00', 89100, 'Tarjeta'),
(32, '2025-01-12 14:00:00', 75900, 'Transferencia'),
(33, '2025-01-13 09:00:00', 62700, 'Efectivo'),
(34, '2025-01-14 16:00:00', 91800, 'Tarjeta'),
(35, '2025-01-15 10:00:00', 56100, 'Efectivo'),
(36, '2025-01-16 11:00:00', 83600, 'Tarjeta'),
(37, '2025-01-17 14:00:00', 80300, 'Transferencia'),
(38, '2025-01-18 09:00:00', 67100, 'Efectivo'),
(39, '2025-01-19 16:00:00', 93500, 'Tarjeta'),
(40, '2025-01-20 10:00:00', 51700, 'Efectivo'),
(41, '2025-01-21 11:00:00', 85800, 'Tarjeta'),
(42, '2025-01-22 14:00:00', 78100, 'Efectivo'),
(43, '2025-01-23 14:00:00', 90200, 'Transferencia'),
(44, '2025-01-24 09:00:00', 54900, 'Efectivo'),
(45, '2025-01-25 16:00:00', 88000, 'Tarjeta'),
(46, '2025-01-26 10:00:00', 66000, 'Efectivo'),
(47, '2025-01-27 11:00:00', 94600, 'Tarjeta'),
(48, '2025-01-28 14:00:00', 82500, 'Transferencia'),
(49, '2025-01-29 09:00:00', 51700, 'Efectivo'),
(50, '2025-01-30 16:00:00', 99000, 'Tarjeta');

-- ============================================================
-- 5. AUDITORIA PRECIOS (registros de cambios de precio)
-- ============================================================
INSERT INTO auditoria_precios (salon_id, precio_anterior, precio_nuevo, usuario) VALUES
(1, 50000, 55000, 'admin_sistemas'),
(3, 23000, 25000, 'admin_sistemas'),
(5, 75000, 80000, 'admin_sistemas'),
(7, 55000, 60000, 'admin_sistemas'),
(10, 70000, 75000, 'admin_sistemas'),
(12, 40000, 42000, 'admin_sistemas'),
(15, 45000, 48000, 'admin_sistemas'),
(17, 36000, 38000, 'admin_sistemas'),
(20, 28000, 30000, 'admin_sistemas'),
(22, 35000, 37000, 'admin_sistemas');

-- ============================================================
-- RESUMEN DE DATOS INGRESADOS
-- ==========================================================--
SELECT 'Salones:' AS tabla, COUNT(*) AS total FROM salones
UNION ALL
SELECT 'Clientes:', COUNT(*) FROM clientes
UNION ALL
SELECT 'Reservas:', COUNT(*) FROM reservas
UNION ALL
SELECT 'Pagos:', COUNT(*) FROM pagos
UNION ALL
SELECT 'Auditoria_precios:', COUNT(*) FROM auditoria_precios;