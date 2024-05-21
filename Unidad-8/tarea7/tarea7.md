<div align="justify">

# Trabajo con la BBDD Alumnos

Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas:

- Tabla alumnos:
  - id (entero sin signo)
  - nombre (cadena de caracteres)
  - apellido1 (cadena de caracteres)
  - apellido2 (cadena de caracteres)
  - nota (número real)

```sql
create database if not exists tarea7;

use tarea7;

create table alumnos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  apellido1 VARCHAR(50),
  apellido2 VARCHAR(50),
  nota DECIMAL
);
```

Crea los siguientes __triggers__:
- Trigger1:_trigger_check_nota_before_insert_.
  - Se ejecuta sobre la tabla alumnos.
  - Se ejecuta antes de una operación de inserción.
  - Si el nuevo valor de la nota que se quiere insertar es negativo, se guarda como 0.
  - Si el nuevo valor de la nota que se quiere insertar es mayor que 10, se guarda como 10.
  
```sql
DROP TRIGGER IF EXISTS check_nota_before_insert;
DELIMITER $$
CREATE TRIGGER check_nota_before_insert
BEFORE INSERT ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    ELSEIF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;
END;$$
DELIMITER ;
```

```sql
INSERT INTO alumnos (nombre, apellido1, apellido2, nota) values ('lili', 'guo', 'zeng', '30');
INSERT INTO alumnos (nombre, apellido1, apellido2, nota) values ('shijie', 'guo', 'zeng', '-5');

select * from alumnos;
+----+--------+-----------+-----------+------+
| id | nombre | apellido1 | apellido2 | nota |
+----+--------+-----------+-----------+------+
|  1 | lili   | guo       | zeng      |   10 |
|  2 | shijie | guo       | zeng      |    0 |
+----+--------+-----------+-----------+------+
2 rows in set (0,00 sec)
```

- __Trigger2__ : _trigger_check_nota_before_update_.
  - Se ejecuta sobre la tabla alumnos.
  - Se ejecuta antes de una operación de actualización.
  - Si el nuevo valor de la nota que se quiere actualizar es negativo, se guarda como 0.
  - Si el nuevo valor de la nota que se quiere actualizar es mayor que 10, se guarda como 10.

```sql
DROP TRIGGER IF EXISTS tigger_check_nota_before_update;
DELIMITER $$
CREATE TRIGGER tigger_check_nota_before_update
BEFORE UPDATE ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    ELSEIF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;
END;$$
DELIMITER ;
```

```sql
UPDATE alumnos SET nota = 30 WHERE id = 1;
UPDATE alumnos SET nota = -9 WHERE id = 2;

select * from alumnos;
+----+--------+-----------+-----------+------+
| id | nombre | apellido1 | apellido2 | nota |
+----+--------+-----------+-----------+------+
|  1 | lili   | guo       | zeng      |   10 |
|  2 | shijie | guo       | zeng      |    0 |
+----+--------+-----------+-----------+------+
2 rows in set (0,00 sec)
```

Una vez creados los triggers escriba varias sentencias de inserción y actualización sobre la tabla alumnos y verifica que los triggers se están ejecutando correctamente.

Crea el siguiente procedimiento:
- __Procedimiento1__:
  - Crea un procedimiento que permita realizar la inserción de un número de alumnos, con una nota mímina y máxima. Estos valores pueden oscilar entre 3, y 10.

```sql
DELIMITER //

DROP PROCEDURE IF EXISTS insertar_alumnos_10;
CREATE PROCEDURE insertar_alumnos_10(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE random_id INT;
    DECLARE random_nombre VARCHAR(30);
    DECLARE random_apellido1 VARCHAR(30);
    DECLARE random_apellido2 VARCHAR(30);
    DECLARE random_nota DECIMAL(4, 1);

    WHILE counter < iterations DO
        SET random_id = FLOOR(RAND() * 10000) + counter;
        SET random_nombre = CONCAT('Nombre', counter);
        SET random_apellido1 = CONCAT('Apellido1', counter);
        SET random_apellido2 = CONCAT('Apellido2', counter);
        SET random_nota = ROUND(RAND() * (10 - 3) + 3, 1);
        
        INSERT INTO alumnos (id, nombre, apellido1, apellido2, nota) 
        VALUES (random_id, random_nombre, random_apellido1, random_apellido2, random_nota);
        
        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;
```

