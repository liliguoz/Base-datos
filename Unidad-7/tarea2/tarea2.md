<div align="justify">

# Tarea 2 de trabajo con índices

<div align="center">
<img src="https://hoplasoftware.com/wp-content/uploads/2021/07/1024px-MySQL.ff87215b43fd7292af172e2a5d9b844217262571.png" width=600/>
</div>

Una empresa guarda los siguientes datos de sus clientes, con los siguientes campos:
- documento char (8) not null,
- nombre varchar(30) not null,
- domicilio varchar(30),
- ciudad varchar(20),
- provincia varchar (20),
- telefono varchar(11)

Se pide: 
- Elimine la tabla "cliente" si existe. 

```sql
drop table if exists cliente;
```

- Cree la tabla si clave primaria y incluye a posteriori esta.

```sql
CREATE DATABASE IF NOT EXISTS tarea2;
Query OK, 1 row affected, 1 warning (0,00 sec)
¡
USE tarea2; 

CREATE TABLE cliente (
    documento char(8) not null,
    nombre varchar(30) not null,
    domicilio varchar(30),
    ciudad varchar(20),
    provincia varchar (20),
    telefono varchar(11)
);
Query OK, 0 rows affected (0,02 sec)

ALTER TABLE cliente MODIFY documento char(8) NOT NULL, ADD PRIMARY KEY(documento);
Query OK, 0 rows affected (0,06 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

- Define los siguientes indices:
   - Un índice único por el campo "documento" y un índice común por ciudad y provincia.

```sql
CREATE UNIQUE INDEX idx_doc ON cliente(documento);
Query OK, 0 rows affected (0,03 sec)
Records: 0  Duplicates: 0  Warnings: 0

CREATE INDEX idx_ciu_prov ON cliente(ciudad, provincia);
Query OK, 0 rows affected (0,03 sec)
Records: 0  Duplicates: 0  Warnings: 0
```
   Se ha utilizado en priemr ligar el la sentencia de unique index porque solo se requiere de un único indice, sin embargo, la ciudad y la provincia pueden repetirse y por tanto debe ser un index (non-unique).
   
   - Vea los índices de la tabla.

```sql
show index from cliente;

+---------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name     | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| cliente |          0 | PRIMARY      |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          0 | idx_doc      |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | idx_ciu_prov |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | idx_ciu_prov |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+---------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```

- Agregue un índice único por el campo "telefono".

```sql
CREATE UNIQUE INDEX idx_tlf on cliente (telefono);
Query OK, 0 rows affected (0,03 sec)
Records: 0  Duplicates: 0  Warnings: 0

show index from cliente;
+---------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name     | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| cliente |          0 | PRIMARY      |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          0 | idx_doc      |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          0 | idx_tlf      |            1 | telefono    | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | idx_ciu_prov |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | idx_ciu_prov |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+---------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```
- Elimina los índices.

```
drop index idx_doc on cliente;

drop index idx_tlf on cliente;

drop index idx_ciu_prov on cliente;

show index from cliente;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| cliente |          0 | PRIMARY  |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```
    

</div>