<h1 align="center"> TAREA 2 MYSQL </h1>

<div align="center">
<img src="https://cdn.clever-cloud.com/uploads/2023/03/mysql.svg" width="500" />
</div>

___

```sql
CREATE DATABASE IF NOT EXISTS tarea2;
```

```sql
USE tarea2;
```

```sql
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(50)
);
```

```sql
INSERT INTO clientes (nombre, direccion) VALUES
    ('Cliente 1', 'Dirección 1'),
    ('Cliente 2', 'Dirección 2'),
    ('Cliente 3', 'Dirección 3'),
    ('Cliente 4', 'Dirección 4'),
    ('Cliente 5', 'Dirección 5'),
    ('Cliente 6', 'Dirección 6'),
    ('Cliente 7', 'Dirección 7'),
    ('Cliente 8', 'Dirección 8'),
    ('Cliente 9', 'Dirección 9'),
    ('Cliente 10', 'Dirección 10'),
    ('Cliente 11', 'Dirección 11'),
    ('Cliente 12', 'Dirección 12'),
    ('Cliente 13', 'Dirección 13'),
    ('Cliente 14', 'Dirección 14'),
    ('Cliente 15', 'Dirección 15'),
    ('Cliente 16', 'Dirección 16'),
    ('Cliente 17', 'Dirección 17'),
    ('Cliente 18', 'Dirección 18'),
    ('Cliente 19', 'Dirección 19'),
    ('Cliente 20', 'Dirección 20');
```

```sql
CREATE TABLE IF NOT EXISTS productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL
);
```

```sql
INSERT INTO productos (nombre, precio) VALUES
    ('Producto 1', 10.99),
    ('Producto 2', 20.50),
    ('Producto 3', 30.99),
    ('Producto 4', 40.50),
    ('Producto 5', 50.99),
    ('Producto 6', 60.50),
    ('Producto 7', 70.99),
    ('Producto 8', 80.50),
    ('Producto 9', 90.99),
    ('Producto 10', 100.50),
    ('Producto 11', 110.99),
    ('Producto 12', 120.50),
    ('Producto 13', 130.99),
    ('Producto 14', 140.50),
    ('Producto 15', 150.99),
    ('Producto 16', 160.50),
    ('Producto 17', 170.99),
    ('Producto 18', 180.50),
    ('Producto 19', 190.99),
    ('Producto 20', 200.50);
```

```sql
CREATE TABLE IF NOT EXISTS ordenes (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
```

```sql
INSERT INTO ordenes (id_cliente, id_producto, cantidad) VALUES
    (1, 1, 2),
    (2, 2, 1),
    (3, 3, 3),
    (4, 4, 2),
    (5, 5, 1),
    (6, 6, 2),
    (7, 7, 3),
    (8, 8, 2),
    (9, 9, 1),
    (10, 10, 2),
    (11, 11, 3),
    (12, 12, 2),
    (13, 13, 1),
    (14, 14, 2),
    (15, 15, 3),
    (16, 16, 2),
    (17, 17, 1),
    (18, 18, 2),
    (19, 19, 3),
    (20, 20, 2);
```

### Realiza la migración a MySql y realiza las siguientes consultas:

#### Consultas simples:
1. Mostrar todos los clientes.

```sql
 select * from clientes;
+------------+------------+---------------+
| id_cliente | nombre     | direccion     |
+------------+------------+---------------+
|          1 | Cliente 1  | Dirección 1   |
|          2 | Cliente 2  | Dirección 2   |
|          3 | Cliente 3  | Dirección 3   |
|          4 | Cliente 4  | Dirección 4   |
|          5 | Cliente 5  | Dirección 5   |
|          6 | Cliente 6  | Dirección 6   |
|          7 | Cliente 7  | Dirección 7   |
|          8 | Cliente 8  | Dirección 8   |
|          9 | Cliente 9  | Dirección 9   |
|         10 | Cliente 10 | Dirección 10  |
|         11 | Cliente 11 | Dirección 11  |
|         12 | Cliente 12 | Dirección 12  |
|         13 | Cliente 13 | Dirección 13  |
|         14 | Cliente 14 | Dirección 14  |
|         15 | Cliente 15 | Dirección 15  |
|         16 | Cliente 16 | Dirección 16  |
|         17 | Cliente 17 | Dirección 17  |
|         18 | Cliente 18 | Dirección 18  |
|         19 | Cliente 19 | Dirección 19  |
|         20 | Cliente 20 | Dirección 20  |
+------------+------------+---------------+
```

