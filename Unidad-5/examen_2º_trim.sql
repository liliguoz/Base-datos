-- ----------------------------------------
-- Consultas sobre una tabla
-- 0,2 puntos la correcta. Total = 1,4 puntos
-- ----------------------------------------

-- 1.- Devuelve un listado con todos las compras que se han realizado. Las compras deben estar ordenados
-- por la fecha de realización, mostrando en primer lugar las compras más recientes.

select * from compra
order by fecha desc;

/**
┌────┬─────────┬────────────┬───────────────┬──────────────────┐
│ id │  total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼─────────┼────────────┼───────────────┼──────────────────┤
│ 15 │ 370.85  │ 2022-03-11 │ 1             │ 5                │
│ 16 │ 2389.23 │ 2022-03-11 │ 1             │ 5                │
│ 13 │ 545.75  │ 2022-01-25 │ 6             │ 1                │
│ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │
│ 1  │ 150.5   │ 2020-10-05 │ 5             │ 2                │
│ 3  │ 65.26   │ 2020-10-05 │ 2             │ 1                │
│ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │
│ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │
│ 14 │ 145.82  │ 2020-02-02 │ 6             │ 1                │
│ 9  │ 2480.4  │ 2019-10-10 │ 8             │ 3                │
│ 2  │ 270.65  │ 2019-09-10 │ 1             │ 5                │
│ 4  │ 110.5   │ 2019-08-17 │ 8             │ 3                │
│ 11 │ 75.29   │ 2019-08-17 │ 3             │ 7                │
│ 6  │ 2400.6  │ 2019-07-27 │ 7             │ 1                │
│ 7  │ 5760.0  │ 2018-09-10 │ 2             │ 1                │
│ 10 │ 250.45  │ 2018-06-27 │ 8             │ 2                │
└────┴─────────┴────────────┴───────────────┴──────────────────┘

**/

-- 2. Devuelve todos los datos de los dos compras de mayor valor.

select * from compra 
order by total desc limit 2;

/**
┌────┬────────┬────────────┬───────────────┬──────────────────┐
│ id │ total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼────────┼────────────┼───────────────┼──────────────────┤
│ 7  │ 5760.0 │ 2018-09-10 │ 2             │ 1                │
│ 12 │ 3045.6 │ 2020-04-25 │ 2             │ 1                │
└────┴────────┴────────────┴───────────────┴──────────────────┘
**/

-- 3. Devuelve un listado con los identificadores de los consumidores que han realizado algún compra.
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.

select distinct(id_suministrador) from compra;

/**
┌──────────────────┐
│ id_suministrador │
├──────────────────┤
│ 2                │
│ 5                │
│ 1                │
│ 3                │
│ 6                │
│ 7                │
└──────────────────┘

**/

-- 4. Devuelve un listado de todos las compras que se realizaron durante el año 2020,
-- cuya cantidad total sea superior a 500€.

select * from compra where fecha regexp '2020' and total > 500;

/**
┌────┬─────────┬────────────┬───────────────┬──────────────────┐
│ id │  total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼─────────┼────────────┼───────────────┼──────────────────┤
│ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │
│ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │
│ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │
└────┴─────────┴────────────┴───────────────┴──────────────────┘
**/

-- 5. Devuelve un listado con el nombre y los apellidos de los suministradores que tienen una comisión entre 0.11 y 0.15.

select nombre, apellido1, apellido2 from suministrador where categoria between 0.11 and 0.15;

/**
┌─────────┬───────────┬───────────┐
│ nombre  │ apellido1 │ apellido2 │
├─────────┼───────────┼───────────┤
│ Daniel  │ Sáez      │ Vega      │
│ Juan    │ Gómez     │ López     │
│ Diego   │ Flores    │ Salas     │
│ Marta   │ Herrera   │ Gil       │
│ Antonio │ Carretero │ Ortega    │
│ Manuel  │ Domínguez │ Hernández │
│ Antonio │ Vega      │ Hernández │
└─────────┴───────────┴───────────┘
**/