```sql
CALL insertar_alumnos_10(10);
+------+---------+------------+------------+------+
| id   | nombre  | apellido1  | apellido2  | nota |
+------+---------+------------+------------+------+
|    1 | lili    | guo        | zeng       |   10 |
|    2 | shijie  | guo        | zeng       |    0 |
|   73 | Nombre3 | Apellido13 | Apellido23 |    6 |
| 1399 | Nombre2 | Apellido12 | Apellido22 |    9 |
| 2229 | Nombre9 | Apellido19 | Apellido29 |    7 |
| 3576 | Nombre8 | Apellido18 | Apellido28 |    9 |
| 3961 | Nombre7 | Apellido17 | Apellido27 |    5 |
| 4451 | Nombre0 | Apellido10 | Apellido20 |    6 |
| 4623 | Nombre6 | Apellido16 | Apellido26 |    7 |
| 5980 | Nombre5 | Apellido15 | Apellido25 |    5 |
| 8498 | Nombre1 | Apellido11 | Apellido21 |   10 |
| 8773 | Nombre4 | Apellido14 | Apellido24 |    5 |
+------+---------+------------+------------+------+
12 rows in set (0,00 sec)
```
  - Crea un procedimiento que permita realizar la inserción de un número de alumnos, con una nota mímina y máxima. Estos valores pueden oscilar entre -10, y 12.

```sql
DELIMITER //

DROP PROCEDURE IF EXISTS insertar_alumnos_12;
CREATE PROCEDURE insertar_alumnos_12(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE random_id INT;
    DECLARE random_nombre VARCHAR(30);
    DECLARE random_apellido1 VARCHAR(30);
    DECLARE random_apellido2 VARCHAR(30);
    DECLARE random_nota DECIMAL(4, 1);

    WHILE counter < iterations DO
        SET random_id = FLOOR(RAND() * 10000) + counter;
        SET random_nombre = CONCAT('Nombre', counter);
        SET random_apellido1 = CONCAT('Apellido1', counter);
        SET random_apellido2 = CONCAT('Apellido2', counter);
        SET random_nota = ROUND((RAND() * (12 - (-10)) + (-10)), 1);
        
        INSERT INTO alumnos (id, nombre, apellido1, apellido2, nota) 
        VALUES (random_id, random_nombre, random_apellido1, random_apellido2, random_nota);
        
        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;
```

```SQL
CALL insertar_alumnos_12(10);

select * from alumnos;
+------+---------+------------+------------+------+
| id   | nombre  | apellido1  | apellido2  | nota |
+------+---------+------------+------------+------+
|    1 | lili    | guo        | zeng       |   10 |
|    2 | shijie  | guo        | zeng       |    0 |
|   73 | Nombre3 | Apellido13 | Apellido23 |    6 |
| 1342 | Nombre3 | Apellido13 | Apellido23 |    0 |
| 1399 | Nombre2 | Apellido12 | Apellido22 |    9 |
| 2069 | Nombre5 | Apellido15 | Apellido25 |    2 |
| 2229 | Nombre9 | Apellido19 | Apellido29 |    7 |
| 2294 | Nombre8 | Apellido18 | Apellido28 |    0 |
| 3576 | Nombre8 | Apellido18 | Apellido28 |    9 |
| 3796 | Nombre1 | Apellido11 | Apellido21 |    2 |
| 3961 | Nombre7 | Apellido17 | Apellido27 |    5 |
| 4451 | Nombre0 | Apellido10 | Apellido20 |    6 |
| 4623 | Nombre6 | Apellido16 | Apellido26 |    7 |
| 5484 | Nombre4 | Apellido14 | Apellido24 |    0 |
| 5554 | Nombre2 | Apellido12 | Apellido22 |    0 |
| 5980 | Nombre5 | Apellido15 | Apellido25 |    5 |
| 6284 | Nombre0 | Apellido10 | Apellido20 |    0 |
| 7529 | Nombre9 | Apellido19 | Apellido29 |   10 |
| 8498 | Nombre1 | Apellido11 | Apellido21 |   10 |
| 8773 | Nombre4 | Apellido14 | Apellido24 |    5 |
| 9554 | Nombre7 | Apellido17 | Apellido27 |    4 |
| 9907 | Nombre6 | Apellido16 | Apellido26 |    0 |
+------+---------+------------+------------+------+
22 rows in set (0,00 sec)
```

Realiza los procedimientos y verifica el comportamiento llamando a este con los parámetros adecuados.

</div>
