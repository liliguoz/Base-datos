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
DELIMITER ;

CALL copia_nombres(3000);

SELECT * from empleados_destino;
/**
+----+--------+
| id | nombre |
+----+--------+
|  1 | María  |
|  2 | Pedro  |
+----+--------+
**/
```