-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla suministrador.

select max(categoria) as mayor_comision from suministrador;

/**
┌────────────────┐
│ mayor_comision │
├────────────────┤
│ 0.15           │
└────────────────┘
**/

-- 7. Devuelve el identificador, nombre y primer apellido de aquellos consumidores cuyo segundo apellido no es NULL.
-- El listado deberá estar ordenado alfabéticamente por apellidos y nombre.

select id, nombre, apellido1 from consumidor where apellido2 is not null
order by nombre, apellido1;

/**
┌────┬───────────┬───────────┐
│ id │  nombre   │ apellido1 │
├────┼───────────┼───────────┤
│ 1  │ Aarón     │ Rivero    │
│ 2  │ Adela     │ Salas     │
│ 3  │ Adolfo    │ Rubio     │
│ 10 │ Daniel    │ Santana   │
│ 9  │ Guillermo │ López     │
│ 5  │ Marcos    │ Loyola    │
│ 6  │ María     │ Santana   │
│ 8  │ Pepe      │ Ruiz      │
└────┴───────────┴───────────┘
**/

-- (Consultas Multitabla Where)
-- -----------------------------------------------
-- 0,3 puntos la correcta. Total =  2,1 puntos
-- -----------------------------------------------

-- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los consumidores que han realizado algún compra.
-- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

select con.id, con.nombre, con.apellido1, con.apellido2 from consumidor con, compra c where c.id_consumidor = con.id 
group by con.id
order by con.nombre, con.apellido1, con.apellido2;

/**
┌────┬────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │
├────┼────────┼───────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │
│ 2  │ Adela  │ Salas     │ Díaz      │
│ 3  │ Adolfo │ Rubio     │ Flores    │
│ 4  │ Adrián │ Suárez    │           │
│ 5  │ Marcos │ Loyola    │ Méndez    │
│ 6  │ María  │ Santana   │ Moreno    │
│ 8  │ Pepe   │ Ruiz      │ Santana   │
│ 7  │ Pilar  │ Ruiz      │           │
└────┴────────┴───────────┴───────────┘
**/

-- 2. Devuelve un listado que muestre todos las compras que ha realizado cada consumidor. 
-- El resultado debe mostrar todos los datos de las compras y del consumidor. El listado debe mostrar los datos de los consumidores ordenados alfabéticamente.

select con.*, c.* from compra c, consumidor con where c.id_consumidor = con.id
order by con.nombre, con.apellido1, con.apellido2; 

/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬───────────────┬──────────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼───────────────┼──────────────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 2  │ 270.65  │ 2019-09-10 │ 1             │ 5                │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 15 │ 370.85  │ 2022-03-11 │ 1             │ 5                │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 16 │ 2389.23 │ 2022-03-11 │ 1             │ 5                │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2020-10-05 │ 2             │ 1                │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 7  │ 5760.0  │ 2018-09-10 │ 2             │ 1                │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │
│ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 11 │ 75.29   │ 2019-08-17 │ 3             │ 7                │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2020-10-05 │ 5             │ 2                │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13 │ 545.75  │ 2022-01-25 │ 6             │ 1                │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2020-02-02 │ 6             │ 1                │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4  │ 110.5   │ 2019-08-17 │ 8             │ 3                │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9  │ 2480.4  │ 2019-10-10 │ 8             │ 3                │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10 │ 250.45  │ 2018-06-27 │ 8             │ 2                │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6  │ 2019-07-27 │ 7             │ 1                │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴───────────────┴──────────────────┘
**/

-- 3. Devuelve un listado que muestre todos las compras en los que ha participado un suministrador.
-- El resultado debe mostrar todos los datos de las compras y de los suministradores.
-- El listado debe mostrar los datos de los suministradores ordenados alfabéticamente.