2. Mostrar todos los productos.

```sql
select * from productos;
+-------------+-------------+--------+
| id_producto | nombre      | precio |
+-------------+-------------+--------+
|           1 | Producto 1  |     11 |
|           2 | Producto 2  |     21 |
|           3 | Producto 3  |     31 |
|           4 | Producto 4  |     41 |
|           5 | Producto 5  |     51 |
|           6 | Producto 6  |     61 |
|           7 | Producto 7  |     71 |
|           8 | Producto 8  |     81 |
|           9 | Producto 9  |     91 |
|          10 | Producto 10 |    101 |
|          11 | Producto 11 |    111 |
|          12 | Producto 12 |    121 |
|          13 | Producto 13 |    131 |
|          14 | Producto 14 |    141 |
|          15 | Producto 15 |    151 |
|          16 | Producto 16 |    161 |
|          17 | Producto 17 |    171 |
|          18 | Producto 18 |    181 |
|          19 | Producto 19 |    191 |
|          20 | Producto 20 |    201 |
+-------------+-------------+--------+
```

3. Mostrar todas las órdenes.

```sql
select * from ordenes;
+----------+------------+-------------+----------+
| id_orden | id_cliente | id_producto | cantidad |
+----------+------------+-------------+----------+
|        1 |          1 |           1 |        2 |
|        2 |          2 |           2 |        1 |
|        3 |          3 |           3 |        3 |
|        4 |          4 |           4 |        2 |
|        5 |          5 |           5 |        1 |
|        6 |          6 |           6 |        2 |
|        7 |          7 |           7 |        3 |
|        8 |          8 |           8 |        2 |
|        9 |          9 |           9 |        1 |
|       10 |         10 |          10 |        2 |
|       11 |         11 |          11 |        3 |
|       12 |         12 |          12 |        2 |
|       13 |         13 |          13 |        1 |
|       14 |         14 |          14 |        2 |
|       15 |         15 |          15 |        3 |
|       16 |         16 |          16 |        2 |
|       17 |         17 |          17 |        1 |
|       18 |         18 |          18 |        2 |
|       19 |         19 |          19 |        3 |
|       20 |         20 |          20 |        2 |
+----------+------------+-------------+----------+
```
4. Mostrar los primeros 5 clientes ordenados por nombre.

```sql
select * from clientes order by nombre asc limit 5;
+------------+------------+---------------+
| id_cliente | nombre     | direccion     |
+------------+------------+---------------+
|          1 | Cliente 1  | Dirección 1   |
|         10 | Cliente 10 | Dirección 10  |
|         11 | Cliente 11 | Dirección 11  |
|         12 | Cliente 12 | Dirección 12  |
|         13 | Cliente 13 | Dirección 13  |
+------------+------------+---------------+
```

5. Mostrar los productos con un precio mayor a 50.

```sql
select * from productos where precio > 50;
+-------------+-------------+--------+
| id_producto | nombre      | precio |
+-------------+-------------+--------+
|           5 | Producto 5  |     51 |
|           6 | Producto 6  |     61 |
|           7 | Producto 7  |     71 |
|           8 | Producto 8  |     81 |
|           9 | Producto 9  |     91 |
|          10 | Producto 10 |    101 |
|          11 | Producto 11 |    111 |
|          12 | Producto 12 |    121 |
|          13 | Producto 13 |    131 |
|          14 | Producto 14 |    141 |
|          15 | Producto 15 |    151 |
|          16 | Producto 16 |    161 |
|          17 | Producto 17 |    171 |
|          18 | Producto 18 |    181 |
|          19 | Producto 19 |    191 |
|          20 | Producto 20 |    201 |
+-------------+-------------+--------+
```

