<div align="justify">

# Tarea 3 de trabajo con índices

<div align="center">
<img src="https://hoplasoftware.com/wp-content/uploads/2021/07/1024px-MySQL.ff87215b43fd7292af172e2a5d9b844217262571.png" width=600/>
</div>

Vamos a continuar trabajando con índices. Se pide ejecutar cada una de las acciones necesarias para realizar las operaciones indicadas.

Las operaciones son las siguientes:

- Crea una base de datos que tendrá por nombre __Base_Indices__.

```sql
create database if not exists Base_Indices;

use Base_Indices;
```

- En la BD crea una tabla de nombre MOVIMIENTO con la siguiente estructura:

    | Nombre del campo | Tipo de dato | Propiedades                |
    |------------------|--------------|----------------------------|
    | Identificador    | int       | AUTO_INCREMENT, Clave primaria (PK_MOVIMIENTO) |
    | Articulo         | varchar(50)  | Obligatorio                |
    | Fecha            | date         | Obligatorio                |
    | Cantidad         | int     | Obligatorio                |

```sql
create table MOVIMIENTO (
    Identificador int auto_increment primary key,
    Articulo varchar(50) not null,
    Fecha date not null,
    Cantidad int not null
);
Query OK, 0 rows affected (0,21 sec)
```

- Aplica la sentencia adecuada para visualizar los índices que hay en la tabla.

```sql
show index from MOVIMIENTO;
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| MOVIMIENTO |          0 | PRIMARY  |            1 | Identificador | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

```

No se ven más índices ya que solo se ha insertado en la creación de la tabla la clave primaria que es el identificador.

- Ejecuta la siguiente sentencia sql para generar datos de prueba:

    ```sql
    CREATE TABLE NumerosUnicos (
    Numero INT AUTO_INCREMENT PRIMARY KEY
    );

    INSERT INTO NumerosUnicos (Numero)
    SELECT NULL FROM INFORMATION_SCHEMA.COLUMNS LIMIT 5000;

    INSERT INTO MOVIMIENTO (Identificador, Articulo, Fecha, Cantidad)
    SELECT 
        n.Numero,
        CONCAT('Producto', n.Numero),
        DATE_ADD('2012-01-01', INTERVAL FLOOR(RAND() * 120) DAY),
        FLOOR(RAND() * 1000000) + 1
    FROM 
        NumerosUnicos n;

        DROP TABLE NumerosUnicos;
    ```

```sql
select count(*) from MOVIMIENTO;
+----------+
| count(*) |
+----------+
|     3583 |
+----------+
1 row in set (0,02 sec)
```

- Crea con la sentencia CREATE TABLE…SELECT… un duplicado de la tabla MOVIMIENTO a
la que llamaremos MOVIMIENTO_BIS.

```sql
create table MOVIMIENTO_BIS select * from MOVIMIENTO;
Query OK, 3583 rows affected (0,30 sec)
Records: 3583  Duplicates: 0  Warnings: 0
```

- Con la cláusula __DESCRIBE__ observa cuál es la situación de la tabla clonada, ¿Qué le pasa al
índice y a la propiedad __AUTO_INCREMENT__?

```sql
describe MOVIMIENTO_BIS;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Identificador | int         | NO   |     | 0       |       |
| Articulo      | varchar(50) | NO   |     | NULL    |       |
| Fecha         | date        | NO   |     | NULL    |       |
| Cantidad      | int         | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0,00 sec)

describe MOVIMIENTO;
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| Identificador | int         | NO   | PRI | NULL    | auto_increment |
| Articulo      | varchar(50) | NO   |     | NULL    |                |
| Fecha         | date        | NO   |     | NULL    |                |
| Cantidad      | int         | NO   |     | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+
4 rows in set (0,00 sec)
```

En la tabla clonada no se copian los índices ni la clave primaria de la tabla original, así como la propiedad autoincremental.

- Utilizando EXPLAIN observa el plan de ejecución de la consulta que devuelve toda la información de los movimientos con identificador=3. Tanto en la tabla MOVIMIENTOS como en la tabla MOVIMIENTOS_bis. Escribe tus conclusiones al respecto.

```sql
Explain select identificador from MOVIMIENTO where identificador = 3;
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra       |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | Using index |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)


Explain select identificador from MOVIMIENTO_BIS where identificador = 3;
+----+-------------+----------------+------------+------+------------------+------------------+---------+-------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys    | key              | key_len | ref   | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+------------------+------------------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_IDENTIFICADOR | IX_IDENTIFICADOR | 4       | const |    1 |   100.00 | Using index |
+----+-------------+----------------+------------+------+------------------+------------------+---------+-------+------+----------+-------------+
1 row in set, 1 warning (0,01 sec)

```

