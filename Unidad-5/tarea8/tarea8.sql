-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de la marca Toyota.

select cl.nombre, cl.edad 
from clientes as cl, ventas as v, coches as c
where cl.id_cliente=v.id_cliente and c.id_coche=v.id_coche and c.marca regexp 'Toyota';

/**
┌────────────┬──────┐
│   nombre   │ edad │
├────────────┼──────┤
│ Juan Pérez │ 30   │
└────────────┴──────┘
**/

-- Consulta para calcular el precio promedio de los coches vendidos.

select avg(precio) as precio_promedio
from coches as c, ventas as v 
where c.id_coche=v.id_coche and c.id_coche in (select id_coche from ventas);

/**
┌──────────────────┐
│ precio_promedio  │
├──────────────────┤
│ 28777.7777777778 │
└──────────────────┘
**/
-- Consulta para obtener el modelo y la marca de los coches vendidos a clientes menores de 30 años.

select c.modelo, c.marca 
from coches as c, ventas as v, clientes as cl
where c.id_coche=v.id_coche and cl.id_cliente=v.id_cliente and cl.edad < 30;

/**
┌────────────────┬───────────┐
│     modelo     │   marca   │
├────────────────┼───────────┤
│ Hatchback 2021 │ Honda     │
│ Coupé 2022     │ Chevrolet │
│ Híbrido 2022   │ Hyundai   │
│ Eléctrico 2021 │ Tesla     │
└────────────────┴───────────┘
**/

-- Consulta para contar el número de coches vendidos de cada marca.

select c.marca, count(c.marca) as num_marca
from coches as c, clientes as cl, ventas as v 
where v.id_cliente=cl.id_cliente and v.id_coche=c.id_coche
group by c.marca;

/**
┌────────────┬───────────┐
│   marca    │ num_marca │
├────────────┼───────────┤
│ Chevrolet  │ 1         │
│ Ford       │ 1         │
│ Honda      │ 1         │
│ Hyundai    │ 1         │
│ Mazda      │ 1         │
│ Nissan     │ 1         │
│ Tesla      │ 1         │
│ Toyota     │ 1         │
│ Volkswagen │ 1         │
└────────────┴───────────┘
**/

-- Consulta para obtener el nombre y la dirección de los clientes que han llevado a reparar sus coches en 2024.

select cl.nombre, cl.direccion
from clientes as cl, ventas as v, coches as c 
where v.id_coche=c.id_coche and v.id_cliente=cl.id_cliente and 

/**

**/
-- Consulta para calcular el total gastado en reparaciones por cada cliente.

select 
-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros.

select cl.nombre, cl.edad 
from clientes as cl, ventas as v, coches as c 
where cl.id_cliente=v.id_cliente and v.id_coche=c.id_coche and c.precio > 30000;

/**

**/

-- Consulta para calcular el precio medio de los coches vendidos en 2023.
-- Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de la marca Ford.
-- Consulta para contar el número de coches vendidos por año.
-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches.
-- Consulta para calcular el precio total de los coches vendidos a clientes menores de 30 años.
-- Consulta para obtener el modelo y el año de los coches vendidos en 2023 y llevados a reparar.
-- Consulta para contar el número de coches vendidos por cliente.
-- Consulta para obtener el nombre y el precio de los coches vendidos a clientes mayores de 35 años.

select cl.nombre, c.precio
from clientes as cl, ventas as v, coches as c
where cl.id_cliente=v.id_cliente and v.id_coche=c.id_coche and cl.edad > 35;

/**
┌─────────────────┬─────────┐
│     nombre      │ precio  │
├─────────────────┼─────────┤
│ Pedro Rodríguez │ 32000.0 │
│ Isabel Díaz     │ 35000.0 │
└─────────────────┴─────────┘
**/

-- Consulta para calcular el precio total de los coches vendidos a clientes que viven en una calle (en la dirección).
-- Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches en 2024.
-- Consulta para calcular el precio medio de los coches vendidos en 2023 y llevados a reparar por clientes menores de 30 años.
-- Consulta para obtener el modelo y el año de los coches vendidos por clientes que tienen una dirección que contiene la palabra "Avenida".

select c.modelo, c.año 
from clientes as cl, coches as c, ventas as v
where cl.id_cliente=v.id_cliente and v.id_coche=c.id_coche and cl.direccion regexp 'Avenida';

/**
┌────────────────┬──────┐
│     modelo     │ año  │
├────────────────┼──────┤
│ Hatchback 2021 │ 2021 │
│ Coupé 2022     │ 2022 │
│ Compacto 2021  │ 2021 │
│ Deportivo 2023 │ 2023 │
│ Eléctrico 2021 │ 2021 │
└────────────────┴──────┘
**/

-- Consulta para contar el número de reparaciones realizadas en 2024 por cada cliente.

select count() as num_reparaciones 
from 
where