select c.*, s.* from compra c, suministrador s where c.id_suministrador = s.id
order by s.nombre, s.apellido1, s.apellido2;

/**
┌────┬─────────┬────────────┬───────────────┬──────────────────┬────┬─────────┬───────────┬───────────┬───────────┐
│ id │  total  │   fecha    │ id_consumidor │ id_suministrador │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼────────────┼───────────────┼──────────────────┼────┼─────────┼───────────┼───────────┼───────────┤
│ 2  │ 270.65  │ 2019-09-10 │ 1             │ 5                │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 15 │ 370.85  │ 2022-03-11 │ 1             │ 5                │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 16 │ 2389.23 │ 2022-03-11 │ 1             │ 5                │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 11 │ 75.29   │ 2019-08-17 │ 3             │ 7                │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │
│ 3  │ 65.26   │ 2020-10-05 │ 2             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 6  │ 2400.6  │ 2019-07-27 │ 7             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 7  │ 5760.0  │ 2018-09-10 │ 2             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 13 │ 545.75  │ 2022-01-25 │ 6             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 14 │ 145.82  │ 2020-02-02 │ 6             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 4  │ 110.5   │ 2019-08-17 │ 8             │ 3                │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 9  │ 2480.4  │ 2019-10-10 │ 8             │ 3                │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 1  │ 150.5   │ 2020-10-05 │ 5             │ 2                │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 10 │ 250.45  │ 2018-06-27 │ 8             │ 2                │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │
└────┴─────────┴────────────┴───────────────┴──────────────────┴────┴─────────┴───────────┴───────────┴───────────┘
**/

-- 4. Devuelve un listado que muestre todos los consumidores, con todos las compras que han realizado 
-- y con los datos de los suministradores asociados a cada compra.

select c.*, s.* from consumidor con, compra c, suministrador s 
where con.id = c.id_consumidor and c.id_suministrador = s.id;

/**
┌────┬─────────┬────────────┬───────────────┬──────────────────┬────┬─────────┬───────────┬───────────┬───────────┐
│ id │  total  │   fecha    │ id_consumidor │ id_suministrador │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼────────────┼───────────────┼──────────────────┼────┼─────────┼───────────┼───────────┼───────────┤
│ 1  │ 150.5   │ 2020-10-05 │ 5             │ 2                │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 2  │ 270.65  │ 2019-09-10 │ 1             │ 5                │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 3  │ 65.26   │ 2020-10-05 │ 2             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 4  │ 110.5   │ 2019-08-17 │ 8             │ 3                │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 6  │ 2400.6  │ 2019-07-27 │ 7             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 7  │ 5760.0  │ 2018-09-10 │ 2             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │
│ 9  │ 2480.4  │ 2019-10-10 │ 8             │ 3                │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 10 │ 250.45  │ 2018-06-27 │ 8             │ 2                │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 11 │ 75.29   │ 2019-08-17 │ 3             │ 7                │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │
│ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 13 │ 545.75  │ 2022-01-25 │ 6             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 14 │ 145.82  │ 2020-02-02 │ 6             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 15 │ 370.85  │ 2022-03-11 │ 1             │ 5                │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 16 │ 2389.23 │ 2022-03-11 │ 1             │ 5                │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
└────┴─────────┴────────────┴───────────────┴──────────────────┴────┴─────────┴───────────┴───────────┴───────────┘
**/

-- 5. Devuelve un listado de todos los consumidores que realizaron un compra durante el año 2020,
-- cuya cantidad esté entre 300 € y 1000 €.

select con.* from consumidor con, compra c where c.total between 300 and 1000 and c.fecha regexp '2020'; 