6. Mostrar todas las órdenes realizadas por el cliente con ID 1.

```sql
select * from ordenes where id_cliente = 1;
+----------+------------+-------------+----------+
| id_orden | id_cliente | id_producto | cantidad |
+----------+------------+-------------+----------+
|        1 |          1 |           1 |        2 |
+----------+------------+-------------+----------+
```

7. Mostrar los clientes cuyos nombres comienzan con la letra "M".

```sql
select * from clientes where nombre regexp '^M';
Empty set (0,01 sec)
```

8. Mostrar las órdenes que contienen más de 2 productos.

```sql
select * from ordenes where cantidad > 2;
+----------+------------+-------------+----------+
| id_orden | id_cliente | id_producto | cantidad |
+----------+------------+-------------+----------+
|        3 |          3 |           3 |        3 |
|        7 |          7 |           7 |        3 |
|       11 |         11 |          11 |        3 |
|       15 |         15 |          15 |        3 |
|       19 |         19 |          19 |        3 |
+----------+------------+-------------+----------+
```

9. Mostrar los productos ordenados por precio de forma descendente.

```sql
select * from productos order by precio desc;
+-------------+-------------+--------+
| id_producto | nombre      | precio |
+-------------+-------------+--------+
|          20 | Producto 20 |    201 |
|          19 | Producto 19 |    191 |
|          18 | Producto 18 |    181 |
|          17 | Producto 17 |    171 |
|          16 | Producto 16 |    161 |
|          15 | Producto 15 |    151 |
|          14 | Producto 14 |    141 |
|          13 | Producto 13 |    131 |
|          12 | Producto 12 |    121 |
|          11 | Producto 11 |    111 |
|          10 | Producto 10 |    101 |
|           9 | Producto 9  |     91 |
|           8 | Producto 8  |     81 |
|           7 | Producto 7  |     71 |
|           6 | Producto 6  |     61 |
|           5 | Producto 5  |     51 |
|           4 | Producto 4  |     41 |
|           3 | Producto 3  |     31 |
|           2 | Producto 2  |     21 |
|           1 | Producto 1  |     11 |
+-------------+-------------+--------+
```

#### Consultas de ejemplo para practicar joins

1. Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes

```sql
select c.* , o.* from clientes c left join ordenes o on c.id_cliente=o.id_cliente;
+------------+------------+---------------+----------+------------+-------------+----------+
| id_cliente | nombre     | direccion     | id_orden | id_cliente | id_producto | cantidad |
+------------+------------+---------------+----------+------------+-------------+----------+
|          1 | Cliente 1  | Dirección 1   |        1 |          1 |           1 |        2 |
|          2 | Cliente 2  | Dirección 2   |        2 |          2 |           2 |        1 |
|          3 | Cliente 3  | Dirección 3   |        3 |          3 |           3 |        3 |
|          4 | Cliente 4  | Dirección 4   |        4 |          4 |           4 |        2 |
|          5 | Cliente 5  | Dirección 5   |        5 |          5 |           5 |        1 |
|          6 | Cliente 6  | Dirección 6   |        6 |          6 |           6 |        2 |
|          7 | Cliente 7  | Dirección 7   |        7 |          7 |           7 |        3 |
|          8 | Cliente 8  | Dirección 8   |        8 |          8 |           8 |        2 |
|          9 | Cliente 9  | Dirección 9   |        9 |          9 |           9 |        1 |
|         10 | Cliente 10 | Dirección 10  |       10 |         10 |          10 |        2 |
|         11 | Cliente 11 | Dirección 11  |       11 |         11 |          11 |        3 |
|         12 | Cliente 12 | Dirección 12  |       12 |         12 |          12 |        2 |
|         13 | Cliente 13 | Dirección 13  |       13 |         13 |          13 |        1 |
|         14 | Cliente 14 | Dirección 14  |       14 |         14 |          14 |        2 |
|         15 | Cliente 15 | Dirección 15  |       15 |         15 |          15 |        3 |
|         16 | Cliente 16 | Dirección 16  |       16 |         16 |          16 |        2 |
|         17 | Cliente 17 | Dirección 17  |       17 |         17 |          17 |        1 |
|         18 | Cliente 18 | Dirección 18  |       18 |         18 |          18 |        2 |
|         19 | Cliente 19 | Dirección 19  |       19 |         19 |          19 |        3 |
|         20 | Cliente 20 | Dirección 20  |       20 |         20 |          20 |        2 |
+------------+------------+---------------+----------+------------+-------------+----------+
```
2. Seleccionar todas las órdenes junto con los productos correspondientes

