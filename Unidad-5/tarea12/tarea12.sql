-----------------------------------------------Creación de tabla cliente----------------------------------------------------

create table cliente (
   id integer primary key autoincrement,
   nombre text,
   apellido1 text,
   apellido2 text, 
   ciudad text,
   categoria integer );

-------------------------------------------------Creación tabla comercial-----------------------------------------------------

create table comercial (
   id integer primary key autoincrement,
   nombre text,
   apellido1 text,
   apellido2 text,
   categoria real );

---------------------------------------------------Creación tabla pedido-------------------------------------------------------------

CREATE TABLE pedido (
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   total REAL,
   fecha TEXT,
   id_cliente INTEGER REFERENCES cliente(id),
   id_comercial INTEGER REFERENCES comercial(id)
);

--------------------------------------------------Consultas sobre una tabla------------------------------------------------------

--Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.

select * from pedido order by fecha desc;

/**
┌────┬─────────┬────────────┬────────────┬──────────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
│ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
│ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
│ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
│ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
│ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
│ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
│ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
│ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
└────┴─────────┴────────────┴────────────┴──────────────┘
**/

--Devuelve todos los datos de los dos pedidos de mayor valor.

select total from pedido order by total desc limit 2; 

/**
┌────────┐
│ total  │
├────────┤
│ 5760.0 │
│ 3045.6 │
└────────┘
**/

--Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.

select c.id from cliente as c, pedido as p where c.id not in (select id_cliente from pedido) group by c.id;

/**
┌────┐
│ id │
├────┤
│ 9  │
│ 10 │
└────┘
**/

--Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.

select * from pedido where fecha regexp '2017' and total > 500;

/**
┌────┬─────────┬────────────┬────────────┬──────────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
└────┴─────────┴────────────┴────────────┴──────────────┘
**/

--Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.

select nombre, apellido1, apellido2 from comercial where categoria between 0.05 and 0.11;

/**
┌─────────┬───────────┬───────────┐
│ nombre  │ apellido1 │ apellido2 │
├─────────┼───────────┼───────────┤
│ Diego   │ Flores    │ Salas     │
│ Antonio │ Vega      │ Hernández │
│ Alfredo │ Ruiz      │ Flores    │
└─────────┴───────────┴───────────┘
**/

--Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.

select max(categoria) as comision_max from comercial;

/**
┌──────────────┐
│ comision_max │
├──────────────┤
│ 0.15         │
└──────────────┘
**/

--Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.

select id, nombre, apellido1, apellido2 from cliente where apellido1 not null and apellido2 not null order by nombre, apellido1;

/**
┌────┬───────────┬───────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │
├────┼───────────┼───────────┼───────────┤
│ 1  │ Aarón     │ Rivero    │ Gómez     │
│ 2  │ Adela     │ Salas     │ Díaz      │
│ 3  │ Adolfo    │ Rubio     │ Flores    │
│ 10 │ Daniel    │ Santana   │ Loyola    │
│ 9  │ Guillermo │ López     │ Gómez     │
│ 5  │ Marcos    │ Loyola    │ Méndez    │
│ 6  │ María     │ Santana   │ Moreno    │
│ 8  │ Pepe      │ Ruiz      │ Santana   │
└────┴───────────┴───────────┴───────────┘
**/

--Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.

select nombre from cliente where nombre regexp '^(A.*n|P.*)$';

/**
┌────────┐
│ nombre │
├────────┤
│ Aarón  │
│ Adrián │
│ Pilar  │
│ Pepe   │
└────────┘
**/

--Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.

select nombre from cliente where nombre not regexp '^A' order by nombre;

/**
┌───────────┐
│  nombre   │
├───────────┤
│ Daniel    │
│ Guillermo │
│ Marcos    │
│ María     │
│ Pepe      │
│ Pilar     │
└───────────┘
**/

--Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.

select nombre from comercial where nombre regexp '[el|o]$' order by nombre;

/**
┌─────────┐
│ nombre  │
├─────────┤
│ Alfredo │
│ Antonio │
│ Antonio │
│ Daniel  │
│ Diego   │
│ Manuel  │
└─────────┘
**/

--------------------------------------------------Consultas multitabla (inner join)---------------------------------------------------

--Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

select c.id, c.nombre, c.apellido1, c.apellido2 from cliente as c JOIN pedido as p ON c.id = p.id_cliente where c.id in (select id_cliente from pedido) group by c.id order by nombre;

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

--Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.

select c.*, p.* from cliente as c JOIN pedido as p ON c.id = p.id_cliente where c.id in (select id_cliente from pedido) group by c.id order by nombre;

/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┘
**/

--Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.