/**
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 1  │ Aarón     │ Rivero    │ Gómez     │ Almería │ 100       │
│ 2  │ Adela     │ Salas     │ Díaz      │ Granada │ 200       │
│ 3  │ Adolfo    │ Rubio     │ Flores    │ Sevilla │           │
│ 4  │ Adrián    │ Suárez    │           │ Jaén    │ 300       │
│ 5  │ Marcos    │ Loyola    │ Méndez    │ Almería │ 200       │
│ 6  │ María     │ Santana   │ Moreno    │ Cádiz   │ 100       │
│ 7  │ Pilar     │ Ruiz      │           │ Sevilla │ 300       │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘
**/

-- 6. Devuelve el nombre y los apellidos de todos los suministradores que ha participado en algún compra realizado por María Santana Moreno.

select s.nombre, s.apellido1, s.apellido2 from suministrador s, compra c, consumidor con 
where s.id = c.id_suministrador and c.id_consumidor = con.id and con.nombre = 'María' and con.apellido1 ='Santana' and con.apellido2 ='Moreno'
group by s.id;

/**
┌────────┬───────────┬───────────┐
│ nombre │ apellido1 │ apellido2 │
├────────┼───────────┼───────────┤
│ Daniel │ Sáez      │ Vega      │
└────────┴───────────┴───────────┘
**/

-- 7. Devuelve el nombre de todos los consumidores que han realizado algún compra con el suministrador Daniel Sáez Vega.

select con.nombre from consumidor con, suministrador s, compra c 
where con.id = c.id_consumidor and c.id_suministrador = s.id and s.nombre = 'Daniel' and s.apellido1 = 'Sáez' and s.apellido2 = 'Vega'
group by con.id;

/**
┌────────┐
│ nombre │
├────────┤
│ Adela  │
│ María  │
│ Pilar  │
└────────┘
**/

-- (Consultas Multitabla Join)
-- -----------------------------------------------
-- 0,3 puntos la correcta. Total = 2,1 puntos
-- -----------------------------------------------

-- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los consumidores que han realizado algún compra.
-- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

select con.id, con.nombre, con.apellido1, con.apellido2 from consumidor con
inner join compra c on con.id = c.id_consumidor 
group by con.id
order by con.nombre, con.apellido1, con.apellido2;

/**
┌────┬────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │
├────┼────────┼───────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │
│ 2  │ Adela  │ Salas     │ Díaz      │
│ 3  │ Adolfo │ Rubio     │ Flores    │
│ 4  │ Adrián │ Suárez    │           │
│ 5  │ Marcos │ Loyola    │ Méndez    │
│ 6  │ María  │ Santana   │ Moreno    │
│ 8  │ Pepe   │ Ruiz      │ Santana   │
│ 7  │ Pilar  │ Ruiz      │           │
└────┴────────┴───────────┴───────────┘
**/

-- 2. Devuelve un listado que muestre todos las compras que ha realizado cada consumidor. 
-- El resultado debe mostrar todos los datos de las compras y del consumidor. El listado debe mostrar los datos de los consumidores ordenados alfabéticamente.

select c.*, con.* from compra c 
inner join consumidor con on c.id_consumidor = con.id
order by con.nombre ,con.apellido1, con.apellido2;

/**
┌────┬─────────┬────────────┬───────────────┬──────────────────┬────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  total  │   fecha    │ id_consumidor │ id_suministrador │ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼─────────┼────────────┼───────────────┼──────────────────┼────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 2  │ 270.65  │ 2019-09-10 │ 1             │ 5                │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
│ 15 │ 370.85  │ 2022-03-11 │ 1             │ 5                │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
│ 16 │ 2389.23 │ 2022-03-11 │ 1             │ 5                │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
│ 3  │ 65.26   │ 2020-10-05 │ 2             │ 1                │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │
│ 7  │ 5760.0  │ 2018-09-10 │ 2             │ 1                │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │
│ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │
│ 11 │ 75.29   │ 2019-08-17 │ 3             │ 7                │ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │
│ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │
│ 1  │ 150.5   │ 2020-10-05 │ 5             │ 2                │ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │
│ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │
│ 13 │ 545.75  │ 2022-01-25 │ 6             │ 1                │ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │
│ 14 │ 145.82  │ 2020-02-02 │ 6             │ 1                │ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │
│ 4  │ 110.5   │ 2019-08-17 │ 8             │ 3                │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │
│ 9  │ 2480.4  │ 2019-10-10 │ 8             │ 3                │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │
│ 10 │ 250.45  │ 2018-06-27 │ 8             │ 2                │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │
│ 6  │ 2400.6  │ 2019-07-27 │ 7             │ 1                │ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │
└────┴─────────┴────────────┴───────────────┴──────────────────┴────┴────────┴───────────┴───────────┴─────────┴───────────┘
**/