```sql
select o.*, p.* from ordenes o inner join productos p on o.id_producto=p.id_producto;
+----------+------------+-------------+----------+-------------+-------------+--------+
| id_orden | id_cliente | id_producto | cantidad | id_producto | nombre      | precio |
+----------+------------+-------------+----------+-------------+-------------+--------+
|        1 |          1 |           1 |        2 |           1 | Producto 1  |     11 |
|        2 |          2 |           2 |        1 |           2 | Producto 2  |     21 |
|        3 |          3 |           3 |        3 |           3 | Producto 3  |     31 |
|        4 |          4 |           4 |        2 |           4 | Producto 4  |     41 |
|        5 |          5 |           5 |        1 |           5 | Producto 5  |     51 |
|        6 |          6 |           6 |        2 |           6 | Producto 6  |     61 |
|        7 |          7 |           7 |        3 |           7 | Producto 7  |     71 |
|        8 |          8 |           8 |        2 |           8 | Producto 8  |     81 |
|        9 |          9 |           9 |        1 |           9 | Producto 9  |     91 |
|       10 |         10 |          10 |        2 |          10 | Producto 10 |    101 |
|       11 |         11 |          11 |        3 |          11 | Producto 11 |    111 |
|       12 |         12 |          12 |        2 |          12 | Producto 12 |    121 |
|       13 |         13 |          13 |        1 |          13 | Producto 13 |    131 |
|       14 |         14 |          14 |        2 |          14 | Producto 14 |    141 |
|       15 |         15 |          15 |        3 |          15 | Producto 15 |    151 |
|       16 |         16 |          16 |        2 |          16 | Producto 16 |    161 |
|       17 |         17 |          17 |        1 |          17 | Producto 17 |    171 |
|       18 |         18 |          18 |        2 |          18 | Producto 18 |    181 |
|       19 |         19 |          19 |        3 |          19 | Producto 19 |    191 |
|       20 |         20 |          20 |        2 |          20 | Producto 20 |    201 |
+----------+------------+-------------+----------+-------------+-------------+--------+
```

3. Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50

```sql
select c.nombre, p.precio from clientes c inner join ordenes o on c.id_cliente=o.id_cliente
inner join productos p on o.id_producto=p.id_producto where p.precio > 50;
+------------+--------+
| nombre     | precio |
+------------+--------+
| Cliente 5  |     51 |
| Cliente 6  |     61 |
| Cliente 7  |     71 |
| Cliente 8  |     81 |
| Cliente 9  |     91 |
| Cliente 10 |    101 |
| Cliente 11 |    111 |
| Cliente 12 |    121 |
| Cliente 13 |    131 |
| Cliente 14 |    141 |
| Cliente 15 |    151 |
| Cliente 16 |    161 |
| Cliente 17 |    171 |
| Cliente 18 |    181 |
| Cliente 19 |    191 |
| Cliente 20 |    201 |
+------------+--------+
```

4. Obtener el nombre de los productos que no se han ordenado aún

```sql
select p.nombre
from productos p
LEFT JOIN ordenes o on p.id_producto = o.id_producto
where o.id_producto IS NULL;
Empty set (0,00 sec)
```

5. Mostrar el nombre del cliente, el producto y la cantidad para todas las órdenes

