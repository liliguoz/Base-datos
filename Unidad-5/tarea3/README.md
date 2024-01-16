<h1 align="center"> TAREA 3 SQLITE3 </h1>

<div align="center">
<img src="https://sqlite.org/forum/logo?id=603c155e" />
</div>

## Paso 1:

Para empezar crearemos la base de datos. Para ellos deberemos de crearla usando una serie de comandos:

```sql
nano empleados-dump.sql
```

Una vez creada la BBDD insertaremos en el interior de el fichero los comandos sql:

```sql
CREATE TABLE empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    salario REAL,
    departamento TEXT
);

INSERT INTO empleados (nombre, salario, departamento) VALUES ('Juan', 50000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('María', 60000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carlos', 55000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Ana', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Pedro', 70000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Laura', 52000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Javier', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carmen', 65000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Miguel', 51000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Elena', 55000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Diego', 72000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Sofía', 49000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Andrés', 60000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Isabel', 53000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Raúl', 68000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Patricia', 47000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Alejandro', 71000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Natalia', 54000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Roberto', 49000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Beatriz', 63000, 'TI');
```

## Paso 2:

Una vez hecho lo anterir procederemos a crear la base de datos en sql de la siguiente forma:

```sql
sqlite3 tarea3.db 
```

Una vez hecho esto, para poder leer los comandos que insertamos en el fichero que creamos en el paso 1 deberemos utilizar el siguiente comando:

```sql
.read empleados-dump.sql
```

## Paso 3:

Realiza las siguientes consultas, y muestra el resultado obtenido:

- **Funciones UPPER y LOWER**: Muestra el nombre de todos los empleados en mayúsculas.

```sql
SELECT UPPER(nombre) AS nombre_mayusculas FROM empleados;
```

```sql
┌───────────────────┐
│ nombre_mayusculas │
├───────────────────┤
│ JUAN              │
│ MARíA             │
│ CARLOS            │
│ ANA               │
│ PEDRO             │
│ LAURA             │
│ JAVIER            │
│ CARMEN            │
│ MIGUEL            │
│ ELENA             │
│ DIEGO             │
│ SOFíA             │
│ ANDRéS            │
│ ISABEL            │
│ RAúL              │
│ PATRICIA          │
│ ALEJANDRO         │
│ NATALIA           │
│ ROBERTO           │
│ BEATRIZ           │
└───────────────────┘
```

- **Funciones Numéricas**: Calcula el valor absoluto del salario de todos los empleados.


```sql
SELECT salario, ABS(salario) AS salario_absoluto FROM empleados;
```

```sql
┌─────────┬──────────────────┐
│ salario │ salario_absoluto │
├─────────┼──────────────────┤
│ 50000.0 │ 50000.0          │
│ 60000.0 │ 60000.0          │
│ 55000.0 │ 55000.0          │
│ 48000.0 │ 48000.0          │
│ 70000.0 │ 70000.0          │
│ 52000.0 │ 52000.0          │
│ 48000.0 │ 48000.0          │
│ 65000.0 │ 65000.0          │
│ 51000.0 │ 51000.0          │
│ 55000.0 │ 55000.0          │
│ 72000.0 │ 72000.0          │
│ 49000.0 │ 49000.0          │
│ 60000.0 │ 60000.0          │
│ 53000.0 │ 53000.0          │
│ 68000.0 │ 68000.0          │
│ 47000.0 │ 47000.0          │
│ 71000.0 │ 71000.0          │
│ 54000.0 │ 54000.0          │
│ 49000.0 │ 49000.0          │
│ 63000.0 │ 63000.0          │
└─────────┴──────────────────┘
```

- **Funciones de Fecha y Hora**: Muestra la fecha actual.

```sql
 SELECT CURRENT_DATE AS fecha_actual FROM empleados LIMIT 1;
```

```sql
┌──────────────┐
│ fecha_actual │
├──────────────┤
│ 2024-01-16   │
└──────────────┘
```

- **Funciones de Agregación**: Calcula el promedio de salarios de todos los empleados.

```sql
SELECT AVG(salario) AS promedio_salarios FROM empleados;
```

```sql
┌───────────────────┐
│ promedio_salarios │
├───────────────────┤
│ 57000.0           │
└───────────────────┘
```

- **Funciones de Agregación**: Convierte la cadena '123' a un valor entero.

- **Funciones de Manipulación de Cadenas**: Concatena el nombre y el departamento de cada empleado.

```sql
SELECT CONCAT(nombre, ' ', departamento) AS nombre_departamento FROM empleados;
```

