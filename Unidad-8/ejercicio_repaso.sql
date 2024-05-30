-- Función para calcular el factorial
DELIMITER //

CREATE FUNCTION do_factorial (num INT) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE counter INT DEFAULT 2;
    DECLARE _limit INT;
    SET _limit = num;

    WHILE counter < _limit DO
        SET num = num * counter;
        SET counter = counter + 1;
    END WHILE;
    RETURN num;
END //

DELIMITER ;
SELECT do_factorial(5);
/**
+-----------------+
| do_factorial(5) |
+-----------------+
|             120 |
+-----------------+
**/

-- Crear tabla para insertar con procedimiento
CREATE TABLE users (
    id INT AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(100),
    PRIMARY KEY (id)
);

DELIMITER //

CREATE PROCEDURE insertar_user (IN new_name VARCHAR(50), IN new_email VARCHAR(100))
BEGIN
    INSERT INTO users (name, email) VALUES (new_name, new_email);
END //

DELIMITER ;

CALL insertar_user ('Angel', 'angelxd@example.com');
SELECT * FROM users;
/**
+----+-------+---------------------+
| id | name  | email               |
+----+-------+---------------------+
|  1 | Angel | angelxd@example.com |
+----+-------+---------------------+
**/

-- Insertar con valores aleatorizados
DELIMITER //

CREATE PROCEDURE insertar_user_random (IN iterations INT, IN new_name VARCHAR(50), IN new_email VARCHAR(100))
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO users (name, email) VALUES (CONCAT(new_name, FLOOR(RAND(counter) * (1000 + 1) - 1)), new_email);
        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;

CALL insertar_user_random (10, 'Diego', 'diegobot@example.es');
SELECT * FROM users;
/**
+----+----------+---------------------+
| id | name     | email               |
+----+----------+---------------------+
|  1 | Angel    | angelxd@example.com |
|  2 | Diego154 | diegobot@example.es |
|  3 | Diego404 | diegobot@example.es |
|  4 | Diego655 | diegobot@example.es |
|  5 | Diego905 | diegobot@example.es |
|  6 | Diego155 | diegobot@example.es |
|  7 | Diego405 | diegobot@example.es |
|  8 | Diego655 | diegobot@example.es |
|  9 | Diego906 | diegobot@example.es |
| 10 | Diego155 | diegobot@example.es |
| 11 | Diego406 | diegobot@example.es |
+----+----------+---------------------+
**/

-- PROCEDIMIENTO DE UPDATE CON CURSOR
DELIMITER //

CREATE PROCEDURE cambiar_nombres (IN new_name VARCHAR(50), IN old_name VARCHAR(50))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE target_id INT;
    DECLARE cursor1 CURSOR FOR SELECT id FROM users WHERE name regexp old_name;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cursor1;
    update_loop: LOOP
        FETCH cursor1 INTO target_id;
        IF done THEN
            LEAVE update_loop;
        END IF;
        UPDATE users SET name = new_name WHERE id = target_id;
    END LOOP;
    CLOSE cursor1;

    SELECT * FROM users;
END //

DELIMITER ;

-- Funciona como debe ser
/**
+----+--------+---------------------+
| id | name   | email               |
+----+--------+---------------------+
|  1 | Angel  | angelxd@example.com |
|  2 | Pedro  | diegobot@example.es |
|  3 | Pedro  | diegobot@example.es |
|  4 | Pedro  | diegobot@example.es |
|  5 | Pedro  | diegobot@example.es |
|  6 | Pedro  | diegobot@example.es |
|  7 | Pedro  | diegobot@example.es |
|  8 | Pedro  | diegobot@example.es |
|  9 | Pedro  | diegobot@example.es |
| 10 | Pedro  | diegobot@example.es |
| 11 | Pedro  | diegobot@example.es |
+----+--------+---------------------+
**/
