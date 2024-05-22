<div align="justify">

# Trabajo con la BBDD Alumnos

Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas:

- Tabla alumnos:

  - id (entero sin signo)
  - nombre (cadena de caracteres)
  - apellido1 (cadena de caracteres)
  - apellido2 (cadena de caracteres)
  - email (cadena de caracteres)
 
```sql
CREATE DATABASE IF NOT EXISTS tarea8;

USE tarea8;

drop table if exists alumnos;
CREATE TABLE alumnos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(30),
  apellido1 VARCHAR(30),
  apellido2 VARCHAR(30),
  email VARCHAR(100)
);
```

1. Escribe una función llamado __crear_email__ que dados los parámetros de entrada: __nombre, apellido1, apellido2 y dominio__, cree una dirección de email y la devuelva como salida.

- Función: crear_email
  - Entrada:
      - nombre (cadena de caracteres)
      - apellido1 (cadena de caracteres)
      - apellido2 (cadena de caracteres)
      - dominio (cadena de caracteres)
  - Salida:
      - email (cadena de caracteres)

El email devuelve una dirección de correo electrónico con el siguiente formato:

- El primer carácter del parámetro nombre.
- Los tres primeros caracteres del parámetro apellido1.
- Los tres primeros caracteres del parámetro apellido2.
- El carácter @.
- El dominio pasado como parámetro.
- La dirección de email debe estar en minúsculas.

- También crea una función llamada __eliminar_acentos__ que reciba una cadena de caracteres y devuelva la misma cadena sin acentos. La función tendrá que reemplazar todas las vocales que tengan acento por la misma vocal pero sin acento. Por ejemplo, si la función recibe como parámetro de entrada la cadena María la función debe devolver la cadena Maria.

- Función: eliminar_acentos
  - Entrada:
    - cadena (cadena de caracteres)
  - Salida:
    - (cadena de caracteres)

```SQL
DROP FUNCTION IF EXISTS eliminar_acentos;
DELIMITER //
CREATE FUNCTION eliminar_acentos(cadena VARCHAR(30)) RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
  DECLARE cadena VARCHAR(50);

  SET cadena = REPLACE(cadena, 'á', 'a');
  SET cadena = REPLACE(cadena, 'é', 'e');
  SET cadena = REPLACE(cadena, 'í', 'i');
  SET cadena = REPLACE(cadena, 'ó', 'o');
  SET cadena = REPLACE(cadena, 'ú', 'u');

RETURN cadena;
END //
DELIMITER ;
```
> ___La función crear_email deberá hacer uso de la función eliminar_acentos___.

Una vez creada la tabla escriba un trigger con las siguientes características:

```SQL
DROP FUNCTION IF EXISTS crear_email;
DELIMITER //
CREATE FUNCTION crear_email(nombre VARCHAR(30), apellido1 VARCHAR(30), apellido2 VARCHAR(30), dominio VARCHAR(10))
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
    DECLARE nombre_char VARCHAR(1);
    DECLARE apellido1_char VARCHAR(3);
    DECLARE apellido2_char VARCHAR(3);
    DECLARE email VARCHAR(20);

    SET nombre_char = SUBSTRING(nombre, 1, 1);
    SET apellido1_char = SUBSTRING(apellido1, 1, 3);
    SET apellido2_char = SUBSTRING(apellido2, 1, 3);

    SET email = LCASE(CONCAT(nombre_char, apellido1_char, apellido2_char, '@', dominio));
RETURN email;
END //

DELIMITER ;
   
select crear_email('LILI', 'guo', 'zeng', 'gmail.com');
+-------------------------------------------------+
| crear_email('LILI', 'guo', 'zeng', 'gmail.com') |
+-------------------------------------------------+
| lguozen@gmail.com                               |
+-------------------------------------------------+
1 row in set (0,00 sec)
```
- Trigger:
  - __trigger_crear_email_before_insert__.
  - Se ejecuta sobre la tabla alumnos.
  - Se ejecuta antes de una operación de inserción.
  - Si el nuevo valor del email que se quiere insertar es NULL, entonces se le creará automáticamente una dirección de email y se insertará en la tabla.
  - Si el nuevo valor del email no es NULL se guardará en la tabla el valor del email.

```sql
DROP TRIGGER IF EXISTS trigger_crear_email_before_insert;

DELIMITER //

CREATE TRIGGER trigger_crear_email_before_insert
BEFORE INSERT ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.email is NULL THEN
        SET NEW.email = crear_email(NEW.nombre, NEW.apellido1, NEW.apellido2, 'pepito.com');
    END IF;

END //
DELIMITER ;
```

>__Nota__: Para crear la nueva dirección de email se deberá hacer uso del procedimiento crear_email.

- Verificación:
  - Realiza inserciones en la tabla y verifica el correcto funcionamiento de las __funciones y triggers__.
  - Realiza un procedimiento que realice la inserción de un número de elementos que se pasa como parámetro. Incluye la máxima aleatoridad posible.
  
```sql
DELIMITER //
DROP PROCEDURE IF EXISTS generar_alumnos;
CREATE PROCEDURE generar_alumnos(
    IN p_iteration INT, 
    IN p_prefix VARCHAR(10)
)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE r_nombre VARCHAR(20);
    DECLARE r_apellido1 VARCHAR(20);
    DECLARE r_apellido2 VARCHAR(20);

    WHILE counter < p_iteration DO
        SET r_nombre = CONCAT(p_prefix, SUBSTRING_INDEX(UUID(), '-', 1));
        SET r_apellido1 = CONCAT(p_prefix, SUBSTRING_INDEX(UUID(), '-', 1));
        SET r_apellido2 = CONCAT(p_prefix, SUBSTRING_INDEX(UUID(), '-', 1));

        INSERT INTO alumnos (nombre, apellido1, apellido2, email) VALUES (r_nombre, r_apellido1, r_apellido2, NULL);

        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;

call generar_alumnos(10, 'user');

+----+--------------+--------------+--------------+--------------------+
| id | nombre       | apellido1    | apellido2    | email              |
+----+--------------+--------------+--------------+--------------------+
| 31 | user14f4d3cf | user14f4d415 | user14f4d439 | uuseuse@pepito.com |
| 32 | user14f68ba3 | user14f68c86 | user14f68cc3 | uuseuse@pepito.com |
| 33 | user14f73916 | user14f7399f | user14f739e0 | uuseuse@pepito.com |
| 34 | user14f7e4e6 | user14f7e5b5 | user14f7e60b | uuseuse@pepito.com |
| 35 | user14f8a580 | user14f8a623 | user14f8a661 | uuseuse@pepito.com |
| 36 | user14f97e9f | user14f97f98 | user14f98011 | uuseuse@pepito.com |
| 37 | user14fa8eb9 | user14fa90e6 | user14fa91dd | uuseuse@pepito.com |
| 38 | user14fb5e3a | user14fb5ed6 | user14fb5f1b | uuseuse@pepito.com |
| 39 | user14fc08cf | user14fc0962 | user14fc09a2 | uuseuse@pepito.com |
| 40 | user14fcaab2 | user14fcab3c | user14fcab79 | uuseuse@pepito.com |
+----+--------------+--------------+--------------+--------------------+
40 rows in set (0,00 sec)
```


</div>