```sql
┌───────────────────────────┐
│    nombre_departamento    │
├───────────────────────────┤
│ Juan Ventas               │
│ María TI                  │
│ Carlos Ventas             │
│ Ana Recursos Humanos      │
│ Pedro TI                  │
│ Laura Ventas              │
│ Javier Recursos Humanos   │
│ Carmen TI                 │
│ Miguel Ventas             │
│ Elena Recursos Humanos    │
│ Diego TI                  │
│ Sofía Ventas              │
│ Andrés Recursos Humanos   │
│ Isabel TI                 │
│ Raúl Ventas               │
│ Patricia Recursos Humanos │
│ Alejandro TI              │
│ Natalia Ventas            │
│ Roberto Recursos Humanos  │
│ Beatriz TI                │
└───────────────────────────┘
```

- **Funciones de Manipulación de Cadenas (CONCAT_WS)**: Concatena el nombre y el departamento de cada empleado con un guion como separador.

```sql
SELECT CONCAT_WS(' - ', nombre, departamento) AS nombre_departamento
FROM empleados;
```

```sql
┌─────────────────────────────┐
│     nombre_departamento     │
├─────────────────────────────┤
│ Juan - Ventas               │
│ María - TI                  │
│ Carlos - Ventas             │
│ Ana - Recursos Humanos      │
│ Pedro - TI                  │
│ Laura - Ventas              │
│ Javier - Recursos Humanos   │
│ Carmen - TI                 │
│ Miguel - Ventas             │
│ Elena - Recursos Humanos    │
│ Diego - TI                  │
│ Sofía - Ventas              │
│ Andrés - Recursos Humanos   │
│ Isabel - TI                 │
│ Raúl - Ventas               │
│ Patricia - Recursos Humanos │
│ Alejandro - TI              │
│ Natalia - Ventas            │
│ Roberto - Recursos Humanos  │
│ Beatriz - TI                │
└─────────────────────────────┘
```

- **Funciones de Control de Flujo (CASE)**: Categoriza a los empleados según sus salarios.

- **Funciones de Agregación (SUM)**: Calcula la suma total de salarios de todos los empleados.

```sql
SELECT SUM(salario) AS suma_total_salarios FROM empleados;
```

```sql
┌─────────────────────┐
│ suma_total_salarios │
├─────────────────────┤
│ 1140000.0           │
└─────────────────────┘
```

- **Funciones Numéricas (ROUND)**: Redondea el salario de todos los empleados a dos decimales.

```sql
SELECT CONCAT(nombre, ' ', departamento) AS nombre_departamento FROM empleados;
```
```sql
┌────────────────────┐
│ salario_redondeado │
├────────────────────┤
│ 50000.0            │
│ 60000.0            │
│ 55000.0            │
│ 48000.0            │
│ 70000.0            │
│ 52000.0            │
│ 48000.0            │
│ 65000.0            │
│ 51000.0            │
│ 55000.0            │
│ 72000.0            │
│ 49000.0            │
│ 60000.0            │
│ 53000.0            │
│ 68000.0            │
│ 47000.0            │
│ 71000.0            │
│ 54000.0            │
│ 49000.0            │
│ 63000.0            │
└────────────────────┘
```

- **Funciones de Manipulación de Cadenas (LENGTH)**: Muestra la longitud de cada nombre de empleado.

```sql
SELECT nombre, LENGTH(nombre) AS longitud_del_nombre FROM empleados;
```

```sql
┌───────────┬─────────────────────┐
│  nombre   │ longitud_del_nombre │
├───────────┼─────────────────────┤
│ Juan      │ 4                   │
│ María     │ 5                   │
│ Carlos    │ 6                   │
│ Ana       │ 3                   │
│ Pedro     │ 5                   │
│ Laura     │ 5                   │
│ Javier    │ 6                   │
│ Carmen    │ 6                   │
│ Miguel    │ 6                   │
│ Elena     │ 5                   │
│ Diego     │ 5                   │
│ Sofía     │ 5                   │
│ Andrés    │ 6                   │
│ Isabel    │ 6                   │
│ Raúl      │ 4                   │
│ Patricia  │ 8                   │
│ Alejandro │ 9                   │
│ Natalia   │ 7                   │
│ Roberto   │ 7                   │
│ Beatriz   │ 7                   │
└───────────┴─────────────────────┘
```

- **Funciones de Agregación (COUNT)**: Cuenta el número total de empleados en cada departamento.

```sql
SELECT COUNT(*) AS total_empleados FROM empleados;
```

```sql
┌─────────────────┐
│ total_empleados │
├─────────────────┤
│ 20              │
└─────────────────┘
```

- **Funciones de Fecha y Hora (CURRENT_TIME)**: Muestra la hora actual.

```sql
SELECT CURRENT_TIME AS tiempo_actual FROM empleados LIMIT 1;
```

```sql
┌───────────────┐
│ tiempo_actual │
├───────────────┤
│ 23:02:51      │
└───────────────┘
```