select p.*, c.* from pedido as p JOIN comercial as c ON c.id = p.id_comercial where c.id in (select id_comercial from pedido) group by c.id order by c.nombre;

/**
┌────┬─────────┬────────────┬────────────┬──────────────┬────┬─────────┬───────────┬───────────┬───────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼────────────┼────────────┼──────────────┼────┼─────────┼───────────┼───────────┼───────────┤
│ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │
│ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │
└────┴─────────┴────────────┴────────────┴──────────────┴────┴─────────┴───────────┴───────────┴───────────┘
**/

--Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.

select c.*, co.*, p.* from cliente as c JOIN pedido as p ON c.id = p.id_cliente JOIN comercial as co ON co.id = p.id_comercial group by c.id;

/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬───────────┬───────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼───────────┼───────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴───────────┴───────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┘
**/

--Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.

select c.* from cliente as c JOIN pedido as p ON c.id = p.id_cliente where p.total between 300 and 1000;

/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘
**/

--Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.

select co.nombre, co.apellido1, co.apellido2 from comercial as co JOIN pedido as p ON c.id = p.id_cliente JOIN cliente as c ON p.id_comercial = co.id where c.nombre = 'María' and c.apellido1 = 'Santana' and c.apellido2 = 'Moreno' group by co.id;

/**
┌────────┬───────────┬───────────┐
│ nombre │ apellido1 │ apellido2 │
├────────┼───────────┼───────────┤
│ Daniel │ Sáez      │ Vega      │
└────────┴───────────┴───────────┘
**/

--Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.

select c.nombre from cliente as c JOIN pedido as p ON c.id = p.id_cliente JOIN comercial as co ON p.id_comercial = co.id where co.nombre = 'Daniel' and co.apellido1 = 'Sáez' and co.apellido2 = 'Vega' group by c.id;

/**
┌────────┐
│ nombre │
├────────┤
│ Adela  │
│ María  │
│ Pilar  │
└────────┘
**/

----------------------------------------------Consultas resumen (Funciones)---------------------------------------------------------

--Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.

select sum(total) as total_pedido from pedido;

/**
┌──────────────┐
│ total_pedido │
├──────────────┤
│ 20992.83     │
└──────────────┘
**/

--Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.

select avg(id) as cantidad_media from pedido;

/**
┌────────────────┐
│ cantidad_media │
├────────────────┤
│ 8.5            │
└────────────────┘
**/

--Calcula el número total de comerciales distintos que aparecen en la tabla pedido.

select distinct(count(id)) as num_total_comerciales from comercial; 

/**
┌───────────────────────┐
│ num_total_comerciales │
├───────────────────────┤
│ 8                     │
└───────────────────────┘
**/

--Calcula el número total de clientes que aparecen en la tabla cliente.

select count(id) as num_total_cliente from cliente;

/**
┌───────────────────┐
│ num_total_cliente │
├───────────────────┤
│ 10                │
└───────────────────┘
**/

--Calcula cuál es la mayor cantidad que aparece en la tabla pedido.

select max(total) as total_max from pedido;

/**
┌───────────┐
│ total_max │
├───────────┤
│ 5760.0    │
└───────────┘
**/

--Calcula cuál es la menor cantidad que aparece en la tabla pedido.

select min(total) as total_min from pedido;

/**
┌───────────┐
│ total_min │
├───────────┤
│ 65.26     │
└───────────┘
**/

--Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.

select ciudad, max(categoria) as max_categoria from cliente group by ciudad;

/**
┌─────────┬───────────────┐
│ ciudad  │ max_categoria │
├─────────┼───────────────┤
│ Almería │ 200           │
│ Cádiz   │ 100           │
│ Granada │ 225           │
│ Huelva  │ 200           │
│ Jaén    │ 300           │
│ Sevilla │ 300           │
└─────────┴───────────────┘
**/

--Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.

select c.id, c.nombre, c.apellido1, c.apellido2, p.fecha, max(p.total) as max_valor from cliente as c, pedido as p where c.id = p.id_cliente group by p.id_cliente, p.fecha;