-- 3. Devuelve un listado que muestre todos las compras en los que ha participado un suministrador.
-- El resultado debe mostrar todos los datos de las compras y de los suministradores.
-- El listado debe mostrar los datos de los suministradores ordenados alfabéticamente.

select c.*, s.* from compra c 
inner join suministrador s on s.id = c.id_suministrador
order by s.nombre, s.apellido1, s.apellido2;

/**
┌────┬─────────┬────────────┬───────────────┬──────────────────┬────┬─────────┬───────────┬───────────┬───────────┐
│ id │  total  │   fecha    │ id_consumidor │ id_suministrador │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼────────────┼───────────────┼──────────────────┼────┼─────────┼───────────┼───────────┼───────────┤
│ 2  │ 270.65  │ 2019-09-10 │ 1             │ 5                │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 15 │ 370.85  │ 2022-03-11 │ 1             │ 5                │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 16 │ 2389.23 │ 2022-03-11 │ 1             │ 5                │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 11 │ 75.29   │ 2019-08-17 │ 3             │ 7                │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │
│ 3  │ 65.26   │ 2020-10-05 │ 2             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 6  │ 2400.6  │ 2019-07-27 │ 7             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 7  │ 5760.0  │ 2018-09-10 │ 2             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 13 │ 545.75  │ 2022-01-25 │ 6             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 14 │ 145.82  │ 2020-02-02 │ 6             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 4  │ 110.5   │ 2019-08-17 │ 8             │ 3                │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 9  │ 2480.4  │ 2019-10-10 │ 8             │ 3                │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 1  │ 150.5   │ 2020-10-05 │ 5             │ 2                │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 10 │ 250.45  │ 2018-06-27 │ 8             │ 2                │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │
└────┴─────────┴────────────┴───────────────┴──────────────────┴────┴─────────┴───────────┴───────────┴───────────┘
**/

-- 4. Devuelve un listado que muestre todos los consumidores, con todos las compras que han realizado 
-- y con los datos de los suministradores asociados a cada compra.

select con.*, c.*, s.* from consumidor con 
inner join compra c on c.id_consumidor = con.id
inner join suministrador s on c.id_suministrador = s.id;

/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬───────────────┬──────────────────┬────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_consumidor │ id_suministrador │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼───────────────┼──────────────────┼────┼─────────┼───────────┼───────────┼───────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2020-10-05 │ 5             │ 2                │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 2  │ 270.65  │ 2019-09-10 │ 1             │ 5                │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2020-10-05 │ 2             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4  │ 110.5   │ 2019-08-17 │ 8             │ 3                │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6  │ 2019-07-27 │ 7             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 7  │ 5760.0  │ 2018-09-10 │ 2             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9  │ 2480.4  │ 2019-10-10 │ 8             │ 3                │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10 │ 250.45  │ 2018-06-27 │ 8             │ 2                │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 11 │ 75.29   │ 2019-08-17 │ 3             │ 7                │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13 │ 545.75  │ 2022-01-25 │ 6             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2020-02-02 │ 6             │ 1                │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 15 │ 370.85  │ 2022-03-11 │ 1             │ 5                │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 16 │ 2389.23 │ 2022-03-11 │ 1             │ 5                │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴───────────────┴──────────────────┴────┴─────────┴───────────┴───────────┴───────────┘
**/

