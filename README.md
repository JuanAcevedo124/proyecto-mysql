# Eventos Premier S.A.S. - Sistema de Gestión de Reservas

## Descripción del Proyecto

Sistema de base de datos para la gestión de reservas de salones para reuniones, fiestas y conferencias. El sistema permite:
- Registrar y controlar salones con su capacidad, precio y estado
- Gestionar clientes (individuales y corporativos)
- Realizar reservas con cálculo automático de horas y valor total
- Registrar pagos con diferentes métodos
- Generar reportes y consultas para toma de decisiones

## Estructura de Archivos

- `db_creation.sql` - Script de creación de base de datos y tablas
- `functions.sql` - Funciones personalizadas (calcular_total_reserva, verificar_disponibilidad)
- `triggers.sql` - Triggers de control y auditoría
- `views_queries.sql` - Vistas y consultas SQL
- `README.md` - Documentación del proyecto

## Instrucciones de Ejecución

### 1. Crear la base de datos y tablas
```sql
source db_creation.sql
```

### 2. Crear funciones personalizadas
```sql
source functions.sql
```

### 3. Crear triggers de control y auditoría
```sql
source triggers.sql
```

### 4. Crear vistas y consultas
```sql
source views_queries.sql
```

## Ejemplos de Funciones

### calcular_total_reserva
```sql
SELECT calcular_total_reserva(25000, 3);
-- Retorna: 89250.00 (3 horas * $25.000 * 1.19 IVA)
```

### verificar_disponibilidad
```sql
SELECT verificar_disponibilidad(1, '2024-12-15 10:00:00', '2024-12-15 13:00:00');
-- Retorna: 1 (disponible) o 0 (ocupado)
```

## Ejemplos de Triggers

### actualizar_estado_salon_trigger
Al insertar una nueva reserva, el salón cambia automáticamente a estado "Ocupado".

### liberar_salon_trigger
Al eliminar una reserva, si no hay otras reservas confirmadas, el salon vuelve a "Disponible".

### auditoria_precios_trigger
Cuando se actualiza el precio por hora de un salón, se registra automáticamente en la tabla `auditoria_precios` con el usuario y los valores anterior/nuevo.

## Ejemplos de Consultas

### Reservas en rango de fechas
```sql
SELECT * FROM vista_resumen_reservas
WHERE fecha_inicio BETWEEN '2024-01-01' AND '2024-12-31';
```

### Salones disponibles con capacidad > X
```sql
SELECT * FROM salones WHERE capacidad > 100 AND estado = 'Disponible';
```

### Clientes corporativos con más de 3 reservas
```sql
SELECT c.nombre_completo, COUNT(r.id) AS total_reservas
FROM clientes c
JOIN reservas r ON c.id = r.cliente_id
WHERE c.tipo = 'Corporativo'
GROUP BY c.id
HAVING COUNT(r.id) > 3;
```

### Vista resumen de reservas
```sql
SELECT * FROM vista_resumen_reservas;
```

## Créditos y Autor

- **Empresa**: Eventos Premier S.A.S.
- **Desarrollador**: Sistema de reservas SQL
- **Año**: 2026