/**
┌────┬────────┬───────────┬───────────┬────────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │   fecha    │ max_valor │
├────┼────────┼───────────┼───────────┼────────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ 2016-09-10 │ 270.65    │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ 2019-03-11 │ 2389.23   │
│ 2  │ Adela  │ Salas     │ Díaz      │ 2015-09-10 │ 5760.0    │
│ 2  │ Adela  │ Salas     │ Díaz      │ 2017-04-25 │ 3045.6    │
│ 2  │ Adela  │ Salas     │ Díaz      │ 2017-10-05 │ 65.26     │
│ 3  │ Adolfo │ Rubio     │ Flores    │ 2016-08-17 │ 75.29     │
│ 4  │ Adrián │ Suárez    │           │ 2017-10-10 │ 1983.43   │
│ 5  │ Marcos │ Loyola    │ Méndez    │ 2017-09-10 │ 948.5     │
│ 5  │ Marcos │ Loyola    │ Méndez    │ 2017-10-05 │ 150.5     │
│ 6  │ María  │ Santana   │ Moreno    │ 2017-02-02 │ 145.82    │
│ 6  │ María  │ Santana   │ Moreno    │ 2019-01-25 │ 545.75    │
│ 7  │ Pilar  │ Ruiz      │           │ 2016-07-27 │ 2400.6    │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ 2015-06-27 │ 250.45    │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ 2016-08-17 │ 110.5     │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ 2016-10-10 │ 2480.4    │
└────┴────────┴───────────┴───────────┴────────────┴───────────┘
**/

--Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.

select 

/**
┌────┬────────┬───────────┬───────────┬────────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │   fecha    │ max_valor │
├────┼────────┼───────────┼───────────┼────────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ 2019-03-11 │ 2389.23   │
│ 2  │ Adela  │ Salas     │ Díaz      │ 2015-09-10 │ 5760.0    │
│ 2  │ Adela  │ Salas     │ Díaz      │ 2017-04-25 │ 3045.6    │
│ 7  │ Pilar  │ Ruiz      │           │ 2016-07-27 │ 2400.6    │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ 2016-10-10 │ 2480.4    │
└────┴────────┴───────────┴───────────┴────────────┴───────────┘
**/

--Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.

select c.id, c.nombre, c.apellido1, c.apellido2, p.fecha, max(p.total) as max_valor from cliente as c, pedido as p where c.id = p.id_cliente and p.total > 2000 group by c.id, p.fecha;

/**
┌────┬────────┬───────────┬───────────┬────────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │   fecha    │ max_valor │
├────┼────────┼───────────┼───────────┼────────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ 2019-03-11 │ 2389.23   │
│ 2  │ Adela  │ Salas     │ Díaz      │ 2015-09-10 │ 5760.0    │
│ 2  │ Adela  │ Salas     │ Díaz      │ 2017-04-25 │ 3045.6    │
│ 7  │ Pilar  │ Ruiz      │           │ 2016-07-27 │ 2400.6    │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ 2016-10-10 │ 2480.4    │
└────┴────────┴───────────┴───────────┴────────────┴───────────┘
**/

--Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.

select c.id as identificador_cliente, c.nombre, c.apellido1, c.apellido2, (select count(*) from pedido as p where p.id_cliente = c.id) as total_pedidos from cliente as c;

/**
┌───────────────────────┬───────────┬───────────┬───────────┬───────────────┐
│ identificador_cliente │  nombre   │ apellido1 │ apellido2 │ total_pedidos │
├───────────────────────┼───────────┼───────────┼───────────┼───────────────┤
│ 1                     │ Aarón     │ Rivero    │ Gómez     │ 3             │
│ 2                     │ Adela     │ Salas     │ Díaz      │ 3             │
│ 3                     │ Adolfo    │ Rubio     │ Flores    │ 1             │
│ 4                     │ Adrián    │ Suárez    │           │ 1             │
│ 5                     │ Marcos    │ Loyola    │ Méndez    │ 2             │
│ 6                     │ María     │ Santana   │ Moreno    │ 2             │
│ 7                     │ Pilar     │ Ruiz      │           │ 1             │
│ 8                     │ Pepe      │ Ruiz      │ Santana   │ 3             │
│ 9                     │ Guillermo │ López     │ Gómez     │ 0             │
│ 10                    │ Daniel    │ Santana   │ Loyola    │ 0             │
└───────────────────────┴───────────┴───────────┴───────────┴───────────────┘
**/

--Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.

select c.id, c.nombre, c.apellido1, c.apellido2, p.total from pedido as p, cliente as c where c.id = p.id_cliente and p.fecha regexp '2017';

/**
┌────┬────────┬───────────┬───────────┬─────────┐
│ id │ nombre │ apellido1 │ apellido2 │  total  │
├────┼────────┼───────────┼───────────┼─────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ 150.5   │
│ 2  │ Adela  │ Salas     │ Díaz      │ 65.26   │
│ 5  │ Marcos │ Loyola    │ Méndez    │ 948.5   │
│ 4  │ Adrián │ Suárez    │           │ 1983.43 │
│ 2  │ Adela  │ Salas     │ Díaz      │ 3045.6  │
│ 6  │ María  │ Santana   │ Moreno    │ 145.82  │
└────┴────────┴───────────┴───────────┴─────────┘
**/

--Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0.

