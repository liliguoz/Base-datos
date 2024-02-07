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
from clientes as cl, reparacion as r , coches as c 
where r.id_coche=c.id_coche and r.id_cliente=cl.id_cliente and r.fecha_reparación regexp '2024';

/**
┌─────────────────┬────────────────┐
│     nombre      │   direccion    │
├─────────────────┼────────────────┤
│ Francisco Ruiz  │ Calle I #222   │
│ Elena Torres    │ Avenida J #333 │
│ Juan Pérez      │ Calle A #123   │
│ María Gómez     │ Avenida B #456 │
│ Carlos López    │ Calle C #789   │
│ Ana Martínez    │ Avenida D #101 │
│ Pedro Rodríguez │ Calle E #234   │
│ Laura Sánchez   │ Avenida F #567 │
│ Miguel González │ Calle G #890   │
│ Isabel Díaz     │ Avenida H #111 │
│ Francisco Ruiz  │ Calle I #222   │
│ Elena Torres    │ Avenida J #333 │
└─────────────────┴────────────────┘
**/

-- Consulta para calcular el total gastado en reparaciones por cada cliente.

select cl.nombre, sum(c.precio) as total_reparación 
from clientes as cl, coches as c, reparacion as r
where cl.id_cliente=r.id_cliente and c.id_coche=r.id_coche and c.id_coche in (select id_coche from reparacion)
group by cl.nombre;

/**
┌─────────────────┬──────────────────┐
│     nombre      │ total_reparación │
├─────────────────┼──────────────────┤
│ Ana Martínez    │ 54000.0          │
│ Carlos López    │ 60000.0          │
│ Elena Torres    │ 68000.0          │
│ Francisco Ruiz  │ 61000.0          │
│ Isabel Díaz     │ 60000.0          │
│ Juan Pérez      │ 55000.0          │
│ Laura Sánchez   │ 62000.0          │
│ María Gómez     │ 52000.0          │
│ Miguel González │ 60000.0          │
│ Pedro Rodríguez │ 48000.0          │
└─────────────────┴──────────────────┘
**/

-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros.

select cl.nombre, cl.edad 
from clientes as cl, ventas as v, coches as c 
where cl.id_cliente=v.id_cliente and v.id_coche=c.id_coche and c.precio > 30000;

/**
┌─────────────────┬──────┐
│     nombre      │ edad │
├─────────────────┼──────┤
│ Pedro Rodríguez │ 40   │
│ Isabel Díaz     │ 38   │
│ Elena Torres    │ 29   │
└─────────────────┴──────┘
**/

-- Consulta para calcular el precio medio de los coches vendidos en 2023.

select avg(c.precio) as precio_medio 
from coches as c, ventas as v 
where c.id_coche=v.id_coche and v.fecha_venta regexp '2023';

/**
┌──────────────────┐
│   precio_medio   │
├──────────────────┤
│ 28777.7777777778 │
└──────────────────┘
**/

-- Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de la marca Ford.

select cl.nombre, cl.direccion 
from clientes as cl, ventas as v, coches as C
where cl.id_cliente=v.id_cliente and c.id_coche=v.id_coche and c.marca regexp 'Ford';

/**
┌──────────────┬──────────────┐
│    nombre    │  direccion   │
├──────────────┼──────────────┤
│ Carlos López │ Calle C #789 │
└──────────────┴──────────────┘
**/

-- Consulta para contar el número de coches vendidos por año.

select strftime('%Y', fecha_venta) as año, COUNT(id_coche) as num_ventas_año 
from ventas 
group by año;

/**
┌──────┬────────────────┐
│ año  │ num_ventas_año │
├──────┼────────────────┤
│ 2023 │ 9              │
└──────┴────────────────┘
**/

-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches.

select cl.nombre, cl.edad 
from clientes as cl, reparacion as r, coches as c
where cl.id_cliente=r.id_cliente and c.id_coche=r.id_coche and c.precio > 30000 and c.id_coche in (select id_coche from reparacion); 

/**
┌─────────────────┬──────┐
│     nombre      │ edad │
├─────────────────┼──────┤
│ Carlos López    │ 35   │
│ Isabel Díaz     │ 38   │
│ Francisco Ruiz  │ 33   │
│ Elena Torres    │ 29   │
│ Ana Martínez    │ 28   │
│ Laura Sánchez   │ 32   │
│ Miguel González │ 27   │
└─────────────────┴──────┘
**/

-- Consulta para calcular el precio total de los coches vendidos a clientes menores de 30 años.

