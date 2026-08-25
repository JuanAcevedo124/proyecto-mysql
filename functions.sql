-- ============================================================
-- FUNCIONES PERSONALIZADAS
-- ============================================================

USE eventos_premier;

-- Función: calcular_total_reserva(precio_hora, horas) → retorna el valor total con IVA (19%)
DELIMITER //
CREATE FUNCTION calcular_total_reserva(precio_hora DECIMAL(10, 2), horas DECIMAL(10, 2))
RETURNS DECIMAL(12, 2)
DETERMINISTIC
BEGIN
    DECLARE total_con_iva DECIMAL(12, 2);
    SET total_con_iva = ROUND(precio_hora * horas * 1.19, 2);
    RETURN total_con_iva;
END //
DELIMITER ;

-- Función: verificar_disponibilidad(salon_id, fecha_inicio, fecha_fin) → retorna 1 si está disponible, 0 si está ocupado
DELIMITER //
CREATE FUNCTION verificar_disponibilidad(salon_id INT, p_fecha_inicio DATETIME, p_fecha_fin DATETIME)
RETURNS TINYINT
DETERMINISTIC
BEGIN
    DECLARE conflicto INT;
    -- Verificar si hay reservas que se superponen con la fecha solicitada
    -- Dos rangos de tiempo se superpenden cuando: nuevo_inicio < fecha_fin_existente AND nuevo_fin > fecha_inicio_existente
    SELECT COUNT(*) INTO conflicto
    FROM reservas
    WHERE salon_id = salon_id
      AND estado = 'Confirmada'
      AND (
        (p_fecha_inicio < fecha_fin AND p_fecha_fin > fecha_inicio)
      );
    
    IF conflicto > 0 THEN
        RETURN 0;
    ELSE
        RETURN 1;
    END IF;
END //
DELIMITER ;
