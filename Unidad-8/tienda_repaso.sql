# Ejercicio de Base de Datos: Gestión de Inventarios

## Parte 1: Creación de Base de Datos y Tablas

1. **Crea una base de datos llamada `inventario`.**

2. **Crea una tabla llamada `productos` con los siguientes campos:**
   - `id` (INT, PK, Auto Incremental)
   - `codigo` (VARCHAR(30))
   - `nombre` (VARCHAR(100))
   - `categoria` (VARCHAR(50))
   - `precio` (DECIMAL(10,2))
   - `stock` (INT)

```sql
DROP TABLE IF EXISTS productos;

CREATE TABLE productos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(30),
    nombre VARCHAR(100),
    categoria VARCHAR(50),
    precio DECIMAL(10,2),
    stock INT
);

```

## Parte 2: Procedimientos Almacenados

1. **Crea un procedimiento llamado `insertar_producto` que inserte un nuevo producto en la tabla `productos`.**

DROP PROCEDURE IF EXISTS insertar_producto;
DELIMITER //
CREATE PROCEDURE insertar_producto(in iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE p_codigo VARCHAR(30);
    DECLARE p_nombre VARCHAR(100);
    DECLARE p_categoria VARCHAR(50);
    DECLARE p_precio DECIMAL(10, 2);
    DECLARE p_stock INT;

    WHILE counter < iterations DO
        SET p_codigo = SUBSTRING_INDEX(UUID(), '-', 1);
        SET p_nombre = CONCAT('Producto', ROUND(RAND() * 1000000));
        SET p_categoria = SUBSTRING(UUID(), 1, 8); 
        SET p_precio = ROUND(RAND() * (1000 - 20) + 20, 2); 
        SET p_stock = FLOOR(RAND() * (100 - 10 + 1)) + 10;

        INSERT INTO productos(codigo, nombre, categoria, precio, stock)
        VALUES (p_codigo, p_nombre, p_categoria, p_precio, p_stock);

        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;


mysql> call insertar_producto(30);
Query OK, 1 row affected (0.21 sec)

mysql> select * from productos;
+----+----------+----------------+-----------+--------+-------+
| id | codigo   | nombre         | categoria | precio | stock |
+----+----------+----------------+-----------+--------+-------+
|  1 | 41f8dbc4 | Producto592568 | 41f8dc69  | 956.00 |   100 |
|  2 | 41f9f230 | Producto123819 | 41f9f2d8  | 633.10 |    78 |
|  3 | 41fa5ef5 | Producto906183 | 41fa5f94  | 275.88 |    63 |
|  4 | 41fabaf0 | Producto151540 | 41fabba2  | 996.85 |    58 |
|  5 | 41fb0edf | Producto656233 | 41fb0f82  | 699.34 |    55 |
|  6 | 41fcf155 | Producto407093 | 41fcf1f8  | 552.56 |    55 |
|  7 | 41fec2cc | Producto849133 | 41fec379  | 762.85 |    32 |
|  8 | 41ff1fa1 | Producto939125 | 41ff204c  | 968.39 |    11 |
|  9 | 41ff9790 | Producto203413 | 41ff9839  | 954.02 |    24 |
| 10 | 41fff34d | Producto916688 | 41fff3ee  | 135.51 |    86 |
| 11 | 42004ce1 | Producto842865 | 42004d86  | 702.51 |    96 |
| 12 | 42022484 | Producto678602 | 4202252a  | 541.62 |    66 |
| 13 | 4203f917 | Producto530814 | 4203f9d5  | 781.95 |    36 |
| 14 | 4206ca26 | Producto142874 | 4206cacd  | 832.56 |    75 |
| 15 | 4207e55e | Producto97966  | 4207e605  | 351.83 |    46 |
| 16 | 420aa9a8 | Producto979656 | 420aaa48  | 706.99 |    61 |
| 17 | 420aefb4 | Producto727434 | 420af01e  | 940.11 |    56 |
| 18 | 420cbef6 | Producto744009 | 420cc015  | 199.97 |    72 |
| 19 | 420eb6f2 | Producto879987 | 420eb797  | 354.56 |    16 |
| 20 | 420f1ffa | Producto310690 | 420f20a1  | 365.49 |    85 |
| 21 | 420f8c30 | Producto95558  | 420f8cd7  | 986.16 |    68 |
| 22 | 420fe0ef | Producto256019 | 420fe185  | 364.86 |   100 |
| 23 | 4210313d | Producto901453 | 421031a1  | 542.32 |    97 |
| 24 | 421306f9 | Producto203720 | 421307a6  | 154.27 |    16 |
| 25 | 421430f3 | Producto958367 | 4214319c  | 578.80 |    98 |
| 26 | 4214953e | Producto168887 | 42149668  | 918.41 |    17 |
| 27 | 4214ec50 | Producto635070 | 4214ece3  | 945.28 |    84 |
| 28 | 42152137 | Producto245642 | 42152199  | 785.70 |    25 |
| 29 | 42172287 | Producto504462 | 4217232d  |  32.99 |    60 |
| 30 | 421855a9 | Producto724628 | 42185650  | 965.22 |    69 |
+----+----------+----------------+-----------+--------+-------+
30 rows in set (0.00 sec)





2. **Crea un procedimiento llamado `actualizar_stock` que permita actualizar el stock de un producto, 
identificándolo por su `codigo`.**

DROP PROCEDURE IF EXISTS actualizar_stock;
DELIMITER //

CREATE PROCEDURE actualizar_stock(in input_codigo VARCHAR(30), in input_stock INT)
BEGIN
    UPDATE productos set stock = input_stock where codigo = input_codigo;
END //
DELIMITER ;


mysql> call actualizar_stock('41fff34d', 53);
Query OK, 1 row affected (0.14 sec)

mysql> select * from productos where codigo='41fff34d';
+----+----------+----------------+-----------+--------+-------+
| id | codigo   | nombre         | categoria | precio | stock |
+----+----------+----------------+-----------+--------+-------+
| 10 | 41fff34d | Producto916688 | 41fff3ee  | 135.51 |    53 |
+----+----------+----------------+-----------+--------+-------+
1 row in set (0.00 sec)

3. **Crea un procedimiento llamado `eliminar_producto` que permita eliminar un producto de la tabla `productos`, 
identificándolo por su `codigo`.**


DROP PROCEDURE IF EXISTS eliminar_producto;
DELIMITER //

CREATE PROCEDURE eliminar_producto(in input_codigo VARCHAR(30))
BEGIN
    DELETE FROM productos where codigo = input_codigo;
END //
DELIMITER ;


mysql> call eliminar_producto('420cbef6');
Query OK, 1 row affected (0.01 sec)

mysql> select * from producto where codigo = '420cbef6';
--ERROR 1146 (42S02): Table 'r1.producto' doesn't exist



## Parte 3: Funciones Almacenadas

1. **Crea una función llamada `consultar_precio` que reciba el `codigo` de un producto y retorne su precio.**

DROP FUNCTION IF EXISTS consultar_precio;
DELIMITER //
CREATE FUNCTION consultar_precio(input_codigo VARCHAR(30))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE p_precio DECIMAL(10,2);
    select precio INTo p_precio from productos where codigo = input_codigo;
    RETURN p_precio;
END //
DELIMITER ;


mysql> select consultar_precio('41fff34d');
+------------------------------+
| consultar_precio('41fff34d') |
+------------------------------+
|                       135.51 |
+------------------------------+
1 row in set (0.01 sec)


2. **Crea una función llamada `producto_con_mayor_stock` que retorne el `nombre` del producto con el mayor stock.**


DROP FUNCTION IF EXISTS producto_con_mayor_stock;
DELIMITER //
CREATE FUNCTION producto_con_mayor_stock()
RETURNS  VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE p_nombre VARCHAR(100);
    SELECT nombre into p_nombre FROM productos WHERE stock = (SELECT MAX(stock) FROM productos) LIMIT 1;

    RETURN p_nombre;
END //
DELIMITER ;

mysql> select producto_con_mayor_stock();
+----------------------------+
| producto_con_mayor_stock() |
+----------------------------+
| Producto592568             |
+----------------------------+
1 row in set (0.01 sec)

## Parte 4: Triggers

1. **Crea un trigger que disminuya el stock de un producto cada vez que se inserte un registro en una tabla llamada `ventas`
 (que tendrás que crear). La tabla `ventas` tiene los campos: 
 `id` (INT, PK, Auto Incremental), `codigo_producto` (VARCHAR(30)), `cantidad` (INT).**

--Para usar como clave foránea debe estar indexada
ALTER TABLE productos ADD INDEX codigo_index (codigo);


CREATE TABLE ventas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo_producto VARCHAR(30) NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo)
);
--comprobar cantidad antigua 

