¿Sabías que la mayoría de los adultos sanos pueden ser donantes? Aunque existen ciertas condiciones que debes cumplir para realizar con éxito una donación. Descubre los requisitos básicos para donar sangre.

Para la poder donar sangre se deben cumplir varias condiciones:

- Tener un peso superior a 50Kg.
- No haber donado en un periodo anterior a 90 días en caso de ser hombre y 120 días en caso de mujer.

Teniendo en cuenta esta información se pide:

- Crea una base datos llamada donación.

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
    identificador VARCHAR(255) NOT NULL,
    peso INT NOT NULL,
    admitido ENUM('Si', 'No') NOT NULL,
    sexo ENUM('H', 'M') NOT NULL,
    fecha DATE NOT NULL
);
```

Se pide:

## Procedimientos:

1. Realizar un procedimiento que realice la inserción de datos aleatorios en la tabla. El procedimiento debe de recibir como parámetro de entrada, al menos, el número de registros que se desea insertar y se debe de lanzar, al menos, en dos ocasiones, para verificar su correcto funcionamiento. Los datos deben de ser aleatorios, es decir, en cada inserción de debe de auto generar o seleccionar uno al azar, de los campos requeridos.

```sql
DELIMITER //

CREATE PROCEDURE insertar_datos_aleatorios(IN num_registros INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE identificador_aleatorio VARCHAR(255);
    DECLARE peso_aleatorio INT;
    DECLARE admitido_aleatorio ENUM('Si', 'No');
    DECLARE sexo_aleatorio ENUM('H', 'M');
    DECLARE fecha_aleatoria DATE;

     --Loop para insertar registros aleatorios
    WHILE i < num_registros DO
        SET identificador_aleatorio = CONCAT('ID', LPAD(FLOOR(RAND() * 10000), 4, '0'));
        SET peso_aleatorio = FLOOR(50 + (RAND() * 50));  Peso entre 50 y 100 kg
        SET admitido_aleatorio = IF(RAND() > 0.5, 'Si', 'No');
        SET sexo_aleatorio = IF(RAND() > 0.5, 'H', 'M');
        SET fecha_aleatoria = DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 365) DAY);  Fecha dentro del último año

        INSERT INTO persona (identificador, peso, admitido, sexo, fecha_ultima_donacion)
        VALUES (identificador_aleatorio, peso_aleatorio, admitido_aleatorio, sexo_aleatorio, fecha_aleatoria);

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;
```

2. Realiza un procedimiento que permita actualizar el la fecha de última donación, teniendo como parámetro de entrada el identificador de la persona, y una fecha.

```sql
DELIMITER //

CREATE PROCEDURE actualizar_fecha_donacion(
    IN p_identificador VARCHAR(255),
    IN p_nueva_fecha DATE
)
BEGIN
    UPDATE persona
    SET fecha_ultima_donacion = p_nueva_fecha
    WHERE identificador = p_identificador;
END //

DELIMITER ;


CALL actualizar_fecha_donacion('ID0001', '2024-05-27');

SELECT * FROM persona WHERE identificador = 'ID0001';
```

3. Crea un procedimiento llamado CalcularTotalDonaciones que calcule la cantidad total de donaciones realizadas por cada persona y la almacene en una tabla llamada total_donaciones. La tabla total_donaciones debe tener dos columnas: id_persona (texto) y cantidad_total (integer).

```sql
drop table if exists total_donaciones;

 Crear la tabla total_donaciones
CREATE TABLE total_donaciones (
    id_persona VARCHAR(255) PRIMARY KEY,
    cantidad_total INT
);

DELIMITER //

CREATE PROCEDURE CalcularTotalDonaciones()
BEGIN
     --Eliminar los registros existentes en la tabla total_donaciones
    TRUNCATE TABLE total_donaciones;
    
     Insertar los registros calculados en la tabla total_donaciones
    INSERT INTO total_donaciones (id_persona, cantidad_total)
    SELECT identificador, COUNT(*) AS cantidad_total
    FROM persona
    GROUP BY identificador;
END //

DELIMITER ;

CALL CalcularTotalDonaciones();

SELECT * FROM total_donaciones;
```

4. Crea un procedimiento que me permita eliminar una persona de la tabla total_donaciones.

```sql
DELIMITER //

CREATE PROCEDURE EliminarPersonaTotalDonaciones(
    IN p_identificador VARCHAR(255)
)
BEGIN
    DELETE FROM total_donaciones
    WHERE id_persona = p_identificador;
END //

DELIMITER ;

