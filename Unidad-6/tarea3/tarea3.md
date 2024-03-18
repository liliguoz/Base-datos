<h1 align="center"> TAREA 3 MYSQL </h1>

<div align="center">
<img src="https://cdn.clever-cloud.com/uploads/2023/03/mysql.svg" width="500" />
</div>

___

```sql
CREATE DATABASE IF NOT EXISTS tarea3;

USE tarea3;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    ciudad_cliente VARCHAR(100)
);

CREATE TABLE ordenes (
    id_orden INT PRIMARY KEY,
    id_cliente INT,
    fecha_orden DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio_producto DECIMAL(10, 2)
);

CREATE TABLE detalles_ordenes (
    id_detalle INT PRIMARY KEY,
    id_orden INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO clientes (id_cliente, nombre_cliente, ciudad_cliente) VALUES
(1, 'Juan', 'Ciudad A'),
(2, 'María', 'Ciudad B'),
(3, 'Pedro', 'Ciudad C');

INSERT INTO ordenes (id_orden, id_cliente, fecha_orden) VALUES
(1, 1, '2024-03-01'),
(2, 2, '2024-03-02'),
(3, 3, '2024-03-03');

INSERT INTO productos (id_producto, nombre_producto, precio_producto) VALUES
(1, 'Producto A', 50.00),
(2, 'Producto B', 75.00),
(3, 'Producto C', 100.00);

INSERT INTO detalles_ordenes (id_detalle, id_orden, id_producto, cantidad) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 3);
```
#### Realiza las siguientes consultas:

1. Mostrar todos los clientes.

```sql
select * from clientes;
+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+
```

2. Mostrar todas las órdenes.

```sql
select * from ordenes;
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
|        2 |          2 | 2024-03-02  |
|        3 |          3 | 2024-03-03  |
+----------+------------+-------------+
```

3. Mostrar todos los productos.

```sql
select * from productos;
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           1 | Producto A      |           50.00 |
|           2 | Producto B      |           75.00 |
|           3 | Producto C      |          100.00 |
+-------------+-----------------+-----------------+
```

4. Mostrar todos los detalles de las órdenes.

```sql
select * from detalles_ordenes;
+------------+----------+-------------+----------+
| id_detalle | id_orden | id_producto | cantidad |
+------------+----------+-------------+----------+
|          1 |        1 |           1 |        2 |
|          2 |        2 |           2 |        1 |
|          3 |        3 |           3 |        3 |
+------------+----------+-------------+----------+
```

5. Mostrar los primeros 5 clientes ordenados por nombre.

```sql
select * from clientes order by nombre_cliente limit 5;
+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+
```

6. Mostrar los productos con un precio mayor a 50.

```sql
select * from productos where precio_producto > 50;
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           2 | Producto B      |           75.00 |
|           3 | Producto C      |          100.00 |
+-------------+-----------------+-----------------+
```

7. Mostrar todas las órdenes realizadas por el cliente con ID 1.

```sql
select * from ordenes where id_cliente=1;
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
+----------+------------+-------------+
```

8. Mostrar los clientes cuyos nombres comienzan con la letra "A".

```sql
select * from clientes where nombre_cliente regexp '^A';
Empty set (0,01 sec)
```

9. Mostrar las órdenes que contienen más de 2 productos.

```sql
select * from detalles_ordenes where cantidad > 2;
+------------+----------+-------------+----------+
| id_detalle | id_orden | id_producto | cantidad |
+------------+----------+-------------+----------+
|          3 |        3 |           3 |        3 |
+------------+----------+-------------+----------+
```

10. Mostrar los productos ordenados por precio de forma descendente.

```sql
select * from productos order by precio_producto desc;
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           3 | Producto C      |          100.00 |
|           2 | Producto B      |           75.00 |
|           1 | Producto A      |           50.00 |
+-------------+-----------------+-----------------+
```

11. Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes.

```sql
select c.*, o.* from clientes c
left join ordenes o on c.id_cliente=o.id_cliente;
+------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+
```

12. Seleccionar todas las órdenes junto con los productos correspondientes.