-- 5. Devuelve un listado de todos los consumidores que realizaron un compra durante el año 2020,
-- cuya cantidad esté entre 300 € y 1000 €.

select con.* from consumidor con 
inner join compra c on c.id_consumidor = con.id 
where c.fecha regexp '2020' and c.total between 300 and 1000; 

/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘
**/

-- 6. Devuelve el nombre y los apellidos de todos los suministradores que ha participado en algún compra realizado por María Santana Moreno.

select s.nombre, s.apellido1, s.apellido2 from suministrador s 
inner join compra c on c.id_suministrador = s.id
inner join consumidor con on c.id_consumidor = con.id
where con.nombre = 'María' and con.apellido1 = 'Santana' and con.apellido2 = 'Moreno'
group by s.id;

/**
┌────────┬───────────┬───────────┐
│ nombre │ apellido1 │ apellido2 │
├────────┼───────────┼───────────┤
│ Daniel │ Sáez      │ Vega      │
└────────┴───────────┴───────────┘
**/

-- 7. Devuelve el nombre de todos los consumidores que han realizado algún compra con el suministrador Daniel Sáez Vega.

select con.nombre, con.apellido1, con.apellido2 from consumidor con 
inner join compra c on c.id_consumidor = con.id
inner join suministrador s on c.id_suministrador = s.id
where s.nombre = 'Daniel' and s.apellido1 = 'Sáez' and s.apellido2 = 'Vega'
group by con.id;

/**
┌────────┬───────────┬───────────┐
│ nombre │ apellido1 │ apellido2 │
├────────┼───────────┼───────────┤
│ Adela  │ Salas     │ Díaz      │
│ María  │ Santana   │ Moreno    │
│ Pilar  │ Ruiz      │           │
└────────┴───────────┴───────────┘
**/

-- ---------------------------
-- Consultas resumen (funciones)
-- -----------------------------------------------
-- 0,2 puntos la correcta. (1-6) 1,2 puntos
-- 0,25 puntos la correcta. (7-10) 1 punto.
-- Total = 2,2 puntos
-- -----------------------------------------------

-- 1. Calcula la cantidad media de todos las compras que aparecen en la tabla compra.

select avg(id) as cantidad_media_compra from compra;

/**
┌───────────────────────┐
│ cantidad_media_compra │
├───────────────────────┤
│ 8.5                   │
└───────────────────────┘
**/

-- 2. Calcula el número total de suministradores distintos que aparecen en la tabla compra.

select s.id, count(c.id_suministrador) as num_suministradores from compra c 
inner join suministrador s on c.id_suministrador = s.id 
group by s.id;

/**
┌────┬─────────────────────┐
│ id │ num_suministradores │
├────┼─────────────────────┤
│ 1  │ 6                   │
│ 2  │ 3                   │
│ 3  │ 2                   │
│ 5  │ 3                   │
│ 6  │ 1                   │
│ 7  │ 1                   │
└────┴─────────────────────┘
**/

-- 3. Calcula el número total de consumidores que aparecen en la tabla consumidor.

select count(nombre) as num_total from consumidor;

/**
┌───────────┐
│ num_total │
├───────────┤
│ 10        │
└───────────┘
**/

-- 4. Calcula cuál es la mayor cantidad que aparece en la tabla compra.

select max(total) from compra;

/**
┌────────────┐
│ max(total) │
├────────────┤
│ 5760.0     │
└────────────┘
**/

-- 5. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla consumidor.

select ciudad, max(categoria) from consumidor group by ciudad;

/**
┌─────────┬────────────────┐
│ ciudad  │ max(categoria) │
├─────────┼────────────────┤
│ Almería │ 200            │
│ Cádiz   │ 100            │
│ Granada │ 225            │
│ Huelva  │ 200            │
│ Jaén    │ 300            │
│ Sevilla │ 300            │
└─────────┴────────────────┘
**/