select (c.id) as id_cliente, c.nombre, c.apellido1, c.apellido2, (select COUNT(*) from pedido p where p.id_cliente = c.id) as pedidos_totales from cliente c;

/**
┌────────────┬───────────┬───────────┬───────────┬─────────────────┐
│ id_cliente │  nombre   │ apellido1 │ apellido2 │ pedidos_totales │
├────────────┼───────────┼───────────┼───────────┼─────────────────┤
│ 1          │ Aarón     │ Rivero    │ Gómez     │ 3               │
│ 2          │ Adela     │ Salas     │ Díaz      │ 3               │
│ 3          │ Adolfo    │ Rubio     │ Flores    │ 1               │
│ 4          │ Adrián    │ Suárez    │           │ 1               │
│ 5          │ Marcos    │ Loyola    │ Méndez    │ 2               │
│ 6          │ María     │ Santana   │ Moreno    │ 2               │
│ 7          │ Pilar     │ Ruiz      │           │ 1               │
│ 8          │ Pepe      │ Ruiz      │ Santana   │ 3               │
│ 9          │ Guillermo │ López     │ Gómez     │ 0               │
│ 10         │ Daniel    │ Santana   │ Loyola    │ 0               │
└────────────┴───────────┴───────────┴───────────┴─────────────────┘
**/

--Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.

select max(total) as max_valor, strftime('%Y', fecha) as año from pedido group by año;

/**
┌───────────┬──────┐
│ max_valor │ año  │
├───────────┼──────┤
│ 5760.0    │ 2015 │
│ 2480.4    │ 2016 │
│ 3045.6    │ 2017 │
│ 2389.23   │ 2019 │
└───────────┴──────┘
**/

--Devuelve el número total de pedidos que se han realizado cada año.

select count(*) as num_pedido, substring(fecha, 1, 4) as año from pedido group by substring(fecha, 1, 4);

/**
┌────────────┬──────┐
│ num_pedido │ año  │
├────────────┼──────┤
│ 2          │ 2015 │
│ 5          │ 2016 │
│ 6          │ 2017 │
│ 3          │ 2019 │
└────────────┴──────┘
**/

--------------------------------------------------Subconsultas---------------------------------------------------------

-----------------Con operadores básicos de comparación

--Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).

select * from pedido WHERE id_cliente = (select id from cliente WHERE nombre = 'Adela' and apellido1 = 'Salas' and apellido2 = 'Díaz');

/**
┌────┬────────┬────────────┬────────────┬──────────────┐
│ id │ total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼────────────┼────────────┼──────────────┤
│ 3  │ 65.26  │ 2017-10-05 │ 2          │ 1            │
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴────────────┴────────────┴──────────────┘
**/

Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)

select * from pedido WHERE id_comercial = (select id from comercial WHERE nombre = 'Daniel' and apellido1 = 'Sáez' and apellido2 = 'Vega');

/**
┌────┬────────┬────────────┬────────────┬──────────────┐
│ id │ total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼────────────┼────────────┼──────────────┤
│ 3  │ 65.26  │ 2017-10-05 │ 2          │ 1            │
│ 6  │ 2400.6 │ 2016-07-27 │ 7          │ 1            │
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
│ 13 │ 545.75 │ 2019-01-25 │ 6          │ 1            │
│ 14 │ 145.82 │ 2017-02-02 │ 6          │ 1            │
└────┴────────┴────────────┴────────────┴──────────────┘
**/

Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)

select * from cliente where id = (select id_cliente from pedido where strftime('%Y', fecha) = '2019' order by total desc limit 1);

/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘
**/

Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.

select fecha, total from pedido where id_cliente = (select id from cliente where nombre = 'Pepe' and apellido1 = 'Ruiz' and apellido2 = 'Santana') order by total asc limit 1;

/**
┌────────────┬───────┐
│   fecha    │ total │
├────────────┼───────┤
│ 2016-08-17 │ 110.5 │
└────────────┴───────┘
**/

Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.

select c.*, p.* from cliente c JOIN pedido p ON c.id = p.id_cliente where p.fecha regexp '2017' and p.total >= (select AVG(total) from pedido WHERE strftime('%Y', fecha) = '2017');

/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┤
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┘
**/

----------------Subconsultas con IN y NOT IN

Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).

select * from cliente where id not in (select id_cliente from pedido);

/**
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘
**/

Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).

select * from comercial where id not in (select id_comercial from pedido);

/**
┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘
**/

---------------Subconsultas con EXISTS y NOT EXISTS

--Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

select c.* from cliente as c where not exists (select p.id_cliente from pedido p where c.id = p.id_cliente);

/**
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘
**/

--Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

select c.* from comercial as c where not exists(select p.id_comercial from pedido as p where c.id = p.id_comercial);

/**
┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘
**/
