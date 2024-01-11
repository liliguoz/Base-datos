<h1 align="center"> TAREA 2 SQLITE3 </h1>

<div align="center">
<img src="https://sqlite.org/forum/logo?id=603c155e" />
</div>

## Paso 1:
Para empezar tenemos que crear la tarea en la cuál podremos hacer la práctica:

```sql
sqlite3 tarea2.db
````

Asimismo, se deberá crear en esta tarea dos tablas, una llamada *propietarios* y la otra será la de *vehículos*.

Comenzaremos creando la tabla de propietarios mediante el siguiente comando:

```sql
create table propietarios (
id INTEGER PRIMARY KEY AUTOINCREMENT,
nombre TEXT NOT NULL,
apellido TEXT NOT NULL,
dni TEXT UNICODE );
```

Seguidamente, procederemos a añadir los datos en las celdas:

```sql
INSERT INTO propietarios (nombre, apellido, dni)
VALUES 
('Juan', 'Perez', '12345678A'),
('María', 'Lopez', '87456321B'),
('Carlos', 'Ruiz', '11111111C'),
('Laura', 'Gomez', '22222222D'),
('Pedro', 'Martinez', '33333333E'),
('Ana', 'Fernandez', '44444444F'),
('Diego', 'Sanchez', '55555555G'),
('Sofia', 'Torres', '66666666H'),
('Javier', 'Leon', '77777777I'),
('Lucia', 'Castillo', '88888888J'),
('Luis', 'González', '99999999K'),
('Marta', 'Diaz', '10101010L'),
('Victor', 'Vargas', '11111112L'),
('Elena', 'Castro', '12121212N'),
('Roberto', 'Blanco', '13131313O'),
('Natalia', 'Paredes', '14141414P'),
('Fernando', 'Herrera', '15151515Q'),
('Clara', 'Soto', '16161616R'),
('Sergio', 'Mendoza', '17171717S'),
('Patricia', 'Navarro', '18181818T');
```
Se nos creará con esto la siguiente tabla que dará como resultado lo siguiente:

```sql
+----+----------+-----------+-----------+
| id |  nombre  | apellido  |    dni    |
+----+----------+-----------+-----------+
| 1  | Juan     | Perez     | 12345678A |
| 2  | María    | Lopez     | 87456321B |
| 3  | Carlos   | Ruiz      | 11111111C |
| 4  | Laura    | Gomez     | 22222222D |
| 5  | Pedro    | Martinez  | 33333333E |
| 6  | Ana      | Fernandez | 44444444F |
| 7  | Diego    | Sanchez   | 55555555G |
| 8  | Sofia    | Torres    | 66666666H |
| 9  | Javier   | Leon      | 77777777I |
| 10 | Lucia    | Castillo  | 88888888J |
| 11 | Luis     | González  | 99999999K |
| 12 | Marta    | Diaz      | 10101010L |
| 13 | Victor   | Vargas    | 11111112L |
| 14 | Elena    | Castro    | 12121212N |
| 15 | Roberto  | Blanco    | 13131313O |
| 16 | Natalia  | Paredes   | 14141414P |
| 17 | Fernando | Herrera   | 15151515Q |
| 18 | Clara    | Soto      | 16161616R |
| 19 | Sergio   | Mendoza   | 17171717S |
| 20 | Patricia | Navarro   | 18181818T |
+----+----------+-----------+-----------+
```

Procederemos ahora a comenzar a realizar la tabla de vehículos:

```sql
create table vehículos (
id INTEGER PRIMARY KEY AUTOINCREMENT,
marca TEXT NOT NULL, 
modelo TEXT NOT NULL,
año INTEGER NOT NULL, 
id_propietario INTEGER	references propietarios(id)
);
```
Además procederemos a insertar los datos de este en las celdas:

```sql
INSERT INTO vehículos (marca, modelo, año, id_propietario)
VALUES (‘Ford’, ‘Fiesta’, ‘2019’, ‘1’),
(‘Toyota’, ‘Corolla’, ‘2018’, ‘2’),
(‘Nissan’, ‘Sentra’, ‘2020’, ‘3’),
(‘Chevrolet’, ‘Spark’, ‘2017’, ‘4’),
(‘Honda’, ‘Civic’, ‘2016’, ‘5’),
(‘Ford’, ‘Mustang’, ‘2021’, ‘6’),
(‘Toyota’, ‘RAV4’, ‘2019’, ‘7’),
(‘Volkswagen’, ‘Golf’, ‘2020’, ‘8’),
(‘Honda’, ‘CR-V’, ‘2018’, ‘9’),
(‘Nissan’ , ‘Altima’, ‘2017’, ‘10’),
(‘Chevrolet’, ‘Malibu’, ‘2019’, ‘11’),
(‘Toyota’, ‘Camry’, ‘2020’, ‘12’),
(‘Honda’, ‘Accord’, ‘2018’, ‘13’),
(‘Ford’, ‘Explorer’, ‘2021’, ‘14’),
(‘Nissan’, ‘Rogue’, ‘2017’, ‘15’),
(‘Volkswagen’, ‘Jetta’, ‘2019’, ‘16’),
(‘Chevrolet’, ‘Equinox’, ‘2018’, ‘17’),
(‘Toyota’, ‘Highlander’, ‘2020’, ‘18’),
(‘Toyota’, ‘Odyssey’, ‘2016’, ‘19’),
(‘Nissan’, ‘Murano’, ‘2019’, ‘20’);
```

Se nos formará esta tabla:
```sql
+----+------------+------------+------+----------------+
| id |   marca    |   modelo   | año  | id_propietario |
+----+------------+------------+------+----------------+
| 1  | Ford       | Fiesta     | 2019 | 1              |
| 2  | Toyota     | Corolla    | 2018 | 2              |
| 3  | Nissan     | Sentra     | 2020 | 3              |
| 4  | Chevrolet  | Spark      | 2017 | 4              |
| 5  | Honda      | Civic      | 2016 | 5              |
| 6  | Ford       | Mustang    | 2021 | 6              |
| 7  | Toyota     | RAV4       | 2019 | 7              |
| 8  | Volkswagen | Golf       | 2020 | 8              |
| 9  | Honda      | CR-V       | 2018 | 9              |
| 10 | Nissan     | Altima     | 2017 | 10             |
| 11 | Chevrolet  | Malibu     | 2019 | 11             |
| 12 | Toyota     | Camry      | 2020 | 12             |
| 13 | Honda      | Accord     | 2018 | 13             |
| 14 | Ford       | Explorer   | 2021 | 14             |
| 15 | Nissan     | Rogue      | 2017 | 15             |
| 16 | Volkswagen | Jetta      | 2019 | 16             |
| 17 | Chevrolet  | Equinox    | 2018 | 17             |
| 18 | Toyota     | Highlander | 2020 | 18             |
| 19 | Toyota     | Odyssey    | 2016 | 19             |
| 20 | Nissan     | Murano     | 2019 | 20             |
+----+------------+------------+------+----------------+
```
## Paso 2:
- Seleccionar todos los propietarios.
```sql
SELECT * FROM propietarios WHERE propietarios.id;
```
```sql
+----+----------+-----------+-----------+
| id |  nombre  | apellido  |    dni    |
+----+----------+-----------+-----------+
| 1  | Juan     | Perez     | 12345678A |
| 2  | María    | Lopez     | 87456321B |
| 3  | Carlos   | Ruiz      | 11111111C |
| 4  | Laura    | Gomez     | 22222222D |
| 5  | Pedro    | Martinez  | 33333333E |
| 6  | Ana      | Fernandez | 44444444F |
| 7  | Diego    | Sanchez   | 55555555G |
| 8  | Sofia    | Torres    | 66666666H |
| 9  | Javier   | Leon      | 77777777I |
| 10 | Lucia    | Castillo  | 88888888J |
| 11 | Luis     | González  | 99999999K |
| 12 | Marta    | Diaz      | 10101010L |
| 13 | Victor   | Vargas    | 11111112L |
| 14 | Elena    | Castro    | 12121212N |
| 15 | Roberto  | Blanco    | 13131313O |
| 16 | Natalia  | Paredes   | 14141414P |
| 17 | Fernando | Herrera   | 15151515Q |
| 18 | Clara    | Soto      | 16161616R |
| 19 | Sergio   | Mendoza   | 17171717S |
| 20 | Patricia | Navarro   | 18181818T |
+----+----------+-----------+-----------+
```
- Listar todos los vehículos.
```sql
SELECT * FROM vehículos WHERE vehículos.id;
```
```sql
+----+------------+------------+------+----------------+
| id |   marca    |   modelo   | año  | id_propietario |
+----+------------+------------+------+----------------+
| 1  | Ford       | Fiesta     | 2019 | 1              |
| 2  | Toyota     | Corolla    | 2018 | 2              |
| 3  | Nissan     | Sentra     | 2020 | 3              |
| 4  | Chevrolet  | Spark      | 2017 | 4              |
| 5  | Honda      | Civic      | 2016 | 5              |
| 6  | Ford       | Mustang    | 2021 | 6              |
| 7  | Toyota     | RAV4       | 2019 | 7              |
| 8  | Volkswagen | Golf       | 2020 | 8              |
| 9  | Honda      | CR-V       | 2018 | 9              |
| 10 | Nissan     | Altima     | 2017 | 10             |
| 11 | Chevrolet  | Malibu     | 2019 | 11             |
| 12 | Toyota     | Camry      | 2020 | 12             |
| 13 | Honda      | Accord     | 2018 | 13             |
| 14 | Ford       | Explorer   | 2021 | 14             |
| 15 | Nissan     | Rogue      | 2017 | 15             |
| 16 | Volkswagen | Jetta      | 2019 | 16             |
| 17 | Chevrolet  | Equinox    | 2018 | 17             |
| 18 | Toyota     | Highlander | 2020 | 18             |
| 19 | Toyota     | Odyssey    | 2016 | 19             |
| 20 | Nissan     | Murano     | 2019 | 20             |
+----+------------+------------+------+----------------+
```
- Seleccionar solo los nombres y apellidos de los propietarios.

```sql
SELECT nombre, apellido FROM propietarios;
```
```sql
+----------+-----------+
|  nombre  | apellido  |
+----------+-----------+
| Juan     | Perez     |
| María    | Lopez     |
| Carlos   | Ruiz      |
| Laura    | Gomez     |
| Pedro    | Martinez  |
| Ana      | Fernandez |
| Diego    | Sanchez   |
| Sofia    | Torres    |
| Javier   | Leon      |
| Lucia    | Castillo  |
| Luis     | González  |
| Marta    | Diaz      |
| Victor   | Vargas    |
| Elena    | Castro    |
| Roberto  | Blanco    |
| Natalia  | Paredes   |
| Fernando | Herrera   |
| Clara    | Soto      |
| Sergio   | Mendoza   |
| Patricia | Navarro   |
+----------+-----------+
```
- Listar todas las marcas y modelos de los vehículos.
```sql
SELECT marca, modelo FROM vehículos;
```
```sql
+------------+------------+
|   marca    |   modelo   |
+------------+------------+
| Ford       | Fiesta     |
| Toyota     | Corolla    |
| Nissan     | Sentra     |
| Chevrolet  | Spark      |
| Honda      | Civic      |
| Ford       | Mustang    |
| Toyota     | RAV4       |
| Volkswagen | Golf       |
| Honda      | CR-V       |
| Nissan     | Altima     |
| Chevrolet  | Malibu     |
| Toyota     | Camry      |
| Honda      | Accord     |
| Ford       | Explorer   |
| Nissan     | Rogue      |
| Volkswagen | Jetta      |
| Chevrolet  | Equinox    |
| Toyota     | Highlander |
| Toyota     | Odyssey    |
| Nissan     | Murano     |
+------------+------------+
```
- Seleccionar solo los propietarios con apellido "Perez".

```sql
SELECT * FROM propietarios WHERE apellido = 'Perez';
```
```sql
+----+--------+----------+-----------+
| id | nombre | apellido |    dni    |
+----+--------+----------+-----------+
| 1  | Juan   | Perez    | 12345678A |
+----+--------+----------+-----------+
```
- Listar todos los vehículos con año 2019.
```sql
SELECT * FROM vehículos WHERE año = '2019';
```
```sql
+----+------------+--------+------+----------------+
| id |   marca    | modelo | año  | id_propietario |
+----+------------+--------+------+----------------+
| 1  | Ford       | Fiesta | 2019 | 1              |
| 7  | Toyota     | RAV4   | 2019 | 7              |
| 11 | Chevrolet  | Malibu | 2019 | 11             |
| 16 | Volkswagen | Jetta  | 2019 | 16             |
| 20 | Nissan     | Murano | 2019 | 20             |
+----+------------+--------+------+----------------+
```
- Seleccionar propietarios que tienen vehículos de la marca "Toyota".

```sql
SELECT * FROM vehículos WHERE marca = 'Toyota';
```
```sql
+----+--------+------------+------+----------------+
| id | marca  |   modelo   | año  | id_propietario |
+----+--------+------------+------+----------------+
| 2  | Toyota | Corolla    | 2018 | 2              |
| 7  | Toyota | RAV4       | 2019 | 7              |
| 12 | Toyota | Camry      | 2020 | 12             |
| 18 | Toyota | Highlander | 2020 | 18             |
| 19 | Toyota | Odyssey    | 2016 | 19             |
+----+--------+------------+------+----------------+
```

- Listar vehículos con marca "Ford" y modelo "Fiesta".

```sql
SELECT * FROM vehículos WHERE marca = 'Ford' AND modelo = 'Fiesta';
```
```sql
+----+-------+--------+------+----------------+
| id | marca | modelo | año  | id_propietario |
+----+-------+--------+------+----------------+
| 1  | Ford  | Fiesta | 2019 | 1              |
+----+-------+--------+------+----------------+
```

- Seleccionar propietarios con DNI "12345678A".
```sql
SELECT * FROM propietarios WHERE dni = '12345678A';
```
```sql
+----+--------+----------+-----------+
| id | nombre | apellido |    dni    |
+----+--------+----------+-----------+
| 1  | Juan   | Perez    | 12345678A |
+----+--------+----------+-----------+
```
- Listar vehículos que pertenecen al propietario con ID 5.
```sql
SELECT * FROM vehículos WHERE id_propietarios = 5;
```
```sql
+----+-------+--------+------+----------------+
| id | marca | modelo | año  | id_propietario |
+----+-------+--------+------+----------------+
| 5  | Honda | Civic  | 2016 | 5              |
+----+-------+--------+------+----------------+
```

## Paso 3:

- Actualizar el nombre de un propietario con DNI "12345678A".

```sql
UPDATE propietarios
SET nombre = 'Margaret'
WHERE dni = '12345678A';
```
```sql
+----+----------+-----------+-----------+
| id |  nombre  | apellido  |    dni    |
+----+----------+-----------+-----------+
| 1  | Margaret | Perez     | 12345678A |
| 2  | María    | Lopez     | 87456321B |
| 3  | Carlos   | Ruiz      | 11111111C |
| 4  | Laura    | Gomez     | 22222222D |
| 5  | Pedro    | Martinez  | 33333333E |
| 6  | Ana      | Fernandez | 44444444F |
| 7  | Diego    | Sanchez   | 55555555G |
| 8  | Sofia    | Torres    | 66666666H |
| 9  | Javier   | Leon      | 77777777I |
| 10 | Lucia    | Castillo  | 88888888J |
| 11 | Luis     | González  | 99999999K |
| 12 | Marta    | Diaz      | 10101010L |
| 13 | Victor   | Vargas    | 11111112L |
| 14 | Elena    | Castro    | 12121212N |
| 15 | Roberto  | Blanco    | 13131313O |
| 16 | Natalia  | Paredes   | 14141414P |
| 17 | Fernando | Herrera   | 15151515Q |
| 18 | Clara    | Soto      | 16161616R |
| 19 | Sergio   | Mendoza   | 17171717S |
| 20 | Patricia | Navarro   | 18181818T |
+----+----------+-----------+-----------+
```

- Modificar el año de un vehículo con ID 3 a 2022.

```sql
UPDATE vehículos
SET año = '2022'
WHERE id_vehiculo = 3;
```

```sql
+----+------------+------------+------+----------------+
| id |   marca    |   modelo   | año  | id_propietario |
+----+------------+------------+------+----------------+
| 1  | Ford       | Fiesta     | 2019 | 1              |
| 2  | Toyota     | Corolla    | 2018 | 2              |
| 3  | Nissan     | Sentra     | 2022 | 3              |
| 4  | Chevrolet  | Spark      | 2017 | 4              |
| 5  | Honda      | Civic      | 2016 | 5              |
| 6  | Ford       | Mustang    | 2021 | 6              |
| 7  | Toyota     | RAV4       | 2019 | 7              |
| 8  | Volkswagen | Golf       | 2020 | 8              |
| 9  | Honda      | CR-V       | 2018 | 9              |
| 10 | Nissan     | Altima     | 2017 | 10             |
| 11 | Chevrolet  | Malibu     | 2019 | 11             |
| 12 | Toyota     | Camry      | 2020 | 12             |
| 13 | Honda      | Accord     | 2018 | 13             |
| 14 | Ford       | Explorer   | 2021 | 14             |
| 15 | Nissan     | Rogue      | 2017 | 15             |
| 16 | Volkswagen | Jetta      | 2019 | 16             |
| 17 | Chevrolet  | Equinox    | 2018 | 17             |
| 18 | Toyota     | Highlander | 2020 | 18             |
| 19 | Toyota     | Odyssey    | 2016 | 19             |
| 20 | Nissan     | Murano     | 2019 | 20             |
+----+------------+------------+------+----------------+
```
- Cambiar el modelo de todos los vehículos Nissan a "Micra".

```sql
UPDATE vehículos
SET modelo = 'Micra'
WHERE marca = 'Nissan';
```

```sql
+----+------------+------------+------+----------------+
| id |   marca    |   modelo   | año  | id_propietario |
+----+------------+------------+------+----------------+
| 1  | Ford       | Fiesta     | 2019 | 1              |
| 2  | Toyota     | Corolla    | 2018 | 2              |
| 3  | Nissan     | Micra      | 2022 | 3              |
| 4  | Chevrolet  | Spark      | 2017 | 4              |
| 5  | Honda      | Civic      | 2016 | 5              |
| 6  | Ford       | Mustang    | 2021 | 6              |
| 7  | Toyota     | RAV4       | 2019 | 7              |
| 8  | Volkswagen | Golf       | 2020 | 8              |
| 9  | Honda      | CR-V       | 2018 | 9              |
| 10 | Nissan     | Micra      | 2017 | 10             |
| 11 | Chevrolet  | Malibu     | 2019 | 11             |
| 12 | Toyota     | Camry      | 2020 | 12             |
| 13 | Honda      | Accord     | 2018 | 13             |
| 14 | Ford       | Explorer   | 2021 | 14             |
| 15 | Nissan     | Micra      | 2017 | 15             |
| 16 | Volkswagen | Jetta      | 2019 | 16             |
| 17 | Chevrolet  | Equinox    | 2018 | 17             |
| 18 | Toyota     | Highlander | 2020 | 18             |
| 19 | Toyota     | Odyssey    | 2016 | 19             |
| 20 | Nissan     | Micra      | 2019 | 20             |
+----+------------+------------+------+----------------+
```
- Actualizar el apellido de un propietario con ID 7 a "Gomez".

```sql
UPDATE propietarios
SET apellido = 'Gomez'
WHERE id = 7;
```
```sql
+----+----------+-----------+-----------+
| id |  nombre  | apellido  |    dni    |
+----+----------+-----------+-----------+
| 1  | Juan     | Perez     | 12345678A |
| 2  | María    | Lopez     | 87456321B |
| 3  | Carlos   | Ruiz      | 11111111C |
| 4  | Laura    | Gomez     | 22222222D |
| 5  | Pedro    | Martinez  | 33333333E |
| 6  | Ana      | Fernandez | 44444444F |
| 7  | Diego    | Gomez     | 55555555G |
| 8  | Sofia    | Torres    | 66666666H |
| 9  | Javier   | Leon      | 77777777I |
| 10 | Lucia    | Castillo  | 88888888J |
| 11 | Luis     | González  | 99999999K |
| 12 | Marta    | Diaz      | 10101010L |
| 13 | Victor   | Vargas    | 11111112L |
| 14 | Elena    | Castro    | 12121212N |
| 15 | Roberto  | Blanco    | 13131313O |
| 16 | Natalia  | Paredes   | 14141414P |
| 17 | Fernando | Herrera   | 15151515Q |
| 18 | Clara    | Soto      | 16161616R |
| 19 | Sergio   | Mendoza   | 17171717S |
| 20 | Patricia | Navarro   | 18181818T |
+----+----------+-----------+-----------+
```

- Modificar la marca de un vehículo con modelo "Fiesta" a "Renault".

```sql
UPDATE vehículos
SET marca = 'Renault'
WHERE modelo = 'Fiesta';
```

```sql
+----+------------+------------+------+----------------+
| id |   marca    |   modelo   | año  | id_propietario |
+----+------------+------------+------+----------------+
| 1  | Renault    | Fiesta     | 2019 | 1              |
| 2  | Toyota     | Corolla    | 2018 | 2              |
| 3  | Nissan     | Micra      | 2022 | 3              |
| 4  | Chevrolet  | Spark      | 2017 | 4              |
| 5  | Honda      | Civic      | 2016 | 5              |
| 6  | Ford       | Mustang    | 2021 | 6              |
| 7  | Toyota     | RAV4       | 2019 | 7              |
| 8  | Volkswagen | Golf       | 2020 | 8              |
| 9  | Honda      | CR-V       | 2018 | 9              |
| 10 | Nissan     | Micra      | 2017 | 10             |
| 11 | Chevrolet  | Malibu     | 2019 | 11             |
| 12 | Toyota     | Camry      | 2020 | 12             |
| 13 | Honda      | Accord     | 2018 | 13             |
| 14 | Ford       | Explorer   | 2021 | 14             |
| 15 | Nissan     | Micra      | 2017 | 15             |
| 16 | Volkswagen | Jetta      | 2019 | 16             |
| 17 | Chevrolet  | Equinox    | 2018 | 17             |
| 18 | Toyota     | Highlander | 2020 | 18             |
| 19 | Toyota     | Odyssey    | 2016 | 19             |
| 20 | Nissan     | Micra      | 2019 | 20             |
+----+------------+------------+------+----------------+
```
