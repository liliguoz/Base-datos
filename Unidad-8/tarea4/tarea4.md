## Crear la base de datos
```sql
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

-- Crear la tabla empleados
CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    salario DECIMAL(10, 2)
);

-- Insertar algunos datos de ejemplo
INSERT INTO empleados (nombre, salario) VALUES
('Juan', 3000.00),
('María', 3500.00),
('Pedro', 3200.00);
```

1. Escribe un procedimiento almacenado que copie los nombres de todos los empleados cuyo salario sea superior a 3000 en una nueva tabla llamada 'empleados_destino'. Es necesario crear la tabla empleados_destiono.
```sql
CREATE TABLE empleados_destino (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100)
);

DELIMITER //
CREATE PROCEDURE copia_nombres(IN salary_limit DECIMAL(10,2))
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE cur CURSOR FOR SELECT nombre FROM empleados WHERE salario>salary_limit;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_nombre;
          IF done THEN
              LEAVE read_loop;
          END IF;
          INSERT INTO empleados_destino (nombre) VALUES (emp_nombre);
      END LOOP;
      CLOSE cur;
  END //
Query OK, 0 rows affected (0,01 sec)
DELIMITER ;

CALL copia_nombres(3000);

SELECT * from empleados_destino;
+----+--------+
| id | nombre |
+----+--------+
|  1 | María  |
|  2 | Pedro  |
+----+--------+
```

2. Escribe un procedimiento almacenado que seleccione los empleados cuyos nombres contienen la letra 'a' y aumente sus salarios en un 10%.

```sql
select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3000.00 |
|  2 | María  | 3675.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+

DELIMITER //
CREATE PROCEDURE aumento_salarios()
   BEGIN
       DECLARE done INT DEFAULT FALSE;
       DECLARE emp_id INT;
       DECLARE emp_nombre VARCHAR(100);
       DECLARE emp_salario DECIMAL(10, 2);
       DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados WHERE nombre REGEXP 'a';
       DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
 
       OPEN cur;
       read_loop: LOOP
           FETCH cur INTO emp_id, emp_nombre, emp_salario;
           IF done THEN
               LEAVE read_loop;
           END IF;
           UPDATE empleados SET salario = salario * (1 + 10 / 100) WHERE id = emp_id;
       END LOOP;
       CLOSE cur;
   END //
Query OK, 0 rows affected (0,01 sec)
   DELIMITER ;

 CALL aumento_salarios();
Query OK, 0 rows affected (0,02 sec)

mysql> select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3300.00 |
|  2 | María  | 4042.50 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
```

3. Escribe un procedimiento almacenado que seleccione empleados cuyos IDs estén en un rango específico, por ejemplo, entre 2 y 3.

```sql
   DELIMITER //
   CREATE PROCEDURE ids(IN min INT, IN max INT)
   BEGIN
       DECLARE done INT DEFAULT FALSE;
       DECLARE emp_id INT;
       DECLARE cur CURSOR FOR SELECT id FROM empleados WHERE id BETWEEN min and max;
       DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
 
       OPEN cur;
       read_loop: LOOP
           FETCH cur INTO emp_id;
           IF done THEN
               LEAVE read_loop;
           END IF;
           SELECT id from empleados where id = emp_id;
       END LOOP
       CLOSE cur;
   END //
Query OK, 0 rows affected (0,01 sec)
   DELIMITER ;

CALL ids(1, 2);
+----+
| id |
+----+
|  1 |
+----+
1 row in set (0,00 sec)

+----+
| id |
+----+
|  2 |
+----+
1 row in set (0,00 sec)

Query OK, 0 rows affected (0,00 sec)
```

4. Escribe un procedimiento almacenado que elimine todos los empleados cuyo salario esté entre 2000 y 2500.

```sql
```

5. Escribe un procedimiento almacenado que aumente el salario de un empleado específico cuyo nombre se pasa como parámetro en un 20%.

```sql
   DELIMITER //
   CREATE PROCEDURE name_dos(IN name VARCHAR(50))
   BEGIN
       DECLARE done INT DEFAULT FALSE;
       DECLARE emp_id INT;
       DECLARE emp_nombre VARCHAR(100);
       DECLARE emp_salario DECIMAL(10, 2);
       DECLARE cur CURSOR FOR SELECT id FROM empleados WHERE nombre = name;
       DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
 
       OPEN cur;
       read_loop: LOOP
           FETCH cur INTO emp_id;
           IF done THEN
               LEAVE read_loop;
           END IF;
```
