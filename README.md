# Eventos Premier S.A.S.: base de datos de reservas

Base de datos en MySQL para gestionar salones, clientes, reservas y pagos de una empresa de eventos. Incluye funciones, triggers, vistas y datos de prueba.

## Funcionalidades

- Control de salones por capacidad, precio y estado.
- Clientes individuales y corporativos.
- Reservas con cálculo del valor total (IVA incluido) y validación de disponibilidad.
- Registro de pagos.
- Auditoría de cambios de precio.

## Modelo

| Tabla | Contenido |
|---|---|
| `salones` | Espacios disponibles para eventos |
| `clientes` | Clientes individuales y corporativos |
| `reservas` | Reservas por salón y cliente |
| `pagos` | Pagos asociados a las reservas |
| `auditoria_precios` | Historial de cambios de precio |

## Objetos programados

| Objeto | Tipo | Propósito |
|---|---|---|
| `calcular_total_reserva` | Función | Calcula el valor total con IVA |
| `verificar_disponibilidad` | Función | Indica si un salón está libre en un rango de fechas |
| `actualizar_estado_salon_trigger` | Trigger | Marca el salón como ocupado al reservar |
| `liberar_salon_trigger` | Trigger | Libera el salón si no quedan reservas confirmadas |
| `auditoria_precios_trigger` | Trigger | Registra los cambios de precio |
| `vista_resumen_reservas` | Vista | Resume la información de las reservas |

## Instalación

Desde el cliente de MySQL, ejecuta los scripts en este orden:

```sql
source db_creation.sql
source functions.sql
source triggers.sql
source views_queries.sql
```

Los datos de prueba están en `datos_simulados.sql` y se describen en [datos_simulados_documentation.md](datos_simulados_documentation.md).

## Ejemplos

```sql
-- 3 horas a 25.000 con IVA del 19 %: 89250.00
SELECT calcular_total_reserva(25000, 3);

-- 1 = disponible, 0 = ocupado
SELECT verificar_disponibilidad(1, '2024-12-15 10:00:00', '2024-12-15 13:00:00');

-- Clientes corporativos con más de 3 reservas
SELECT c.nombre_completo, COUNT(r.id) AS total_reservas
FROM clientes c
JOIN reservas r ON c.id = r.cliente_id
WHERE c.tipo = 'Corporativo'
GROUP BY c.id
HAVING COUNT(r.id) > 3;
```

## Autor

Juan José Acevedo Morales, desarrollador de software junior.
[Portafolio](https://juanacevedo124.github.io/Portafolio/) | [GitHub](https://github.com/JuanAcevedo124) | [LinkedIn](https://www.linkedin.com/in/juan-acevedo-b24759450/)
