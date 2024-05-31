Crea una tabla llamada persona con los siguientes campos:

- Identificador Auto Incremental (Integer) PK
- Identificador (Texto)
- Peso. (Entero)
- Admitido. Texto(Si/No).(Valores de dominio:Si/No)
- Sexo. Texto (H/M).(Valores de dominio:H/M)
- Fecha Última Donación.

```sql
DROP DATABASE IF EXISTS examen;

CREATE DATABASE examen;

USE examen;

CREATE TABLE IF NOT EXISTS persona (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identificador VARCHAR(40) NOT NULL,
    peso INT NOT NULL,
    admitido ENUM('Si', 'No') NOT NULL,
    sexo ENUM('H', 'M') NOT NULL,
    fecha DATE NOT NULL
);
```

Se pide:

## Procedimientos:

1. Realizar un procedimiento que realice la inserción de datos aleatorios en la tabla. 
El procedimiento debe de recibir como parámetro de entrada, al menos, 
el número de registros que se desea insertar y se debe de lanzar, al menos, en dos ocasiones, 
para verificar su correcto funcionamiento. Los datos deben de ser aleatorios, es decir, 
en cada inserción de debe de auto generar o seleccionar uno al azar, de los campos requeridos.

```sql
DROP PROCEDURE IF EXISTS insercion_tabla;

DELIMITER //

CREATE PROCEDURE insercion_tabla(IN iteracion INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE p_identificador VARCHAR(40);
    DECLARE p_peso INT;
    DECLARE p_admitido ENUM('Si', 'No');
    DECLARE p_sexo ENUM('H', 'M');
    DECLARE p_fecha DATE;
    
    WHILE counter < iteracion DO
        SET p_identificador = UUID();
        SET p_peso = FLOOR(RAND() * (100 - 50 + 1)) + 50;
        SET p_admitido = IF(RAND() > 0.5, 'Si', 'No');
        SET p_sexo = IF(RAND() > 0.5, 'H', 'M');
        SET p_fecha = DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 365) DAY);
        
        INSERT INTO persona (identificador, peso, admitido, sexo, fecha)
        VALUES (p_identificador, p_peso, p_admitido, p_sexo, p_fecha);
        
        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;

CALL insercion_tabla(10);

SELECT FROM persona;
+----+--------------------------------------+------+----------+------+------------+
| id | identificador                        | peso | admitido | sexo | fecha      |
+----+--------------------------------------+------+----------+------+------------+
|  1 | 337b25da-1e8a-11ef-857e-080027f4f295 |   56 | No       | M    | 2023-09-09 |
|  2 | 337c4e9f-1e8a-11ef-857e-080027f4f295 |   62 | No       | H    | 2023-12-19 |
|  3 | 337cbb76-1e8a-11ef-857e-080027f4f295 |   84 | No       | M    | 2023-09-11 |
|  4 | 337d2602-1e8a-11ef-857e-080027f4f295 |   55 | No       | M    | 2023-07-17 |
|  5 | 337d8291-1e8a-11ef-857e-080027f4f295 |   62 | Si       | M    | 2024-02-09 |
|  6 | 337db589-1e8a-11ef-857e-080027f4f295 |   95 | Si       | H    | 2024-03-28 |
|  7 | 337de9a2-1e8a-11ef-857e-080027f4f295 |   51 | Si       | H    | 2024-05-13 |
|  8 | 337e3291-1e8a-11ef-857e-080027f4f295 |   66 | No       | M    | 2023-09-06 |
|  9 | 337e647f-1e8a-11ef-857e-080027f4f295 |   52 | No       | M    | 2023-09-10 |
| 10 | 337eb893-1e8a-11ef-857e-080027f4f295 |   52 | No       | M    | 2023-07-28 |
+----+--------------------------------------+------+----------+------+------------+
10 rows in set (0,00 sec)
```

2. Realiza un procedimiento que permita actualizar el la fecha de última donación, 
teniendo como parámetro de entrada el identificador de la persona, y una fecha.

```sql
DROP PROCEDURE IF EXISTS actualizacion_fecha;

DELIMITER //
CREATE PROCEDURE actualizacion_fecha(IN p_id INT, IN p_fecha DATE)
BEGIN
    UPDATE persona SET fecha = p_fecha where id = p_id;
END //
DELIMITER ;


CALL actualizacion_fecha(1, '2030-01-01');

select * from persona where id = 1;
+----+--------------------------------------+------+----------+------+------------+
| id | identificador                        | peso | admitido | sexo | fecha      |
+----+--------------------------------------+------+----------+------+------------+
|  1 | 337b25da-1e8a-11ef-857e-080027f4f295 |   56 | No       | M    | 2030-01-01 |
+----+--------------------------------------+------+----------+------+------------+
1 row in set (0,00 sec)
```