select sum(c.precio) as precio_total 
from coches as c, clientes as cl, ventas as v
where v.id_coche=c.id_coche and v.id_cliente=cl.id_cliente and cl.edad < 30;

/**
┌──────────────┐
│ precio_total │
├──────────────┤
│ 117000.0     │
└──────────────┘
**/

-- Consulta para obtener el modelo y el año de los coches vendidos en 2023 y llevados a reparar.

select c.modelo 
from coches as c, ventas as v, reparacion as r
where r.id_coche=v.id_coche and r.id_coche=c.id_coche and v.fecha_venta regexp '2023' and c.id_coche in (select id_coche from reparacion)
group by c.modelo;

/**
┌────────────────┐
│     modelo     │
├────────────────┤
│ Camioneta 2023 │
│ Compacto 2021  │
│ Coupé 2022     │
│ Deportivo 2023 │
│ Eléctrico 2021 │
│ Hatchback 2021 │
│ Híbrido 2022   │
│ SUV 2023       │
│ Sedán 2022     │
└────────────────┘
**/

-- Consulta para contar el número de coches vendidos por cliente.

select cl.nombre, count(v.id_venta) as num_vendido
from clientes as cl, ventas as v
where cl.id_cliente=v.id_cliente 
group by cl.nombre;

/**
┌─────────────────┬─────────────┐
│     nombre      │ num_vendido │
├─────────────────┼─────────────┤
│ Ana Martínez    │ 1           │
│ Carlos López    │ 1           │
│ Elena Torres    │ 1           │
│ Isabel Díaz     │ 1           │
│ Juan Pérez      │ 1           │
│ Laura Sánchez   │ 1           │
│ María Gómez     │ 1           │
│ Miguel González │ 1           │
│ Pedro Rodríguez │ 1           │
└─────────────────┴─────────────┘
**/

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

select cl.direccion, sum(c.precio) as precio_total
from coches as c, clientes as cl, ventas as v
where v.id_coche=c.id_coche and cl.id_cliente=v.id_cliente 
group by cl.direccion;

/**
┌────────────────┬──────────────┐
│   direccion    │ precio_total │
├────────────────┼──────────────┤
│ Avenida B #456 │ 22000.0      │
│ Avenida D #101 │ 28000.0      │
│ Avenida F #567 │ 20000.0      │
│ Avenida H #111 │ 35000.0      │
│ Avenida J #333 │ 40000.0      │
│ Calle A #123   │ 25000.0      │
│ Calle C #789   │ 30000.0      │
│ Calle E #234   │ 32000.0      │
│ Calle G #890   │ 27000.0      │
└────────────────┴──────────────┘
**/

-- Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches en 2024.

select cl.nombre, cl.direccion 
from clientes as cl, coches as c, reparacion as r
where r.id_cliente=cl.id_cliente and c.id_coche=r.id_coche and c.precio > 30000 and r.fecha_reparación regexp '2024';

/**
┌─────────────────┬────────────────┐
│     nombre      │   direccion    │
├─────────────────┼────────────────┤
│ Francisco Ruiz  │ Calle I #222   │
│ Elena Torres    │ Avenida J #333 │
│ Ana Martínez    │ Avenida D #101 │
│ Laura Sánchez   │ Avenida F #567 │
│ Miguel González │ Calle G #890   │
└─────────────────┴────────────────┘
**/

-- Consulta para calcular el precio medio de los coches vendidos en 2023 y llevados a reparar por clientes menores de 30 años.

select avg(c.precio) as precio_medio
from coches as c, clientes as cl, ventas as v
where v.id_cliente=cl.id_cliente and v.id_coche=c.id_coche and v.fecha_venta regexp '2023' and cl.edad < 30;

/**
┌──────────────┐
│ precio_medio │
├──────────────┤
│ 29250.0      │
└──────────────┘
**/

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

select cl.id_cliente, count(r.id_cliente) as num_reparaciones 
from reparacion as r, clientes as cl
where cl.id_cliente=r.id_cliente
group by cl.id_cliente;

/**
┌────────────┬──────────────────┐
│ id_cliente │ num_reparaciones │
├────────────┼──────────────────┤
│ 1          │ 2                │
│ 2          │ 2                │
│ 3          │ 2                │
│ 4          │ 2                │
│ 5          │ 2                │
│ 6          │ 2                │
│ 7          │ 2                │
│ 8          │ 2                │
│ 9          │ 2                │
│ 10         │ 2                │
└────────────┴──────────────────┘
**/