CALL EliminarPersonaTotalDonaciones('ID0001');

SELECT * FROM total_donaciones WHERE id_persona = 'ID0001';
```

## Funciones:

1. Realiza una función que determine si una persona almacenada en la tabla persona puede realizar una donación. Para ello la función recibe como parámetro de entrada el identificador de esta persona, y una fecha de donación. Revisa las condiciones para que una persona pueda o no donar. Posteriormente actualice el valor de la última donación de la persona indicada con el parámetro de entrada.

```sql
DELIMITER //

CREATE FUNCTION PuedeDonar(
    p_identificador VARCHAR(255),
    p_fecha_donacion DATE
) RETURNS BOOLEAN
BEGIN
    DECLARE v_peso INT;
    DECLARE v_sexo ENUM('H', 'M');
    DECLARE v_fecha_ultima_donacion DATE;
    DECLARE v_dias_desde_ultima_donacion INT;

     --Obtener los detalles de la persona
    SELECT peso, sexo, fecha_ultima_donacion
    INTO v_peso, v_sexo, v_fecha_ultima_donacion
    FROM persona
    WHERE identificador = p_identificador;

     --Verificar si la persona cumple con los requisitos de peso
    IF v_peso < 50 THEN
        RETURN FALSE;
    END IF;

     --Calcular los días desde la última donación
    SET v_dias_desde_ultima_donacion = DATEDIFF(p_fecha_donacion, v_fecha_ultima_donacion);

     Verificar el tiempo mínimo desde la última donación
    IF (v_sexo = 'H' AND v_dias_desde_ultima_donacion < 90) OR 
       (v_sexo = 'M' AND v_dias_desde_ultima_donacion < 120) THEN
        RETURN FALSE;
    END IF;

     --Actualizar la fecha de última donación si cumple con los requisitos
    UPDATE persona
    SET fecha_ultima_donacion = p_fecha_donacion
    WHERE identificador = p_identificador;

    RETURN TRUE;
END //

DELIMITER ;
```
   	 
2. Realiza una función que determine que persona es la que más donaciones ha realizado.

```sql
DELIMITER //

CREATE FUNCTION PersonaConMasDonaciones() RETURNS VARCHAR(255)
BEGIN
    DECLARE v_id_persona VARCHAR(255);

     --Encontrar la persona con más donaciones
    SELECT id_persona
    INTO v_id_persona
    FROM donaciones
    GROUP BY id_persona
    ORDER BY COUNT(*) DESC
    LIMIT 1;

    RETURN v_id_persona;
END //

DELIMITER ;
```


## Triggers

1. Realiza un trigger que actualiza total_donaciones con cada una de las inserciones que se realicen en la tabla Persona.

```sql

 Crear la tabla total_donaciones si no existe
CREATE TABLE IF NOT EXISTS total_donaciones (
    id_persona VARCHAR(255) PRIMARY KEY,
    cantidad_total INT
);

DELIMITER //

 --Crear el trigger para actualizar total_donaciones después de insertar en persona
CREATE TRIGGER after_insert_persona
AFTER INSERT ON persona
FOR EACH ROW
BEGIN
    DECLARE v_count INT;

     --Contar el número de donaciones actuales de la persona en la tabla persona
    SELECT COUNT(*)
    INTO v_count
    FROM persona
    WHERE identificador = NEW.identificador;

     --Insertar o actualizar la tabla total_donaciones con la cantidad total de donaciones
    INSERT INTO total_donaciones (id_persona, cantidad_total)
    VALUES (NEW.identificador, v_count)
    ON DUPLICATE KEY UPDATE cantidad_total = v_count;
END //

DELIMITER ;

 --Insertar registros en la tabla persona para verificar el trigger
INSERT INTO persona (identificador, peso, admitido, sexo, fecha_ultima_donacion)
VALUES ('ID0001', 60, 'Si', 'H', '2024-01-01'),
       ('ID0002', 55, 'Si', 'M', '2024-02-01');

 --Verificar el contenido de la tabla total_donaciones
SELECT * FROM total_donaciones;
```

2. Realiza un trigger que elimine todos los registros en la tabla persona cuando se elimine un registro de la tabla total_donaciones.

```sql
DELIMITER //

CREATE TRIGGER after_delete_total_donaciones
AFTER DELETE ON total_donaciones
FOR EACH ROW
BEGIN
     --Eliminar todos los registros de la persona correspondiente en la tabla persona
    DELETE FROM persona
    WHERE identificador = OLD.id_persona;
END //

DELIMITER ;
```
