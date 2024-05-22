<div align="justify">

# Trabajo con la BBDD Alumnos

Modifica el ejercicio anterior y añade un nuevo trigger que las siguientes características:
Trigger: __trigger_guardar_email_after_update__:
  - Se ejecuta sobre la tabla alumnos.
  - Se ejecuta después de una operación de actualización.
  - Cada vez que un alumno modifique su dirección de email se deberá insertar un nuevo registro en una tabla llamada log_cambios_email.
  - La tabla log_cambios_email contiene los siguientes campos:
    - id: clave primaria (entero autonumérico)
    - id_alumno: id del alumno (entero)
    - fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
    - old_email: valor anterior del email (cadena de caracteres)
    - new_email: nuevo valor con el que se ha actualizado

```sql
CREATE TABLE log_cambios_email(
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_alumno INT,
  fecha_hora DATETIME,
  old_email VARCHAR(30),
  new_email VARCHAR(30)
);
```

```sql
DROP TRIGGER IF EXISTS gardar_email_after_update;

DELIMITER //
CREATE TRIGGER guardar_email_after_update
AFTER UPDATE ON alumnos
FOR EACH ROW
BEGIN
  IF OLD.email <> NEW.email THEN
    INSERT INTO log_cambios_email(id_alumno, fecha_hora, old_email, new_email)
    VALUES (NEW.id, NOW(), OLD.email, NEW.email);
  END IF ;
END //
DELIMITER ;
```

```sql
UPDATE alumnos SET email = 'liliguo@gmail.com' where id = '40';

select * from log_cambios_email;
+----+-----------+---------------------+--------------------+-------------------+
| id | id_alumno | fecha_hora          | old_email          | new_email         |
+----+-----------+---------------------+--------------------+-------------------+
|  1 |        40 | 2024-05-22 23:08:09 | uuseuse@pepito.com | liliguo@gmail.com |
+----+-----------+---------------------+--------------------+-------------------+
1 row in set (0,00 sec)
```
Añade un nuevo trigger que tenga las siguientes características:
- Trigger: __trigger_guardar_alumnos_eliminados__:
  - Se ejecuta sobre la tabla alumnos.
  - Se ejecuta después de una operación de borrado.
  - Cada vez que se elimine un alumno de la tabla alumnos se deberá insertar un nuevo registro en una tabla llamada log_alumnos_eliminados.
  - La tabla log_alumnos_eliminados contiene los siguientes campos:
    - id: clave primaria (entero autonumérico)
    - id_alumno: id del alumno (entero)
    - fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
    - nombre: nombre del alumno eliminado (cadena de caracteres)
    - apellido1: primer apellido del alumno eliminado (cadena de caracteres)
    - apellido2: segundo apellido del alumno eliminado (cadena de caracteres)
    - email: email del alumno eliminado (cadena de caracteres).

```SQL
CREATE TABLE log_alumnos_eliminados(
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_alumno INT,
  fecha_hora DATETIME,
  nombre VARCHAR(20),
  apellido1 VARCHAR(20),
  apellido2 VARCHAR(20),
  email VARCHAR(30)
);
```

```SQL

DROP TRIGGER IF EXISTS guardar_alumnos_eliminados;

DELIMITER //
CREATE TRIGGER guardar_alumnos_eliminados
AFTER DELETE ON alumnos
FOR EACH ROW
BEGIN
  INSERT INTO log_alumnos_eliminados(id_alumno, fecha_hora, nombre, apellido1, apellido2, email)
  VALUES (OLD.id, NOW(), OLD.nombre, OLD.apellido1, OLD.apellido2, OLD.email);
END //
DELIMITER ;
```

```sql
DELETE from alumnos where id = 34;

Select * from log_alumnos_eliminados;
+----+-----------+---------------------+--------------+--------------+--------------+--------------------+
| id | id_alumno | fecha_hora          | nombre       | apellido1    | apellido2    | email              |
+----+-----------+---------------------+--------------+--------------+--------------+--------------------+
|  1 |        34 | 2024-05-22 23:24:35 | user14f7e4e6 | user14f7e5b5 | user14f7e60b | uuseuse@pepito.com |
+----+-----------+---------------------+--------------+--------------+--------------+--------------------+
1 row in set (0,00 sec)
```

</div>