3. Crea un procedimiento llamado CalcularTotalDonaciones que calcule la cantidad total de donaciones realizadas por cada persona 
y la almacene en una tabla llamada total_donaciones. 
La tabla total_donaciones debe tener dos columnas: id_persona (texto) y cantidad_total (integer).

```sql
DROP PROCEDURE IF EXISTS CalcularTotalDonaciones;

DELIMITER //

CREATE PROCEDURE CalcularTotalDonaciones()
BEGIN
    DROP TABLE IF EXISTS total_donaciones;

    CREATE TABLE total_donaciones (
        id_persona VARCHAR(40) NOT NULL PRIMARY KEY,
        cantidad_total INT NOT NULL
    );

    INSERT INTO total_donaciones (id_persona, cantidad_total)
    SELECT identificador, COUNT(*) AS cantidad_total
    FROM persona
    GROUP BY identificador;
END //

DELIMITER ;

CALL CalcularTotalDonaciones();

select * from total_donaciones;
+--------------------------------------+----------------+
| id_persona                           | cantidad_total |
+--------------------------------------+----------------+
| 337b25da-1e8a-11ef-857e-080027f4f295 |              1 |
| 337c4e9f-1e8a-11ef-857e-080027f4f295 |              1 |
| 337cbb76-1e8a-11ef-857e-080027f4f295 |              1 |
| 337d2602-1e8a-11ef-857e-080027f4f295 |              1 |
| 337d8291-1e8a-11ef-857e-080027f4f295 |              1 |
| 337db589-1e8a-11ef-857e-080027f4f295 |              1 |
| 337de9a2-1e8a-11ef-857e-080027f4f295 |              1 |
| 337e3291-1e8a-11ef-857e-080027f4f295 |              1 |
| 337e647f-1e8a-11ef-857e-080027f4f295 |              1 |
| 337eb893-1e8a-11ef-857e-080027f4f295 |              1 |
+--------------------------------------+----------------+
10 rows in set (0,00 sec)
```

4. Crea un procedimiento que me permita eliminar una persona de la tabla total_donaciones.

```sql
DROP PROCEDURE IF EXISTS eliminar_persona;

DELIMITER //
CREATE PROCEDURE eliminar_persona(IN p_id VARCHAR(40))
BEGIN
    DELETE FROM total_donaciones WHERE id_persona = p_id;
END //
DELIMITER ;

call eliminar_persona('337b25da-1e8a-11ef-857e-080027f4f295');

select * from total_donaciones;
+--------------------------------------+----------------+
| id_persona                           | cantidad_total |
+--------------------------------------+----------------+
| 337c4e9f-1e8a-11ef-857e-080027f4f295 |              1 |
| 337cbb76-1e8a-11ef-857e-080027f4f295 |              1 |
| 337d2602-1e8a-11ef-857e-080027f4f295 |              1 |
| 337d8291-1e8a-11ef-857e-080027f4f295 |              1 |
| 337db589-1e8a-11ef-857e-080027f4f295 |              1 |
| 337de9a2-1e8a-11ef-857e-080027f4f295 |              1 |
| 337e3291-1e8a-11ef-857e-080027f4f295 |              1 |
| 337e647f-1e8a-11ef-857e-080027f4f295 |              1 |
| 337eb893-1e8a-11ef-857e-080027f4f295 |              1 |
+--------------------------------------+----------------+
9 rows in set (0,00 sec)
```

## Funciones:

1. Realiza una función que determine si una persona almacenada en la tabla persona puede realizar una donación. 
Para ello la función recibe como parámetro de entrada el identificador de esta persona, y una fecha de donación. 
Revisa las condiciones para que una persona pueda o no donar. Posteriormente actualice el valor de la última donación de la persona indicada con el parámetro de entrada.

