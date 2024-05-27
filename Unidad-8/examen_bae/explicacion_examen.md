### Usos del Tipo de Datos `ENUM` en MySQL

1. **Restricción de Valores**:
   - **Control de Calidad de Datos**: Garantiza que solo se ingresen valores válidos en una columna, lo cual ayuda a mantener la integridad de los datos.
   - **Facilidad de Validación**: No se requiere validación adicional en el nivel de aplicación para verificar los valores permitidos.

2. **Eficiencia de Almacenamiento**:
   - **Almacenamiento Compacto**: `ENUM` almacena valores internamente como números enteros, lo que puede ser más eficiente en términos de espacio que usar tipos de datos como `VARCHAR`.

3. **Legibilidad y Mantenimiento del Código**:
   - **Legibilidad**: Facilita la comprensión del esquema de la base de datos, ya que los valores posibles están definidos claramente en la declaración de la columna.
   - **Mantenimiento**: Simplifica la gestión de los valores permitidos, ya que están centralizados en la definición de la columna.

### Ejemplos de Uso

#### Ejemplo 1: Definir una Columna `ENUM`

Supongamos que tenemos una tabla `usuarios` y queremos que la columna `estado` solo permita los valores 'activo', 'inactivo' o 'pendiente'. La definición de la tabla sería:

```sql
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    estado ENUM('activo', 'inactivo', 'pendiente') NOT NULL
);
```

#### Ejemplo 2: Insertar Datos en una Columna `ENUM`

Para insertar datos en la columna `estado`, solo se pueden usar los valores predefinidos:

```sql
INSERT INTO usuarios (nombre, estado) VALUES ('Juan Perez', 'activo');
INSERT INTO usuarios (nombre, estado) VALUES ('Maria Gomez', 'pendiente');
```

Intentar insertar un valor no definido causará un error:

```sql
INSERT INTO usuarios (nombre, estado) VALUES ('Carlos Ruiz', 'desconocido'); 
-- Esto dará un error: ERROR 1265 (01000): Data truncated for column 'estado' at row 1
```

#### Ejemplo 3: Comparación y Consulta

Las consultas pueden aprovechar los valores `ENUM` para filtrar resultados:

```sql
SELECT * FROM usuarios WHERE estado = 'activo';
```

### Beneficios Adicionales

- **Desempeño**: Debido a que `ENUM` se almacena internamente como un número entero, las operaciones de comparación y clasificación pueden ser más rápidas en comparación con cadenas de texto.
- **Facilidad de Actualización**: Actualizar los valores permitidos de un `ENUM` implica alterar la definición de la columna, lo cual es un cambio centralizado y más fácil de manejar.

### Consideraciones

- **Limitaciones en la Portabilidad**: El uso de `ENUM` es específico a MySQL y puede no ser portable a otras bases de datos que no soportan este tipo de datos de la misma manera.
- **Cambio de Definición**: Agregar o eliminar valores en un `ENUM` requiere modificar la estructura de la tabla, lo cual puede ser una operación costosa en términos de tiempo de inactividad.

La expresión `SET peso_aleatorio = FLOOR(50 + (RAND() * 50));` es una instrucción SQL que asigna un valor aleatorio a la variable `peso_aleatorio`. Este valor aleatorio está comprendido entre 50 y 100 kg. Aquí está el desglose paso a paso de cómo funciona:

1. **`RAND()`**:
   - La función `RAND()` genera un número decimal aleatorio entre 0 (inclusive) y 1 (exclusivo). Cada vez que se llama, produce un valor diferente dentro de este rango.

2. **`RAND() * 50`**:
   - Multiplicamos el resultado de `RAND()` por 50 para expandir el rango de 0-1 a un rango de 0-50. Ahora, `RAND() * 50` genera un número decimal aleatorio entre 0 (inclusive) y 50 (exclusivo).

3. **`50 + (RAND() * 50)`**:
   - Al agregar 50 al resultado de `RAND() * 50`, trasladamos el rango de 0-50 a un rango de 50-100. Es decir, ahora estamos generando un número decimal aleatorio entre 50 (inclusive) y 100 (exclusivo).

4. **`FLOOR(50 + (RAND() * 50))`**:
   - La función `FLOOR()` redondea hacia abajo el número decimal al entero más cercano que es menor o igual que el número decimal. Esto convierte el número aleatorio decimal en un número entero aleatorio. Por ejemplo, si el resultado de `50 + (RAND() * 50)` es 75.89, `FLOOR(75.89)` lo convertirá en 75.

### Ejemplo Práctico

Si desglosamos la operación con un ejemplo específico:

1. Supongamos que `RAND()` genera el valor 0.6734.
2. Multiplicamos esto por 50:
   \[
   0.6734 \times 50 = 33.67
   \]
3. Luego, sumamos 50:
   \[
   50 + 33.67 = 83.67
   \]
4. Finalmente, aplicamos `FLOOR()` para redondear hacia abajo:
   \[
   \text{FLOOR}(83.67) = 83
   \]

Por lo tanto, la variable `peso_aleatorio` se establece en 83.

### Resumen

La instrucción `SET peso_aleatorio = FLOOR(50 + (RAND() * 50));` genera un número entero aleatorio entre 50 y 100 kg de la siguiente manera:
- `RAND()` produce un número decimal aleatorio entre 0 y 1.
- Multiplicando por 50, se obtiene un número decimal aleatorio entre 0 y 50.
- Sumando 50, el rango se traslada a un número decimal aleatorio entre 50 y 100.
- Aplicando `FLOOR()`, se obtiene un número entero aleatorio dentro de ese rango.

Esta técnica es útil para generar valores aleatorios dentro de un rango específico en aplicaciones de bases de datos.

# SET admitido_aleatorio = IF(RAND() > 0.5, 'Si', 'No');

