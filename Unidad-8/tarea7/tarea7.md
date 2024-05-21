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
  - Crea un procedimiento que permita realizar la inserción de un número de alumnos, con una nota mímina y máxima. Estos valores pueden oscilar entre -10, y 12.

```sql
DROP PROCEDURE IF EXISTS generar_alumnos;
DELIMITER //
CREATE PROCEDURE generar_alumnos(IN cantidad INT, prefix VARCHAR(100), nota_minima INT, nota_maxima INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE p_nombre VARCHAR(100);
    DECLARE p_nota FLOAT;
    WHILE counter < cantidad DO
        SET p_nombre = CONCAT(prefix, (RAND(counter) * 1000) + 1);
        SET p_nota = ROUND(RAND(counter) * (nota_maxima - nota_minima + 1) + nota_minima);
        INSERT INTO alumno (nombre, apellido1, apellido2, nota) VALUES (
            p_nombre, p_nombre, p_nombre, p_nota
        );
        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;
```
Realiza los procedimientos y verifica el comportamiento llamando a este con los parámetros adecuados.

</div>