```sql
select c.nombre, p.nombre, o.cantidad from clientes c
inner join ordenes o on c.id_cliente=o.id_cliente
inner join productos p on p.id_producto=o.id_producto;
+------------+-------------+----------+
| nombre     | nombre      | cantidad |
+------------+-------------+----------+
| Cliente 1  | Producto 1  |        2 |
| Cliente 2  | Producto 2  |        1 |
| Cliente 3  | Producto 3  |        3 |
| Cliente 4  | Producto 4  |        2 |
| Cliente 5  | Producto 5  |        1 |
| Cliente 6  | Producto 6  |        2 |
| Cliente 7  | Producto 7  |        3 |
| Cliente 8  | Producto 8  |        2 |
| Cliente 9  | Producto 9  |        1 |
| Cliente 10 | Producto 10 |        2 |
| Cliente 11 | Producto 11 |        3 |
| Cliente 12 | Producto 12 |        2 |
| Cliente 13 | Producto 13 |        1 |
| Cliente 14 | Producto 14 |        2 |
| Cliente 15 | Producto 15 |        3 |
| Cliente 16 | Producto 16 |        2 |
| Cliente 17 | Producto 17 |        1 |
| Cliente 18 | Producto 18 |        2 |
| Cliente 19 | Producto 19 |        3 |
| Cliente 20 | Producto 20 |        2 |
+------------+-------------+----------+
```

6. Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos

```sql
select p.nombre, c.nombre from productos p
INNER JOIN ordenes o ON p.id_producto = o.id_producto
INNER JOIN clientes c ON o.id_cliente = c.id_cliente;
+-------------+------------+
| nombre      | nombre     |
+-------------+------------+
| Producto 1  | Cliente 1  |
| Producto 2  | Cliente 2  |
| Producto 3  | Cliente 3  |
| Producto 4  | Cliente 4  |
| Producto 5  | Cliente 5  |
| Producto 6  | Cliente 6  |
| Producto 7  | Cliente 7  |
| Producto 8  | Cliente 8  |
| Producto 9  | Cliente 9  |
| Producto 10 | Cliente 10 |
| Producto 11 | Cliente 11 |
| Producto 12 | Cliente 12 |
| Producto 13 | Cliente 13 |
| Producto 14 | Cliente 14 |
| Producto 15 | Cliente 15 |
| Producto 16 | Cliente 16 |
| Producto 17 | Cliente 17 |
| Producto 18 | Cliente 18 |
| Producto 19 | Cliente 19 |
| Producto 20 | Cliente 20 |
+-------------+------------+
```

7. Mostrar todas las órdenes con sus clientes y productos, incluso si no hay órdenes

```sql
select c.nombre, p.nombre from clientes c
LEFT JOIN ordenes o ON c.id_cliente = o.id_cliente
INNER JOIN productos p ON o.id_producto = p.id_producto;
+------------+-------------+
| nombre     | nombre      |
+------------+-------------+
| Cliente 1  | Producto 1  |
| Cliente 2  | Producto 2  |
| Cliente 3  | Producto 3  |
| Cliente 4  | Producto 4  |
| Cliente 5  | Producto 5  |
| Cliente 6  | Producto 6  |
| Cliente 7  | Producto 7  |
| Cliente 8  | Producto 8  |
| Cliente 9  | Producto 9  |
| Cliente 10 | Producto 10 |
| Cliente 11 | Producto 11 |
| Cliente 12 | Producto 12 |
| Cliente 13 | Producto 13 |
| Cliente 14 | Producto 14 |
| Cliente 15 | Producto 15 |
| Cliente 16 | Producto 16 |
| Cliente 17 | Producto 17 |
| Cliente 18 | Producto 18 |
| Cliente 19 | Producto 19 |
| Cliente 20 | Producto 20 |
+------------+-------------+
```

8. Obtener el nombre de los clientes junto con el número total de órdenes que han realizado

