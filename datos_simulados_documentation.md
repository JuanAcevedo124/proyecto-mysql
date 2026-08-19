# Eventos Premier S.A.S. - Datos Simulados para Pruebas

## Descripción
Archivo con 50 registros simulados por categoría para garantizar que todas las consultas, triggers y funciones del sistema funcionen correctamente con datos reales.

## Estructura de Datos

### 1. Salones (50 salones)
- **Rango de capacidades:** 20 a 350 personas
- **Rango de precios:** $20.000 a $80.000 por hora
- **Estados:** Disponible (38), Ocupado (5), En mantenimiento (7)
- **Distribución:** Diferentes tipos (Boda, Conferencias, Ejecutivo, Colonial, etc.)
- **Propósito:** Permite probar consultas de disponibilidad, capacidad y reporte de salones por estado

### 2. Clientes (50 clientes)
- **Mixto:** 30 personas naturales (Individual) + 20 empresas (Corporativo)
- **Identificaciones:** Documentos de cidadanía y números de NIT
- **Contactos:** Teléfonos y correos electrónicos realistas
- **Propósito:** Incluye clientes corporativos que permiten la consulta "más de 3 reservas" y pruebas de funciones por cliente

### 3. Reservas (50 reservas)
- **Fechas:** Distribuidas entre diciembre 2024 y enero 2025
- **Distribución:** Reservas confirmadas, pendientes y canceladas
- **Solapamiento:** Algunas reservas se superponen para probar `verificar_disponibilidad`
- **Propósito:** Cubre todas las consultas (rango de fechas, totales, estado) y triggers

### 4. Pagos (50 pagos)
- **Métodos:** Efectivo, Tarjeta, Transferencia (distribuidos equitativamente)
- **Montos:** Variados según duración y precio hora + IVA
- **Fecha:** Todas las fechas preceden a la reserva o coincide con confirmación
- **Propósito:** Permite probar consultas de pagos por método y monto total recaudado

### 5. Auditoría Precios (8 registros)
- **Cambios registrados:** Actualizaciones históricas de precio por hora
- **Usuario:** admin_sistemas
- **Propósito:** Permite verificar que el trigger `auditoria_precios_trigger` funcione y muestre historial

## Cómo los datos soportan cada requisito

### Consultas SQL

1. **Reservas en rango de fechas (BETWEEN):**
   - Datos del 15/12/2024 al 9/01/2025 cubre el rango `BETWEEN '2024-01-01' AND '2024-12-31'`
   - Permite probar ambas consultas del archivo views_queries.sql

2. **Salones con capacidad > X y estado = 'Disponible':**
   - 38 salones con estado 'Disponible' con capacidades desde 20 hasta 350
   - Ejemplo: `WHERE capacidad > 50 AND estado = 'Disponible'` retorna 22 salones

3. **Clientes corporativos con >3 reservas:**
   - 20 clientes corporativos registrados
   - Varios tienen múltiples reservas (ej. Empresa XYZ Ltda, Banco de Bogotá)
   - Permite que la consulta HAVING COUNT(r.id) > 3 retorne resultados

### Funciones

1. **calcular_total_reserva(precio_hora, horas):**
   - Con datos reales: `SELECT calcular_total_reserva(55000, 4)` = 328.900
   - Todas las reservas tienen sus horas calculadas virtualmente

2. **verificar_disponibilidad(salon_id, fecha_inicio, fecha_fin):**
   - Prueba con conflictos: `SELECT verificar_disponibilidad(1, '2024-12-15 10:00:00', '2024-12-15 14:00:00')`
   - Prueba sin conflictos: `SELECT verificar_disponibilidad(1, '2024-12-20 10:00:00', '2024-12-20 14:00:00')`

### Triggers

1. **actualizar_estado_salon_trigger:**
   - Al INSERT de reserva: el salon pasa de Disponible a Ocupado automáticamente
   - Verificable con: `UPDATE salones SET estado='Disponible' WHERE id=1; INSERT INTO reservas...`

2. **liberar_salon_trigger:**
   - Al DELETE de reserva: si no hay otras confirmadas, salon vuelve a Disponible
   - Si quedan otras reservas, el estado se mantiene

3. **auditoria_precios_trigger:**
   - Al UPDATE precio hora en salones: registro automático en auditoria_precios
   - Los 8 registros iniciales fueron creados manualmente, el trigger añade más

## Ejemplos de Ejecución

### Insertar todos los datos simulados:
```sql
source datos_simulados.sql
```

### Ejemplos de consultas con los datos:

1. Reservas en diciembre:
```sql
SELECT * FROM vista_resumen_reservas
WHERE fecha_inicio BETWEEN '2024-12-01' AND '2024-12-31';
```

2. Salones disponibles > 100 personas:
```sql
SELECT * FROM salones WHERE capacidad > 100 AND estado = 'Disponible';
-- Retorna: Salón de Fiestas Grande(200), Salón de Boda(350), Salón Premium(120), etc.
```

3. Clientes corporativos con más de 3 reservas:
```sql
SELECT c.nombre_completo, COUNT(r.id) AS total_reservas
FROM clientes c JOIN reservas r ON c.id = r.cliente_id
WHERE c.tipo = 'Corporativo'
GROUP BY c.id HAVING COUNT(r.id) > 3;
-- Retorna clientes como: Empresa XYZ Ltda, Banco de Bogotá, Grupo Aval, etc.
```

## Nota Importante
Los datos están diseñados para:
- Cubrir todos los escenarios de las consultas requeridas
- Incluir casos edge (salon en mantenimiento, reservas canceladas, sin superposición)
- Permitir probar triggers tanto en éxito como en condiciones límite
- Generar reportes significativos para toma de decisiones administrativas