```sql
select do.*, p.* from productos p
inner join detalles_ordenes do on dt.id_producto=p.id_producto;
+------------+----------+-------------+----------+-------------+-----------------+-----------------+
| id_detalle | id_orden | id_producto | cantidad | id_producto | nombre_producto | precio_producto |
+------------+----------+-------------+----------+-------------+-----------------+-----------------+
|          1 |        1 |           1 |        2 |           1 | Producto A      |           50.00 |
|          2 |        2 |           2 |        1 |           2 | Producto B      |           75.00 |
|          3 |        3 |           3 |        3 |           3 | Producto C      |          100.00 |
+------------+----------+-------------+----------+-------------+-----------------+-----------------+
```

13. Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50.

```sql
select c.*, p.* from clientes c
inner join ordenes o on c.id_cliente=o.id_cliente
inner join detalles_ordenes do on o.id_orden=do.id_orden
inner join productos p on do.id_producto=p.id_producto
where p.precio_producto > 50;
+------------+----------------+----------------+-------------+-----------------+-----------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_producto | nombre_producto | precio_producto |
+------------+----------------+----------------+-------------+-----------------+-----------------+
|          2 | María          | Ciudad B       |           2 | Producto B      |           75.00 |
|          3 | Pedro          | Ciudad C       |           3 | Producto C      |          100.00 |
+------------+----------------+----------------+-------------+-----------------+-----------------+
```

14. Obtener el nombre de los productos que no se han ordenado aún.

```sql
select p.nombre_producto from productos p
inner join detalles_ordenes do on p.id_producto=do.id_producto
inner join ordenes o on do.id_orden=o.id_orden
where p.id_producto not in (select id_producto from detalles_ordenes);
Empty set (0,08 sec)
```

15. Mostrar el nombre del cliente, el producto y la cantidad para todas las órdenes.

```sql
select c.nombre_cliente, p.nombre_producto, do.cantidad from clientes c
inner join ordenes o on c.id_cliente=o.id_cliente
inner join detalles_ordenes do on o.id_orden=do.id_orden
inner join productos p on do.id_producto=p.id_producto;
+----------------+-----------------+----------+
| nombre_cliente | nombre_producto | cantidad |
+----------------+-----------------+----------+
| Juan           | Producto A      |        2 |
| María          | Producto B      |        1 |
| Pedro          | Producto C      |        3 |
+----------------+-----------------+----------+
```

16. Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos.

```sql
select p.nombre_producto, c.nombre_cliente from clientes c
inner join ordenes o on c.id_cliente=o.id_cliente
inner join detalles_ordenes do on o.id_orden=do.id_orden
inner join productos p on do.id_producto=p.id_producto;
+-----------------+----------------+
| nombre_producto | nombre_cliente |
+-----------------+----------------+
| Producto A      | Juan           |
| Producto B      | María          |
| Producto C      | Pedro          |
+-----------------+----------------+
```

17. Mostrar todas las órdenes con sus clientes y productos, incluso si no hay órdenes.

```sql
select o.*, c.*, p.* from clientes c
left join ordenes o on c.id_cliente=o.id_cliente
inner join detalles_ordenes do on o.id_orden=do.id_orden
right join productos p on do.id_producto=p.id_producto;
+----------+------------+-------------+------------+----------------+----------------+-------------+-----------------+-----------------+
| id_orden | id_cliente | fecha_orden | id_cliente | nombre_cliente | ciudad_cliente | id_producto | nombre_producto | precio_producto |
+----------+------------+-------------+------------+----------------+----------------+-------------+-----------------+-----------------+
|        1 |          1 | 2024-03-01  |          1 | Juan           | Ciudad A       |           1 | Producto A      |           50.00 |
|        2 |          2 | 2024-03-02  |          2 | María          | Ciudad B       |           2 | Producto B      |           75.00 |
|        3 |          3 | 2024-03-03  |          3 | Pedro          | Ciudad C       |           3 | Producto C      |          100.00 |
+----------+------------+-------------+------------+----------------+----------------+-------------+-----------------+-----------------+
```

18. Obtener el nombre de los clientes junto con el número total de órdenes que han realizado.