-- 6. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores.
-- Es decir, el mismo consumidor puede haber realizado varios compras de diferentes cantidades el mismo día.

select fecha, max(total) from compra group by fecha;

/**
┌────────────┬────────────┐
│   fecha    │ max(total) │
├────────────┼────────────┤
│ 2018-06-27 │ 250.45     │
│ 2018-09-10 │ 5760.0     │
│ 2019-07-27 │ 2400.6     │
│ 2019-08-17 │ 110.5      │
│ 2019-09-10 │ 270.65     │
│ 2019-10-10 │ 2480.4     │
│ 2020-02-02 │ 145.82     │
│ 2020-04-25 │ 3045.6     │
│ 2020-09-10 │ 948.5      │
│ 2020-10-05 │ 150.5      │
│ 2020-10-10 │ 1983.43    │
│ 2022-01-25 │ 545.75     │
│ 2022-03-11 │ 2389.23    │
└────────────┴────────────┘
**/

-- Se pide que se calcule cuál es el compra de máximo valor para cada uno de los días en los que un consumidor ha realizado un compra.
-- Muestra el identificador del consumidor, nombre, apellidos, la fecha y el valor de la cantidad.

select con.id, con.nombre, con.apellido1, con.apellido2, c.fecha, max(total) from compra c
inner join consumidor con on con.id = c.id_consumidor
group by fecha;

/**
┌────┬────────┬───────────┬───────────┬────────────┬────────────┐
│ id │ nombre │ apellido1 │ apellido2 │   fecha    │ max(total) │
├────┼────────┼───────────┼───────────┼────────────┼────────────┤
│ 8  │ Pepe   │ Ruiz      │ Santana   │ 2018-06-27 │ 250.45     │
│ 2  │ Adela  │ Salas     │ Díaz      │ 2018-09-10 │ 5760.0     │
│ 7  │ Pilar  │ Ruiz      │           │ 2019-07-27 │ 2400.6     │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ 2019-08-17 │ 110.5      │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ 2019-09-10 │ 270.65     │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ 2019-10-10 │ 2480.4     │
│ 6  │ María  │ Santana   │ Moreno    │ 2020-02-02 │ 145.82     │
│ 2  │ Adela  │ Salas     │ Díaz      │ 2020-04-25 │ 3045.6     │
│ 5  │ Marcos │ Loyola    │ Méndez    │ 2020-09-10 │ 948.5      │
│ 5  │ Marcos │ Loyola    │ Méndez    │ 2020-10-05 │ 150.5      │
│ 4  │ Adrián │ Suárez    │           │ 2020-10-10 │ 1983.43    │
│ 6  │ María  │ Santana   │ Moreno    │ 2022-01-25 │ 545.75     │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ 2022-03-11 │ 2389.23    │
└────┴────────┴───────────┴───────────┴────────────┴────────────┘
**/

-- 7. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores,
-- teniendo en cuenta que sólo queremos mostrar aquellas compras que superen la cantidad de 2000 €.

select con.nombre, max(c.total), c.fecha from compra c inner join consumidor con on c.id_consumidor = con.id 
where c.total > 200 
group by c.id_consumidor;

/**
┌────────┬──────────────┬────────────┐
│ nombre │ max(c.total) │   fecha    │
├────────┼──────────────┼────────────┤
│ Aarón  │ 2389.23      │ 2022-03-11 │
│ Adela  │ 5760.0       │ 2018-09-10 │
│ Adrián │ 1983.43      │ 2020-10-10 │
│ Marcos │ 948.5        │ 2020-09-10 │
│ María  │ 545.75       │ 2022-01-25 │
│ Pilar  │ 2400.6       │ 2019-07-27 │
│ Pepe   │ 2480.4       │ 2019-10-10 │
└────────┴──────────────┴────────────┘
*//

-- 8. Calcula el máximo valor de las compras realizadas para cada uno de los suministradores durante la fecha 2020-08-17.
-- Muestra el identificador del suministrador, nombre, apellidos y total.

