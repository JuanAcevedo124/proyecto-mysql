-- ============================================================
-- TRIGGERS DE CONTROL Y AUDITORÍA
-- ============================================================

USE eventos_premier;

-- Trigger: actualizar_estado_salon_trigger
-- Al registrar una nueva reserva, el estado del salón cambia a "Ocupado"
DELIMITER //
CREATE TRIGGER actualizar_estado_salon_trigger
AFTER INSERT ON reservas
FOR EACH ROW
BEGIN
    UPDATE salones
    SET estado = 'Ocupado',
        actualizado_en = CURRENT_TIMESTAMP
    WHERE id = NEW.salon_id;
END //
DELIMITER ;

-- Trigger: liberar_salon_trigger
-- Al eliminar una reserva, el salón vuelve a "Disponible"
DELIMITER //
CREATE TRIGGER liberar_salon_trigger
AFTER DELETE ON reservas
FOR EACH ROW
BEGIN
    -- Verificar si hay otras reservas confirmadas para este salón
    DECLARE count_reservas INT;
    SELECT COUNT(*) INTO count_reservas
    FROM reservas
    WHERE salon_id = OLD.salon_id
      AND estado = 'Confirmada';
    
    IF count_reservas = 0 THEN
        UPDATE salones
        SET estado = 'Disponible',
            actualizado_en = CURRENT_TIMESTAMP
        WHERE id = OLD.salon_id;
    END IF;
END //
DELIMITER ;

-- Trigger: auditoria_precios_trigger
-- Cuando se actualiza el precio por hora de un salón, registrar el cambio en una tabla "auditoria_precios"
DELIMITER //
CREATE TRIGGER auditoria_precios_trigger
AFTER UPDATE ON salones
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_precios (salon_id, precio_anterior, precio_nuevo, usuario)
    VALUES (OLD.id, OLD.precio_hora, NEW.precio_hora, USER());
END //
DELIMITER ;