```sql
select c.nombre_cliente, COUNT(o.id_orden) AS total_ordenes from clientes c
left join ordenes o on c.id_cliente = o.id_cliente
group by c.id_cliente;
+----------------+---------------+
| nombre_cliente | total_ordenes |
+----------------+---------------+
| Juan           |             1 |
| María          |             1 |
| Pedro          |             1 |
+----------------+---------------+
```

19. Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto.

```sql
select o.*, c.nombre_cliente, p.nombre_producto from clientes c
inner join ordenes o on c.id_cliente=o.id_cliente
inner join detalles_ordenes do on o.id_orden=do.id_orden
inner join productos p on do.id_producto=p.id_producto;
+----------+------------+-------------+----------------+-----------------+
| id_orden | id_cliente | fecha_orden | nombre_cliente | nombre_producto |
+----------+------------+-------------+----------------+-----------------+
|        1 |          1 | 2024-03-01  | Juan           | Producto A      |
|        2 |          2 | 2024-03-02  | María          | Producto B      |
|        3 |          3 | 2024-03-03  | Pedro          | Producto C      |
+----------+------------+-------------+----------------+-----------------+
```

20. Mostrar todas las órdenes con sus productos y clientes, incluso si no hay información de cliente.

```sql
select o.*, c.nombre_cliente, p.nombre_producto from clientes c
right join ordenes o on c.id_cliente=o.id_cliente
inner join detalles_ordenes do on o.id_orden=do.id_orden
inner join productos p on do.id_producto=p.id_producto;
+----------+------------+-------------+----------------+-----------------+
| id_orden | id_cliente | fecha_orden | nombre_cliente | nombre_producto |
+----------+------------+-------------+----------------+-----------------+
|        1 |          1 | 2024-03-01  | Juan           | Producto A      |
|        2 |          2 | 2024-03-02  | María          | Producto B      |
|        3 |          3 | 2024-03-03  | Pedro          | Producto C      |
+----------+------------+-------------+----------------+-----------------+
```

21. Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos, incluyendo los productos que no han sido ordenados.

```sql
select p.nombre_producto, c.nombre_cliente from clientes c
inner join ordenes o on c.id_cliente=o.id_cliente
inner join detalles_ordenes do on o.id_orden=do.id_orden
right join productos p on do.id_producto=p.id_producto;
+-----------------+----------------+
| nombre_producto | nombre_cliente |
+-----------------+----------------+
| Producto A      | Juan           |
| Producto B      | María          |
| Producto C      | Pedro          |
+-----------------+----------------+
```

22. Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto, incluyendo las órdenes sin productos.

```sql
select c.nombre_cliente, p.nombre_producto from clientes c
left join ordenes o on c.id_cliente=o.id_cliente
inner join detalles_ordenes do on o.id_orden=do.id_orden
inner join productos p on do.id_producto=p.id_producto;
+----------------+-----------------+
| nombre_cliente | nombre_producto |
+----------------+-----------------+
| Juan           | Producto A      |
| María          | Producto B      |
| Pedro          | Producto C      |
+----------------+-----------------+
```

23. Obtener el nombre de los clientes junto con el número total de órdenes que han realizado, incluyendo los clientes que no han realizado órdenes.

```sql
select c.nombre_cliente, COUNT(o.id_orden) AS total_ordenes from clientes c
left join ordenes o on c.id_cliente = o.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente;
+----------------+---------------+
| nombre_cliente | total_ordenes |
+----------------+---------------+
| Juan           |             1 |
| María          |             1 |
| Pedro          |             1 |
+----------------+---------------+
```

24. Mostrar todas las órdenes con sus clientes y productos, incluyendo las órdenes y productos que no tienen información.

```sql
select c.nombre_cliente, p.nombre_producto from ordenes o
left join clientes c on o.id_cliente=c.id_cliente
left join detalles_ordenes do on o.id_orden=do.id_orden
left join productos p on do.id_producto=p.id_producto;
+----------------+-----------------+
| nombre_cliente | nombre_producto |
+----------------+-----------------+
| Juan           | Producto A      |
| María          | Producto B      |
| Pedro          | Producto C      |
+----------------+-----------------+
```

