<h1 align="center"> TAREA 3 MYSQL </h1>

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
2. Mostrar todos los productos.
3. Mostrar todos los pedidos.
4. Mostrar los usuarios que tienen más de 25 años.
5. Mostrar los productos con un precio mayor a 50.
6. Mostrar los pedidos realizados el día de hoy.
7. Mostrar el total de productos en stock.
8. Mostrar el promedio de edades de los usuarios.
9. Mostrar los usuarios que tienen la letra 'a' en su nombre
10. Mostrar los productos ordenados por precio de forma descendente.
11. Mostrar los pedidos realizados por el usuario con ID 2.
12. Mostrar los usuarios ordenados por edad de forma ascendente.
13. Mostrar los productos con un precio entre 20 y 50.
14. Mostrar los usuarios que tienen un correo de dominio 'example.com'.
15. Mostrar los pedidos con una cantidad mayor a 2