La instrucción `SET admitido_aleatorio = IF(RAND() > 0.5, 'Si', 'No');` asigna aleatoriamente uno de dos valores ('Si' o 'No') a la variable `admitido_aleatorio`. Aquí tienes una explicación detallada de cómo funciona:

1. **`RAND()`**:
   - La función `RAND()` en MySQL genera un número decimal aleatorio entre 0 (inclusive) y 1 (exclusivo). Cada vez que se llama, produce un valor diferente dentro de este rango.

2. **`RAND() > 0.5`**:
   - Este es un operador de comparación que verifica si el número aleatorio generado por `RAND()` es mayor que 0.5. Dado que `RAND()` genera valores de manera uniforme, hay una probabilidad del 50% de que `RAND()` sea mayor que 0.5 y una probabilidad del 50% de que sea menor o igual a 0.5.

3. **`IF(condition, value_if_true, value_if_false)`**:
   - La función `IF` es una estructura de control condicional en MySQL. Evalúa la condición dada (`RAND() > 0.5`). 
   - Si la condición es verdadera (es decir, si el número aleatorio es mayor que 0.5), la función devuelve el valor especificado en `value_if_true`, que es `'Si'`.
   - Si la condición es falsa (es decir, si el número aleatorio es menor o igual que 0.5), la función devuelve el valor especificado en `value_if_false`, que es `'No'`.

### Ejemplo Práctico

Vamos a analizar algunos ejemplos hipotéticos para ver cómo funciona esta instrucción:

- **Caso 1**: Supongamos que `RAND()` genera 0.8.
  - Evaluación: `0.8 > 0.5` es verdadero.
  - Resultado: `IF(TRUE, 'Si', 'No')` devuelve `'Si'`.
  - `admitido_aleatorio` se establece en `'Si'`.

- **Caso 2**: Supongamos que `RAND()` genera 0.3.
  - Evaluación: `0.3 > 0.5` es falso.
  - Resultado: `IF(FALSE, 'Si', 'No')` devuelve `'No'`.
  - `admitido_aleatorio` se establece en `'No'`.

### Resumen

La instrucción `SET admitido_aleatorio = IF(RAND() > 0.5, 'Si', 'No');` funciona de la siguiente manera:
- **Genera un número aleatorio** entre 0 y 1 utilizando `RAND()`.
- **Compara** ese número con 0.5.
- **Asigna** `'Si'` a la variable `admitido_aleatorio` si el número es mayor que 0.5.
- **Asigna** `'No'` a la variable `admitido_aleatorio` si el número es menor o igual que 0.5.

En términos prácticos, esta instrucción es una forma de decidir aleatoriamente entre dos opciones, con una probabilidad del 50% para cada una.

# SET fecha_aleatoria = DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 365) DAY)

La instrucción `SET fecha_aleatoria = DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 365) DAY);` asigna a la variable `fecha_aleatoria` una fecha aleatoria dentro del último año (es decir, desde la fecha actual hasta un año atrás). A continuación, se explica paso a paso cómo funciona:

1. **`CURDATE()`**:
   - La función `CURDATE()` devuelve la fecha actual en el formato 'YYYY-MM-DD' sin la parte de la hora.

2. **`RAND()`**:
   - La función `RAND()` genera un número decimal aleatorio entre 0 (inclusive) y 1 (exclusivo).

3. **`RAND() * 365`**:
   - Multiplicamos el valor aleatorio generado por `RAND()` por 365. Esto nos da un número decimal aleatorio entre 0 y 365 (aunque no llegará exactamente a 365, puede acercarse mucho).

4. **`FLOOR(RAND() * 365)`**:
   - La función `FLOOR()` redondea el número decimal hacia abajo al entero más cercano. Esto convierte el número decimal en un número entero aleatorio entre 0 y 364. Este número representa el número de días que se restarán desde la fecha actual.

5. **`INTERVAL FLOOR(RAND() * 365) DAY`**:
   - Este constructo crea un intervalo de tiempo en días basado en el número entero obtenido de `FLOOR(RAND() * 365)`. El intervalo representa un número aleatorio de días entre 0 y 364.

6. **`DATE_SUB(CURDATE(), INTERVAL ...)`**:
   - La función `DATE_SUB()` resta el intervalo especificado de la fecha proporcionada. En este caso, resta el número aleatorio de días del paso anterior de la fecha actual (`CURDATE()`).

### Ejemplo Práctico

Vamos a analizar cómo se calcula `fecha_aleatoria` con ejemplos específicos:

1. **Supongamos que `RAND()` genera 0.356**:
   - `RAND() * 365` = 0.356 * 365 ≈ 129.74
   - `FLOOR(129.74)` = 129
   - `INTERVAL 129 DAY` es un intervalo de 129 días.

2. **Si la fecha actual es 2024-05-27**:
   - `DATE_SUB('2024-05-27', INTERVAL 129 DAY)` resta 129 días de la fecha 2024-05-27.
   - La fecha resultante es 2024-01-19.

Por lo tanto, `fecha_aleatoria` se establece en 2024-01-19.

### Resumen

La instrucción `SET fecha_aleatoria = DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 365) DAY);` funciona de la siguiente manera:
- **Genera un número aleatorio** entre 0 y 1 usando `RAND()`.
- **Multiplica** ese número por 365 para obtener un número decimal entre 0 y 365.
- **Redondea** ese número decimal hacia abajo al entero más cercano usando `FLOOR()`.
- **Resta** ese número de días de la fecha actual (`CURDATE()`) utilizando `DATE_SUB()`, obteniendo así una fecha aleatoria dentro del último año.

Esto es útil para generar fechas aleatorias en aplicaciones que requieren datos de prueba o simulaciones dentro de un rango específico de tiempo.

# 
