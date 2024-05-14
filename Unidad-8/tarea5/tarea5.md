<div align="justify">

# Trabajo con procedimientos de generación de información

Dado el procedimiento base:

```sql
DELIMITER //

CREATE PROCEDURE my_loop(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        -- Coloca aquí el código que deseas ejecutar en cada iteración del bucle
        -- Por ejemplo, puedes imprimir el valor del contador
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

-- Llama al procedimiento 
CALL my_loop(5);
```

  1. Inserta cinco filas en la tabla empleados con nombres aleatorios generados usando la función CONCAT() junto con RAND().

```sql
DELIMITER //

CREATE PROCEDURE nombre_aleatorios(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        VALUES (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

call nombres_aleatorios(5);

select * from empleados;
+----+-----------------------------+---------+
| id | nombre                      | salario |
+----+-----------------------------+---------+
|  1 | Juan                        | 3000.00 |
|  2 | María                       | 3500.00 |
|  3 | Pedro                       | 3200.00 |
|  4 | Empleado0.3068884967890461  | 5308.00 |
|  5 | Empleado0.1471141615389978  | 5959.00 |
|  6 | Empleado0.03317287474234856 | 7449.00 |
|  7 | Empleado0.30625744285644724 | 5903.00 |
|  8 | Empleado0.5203358181941656  | 3105.00 |
+----+-----------------------------+---------+
8 rows in set (0,00 sec)
```

 2. Inserta tres filas en la tabla empleados con nombres aleatorios generados usando la función __UUID()__.

```sql
DELIMITER //

CREATE PROCEDURE aleatorio_nombre_uuid(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
    INSERT INTO empleados (nombre, salario)
    VALUES (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

call aleatorio_nombre_uuid(3);

select * from empleados
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.3068884967890461           | 5308.00 |
|  5 | Empleado0.1471141615389978           | 5959.00 |
|  6 | Empleado0.03317287474234856          | 7449.00 |
|  7 | Empleado0.30625744285644724          | 5903.00 |
|  8 | Empleado0.5203358181941656           | 3105.00 |
|  9 | faaed881-1244-11ef-8117-080027f4f295 | 3040.00 |
| 10 | fab007c7-1244-11ef-8117-080027f4f295 | 3885.00 |
| 11 | fab06d07-1244-11ef-8117-080027f4f295 | 8306.00 |
+----+--------------------------------------+---------+
11 rows in set (0,00 sec)
```

  3. Inserta dos filas en la tabla empleados con nombres aleatorios generados usando la función RAND() junto con ORDER BY RAND().

```sql
  DELIMITER //

CREATE PROCEDURE aleatorio_nombres(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
      INSERT INTO empleados (nombre, salario)
      SELECT CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000
      FROM (SELECT 1 UNION SELECT 2) AS sub
      ORDER BY RAND()
      LIMIT 2;
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

call aleatorio_nombres(1);

select * from empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.3068884967890461           | 5308.00 |
|  5 | Empleado0.1471141615389978           | 5959.00 |
|  6 | Empleado0.03317287474234856          | 7449.00 |
|  7 | Empleado0.30625744285644724          | 5903.00 |
|  8 | Empleado0.5203358181941656           | 3105.00 |
|  9 | faaed881-1244-11ef-8117-080027f4f295 | 3040.00 |
| 10 | fab007c7-1244-11ef-8117-080027f4f295 | 3885.00 |
| 11 | fab06d07-1244-11ef-8117-080027f4f295 | 8306.00 |
| 12 | Empleado0.04082512021141604          | 6779.00 |
| 13 | Empleado0.8050510983961179           | 4588.00 |
+----+--------------------------------------+---------+
13 rows in set (0,00 sec)
```

 4. Inserta cuatro filas en la tabla empleados con nombres aleatorios generados usando la función SUBSTRING_INDEX(UUID(), '-', -1).

```sql
DELIMITER //

CREATE PROCEDURE substring_aleatorio(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
    INSERT INTO empleados (nombre, salario)
    VALUES (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

call subtring_aleatorio(4);

select * from empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.3068884967890461           | 5308.00 |
|  5 | Empleado0.1471141615389978           | 5959.00 |
|  6 | Empleado0.03317287474234856          | 7449.00 |
|  7 | Empleado0.30625744285644724          | 5903.00 |
|  8 | Empleado0.5203358181941656           | 3105.00 |
|  9 | faaed881-1244-11ef-8117-080027f4f295 | 3040.00 |
| 10 | fab007c7-1244-11ef-8117-080027f4f295 | 3885.00 |
| 11 | fab06d07-1244-11ef-8117-080027f4f295 | 8306.00 |
| 12 | Empleado0.04082512021141604          | 6779.00 |
| 13 | Empleado0.8050510983961179           | 4588.00 |
| 15 | 080027f4f295                         | 8915.00 |
| 16 | 080027f4f295                         | 6237.00 |
| 17 | 080027f4f295                         | 2441.00 |
| 18 | 080027f4f295                         | 7494.00 |
+----+--------------------------------------+---------+
17 rows in set (0,00 sec)
```
 
 5. Inserta seis filas en la tabla empleados con nombres aleatorios generados usando la función RAND() y una semilla diferente.

```sql
DELIMITER //

CREATE PROCEDURE al_nombres(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
    INSERT INTO empleados (nombre, salario)
    VALUES (CONCAT('Empleado', RAND(1)), FLOOR(RAND(1) * (10000 - 2000 + 1)) + 2000);
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

call al_nombres(6);

select * from empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.3068884967890461           | 5308.00 |
|  5 | Empleado0.1471141615389978           | 5959.00 |
|  6 | Empleado0.03317287474234856          | 7449.00 |
|  7 | Empleado0.30625744285644724          | 5903.00 |
|  8 | Empleado0.5203358181941656           | 3105.00 |
|  9 | faaed881-1244-11ef-8117-080027f4f295 | 3040.00 |
| 10 | fab007c7-1244-11ef-8117-080027f4f295 | 3885.00 |
| 11 | fab06d07-1244-11ef-8117-080027f4f295 | 8306.00 |
| 12 | Empleado0.04082512021141604          | 6779.00 |
| 13 | Empleado0.8050510983961179           | 4588.00 |
| 15 | 080027f4f295                         | 8915.00 |
| 16 | 080027f4f295                         | 6237.00 |
| 17 | 080027f4f295                         | 2441.00 |
| 18 | 080027f4f295                         | 7494.00 |
| 19 | Empleado0.40540353712197724          | 5243.00 |
| 20 | Empleado0.40540353712197724          | 5243.00 |
| 21 | Empleado0.40540353712197724          | 5243.00 |
| 22 | Empleado0.40540353712197724          | 5243.00 |
| 23 | Empleado0.40540353712197724          | 5243.00 |
| 24 | Empleado0.40540353712197724          | 5243.00 |
+----+--------------------------------------+---------+
23 rows in set (0,00 sec)
```

Crea cada uno de los procedimientos, maximixando el número de parámetros de entrada necesarios, por ejemplo: ___nombre, salario, e id__.

___Crea el procedimiento, la invocación, y el estado de la tabla después de la invocación de este___.

</div>