- **Funciones de Conversión (CAST)**: Convierte el salario a un valor de punto flotante.

```sql 
SELECT nombre, CAST(salario AS FLOAT) AS salario_flotante
FROM empleados;
```

```sql
┌───────────┬──────────────────┐
│  nombre   │ salario_flotante │
├───────────┼──────────────────┤
│ Juan      │ 50000.0          │
│ María     │ 60000.0          │
│ Carlos    │ 55000.0          │
│ Ana       │ 48000.0          │
│ Pedro     │ 70000.0          │
│ Laura     │ 52000.0          │
│ Javier    │ 48000.0          │
│ Carmen    │ 65000.0          │
│ Miguel    │ 51000.0          │
│ Elena     │ 55000.0          │
│ Diego     │ 72000.0          │
│ Sofía     │ 49000.0          │
│ Andrés    │ 60000.0          │
│ Isabel    │ 53000.0          │
│ Raúl      │ 68000.0          │
│ Patricia  │ 47000.0          │
│ Alejandro │ 71000.0          │
│ Natalia   │ 54000.0          │
│ Roberto   │ 49000.0          │
│ Beatriz   │ 63000.0          │
└───────────┴──────────────────┘
```

- **Funciones de Manipulación de Cadenas (SUBSTR)**: Muestra los primeros tres caracteres de cada nombre de empleado.

```sql
SELECT nombre, SUBSTR(nombre, 1, 3) AS primeros_tres_caracteres
FROM empleados;
```

```sql
┌───────────┬──────────────────────────┐
│  nombre   │ primeros_tres_caracteres │
├───────────┼──────────────────────────┤
│ Juan      │ Jua                      │
│ María     │ Mar                      │
│ Carlos    │ Car                      │
│ Ana       │ Ana                      │
│ Pedro     │ Ped                      │
│ Laura     │ Lau                      │
│ Javier    │ Jav                      │
│ Carmen    │ Car                      │
│ Miguel    │ Mig                      │
│ Elena     │ Ele                      │
│ Diego     │ Die                      │
│ Sofía     │ Sof                      │
│ Andrés    │ And                      │
│ Isabel    │ Isa                      │
│ Raúl      │ Raú                      │
│ Patricia  │ Pat                      │
│ Alejandro │ Ale                      │
│ Natalia   │ Nat                      │
│ Roberto   │ Rob                      │
│ Beatriz   │ Bea                      │
└───────────┴──────────────────────────┘
```

- **Order By and Like.**

Empleados en el departamento de 'Ventas' con salarios superiores a 52000.

```sql
SELECT nombre, departamento, salario
FROM empleados
WHERE departamento = 'Ventas' AND salario > 52000
ORDER BY salario DESC;
```

```sql
┌─────────┬──────────────┬─────────┐
│ nombre  │ departamento │ salario │
├─────────┼──────────────┼─────────┤
│ Raúl    │ Ventas       │ 68000.0 │
│ Carlos  │ Ventas       │ 55000.0 │
│ Natalia │ Ventas       │ 54000.0 │
└─────────┴──────────────┴─────────┘
```

Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente.

```sql 
SELECT nombre, salario
FROM empleados
WHERE nombre LIKE '%a%'
ORDER BY salario ASC;
```

```sql
┌───────────┬─────────┐
│  nombre   │ salario │
├───────────┼─────────┤
│ Patricia  │ 47000.0 │
│ Ana       │ 48000.0 │
│ Javier    │ 48000.0 │
│ Sofía     │ 49000.0 │
│ Juan      │ 50000.0 │
│ Laura     │ 52000.0 │
│ Isabel    │ 53000.0 │
│ Natalia   │ 54000.0 │
│ Carlos    │ 55000.0 │
│ Elena     │ 55000.0 │
│ María     │ 60000.0 │
│ Andrés    │ 60000.0 │
│ Beatriz   │ 63000.0 │
│ Carmen    │ 65000.0 │
│ Raúl      │ 68000.0 │
│ Alejandro │ 71000.0 │
└───────────┴─────────┘
```

Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.

```sql
SELECT nombre, salario
FROM empleados
WHERE departamento = 'Recursos Humanos' AND salario BETWEEN 45000 AND 55000;
```

```sql
SELECT nombre, salario
FROM empleados
WHERE departamento = 'Recursos Humanos' AND salario BETWEEN 45000 AND 55000;
```

Empleados con salarios en orden descendente, limitando a los primeros 5 resultados.

```sql
SELECT nombre, salario
FROM empleados
ORDER BY salario DESC
LIMIT 5;
```