select s.nombre, s.apellido1, s.apellido2, max(c.total)
from compra c 
inner join suministrador s on s.id = c.id_suministrador 
where c.fecha = '2020-08-17'
group by s.id;

-- 9. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores.
-- Tenga en cuenta que pueden existir consumidores que no han realizado ninguna compra.
-- Estos consumidores también deben aparecer en el listado indicando que el número de compras realizadas es 0.
-- 10. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores durante el año 2020.

select con.id, con.nombre, con.apellido1, apellido2, 

select 

-- ---------------------
-- Subconsultas
-- -----------------------------------------------
-- 0,2 puntos la correcta (1-5).
-- 0,3 puntos la correcta (6-9).
-- Total = 2,2 puntos
-- -----------------------------------------------

--- Con operadores básicos de comparación

-- 1. Devuelve un listado con todos las compras que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).

select c.* from compra c, consumidor con where c.id_consumidor = con.id and con.nombre in('Adela') and con.apellido1 in ('Salas') and con.apellido2 in ('Díaz');

/**
┌────┬────────┬────────────┬───────────────┬──────────────────┐
│ id │ total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼────────┼────────────┼───────────────┼──────────────────┤
│ 3  │ 65.26  │ 2020-10-05 │ 2             │ 1                │
│ 7  │ 5760.0 │ 2018-09-10 │ 2             │ 1                │
│ 12 │ 3045.6 │ 2020-04-25 │ 2             │ 1                │
└────┴────────┴────────────┴───────────────┴──────────────────┘
**/

-- 2. Devuelve la fecha y la cantidad del compra de menor valor realizado por el cliente Pepe Ruiz Santana.

select c.fecha, min(c.total) from compra c 
inner join consumidor con 
on con.id = c.id_consumidor where con.nombre in('Pepe') and con.apellido1 in ('Ruiz') and con.apellido2 in('Santana');

/**
┌────────────┬──────────────┐
│   fecha    │ min(c.total) │
├────────────┼──────────────┤
│ 2019-08-17 │ 110.5        │
└────────────┴──────────────┘
**/

-- 3. Devuelve el número de compras en los que ha participado el suministrador Daniel Sáez Vega. (Sin utilizar INNER JOIN)

select count(c.id_suministrador) from compra c, suministrador s 
where c.id_suministrador = s.id 
and s.nombre in ('Daniel') and s.apellido1 in ('Sáez') and s.apellido2 in ('Vega');

/**
┌───────────────────────────┐
│ count(c.id_suministrador) │
├───────────────────────────┤
│ 6                         │
└───────────────────────────┘
**/

-- 4. Devuelve los datos del consumidor que realizó el compra más caro en el año 2021. (Sin utilizar INNER JOIN)

select con.* from consumidor con, compra c where c.id_consumidor = con.id and fecha regexp '2021' in (select min(total) from compra);
-- 5. Devuelve un listado con los datos de los consumidores y las compras, de todos los consumidores que han realizado un compra durante el año 2020 con un valor mayor o igual al valor medio de las compras realizadas durante ese mismo año.

select con.*, c.* from consumidor con 
inner join compra c on c.id_consumidor = con.id 
where c.fecha regexp '2020' 
group by c.fecha
having c.total >= avg(c.total);

/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬───────────────┬──────────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼───────────────┼──────────────────┤
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2020-02-02 │ 6             │ 1                │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2020-10-05 │ 5             │ 2                │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴───────────────┴──────────────────┘
**/

-- 6. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando IN o NOT IN).

select con.* from consumidor con inner join compra c on c.id_consumidor = con.id where con.id not in (select id_consumidor from compra);

/**

**/

-- 7. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando IN o NOT IN).;

select s.* from suministrador s, compra c where s.id = c.id_suministrador and s.id not in (select c.id_suministrador from compra c where );
-- 8. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).
-- 9. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).