mysql> select * from productos where codigo='41fff34d';
+----+----------+----------------+-----------+--------+-------+
| id | codigo   | nombre         | categoria | precio | stock |
+----+----------+----------------+-----------+--------+-------+
| 10 | 41fff34d | Producto916688 | 41fff3ee  | 135.51 |    53 |
+----+----------+----------------+-----------+--------+-------+

DROP TRIGGER IF EXISTS disminuir_stock;
DELIMITER //
CREATE TRIGGER disminuir_stock
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN
    UPDATE productos 
    SET stock = stock - NEW.cantidad 
    WHERE codigo = NEW.codigo_producto;
END //
DELIMITER ;



mysql> insert into ventas (codigo_producto, cantidad) VALUES ('41fff34d', 3);
Query OK, 1 row affected (0.02 sec)

mysql> select * from ventas;
+----+-----------------+----------+
| id | codigo_producto | cantidad |
+----+-----------------+----------+
|  1 | 41fff34d        |        3 |
+----+-----------------+----------+
1 row in set (0.00 sec)



--comprobar cantidad actual
mysql> select * from productos where codigo='41fff34d';
+----+----------+----------------+-----------+--------+-------+
| id | codigo   | nombre         | categoria | precio | stock |
+----+----------+----------------+-----------+--------+-------+
| 10 | 41fff34d | Producto916688 | 41fff3ee  | 135.51 |    50 |
+----+----------+----------------+-----------+--------+-------+
1 row in set (0.00 sec)

2. **Crea un trigger que elimine un producto de la tabla `productos` si el stock llega a cero después de una actualización.**


DROP TRIGGER IF EXISTS eliminar_producto_sin_stock;
DELIMITER //
CREATE TRIGGER eliminar_producto_sin_stock
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN
    IF NEW.stock = 0 THEN
        DELETE FROM productos WHERE id = NEW.id;
    END IF;
END //
DELIMITER ;


select * from productos where codigo = '421306f9';
+----+----------+----------------+-----------+--------+-------+
| id | codigo   | nombre         | categoria | precio | stock |
+----+----------+----------------+-----------+--------+-------+
| 24 | 421306f9 | Producto203720 | 421307a6  | 154.27 |    16 |
+----+----------+----------------+-----------+--------+-------+
1 row in set (0.00 sec)

insert into ventas (codigo_producto, cantidad) VALUES ('421306f9', 16);

--El problema persiste porque MySQL no permite ejecutar una sentencia DELETE en la tabla que activó el trigger dentro del trigger mismo. Una forma de evitar este problema es utilizar un procedimiento almacenado en lugar de un trigger para realizar la eliminación.