```sql
┌───────────┬─────────┐
│  nombre   │ salario │
├───────────┼─────────┤
│ Diego     │ 72000.0 │
│ Alejandro │ 71000.0 │
│ Pedro     │ 70000.0 │
│ Raúl      │ 68000.0 │
│ Carmen    │ 65000.0 │
└───────────┴─────────┘
```

Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000.

```sql
SELECT nombre, salario
FROM empleados
WHERE (nombre LIKE 'M%' OR nombre LIKE 'N%') AND salario > 50000
ORDER BY salario ASC;
```

```sql
┌─────────┬─────────┐
│ nombre  │ salario │
├─────────┼─────────┤
│ Miguel  │ 51000.0 │
│ Natalia │ 54000.0 │
│ María   │ 60000.0 │
└─────────┴─────────┘
```

Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre.

```sql
SELECT nombre, departamento
FROM empleados
WHERE departamento IN ('TI', 'Ventas')
ORDER BY nombre ASC;
```

```sql
┌───────────┬──────────────┐
│  nombre   │ departamento │
├───────────┼──────────────┤
│ Alejandro │ TI           │
│ Beatriz   │ TI           │
│ Carlos    │ Ventas       │
│ Carmen    │ TI           │
│ Diego     │ TI           │
│ Isabel    │ TI           │
│ Juan      │ Ventas       │
│ Laura     │ Ventas       │
│ María     │ TI           │
│ Miguel    │ Ventas       │
│ Natalia   │ Ventas       │
│ Pedro     │ TI           │
│ Raúl      │ Ventas       │
│ Sofía     │ Ventas       │
└───────────┴──────────────┘
```

Empleados con salarios únicos (eliminando duplicados) en orden ascendente.

```sql
SELECT DISTINCT nombre, salario
FROM empleados
ORDER BY salario ASC;
```

```sql
┌───────────┬─────────┐
│  nombre   │ salario │
├───────────┼─────────┤
│ Patricia  │ 47000.0 │
│ Ana       │ 48000.0 │
│ Javier    │ 48000.0 │
│ Sofía     │ 49000.0 │
│ Roberto   │ 49000.0 │
│ Juan      │ 50000.0 │
│ Miguel    │ 51000.0 │
│ Laura     │ 52000.0 │
│ Isabel    │ 53000.0 │
│ Natalia   │ 54000.0 │
│ Carlos    │ 55000.0 │
│ Elena     │ 55000.0 │
│ María     │ 60000.0 │
│ Andrés    │ 60000.0 │
│ Beatriz   │ 63000.0 │
│ Carmen    │ 65000.0 │
│ Raúl      │ 68000.0 │
│ Pedro     │ 70000.0 │
│ Alejandro │ 71000.0 │
│ Diego     │ 72000.0 │
└───────────┴─────────┘
```

Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'.

```sql
SELECT nombre, departamento
FROM empleados
WHERE (nombre LIKE '%o' OR nombre LIKE '%a') AND departamento = 'Ventas'
ORDER BY nombre ASC;
```

```sql
┌─────────┬──────────────┐
│ nombre  │ departamento │
├─────────┼──────────────┤
│ Laura   │ Ventas       │
│ Natalia │ Ventas       │
│ Sofía   │ Ventas       │
└─────────┴──────────────┘
```

Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.

```sql
SELECT nombre, salario, departamento
FROM empleados
WHERE salario < 55000 OR salario > 70000
ORDER BY departamento ASC;
```

```sql
┌───────────┬─────────┬──────────────────┐
│  nombre   │ salario │   departamento   │
├───────────┼─────────┼──────────────────┤
│ Ana       │ 48000.0 │ Recursos Humanos │
│ Javier    │ 48000.0 │ Recursos Humanos │
│ Patricia  │ 47000.0 │ Recursos Humanos │
│ Roberto   │ 49000.0 │ Recursos Humanos │
│ Diego     │ 72000.0 │ TI               │
│ Isabel    │ 53000.0 │ TI               │
│ Alejandro │ 71000.0 │ TI               │
│ Juan      │ 50000.0 │ Ventas           │
│ Laura     │ 52000.0 │ Ventas           │
│ Miguel    │ 51000.0 │ Ventas           │
│ Sofía     │ 49000.0 │ Ventas           │
│ Natalia   │ 54000.0 │ Ventas           │
└───────────┴─────────┴──────────────────┘
```

Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'.

```sql
SELECT nombre, departamento
FROM empleados
WHERE departamento = 'Recursos Humanos' AND nombre NOT LIKE '%e%'
ORDER BY nombre ASC;
```

```sql
┌──────────┬──────────────────┐
│  nombre  │   departamento   │
├──────────┼──────────────────┤
│ Ana      │ Recursos Humanos │
│ Andrés   │ Recursos Humanos │
│ Patricia │ Recursos Humanos │
└──────────┴──────────────────┘
```