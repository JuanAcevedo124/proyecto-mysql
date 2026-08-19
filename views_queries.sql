-- ============================================================
-- Vistas y Consultas SQL
-- ============================================================

USE eventos_premier;

-- Consulta 1: Reservas realizadas en un rango de fechas (usar BETWEEN)
SELECT r.id,
       c.nombre_completo AS cliente,
       s.nombre AS salon,
       r.fecha_inicio,
       r.fecha_fin,
       r.total_horas,
       r.valor_total,
       r.estado
FROM reservas r
         JOIN clientes c ON r.cliente_id = c.id
         JOIN salones s ON r.salon_id = s.id
WHERE r.fecha_inicio BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY r.fecha_inicio DESC;

-- Consulta 2: Listado de salones con capacidad mayor a X personas y estado = 'Disponible'
SELECT id, nombre, capacidad, precio_hora, estado
FROM salones
WHERE capacidad > 50 AND estado = 'Disponible'
ORDER BY capacidad DESC;

-- Consulta 3: Clientes corporativos que hayan hecho más de 3 reservas (usar subconsulta o COUNT)
SELECT c.id,
       c.nombre_completo,
       c.identificacion,
       COUNT(r.id) AS total_reservas
FROM clientes c
         JOIN reservas r ON c.id = r.cliente_id
WHERE c.tipo = 'Corporativo'
GROUP BY c.id, c.nombre_completo, c.identificacion
HAVING COUNT(r.id) > 3
ORDER BY total_reservas DESC;

-- Vista: vista_resumen_reservas con nombre del cliente, nombre del salón, fecha de inicio, fecha fin, total y estado
CREATE OR REPLACE VIEW vista_resumen_reservas AS
SELECT r.id AS reserva_id,
       c.nombre_completo AS nombre_cliente,
       s.nombre AS nombre_salon,
       r.fecha_inicio,
       r.fecha_fin,
       r.valor_total,
       r.estado
FROM reservas r
         JOIN clientes c ON r.cliente_id = c.id
         JOIN salones s ON r.salon_id = s.id;