```sql
select c.nombre, COUNT(o.id_orden) AS total_ordenes from clientes c
LEFT JOIN ordenes o ON c.id_cliente = o.id_cliente
GROUP BY c.nombre;
+------------+---------------+
| nombre     | total_ordenes |
+------------+---------------+
| Cliente 1  |             1 |
| Cliente 2  |             1 |
| Cliente 3  |             1 |
| Cliente 4  |             1 |
| Cliente 5  |             1 |
| Cliente 6  |             1 |
| Cliente 7  |             1 |
| Cliente 8  |             1 |
| Cliente 9  |             1 |
| Cliente 10 |             1 |
| Cliente 11 |             1 |
| Cliente 12 |             1 |
| Cliente 13 |             1 |
| Cliente 14 |             1 |
| Cliente 15 |             1 |
| Cliente 16 |             1 |
| Cliente 17 |             1 |
| Cliente 18 |             1 |
| Cliente 19 |             1 |
| Cliente 20 |             1 |
+------------+---------------+
```

9. Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto

```sql
select c.nombre, p.nombre from ordenes o
INNER JOIN clientes c ON o.id_cliente = c.id_cliente
INNER JOIN productos p ON o.id_producto = p.id_producto;
+------------+-------------+
| nombre     | nombre      |
+------------+-------------+
| Cliente 1  | Producto 1  |
| Cliente 2  | Producto 2  |
| Cliente 3  | Producto 3  |
| Cliente 4  | Producto 4  |
| Cliente 5  | Producto 5  |
| Cliente 6  | Producto 6  |
| Cliente 7  | Producto 7  |
| Cliente 8  | Producto 8  |
| Cliente 9  | Producto 9  |
| Cliente 10 | Producto 10 |
| Cliente 11 | Producto 11 |
| Cliente 12 | Producto 12 |
| Cliente 13 | Producto 13 |
| Cliente 14 | Producto 14 |
| Cliente 15 | Producto 15 |
| Cliente 16 | Producto 16 |
| Cliente 17 | Producto 17 |
| Cliente 18 | Producto 18 |
| Cliente 19 | Producto 19 |
| Cliente 20 | Producto 20 |
+------------+-------------+
```

10. Mostrar todas las órdenes con sus productos y clientes, incluso si no hay información de cliente.

```sql
select c.nombre, p.nombre from ordenes o
LEFT JOIN clientes c ON o.id_cliente = c.id_cliente
INNER JOIN productos p ON o.id_producto = p.id_producto;
+------------+-------------+
| nombre     | nombre      |
+------------+-------------+
| Cliente 1  | Producto 1  |
| Cliente 2  | Producto 2  |
| Cliente 3  | Producto 3  |
| Cliente 4  | Producto 4  |
| Cliente 5  | Producto 5  |
| Cliente 6  | Producto 6  |
| Cliente 7  | Producto 7  |
| Cliente 8  | Producto 8  |
| Cliente 9  | Producto 9  |
| Cliente 10 | Producto 10 |
| Cliente 11 | Producto 11 |
| Cliente 12 | Producto 12 |
| Cliente 13 | Producto 13 |
| Cliente 14 | Producto 14 |
| Cliente 15 | Producto 15 |
| Cliente 16 | Producto 16 |
| Cliente 17 | Producto 17 |
| Cliente 18 | Producto 18 |
| Cliente 19 | Producto 19 |
| Cliente 20 | Producto 20 |
+------------+-------------+
```

11. Obtener el nombre de los productos junto con el nombre de los clientes que han realizado órdenes de esos productos, incluyendo los productos que no han sido ordenados

```sql
select p.nombre, c.nombre from productos p
LEFT JOIN ordenes o ON p.id_producto = o.id_producto
LEFT JOIN clientes c ON o.id_cliente = c.id_cliente;
+-------------+------------+
| nombre      | nombre     |
+-------------+------------+
| Producto 1  | Cliente 1  |
| Producto 2  | Cliente 2  |
| Producto 3  | Cliente 3  |
| Producto 4  | Cliente 4  |
| Producto 5  | Cliente 5  |
| Producto 6  | Cliente 6  |
| Producto 7  | Cliente 7  |
| Producto 8  | Cliente 8  |
| Producto 9  | Cliente 9  |
| Producto 10 | Cliente 10 |
| Producto 11 | Cliente 11 |
| Producto 12 | Cliente 12 |
| Producto 13 | Cliente 13 |
| Producto 14 | Cliente 14 |
| Producto 15 | Cliente 15 |
| Producto 16 | Cliente 16 |
| Producto 17 | Cliente 17 |
| Producto 18 | Cliente 18 |
| Producto 19 | Cliente 19 |
| Producto 20 | Cliente 20 |
+-------------+------------+
```

12. Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto, incluyendo las órdenes sin productosç

```sql
select o.*, c.nombre, p.nombre from ordenes o
LEFT JOIN clientes c ON o.id_cliente = c.id_cliente
INNER JOIN productos p ON o.id_producto = p.id_producto;
+----------+------------+-------------+----------+------------+-------------+
| id_orden | id_cliente | id_producto | cantidad | nombre     | nombre      |
+----------+------------+-------------+----------+------------+-------------+
|        1 |          1 |           1 |        2 | Cliente 1  | Producto 1  |
|        2 |          2 |           2 |        1 | Cliente 2  | Producto 2  |
|        3 |          3 |           3 |        3 | Cliente 3  | Producto 3  |
|        4 |          4 |           4 |        2 | Cliente 4  | Producto 4  |
|        5 |          5 |           5 |        1 | Cliente 5  | Producto 5  |
|        6 |          6 |           6 |        2 | Cliente 6  | Producto 6  |
|        7 |          7 |           7 |        3 | Cliente 7  | Producto 7  |
|        8 |          8 |           8 |        2 | Cliente 8  | Producto 8  |
|        9 |          9 |           9 |        1 | Cliente 9  | Producto 9  |
|       10 |         10 |          10 |        2 | Cliente 10 | Producto 10 |
|       11 |         11 |          11 |        3 | Cliente 11 | Producto 11 |
|       12 |         12 |          12 |        2 | Cliente 12 | Producto 12 |
|       13 |         13 |          13 |        1 | Cliente 13 | Producto 13 |
|       14 |         14 |          14 |        2 | Cliente 14 | Producto 14 |
|       15 |         15 |          15 |        3 | Cliente 15 | Producto 15 |
|       16 |         16 |          16 |        2 | Cliente 16 | Producto 16 |
|       17 |         17 |          17 |        1 | Cliente 17 | Producto 17 |
|       18 |         18 |          18 |        2 | Cliente 18 | Producto 18 |
|       19 |         19 |          19 |        3 | Cliente 19 | Producto 19 |
|       20 |         20 |          20 |        2 | Cliente 20 | Producto 20 |
+----------+------------+-------------+----------+------------+-------------+
```

13. Obtener el nombre de los clientes junto con el número total de órdenes que han realizado, incluyendo los clientes que no han realizado órdenes.

```sql
select c.nombre, COUNT(o.id_orden) AS total_ordenes from clientes c
LEFT JOIN ordenes o ON c.id_cliente = o.id_cliente
GROUP BY c.nombre;
+------------+---------------+
| nombre     | total_ordenes |
+------------+---------------+
| Cliente 1  |             1 |
| Cliente 2  |             1 |
| Cliente 3  |             1 |
| Cliente 4  |             1 |
| Cliente 5  |             1 |
| Cliente 6  |             1 |
| Cliente 7  |             1 |
| Cliente 8  |             1 |
| Cliente 9  |             1 |
| Cliente 10 |             1 |
| Cliente 11 |             1 |
| Cliente 12 |             1 |
| Cliente 13 |             1 |
| Cliente 14 |             1 |
| Cliente 15 |             1 |
| Cliente 16 |             1 |
| Cliente 17 |             1 |
| Cliente 18 |             1 |
| Cliente 19 |             1 |
| Cliente 20 |             1 |
+------------+---------------+
```

14. Mostrar todas las órdenes con sus clientes y productos, incluyendo las órdenes y productos que no tienen información.

