<div align="justify">

# Tarea 1 de trabajo con índices

<div align="center">
<img src="https://hoplasoftware.com/wp-content/uploads/2021/07/1024px-MySQL.ff87215b43fd7292af172e2a5d9b844217262571.png" width=600/>
</div>

Un instituto de enseñanza guarda los siguientes datos de sus alumnos:
 - número de inscripción, comienza desde 1 cada año,
 - año de inscripción,
 - nombre del alumno,
 - documento del alumno,
 - domicilio,
 - ciudad,
 - provincia,
 - clave primaria: número de inscripto y año de inscripción.

Se pide: 
- Elimine la tabla "alumno" si existe. 

```sql
drop table if exists alumno;
```

- Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de 
inscripción).

```sql
CREATE DATABASE IF NOT EXISTS tarea1;

USE tarea1

CREATE TABLE alumnos(
numero_inscripcion int auto_increment,
anio_inscripcion int,
nombre varchar(50),
dni varchar(10),
domicilio varchar(50),
ciudad varchar(50),
provincia varchar(50),
primary key (numero_inscripcion, anio_inscripcion)
);

describe alumnos;

+--------------------+-------------+------+-----+---------+----------------+
| Field              | Type        | Null | Key | Default | Extra          |
+--------------------+-------------+------+-----+---------+----------------+
| numero_inscripcion | int         | NO   | PRI | NULL    | auto_increment |
| anio_inscripcion   | int         | NO   | PRI | NULL    |                |
| nombre             | varchar(50) | YES  |     | NULL    |                |
| dni                | varchar(10) | YES  | UNI | NULL    |                |
| domicilio          | varchar(50) | YES  |     | NULL    |                |
| ciudad             | varchar(50) | YES  |     | NULL    |                |
| provincia          | varchar(50) | YES  |     | NULL    |                |
+--------------------+-------------+------+-----+---------+----------------+
```

- Define los siguientes indices:
   - Un índice único por el campo "documento" y un índice común por ciudad y provincia.

  ```sql
  CREATE UNIQUE INDEX idx_dni ON alumnos (dni);
  Query OK, 0 rows affected (0,02 sec)
  Records: 0  Duplicates: 0  Warnings: 0

  CREATE INDEX idx_ciudad_prov ON alumnos(ciudad, provincia);
  Query OK, 0 rows affected (0,02 sec)
  Records: 0  Duplicates: 0  Warnings: 0
  ```
  
    - Vea los índices de la tabla.

  ```sql
  show index from alumnos;
  +---------+------------+-----------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
  | Table   | Non_unique | Key_name        | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
  +---------+------------+-----------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
  | alumnos |          0 | PRIMARY         |            1 | numero_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
  | alumnos |          0 | PRIMARY         |            2 | anio_inscripcion   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
  | alumnos |          0 | idx_dni         |            1 | dni                | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
  | alumnos |          1 | idx_ciudad_prov |            1 | ciudad             | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
  | alumnos |          1 | idx_ciudad_prov |            2 | provincia          | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
  +---------+------------+-----------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
  5 rows in set (0,02 sec)
  ```

- Intente ingresar un alumno con clave primaria repetida.

```sql
insert into alumnos (numero_inscripcion, anio_inscripcion, nombre) values (1, 2024, "lili");
ERROR 1062 (23000): Duplicate entry '1-2024' for key 'alumnos.PRIMARY'
```

- Intente ingresar un alumno con documento repetido.

```sql
insert into alumnos (numero_inscripcion, anio_inscripcion, nombre, dni) values (2, 2024, "sara", "123456789A");
ERROR 1062 (23000): Duplicate entry '123456789A' for key 'alumnos.idx_doc'
```

- Ingrese varios alumnos de la misma ciudad y provincia.

```sql
insert into alumnos (numero_inscripcion, anio_inscripcion, nombre, ciudad, provincia) values (3, 2022, "jaime", "santa cruz", "santa cruz"), (4, 2023, "lira", "santa cruz", "santa cruz"), (5, 2023, "lucia",  "santa cruz", "santa cruz");
Query OK, 3 rows affected (0,01 sec)
Records: 3  Duplicates: 0  Warnings: 0
```

- Elimina los indices creados, y muestra que ya no se encuentran.

```sql
DROP INDEX idx_dni ON alumnos;

DROP INDEX idx_ciudad_prov ON alumnos;

show index from alumnos;
+---------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumnos |          0 | PRIMARY  |            1 | numero_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumnos |          0 | PRIMARY  |            2 | anio_inscripcion   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+---------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```

</div>