```sql
DELIMITER //

CREATE FUNCTION apto_donar(p_id INT, p_fecha_donacion DATE) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE p_sexo ENUM('H', 'M');
    DECLARE p_peso INT;
    DECLARE p_dias_ultima_donacion INT;
    DECLARE p_fecha_ultima_donacion DATE;

    -- Obtener peso, sexo y fecha de la última donación de la persona
    SELECT peso, sexo, fecha 
    INTO p_peso, p_sexo, p_fecha_ultima_donacion 
    FROM persona 
    WHERE id = p_id;

    -- Verificar si el peso es menor a 50 kg
    IF p_peso < 50 THEN
        RETURN FALSE;
    END IF;

    -- Calcular los días desde la última donación
    SET p_dias_ultima_donacion = DATEDIFF(p_fecha_donacion, p_fecha_ultima_donacion);

    -- Verificar el tiempo desde la última donación según el sexo
    IF (p_sexo = 'H' AND p_dias_ultima_donacion < 90) OR 
       (p_sexo = 'M' AND p_dias_ultima_donacion < 120) THEN
        RETURN FALSE;
    END IF;

    -- Actualizar la fecha de la última donación
    UPDATE persona
    SET fecha = p_fecha_donacion
    WHERE id = p_id;

    RETURN TRUE;
END //

DELIMITER ;

SELECT apto_donar(2, '2023-12-19');
+-----------------------------+
| apto_donar(2, '2023-12-19') |
+-----------------------------+
|                           0 |
+-----------------------------+
1 row in set (0,00 sec)

SELECT apto_donar(3, '2023-09-11');
+-----------------------------+
| apto_donar(3, '2023-09-11') |
+-----------------------------+
|                           0 |
+-----------------------------+
1 row in set (0,00 sec)


```
   	 
2. Realiza una función que determine que persona es la que más donaciones ha realizado.

```sql
DELIMITER //
DROP FUNCTION IF EXISTS maximo_donador;
CREATE FUNCTION maximo_donador() RETURNS VARCHAR(100) DETERMINISTIC 
BEGIN
    DECLARE p_identificador VARCHAR(100);
    SELECT id_persona INTO p_identificador FROM total_donaciones ORDER BY cantidad_total DESC LIMIT 1; 
    RETURN p_identificador;
END //
DELIMITER ;

select maximo_donador();
+--------------------------------------+
| maximo_donador()                     |
+--------------------------------------+
| 337c4e9f-1e8a-11ef-857e-080027f4f295 |
+--------------------------------------+
1 row in set (0,00 sec)

```


## Triggers

1. Realiza un trigger que actualiza total_donaciones con cada una de las inserciones que se realicen en la tabla Persona.

```sql
DELIMITER //
DROP TRIGGER IF EXISTS actualizacion_persona;
CREATE TRIGGER actualizacion_persona
AFTER INSERT ON persona
FOR EACH ROW
BEGIN
    IF NEW.identificador IN (SELECT identificador FROM persona) THEN
        UPDATE total_donaciones SET cantidad_total = cantidad_total + 1 WHERE id_persona = NEW.identificador;
    ELSE
        INSERT INTO total_donaciones(id_persona, cantidad_total) VALUES (NEW.identificador, 1);
    END IF;
END;//
DELIMITER ; 

CALL insercion_tabla(10);

select * from total_donaciones where id_persona = '337c4e9f-1e8a-11ef-857e-080027f4f295';
+--------------------------------------+----------------+
| id_persona                           | cantidad_total |
+--------------------------------------+----------------+
| 337c4e9f-1e8a-11ef-857e-080027f4f295 |              1 |
+--------------------------------------+----------------+
1 row in set (0,00 sec)

INSERT INTO persona(identificador, peso, admitido, sexo, fecha) VALUES('337c4e9f-1e8a-11ef-857e-080027f4f295', 85, 'Si', 'M', NOW());

select * from total_donaciones where id_persona = '337c4e9f-1e8a-11ef-857e-080027f4f295';
+--------------------------------------+----------------+
| id_persona                           | cantidad_total |
+--------------------------------------+----------------+
| 337c4e9f-1e8a-11ef-857e-080027f4f295 |              2 |
+--------------------------------------+----------------+
1 row in set (0,00 sec)

```

2. Realiza un trigger que elimine todos los registros en la tabla persona cuando se elimine un registro de la tabla total_donaciones.

```sql
DELIMITER //
DROP TRIGGER IF EXISTS eliminar_registros;
CREATE TRIGGER eliminar_registros
AFTER DELETE ON total_donaciones
FOR EACH ROW
BEGIN
    DELETE FROM persona WHERE identificador = OLD.id_persona;
END //
DELIMITER ;

select * from persona where identificador = '337c4e9f-1e8a-11ef-857e-080027f4f295';
+----+--------------------------------------+------+----------+------+------------+
| id | identificador                        | peso | admitido | sexo | fecha      |
+----+--------------------------------------+------+----------+------+------------+
|  2 | 337c4e9f-1e8a-11ef-857e-080027f4f295 |   62 | No       | H    | 2023-12-19 |
| 21 | 337c4e9f-1e8a-11ef-857e-080027f4f295 |   85 | Si       | M    | 2024-05-30 |
+----+--------------------------------------+------+----------+------+------------+

DELETE FROM total_donaciones where id_persona = '337c4e9f-1e8a-11ef-857e-080027f4f295';

select * from persona where identificador = '337c4e9f-1e8a-11ef-857e-080027f4f295';
Empty set (0,00 sec)


```