25. Realizar un inner join entre clientes y órdenes.

```sql
select c.*, o.* from ordenes o
inner join clientes c on o.id_cliente=c.id_cliente;
+------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+
```   

26. Realizar un left join entre órdenes y detalles de órdenes.

```sql
select * from ordenes o
left join detalles_ordenes do ON o.id_orden = do.id_orden;
+----------+------------+-------------+------------+----------+-------------+----------+
| id_orden | id_cliente | fecha_orden | id_detalle | id_orden | id_producto | cantidad |
+----------+------------+-------------+------------+----------+-------------+----------+
|        1 |          1 | 2024-03-01  |          1 |        1 |           1 |        2 |
|        2 |          2 | 2024-03-02  |          2 |        2 |           2 |        1 |
|        3 |          3 | 2024-03-03  |          3 |        3 |           3 |        3 |
+----------+------------+-------------+------------+----------+-------------+----------+
```

27. Realizar un right join entre productos y detalles de órdenes.

```sql
select * from productos p
right join detalles_ordenes do on p.id_producto = do.id_producto;
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
| id_producto | nombre_producto | precio_producto | id_detalle | id_orden | id_producto | cantidad |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
|           1 | Producto A      |           50.00 |          1 |        1 |           1 |        2 |
|           2 | Producto B      |           75.00 |          2 |        2 |           2 |        1 |
|           3 | Producto C      |          100.00 |          3 |        3 |           3 |        3 |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
```

28. Realizar un full join entre clientes y órdenes.

```sql
select * from clientes c
left join ordenes o on o.id_cliente=c.id_cliente
UNION ALL
select * from ordenes o
left join clientes c on c.id_cliente=o.id_cliente;
+------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 | 1          | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 | 2          | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 | 3          | 2024-03-03  |
|          1 | 1              | 2024-03-01     |        1 | Juan       | Ciudad A    |
|          2 | 2              | 2024-03-02     |        2 | María      | Ciudad B    |
|          3 | 3              | 2024-03-03     |        3 | Pedro      | Ciudad C    |
+------------+----------------+----------------+----------+------------+-------------+
```

29. Realizar un full join entre órdenes y detalles de órdenes.

```sql
select * from ordenes o
left join detalles_ordenes do on do.id_orden=o.id_orden
UNION ALL
select * from detalles_ordenes do
left join ordenes o on o.id_orden=do.id_orden;
+----------+------------+-------------+------------+----------+-------------+------------+
| id_orden | id_cliente | fecha_orden | id_detalle | id_orden | id_producto | cantidad   |
+----------+------------+-------------+------------+----------+-------------+------------+
|        1 |          1 | 2024-03-01  |          1 |        1 |           1 | 2          |
|        2 |          2 | 2024-03-02  |          2 |        2 |           2 | 1          |
|        3 |          3 | 2024-03-03  |          3 |        3 |           3 | 3          |
|        1 |          1 | 1           |          2 |        1 |           1 | 2024-03-01 |
|        2 |          2 | 2           |          1 |        2 |           2 | 2024-03-02 |
|        3 |          3 | 3           |          3 |        3 |           3 | 2024-03-03 |
+----------+------------+-------------+------------+----------+-------------+------------+
```

30. Realizar un full join entre productos y detalles de órdenes.

```sql
select * from productos p
left join detalles_ordenes do on do.id_producto=p.id_producto
UNION ALL
select * from detalles_ordenes do
left join productos p on do.id_producto=p.id_producto;
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
| id_producto | nombre_producto | precio_producto | id_detalle | id_orden | id_producto | cantidad |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
|           1 | Producto A      |           50.00 |          1 |        1 | 1           |     2.00 |
|           2 | Producto B      |           75.00 |          2 |        2 | 2           |     1.00 |
|           3 | Producto C      |          100.00 |          3 |        3 | 3           |     3.00 |
|           1 | 1               |            1.00 |          2 |        1 | Producto A  |    50.00 |
|           2 | 2               |            2.00 |          1 |        2 | Producto B  |    75.00 |
|           3 | 3               |            3.00 |          3 |        3 | Producto C  |   100.00 |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
```
