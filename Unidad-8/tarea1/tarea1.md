En este ejercicio, vamos a trabajar en la creación de una base de datos simple utilizando MySQL. Esta base de datos estará diseñada para __administrar información de usuarios y productos__. Una vez que hayamos creado la base de datos y las tablas necesarias, vamos a implementar procedimientos almacenados y funciones para realizar operaciones comunes sobre estos datos.

Pasos:
- 1. Crea la bbdd. _ Utilizaremos comandos SQL para crear una base de datos llamada "SimpleDB" que contendrá dos tablas: "Users" para almacenar información de usuarios y "Products" para almacenar información de productos._

  ```sql
  CREATE DATABASE IF NOT EXISTS SimpleDB;

  USE SimpleDB;

  CREATE TABLE IF NOT EXISTS Users (
      UserID INT AUTO_INCREMENT PRIMARY KEY,
      UserName VARCHAR(50) NOT NULL,
      Email VARCHAR(100) NOT NULL
  );

  CREATE TABLE IF NOT EXISTS Products (
      ProductID INT AUTO_INCREMENT PRIMARY KEY,
      ProductName VARCHAR(100) NOT NULL,
      Price DECIMAL(10, 2) NOT NULL
  );
  ```

- 2. Realiza la inserción de algunos datos de prueba.
  
  ```sql

  INSERT INTO Users (UserName, Email) VALUES ('Juan', 'juan@example.com');
  INSERT INTO Users (UserName, Email) VALUES ('María', 'maria@example.com');
  INSERT INTO Users (UserName, Email) VALUES ('Pedro', 'pedro@example.com');

  INSERT INTO Users (UserName, Email) VALUES ('Ana', 'ana@example.com');
  INSERT INTO Users (UserName, Email) VALUES ('Lola', 'lola@example.com');
  INSERT INTO Users (UserName, Email) VALUES ('Lili', 'liliexample.com');

  INSERT INTO Products (ProductName, Price) VALUES ('Producto 1', 10.99);
  INSERT INTO Products (ProductName, Price) VALUES ('Producto 2', 20.50);
  INSERT INTO Products (ProductName, Price) VALUES ('Producto 3', 15.75);

  INSERT INTO Products (ProductName, Price) VALUES ('Producto 4', 30.00);
  INSERT INTO Products (ProductName, Price) VALUES ('Producto 5', 12.98);
  INSERT INTO Products (ProductName, Price) VALUES ('Producto 6', 20.50);

  ```

  >__Nota__:_Realizar la inserción de al menos_ ___3 elementos___ _más en cada tabla_.

- 3. Crea __procedimientos almacenados__ para realizar operaciones como __insertar un nuevo usuario, actualizar el nombre de un usuario__, etc.
  - Procedimiento para insertar un nuevo usuario.

```sql
DELIMITER //
create PROCEDURE nuevo_usuario
(in nombre varchar(50), in correo varchar(50))
BEGIN
  INSERT INTO Users (UserName, Email) values (nombre, correo);
end //
Query OK, 0 rows affected (0,01 sec)

CALL nuevo_usuario('Sara', 'sara@example.com');
Query OK, 1 row affected (0,00 sec)

select * from Users;
+--------+----------+-------------------+
| UserID | UserName | Email             |
+--------+----------+-------------------+
|      1 | Juan     | juan@example.com  |
|      2 | María    | maria@example.com |
|      3 | Pedro    | pedro@example.com |
|      4 | Ana      | ana@example.com   |
|      5 | Lola     | lola@example.com  |
|      6 | Lili     | liliexample.com   |
|      7 | Sara     | sara@example.com  |
+--------+----------+-------------------+
7 rows in set (0,00 sec)
```

  - Procedimiento para actualizar el nombre de un usuario.

```sql
DELIMITER //
DROP PROCEDURE if exists actualizar_usuario (
    IN nombre VARCHAR(50),
    IN nombre_real VARCHAR(50)
)
BEGIN
    UPDATE Users SET UserName = nombre WHERE UserName = nombre_real;
END //
Query OK, 0 rows affected (0,02 sec)

CALL actualizar_usuario('Juano', 'Juan');
Query OK, 0 rows affected (0,01 sec)

select * from Users;
+--------+----------+-------------------+
| UserID | UserName | Email             |
+--------+----------+-------------------+
|      1 | Juano    | juan@example.com  |
|      2 | María    | maria@example.com |
|      3 | Pedro    | pedro@example.com |
|      4 | Ana      | ana@example.com   |
|      5 | Lola     | lola@example.com  |
|      6 | Lili     | liliexample.com   |
|      7 | Sara     | sara@example.com  |
+--------+----------+-------------------+
7 rows in set (0,00 sec)
```

>__Nota__: _Realiza la invocación y la verificación de que ha funcionado correctamente_.

- 4. Implementa funciones para realizar cálculos o consultas:
  - Función para calcular el precio total de un conjunto de productos.
 
```sql
DELIMITER //
CREATE FUNCTION calc_precio_total() RETURNS FLOAT deterministic
BEGIN
    DECLARE total_precio FLOAT;
    SELECT SUM(price) INTO total_precio FROM Products;
    RETURN total_precio;
END//
DELIMITER ;

Query OK, 0 rows affected (0,01 sec)

select calc_precio_total();
+---------------------+
| calc_precio_total() |
+---------------------+
|              110.72 |
+---------------------+
1 row in set (0,01 sec)
```

  - Función para contar el número de usuarios.

```sql
DELIMITER //
CREATE FUNCTION total_usuario() RETURNS int deterministic
BEGIN
    DECLARE total_usuario INT;
    SELECT COUNT(*) INTO total_usuario FROM Users;
    RETURN total_usuario;
END//
DELIMITER ;

select * from total_usuario();
+-----------------+
| total_usuario() |
+-----------------+
|               7 |
+-----------------+
1 row in set (0,00 sec)

>__Nota__: _Realiza la invocación y la verificación de que ha funcionado correctamente_.
