<h1 align="center"> TAREA 1 MYSQL </h1>

<div align="center">
<img src="https://cdn.clever-cloud.com/uploads/2023/03/mysql.svg" width="500" />
</div>

___

Se crea la base de datos con su respectivo nombre.

```sql
CREATE DATABASE IF NOT EXISTS tarea1;
```

Una vez creada la base de datos debemos de entrar en ella.

```sql
USE tarea1;
```

Asimismo, procederemos a crear una tabla llamada alumnos y sus respectivas columnas.

```sql
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY ,
    nombre VARCHAR(50),
    edad INT,
    correo VARCHAR(50)
);
```

Una vez creada la tabla insertaremos los datos en ella.

```sql
INSERT INTO usuarios (nombre, edad, correo) VALUES
('Juan', 25, 'juan@example.com'),
('María', 30, 'maria@example.com'),
('Pedro', 28, 'pedro@example.com');
```

Se crea otra tabla llamada productos.

```sql
CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10, 2),
    cantidad INT
);
```
Una vez creada la tabla insertaremos los datos en ella

```sql
INSERT INTO productos (nombre, precio, cantidad) VALUES
('Camisa', 25.99, 100),
('Pantalón', 35.50, 80),
('Zapatos', 59.99, 50);
```

Seguidamente crearemos la tabla pedidos

```sql
CREATE TABLE IF NOT EXISTS pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    producto_id INT,
    cantidad INT,
    fecha_pedido DATE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);
```
Insertamos los valores

```sql
INSERT INTO pedidos (usuario_id, producto_id, cantidad, fecha_pedido) VALUES
(1, 1, 2, '2024-03-01'),
(2, 2, 1, '2024-03-02'),
(3, 3, 3, '2024-03-03');
```

#### Realiza la migración a MySql y realiza las siguientes consultas:

1. Mostrar todos los usuarios.

```sql
select * from usuarios;
+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  1 | Juan   |   25 | juan@example.com  |
|  2 | María  |   30 | maria@example.com |
|  3 | Pedro  |   28 | pedro@example.com |
+----+--------+------+-------------------+
```

2. Mostrar todos los productos.

```sql
select * from productos;
+----+-----------+--------+----------+
| id | nombre    | precio | cantidad |
+----+-----------+--------+----------+
|  1 | Camisa    |  25.99 |      100 |
|  2 | Pantalón  |  35.50 |       80 |
|  3 | Zapatos   |  59.99 |       50 |
+----+-----------+--------+----------+
```
3. Mostrar todos los pedidos.

```sql
select * from productos;
+----+-----------+--------+----------+
| id | nombre    | precio | cantidad |
+----+-----------+--------+----------+
|  1 | Camisa    |  25.99 |      100 |
|  2 | Pantalón  |  35.50 |       80 |
|  3 | Zapatos   |  59.99 |       50 |
+----+-----------+--------+----------+
```

4. Mostrar los usuarios que tienen más de 25 años.

```sql
select * from usuarios where edad > 25;
+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  2 | María  |   30 | maria@example.com |
|  3 | Pedro  |   28 | pedro@example.com |
+----+--------+------+-------------------+
```

5. Mostrar los productos con un precio mayor a 50.

```sql
select * from productos where precio > 50;
+----+---------+--------+----------+
| id | nombre  | precio | cantidad |
+----+---------+--------+----------+
|  3 | Zapatos |  59.99 |       50 |
+----+---------+--------+----------+
```

6. Mostrar los pedidos realizados el día de hoy.

```sql
select * from pedido where fecha_pedido = now();
Empty set (0,00 sec)
```

7. Mostrar el total de productos en stock.

```sql
select * from pedidos where cantidad > 0;
+----+------------+-------------+----------+--------------+
| id | usuario_id | producto_id | cantidad | fecha_pedido |
+----+------------+-------------+----------+--------------+
|  1 |          1 |           1 |        2 | 2024-03-01   |
|  2 |          2 |           2 |        1 | 2024-03-02   |
|  3 |          3 |           3 |        3 | 2024-03-03   |
+----+------------+-------------+----------+--------------+
```

8. Mostrar el promedio de edades de los usuarios.

```sql
select avg(edad) from usuarios;
+-----------+
| avg(edad) |
+-----------+
|   27.6667 |
+-----------+
```

9. Mostrar los usuarios que tienen la letra 'a' en su nombre.

```sql
select * from usuarios where nombre REGEXP 'a';
+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  1 | Juan   |   25 | juan@example.com  |
|  2 | María  |   30 | maria@example.com |
+----+--------+------+-------------------+
```

10. Mostrar los productos ordenados por precio de forma descendente.

```sql
select * from productos order by nombre DESC;
+----+-----------+--------+----------+
| id | nombre    | precio | cantidad |
+----+-----------+--------+----------+
|  3 | Zapatos   |  59.99 |       50 |
|  2 | Pantalón  |  35.50 |       80 |
|  1 | Camisa    |  25.99 |      100 |
+----+-----------+--------+----------+
```

11. Mostrar los pedidos realizados por el usuario con ID 2.

```sql
select * from usuarios join pedidos as p on p.usuario_id= usuarios.id where usuarios.id = 2;
+----+--------+------+-------------------+----+------------+-------------+----------+--------------+
| id | nombre | edad | correo            | id | usuario_id | producto_id | cantidad | fecha_pedido |
+----+--------+------+-------------------+----+------------+-------------+----------+--------------+
|  2 | María  |   30 | maria@example.com |  2 |          2 |           2 |        1 | 2024-03-02   |
+----+--------+------+-------------------+----+------------+-------------+----------+--------------+
```

12. Mostrar los usuarios ordenados por edad de forma ascendente.

```sql
select * from usuarios order by nombre ASC;
+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  1 | Juan   |   25 | juan@example.com  |
|  2 | María  |   30 | maria@example.com |
|  3 | Pedro  |   28 | pedro@example.com |
+----+--------+------+-------------------+
```

13. Mostrar los productos con un precio entre 20 y 50.

```sql
select * from productos where precio BETWEEN 20 and 50;
+----+-----------+--------+----------+
| id | nombre    | precio | cantidad |
+----+-----------+--------+----------+
|  1 | Camisa    |  25.99 |      100 |
|  2 | Pantalón  |  35.50 |       80 |
+----+-----------+--------+----------+
```

14. Mostrar los usuarios que tienen un correo de dominio 'example.com'.

```sql
select * from usuarios where correo REGEXP 'example.com';
+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  1 | Juan   |   25 | juan@example.com  |
|  2 | María  |   30 | maria@example.com |
|  3 | Pedro  |   28 | pedro@example.com |
+----+--------+------+-------------------+
```

15. Mostrar los pedidos con una cantidad mayor a 2

```sql
select * from pedidos where cantidad > 2;
+----+------------+-------------+----------+--------------+
| id | usuario_id | producto_id | cantidad | fecha_pedido |
+----+------------+-------------+----------+--------------+
|  3 |          3 |           3 |        3 | 2024-03-03   |
+----+------------+-------------+----------+--------------+
```