```sql
select * from ordenes o
LEFT JOIN productos p ON o.id_producto = p.id_producto UNION all
select * from ordenes o RIGHT JOIN productos p ON o.id_producto = p.id_producto
where o.id_producto IS NULL union all select * from ordenes o join clientes as c on c.id_cliente=o.id_cliente;

select * from clientes c inner join ordenes o on c.id_cliente = o.id_cliente inner join productos p on p.id_producto = o.id_producto;


+----------+------------+-------------+----------+-------------+-------------+---------------+
| id_orden | id_cliente | id_producto | cantidad | id_producto | nombre      | precio        |
+----------+------------+-------------+----------+-------------+-------------+---------------+
|        1 |          1 |           1 |        2 |           1 | Producto 1  | 11            |
|        2 |          2 |           2 |        1 |           2 | Producto 2  | 21            |
|        3 |          3 |           3 |        3 |           3 | Producto 3  | 31            |
|        4 |          4 |           4 |        2 |           4 | Producto 4  | 41            |
|        5 |          5 |           5 |        1 |           5 | Producto 5  | 51            |
|        6 |          6 |           6 |        2 |           6 | Producto 6  | 61            |
|        7 |          7 |           7 |        3 |           7 | Producto 7  | 71            |
|        8 |          8 |           8 |        2 |           8 | Producto 8  | 81            |
|        9 |          9 |           9 |        1 |           9 | Producto 9  | 91            |
|       10 |         10 |          10 |        2 |          10 | Producto 10 | 101           |
|       11 |         11 |          11 |        3 |          11 | Producto 11 | 111           |
|       12 |         12 |          12 |        2 |          12 | Producto 12 | 121           |
|       13 |         13 |          13 |        1 |          13 | Producto 13 | 131           |
|       14 |         14 |          14 |        2 |          14 | Producto 14 | 141           |
|       15 |         15 |          15 |        3 |          15 | Producto 15 | 151           |
|       16 |         16 |          16 |        2 |          16 | Producto 16 | 161           |
|       17 |         17 |          17 |        1 |          17 | Producto 17 | 171           |
|       18 |         18 |          18 |        2 |          18 | Producto 18 | 181           |
|       19 |         19 |          19 |        3 |          19 | Producto 19 | 191           |
|       20 |         20 |          20 |        2 |          20 | Producto 20 | 201           |
|        1 |          1 |           1 |        2 |           1 | Cliente 1   | Dirección 1   |
|        2 |          2 |           2 |        1 |           2 | Cliente 2   | Dirección 2   |
|        3 |          3 |           3 |        3 |           3 | Cliente 3   | Dirección 3   |
|        4 |          4 |           4 |        2 |           4 | Cliente 4   | Dirección 4   |
|        5 |          5 |           5 |        1 |           5 | Cliente 5   | Dirección 5   |
|        6 |          6 |           6 |        2 |           6 | Cliente 6   | Dirección 6   |
|        7 |          7 |           7 |        3 |           7 | Cliente 7   | Dirección 7   |
|        8 |          8 |           8 |        2 |           8 | Cliente 8   | Dirección 8   |
|        9 |          9 |           9 |        1 |           9 | Cliente 9   | Dirección 9   |
|       10 |         10 |          10 |        2 |          10 | Cliente 10  | Dirección 10  |
|       11 |         11 |          11 |        3 |          11 | Cliente 11  | Dirección 11  |
|       12 |         12 |          12 |        2 |          12 | Cliente 12  | Dirección 12  |
|       13 |         13 |          13 |        1 |          13 | Cliente 13  | Dirección 13  |
|       14 |         14 |          14 |        2 |          14 | Cliente 14  | Dirección 14  |
|       15 |         15 |          15 |        3 |          15 | Cliente 15  | Dirección 15  |
|       16 |         16 |          16 |        2 |          16 | Cliente 16  | Dirección 16  |
|       17 |         17 |          17 |        1 |          17 | Cliente 17  | Dirección 17  |
|       18 |         18 |          18 |        2 |          18 | Cliente 18  | Dirección 18  |
|       19 |         19 |          19 |        3 |          19 | Cliente 19  | Dirección 19  |
|       20 |         20 |          20 |        2 |          20 | Cliente 20  | Dirección 20  |
+----------+------------+-------------+----------+-------------+-------------+---------------+
```
