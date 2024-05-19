
<div align="justify">

# ¿El salario?

<div align="center">
<img width="400" src="https://www.gestion.org/wp-content/uploads/2017/08/que-integra-el-salario-base-de-cotizacion-768x452.jpg"/>

</div>

Una de las preguntas más comunes que se hacen las personas cuando empiezan su vida laboral, suele ser qué es el salario base. Y es que es normal que la gente ande un poco confundida ya que, si no tienes conocimientos en este campo, es fácil hacerse un lío con términos como:
- Salario base.
- Base reguladora.
- Salario bruto.
- Salario neto.
- Etc.

Teniendo en cuenta esta información se pide:
- Crea una base datos llamada __salario__.
    - [Crear BBDD en MySql](https://dev.mysql.com/doc/refman/8.0/en/creating-database.html).
- Crea una tabla llamada persona con los siguientes campos:
    - Identificador. (Texto)__(PK)__.
    - Nombre (Texto).
    - Salario_base. (__Escoge el tipo de dato__).
    - Subsidio(__Escoge el tipo de dato__).
    - Salud(__Escoge el tipo de dato__).
    - Pensión(__Escoge el tipo de dato__).
    - Bono(__Escoge el tipo de dato__).
    - Integral(__Escoge el tipo de dato__).

```sql
create database if not exists salario;

use salario;

CREATE TABLE persona(
    id VARCHAR(100) PRIMARY KEY,
    nombre VARCHAR(250),
    salario_base INT,
    subsidio DECIMAL,
    salud DECIMAL,
    pension DECIMAL,
    bono DECIMAL,
    integral DECIMAL
);
```

- Creación de un __procedimiento__ de forma aleatoria con las siguientes características:
    - Parámetro de entrada el número de registros (_Mínimo 10, y realiza la prueba varias veces_). 

```sql
DELIMITER //
DROP PROCEDURE IF EXISTS insertar_datos;

CREATE PROCEDURE insertar_datos(IN iterations INT, IN prefix VARCHAR(10), IN base_salario INT, IN max_salario INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE random_id VARCHAR(20);
    DECLARE random_nombre VARCHAR(100);
    DECLARE random_salario_base DECIMAL(10,2);
    DECLARE random_subsidio DECIMAL(10,2);
    DECLARE random_salud DECIMAL(10,2);
    DECLARE random_pension DECIMAL(10,2);
    DECLARE random_bono DECIMAL(10,2);
    DECLARE random_integral DECIMAL(10,2);

    WHILE counter < iterations DO
        SET random_id = SUBSTRING(UUID(), 1, 20);
        SET random_nombre = CONCAT(prefix, ROUND(RAND() * 1000));
        SET random_salario_base = FLOOR(RAND() * (max_salario - base_salario + 1)) + base_salario;
        SET random_subsidio = random_salario_base * 0.07;
        SET random_salud = random_salario_base * 0.04;
        SET random_pension = random_salario_base * 0.04;
        SET random_bono = random_salario_base * 0.08;
        SET random_integral = random_salario_base - random_salud - random_pension + random_bono + random_subsidio;
        
        INSERT INTO persona(id, nombre, salario_base, subsidio, salud, pension, bono, integral) 
        VALUES (random_id, random_nombre, random_salario_base, random_subsidio, random_salud, random_pension, random_bono, random_integral);
        
        SET counter = counter + 1;
    END WHILE;
END //
//
DELIMITER ;

CALL insertar_datos('10', 'lili', '2000', '3000');

select * from persona;
+----------------------+---------+--------------+----------+-------+---------+------+----------+
| id                   | nombre  | salario_base | subsidio | salud | pension | bono | integral |
+----------------------+---------+--------------+----------+-------+---------+------+----------+
| 3ba16160-162a-11ef-9 | lili520 |         2070 |      145 |    83 |      83 |  166 |     2215 |
| 3ba2c8e8-162a-11ef-9 | lili789 |         2737 |      192 |   109 |     109 |  219 |     2929 |
| 3ba38527-162a-11ef-9 | lili315 |         2366 |      166 |    95 |      95 |  189 |     2532 |
| 3ba4088c-162a-11ef-9 | lili883 |         2319 |      162 |    93 |      93 |  186 |     2481 |
| 3ba4a78f-162a-11ef-9 | lili948 |         2781 |      195 |   111 |     111 |  222 |     2976 |
| 3ba55e9c-162a-11ef-9 | lili58  |         2951 |      207 |   118 |     118 |  236 |     3158 |
| 3ba60432-162a-11ef-9 | lili579 |         2041 |      143 |    82 |      82 |  163 |     2184 |
| 3ba6a65a-162a-11ef-9 | lili471 |         2229 |      156 |    89 |      89 |  178 |     2385 |
| 3ba787cf-162a-11ef-9 | lili734 |         2982 |      209 |   119 |     119 |  239 |     3191 |
| 3ba82538-162a-11ef-9 | lili704 |         2578 |      180 |   103 |     103 |  206 |     2758 |
+----------------------+---------+--------------+----------+-------+---------+------+----------+
10 rows in set (0,00 sec)
```
- Cree una función para cada punto teniendo en cuenta que:
- Función __subsidio_transporte__: El subsidio de transporte equivale al __7%__ al salario básico. _Actualiza el valor en la tabla_.

```sql
CREATE FUNCTION generar_subsidio(salario_base DECIMAL(10,2)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salario_base * 0.07;
END //
```
- Función __salud__: La salud que corresponde al __4%__ al salario básico.  _Actualiza el valor en la tabla_.

```sql
CREATE FUNCTION generar_salud(salario_base DECIMAL(10,2)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salario_base * 0.04;
END //
```

- Función __pension__: La pensión que corresponde al __4%__ al salario básico.  _Actualiza el valor en la tabla_.

```sql
CREATE FUNCTION generar_pension(salario_base DECIMAL(10,2)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salario_base * 0.04;
END //
```
- Función __bono__: Un bono que corresponde al __8%__ al salario básico. _Actualiza el valor en la tabla_. 

```sql
CREATE FUNCTION generar_bono(salario_base DECIMAL(10,2)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salario_base * 0.08;
END //
```
- Función __integral__: El salario integral es la ___suma del salario básico - salud - pension + bono + sub de transporte___. _Actualiza el valor en la tabla_.

```sql
CREATE FUNCTION salario_integral(salario_base DECIMAL(10,2), salud DECIMAL(10,2), pension DECIMAL(10,2), bono DECIMAL(10,2), subsidio DECIMAL(10,2)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salario_base - salud - pension + bono + subsidio;
END //

DELIMITER ;
```
- ___Crea cada uno de las funciones anteriores para una persona en específico___.
- El parámetro de entrada debe de ser un identificar de la persona.


</div>