En la consulta de la tabla de MOVIMIENTO se está itul
- Supongamos que las consultas de rango que se van a hacer en nuestra tabla son frecuentes y además no por el identificador, sino por la fecha. Este es motivo suficiente para que sea la fecha un índice de tabla y así mejorar el tiempo de respuesta de nuestras consultas.
En la tabla MOVIMIENTO_BIS creamos un índice para la fecha (IX_FECHA_BIS) y otro índice para el identificador (IX_IDENTIFICADOR).

```sql

create index IX_FECHA_BIS on MOVIMIENTO_BIS(Fecha);
Query OK, 0 rows affected (0,12 sec)
Records: 0  Duplicates: 0  Warnings: 0

create index IX_IDENTIFICADOR ON MOVIMIENTO_BIS(Identificador);
Query OK, 0 rows affected (0,18 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

- 8.- Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:
Consulta1

```sql
explain select * from MOVIMIENTO where identificador=3;
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra       |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | Using index |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)
```

Consulta 2

```sql
explain select identificador from MOVIMIENTO_BIS where identificador=3;
+----+-------------+----------------+------------+------+------------------+------------------+---------+-------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys    | key              | key_len | ref   | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+------------------+------------------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_IDENTIFICADOR | IX_IDENTIFICADOR | 4       | const |    1 |   100.00 | Using index |
+----+-------------+----------------+------------+------+------------------+------------------+---------+-------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)
```

Fíjata en que en la consulta 1 pedimos todos los campos. ¿A través de que indice se busca? ¿Por qué crees que lo hace así?
En la consulta 2 solo pedimos el identificador. ¿A través de que índice busca? ¿Por qué crees que lo hace así? Analiza la ejecución.

- Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:

Consulta 1:

```sql
explain SELECT fecha FROM MOVIMIENTO WHERE Fecha BETWEEN 01/01/2012 and 01/03/2012;
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3583 |    10.00 | Using where |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)
```

Consulta 2

```sql
explain SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN 01/01/2012 and 01/03/2012;
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
| id | select_type | table          | partitions | type | possible_keys | key          | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_FECHA_BIS  | IX_FECHA_BIS | 3       | const |    1 |   100.00 | NULL  |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0,00 sec)
```

Fijate que en la consulta 2 pedimos todos los campos. ¿A través de que índice busca? ¿Por qué crees que lo hace así?
En la consulta 1 solo pedimos la fecha. ¿A través de que índice busca? ¿Por qué crees que lo hace así? Analiza la ejecución.

- Vamos a crear un índice por fecha (IX_FECHA) en la tabla MOVIMIENTO, puesto que no lo tenía, en este caso la tabla ya tenía un indice, la clave primaria.
- Visualiza los indices de las tablas MOVIMIENTO y MOVIMIENTO_BIS.
- - Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:

```sql
create index IX_FECHA on MOVIMIENTO(Fecha);

show index from MOVIMIENTO;
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| MOVIMIENTO |          0 | PRIMARY  |            1 | Identificador | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| MOVIMIENTO |          1 | IX_FECHA |            1 | Fecha         | A         |         120 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0,01 sec)

show index from MOVIMIENTO_BIS;
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table          | Non_unique | Key_name         | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| MOVIMIENTO_BIS |          1 | IX_FECHA_BIS     |            1 | Fecha         | A         |         120 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| MOVIMIENTO_BIS |          1 | IX_IDENTIFICADOR |            1 | Identificador | A         |        3583 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0,01 sec)
```

Consulta 1:

```sql
explain SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key      | key_len | ref   | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ref  | IX_FECHA      | IX_FECHA | 3       | const |    1 |   100.00 | Using index |
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)
```

Consulta 2:

```sql
explain SELECT * FROM MOVIMIENTO WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type | possible_keys | key      | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ref  | IX_FECHA      | IX_FECHA | 3       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0,00 sec)
```

Consulta 3:

```sql
explain SELECT fecha FROM MOVIMIENTO_BIS WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key          | key_len | ref   | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_FECHA_BIS  | IX_FECHA_BIS | 3       | const |    1 |   100.00 | Using index |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)
```

Consulta 4:

```sql
explain SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
| id | select_type | table          | partitions | type | possible_keys | key          | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_FECHA_BIS  | IX_FECHA_BIS | 3       | const |    1 |   100.00 | NULL  |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0,00 sec)
```

</div>