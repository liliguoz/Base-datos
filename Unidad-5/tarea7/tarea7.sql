-- Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Qué es lo que no me han pedido?

select cl.nombre, c.modelo, c.precio 
from clientes as cl, coches as c, ventas as v 
WHERE cl.id_cliente = v.id_cliente and c.id_coche = v.id_coche;

/**
┌─────────────────┬────────────────┬─────────┐
│     nombre      │     modelo     │ precio  │
├─────────────────┼────────────────┼─────────┤
│ Juan Pérez      │ Sedán 2022     │ 25000.0 │
│ María Gómez     │ Hatchback 2021 │ 22000.0 │
│ Carlos López    │ SUV 2023       │ 30000.0 │
│ Ana Martínez    │ Coupé 2022     │ 28000.0 │
│ Pedro Rodríguez │ Camioneta 2023 │ 32000.0 │
│ Laura Sánchez   │ Compacto 2021  │ 20000.0 │
│ Miguel González │ Híbrido 2022   │ 27000.0 │
│ Isabel Díaz     │ Deportivo 2023 │ 35000.0 │
│ Elena Torres    │ Eléctrico 2021 │ 40000.0 │
└─────────────────┴────────────────┴─────────┘
**/

-- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
  -- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio)

select cl.id_cliente, cl.nombre, c.marca, c.precio 
from clientes as cl, coches as c, ventas as v 
WHERE cl.id_cliente = v.id_cliente and v.id_coche = c.id_coche and c.precio > (select AVG(precio) from coches);

/**
┌────────────┬─────────────────┬────────┬─────────┐
│ id_cliente │     nombre      │ marca  │ precio  │
├────────────┼─────────────────┼────────┼─────────┤
│ 3          │ Carlos López    │ Ford   │ 30000.0 │
│ 5          │ Pedro Rodríguez │ Nissan │ 32000.0 │
│ 8          │ Isabel Díaz     │ Mazda  │ 35000.0 │
│ 10         │ Elena Torres    │ Tesla  │ 40000.0 │
└────────────┴─────────────────┴────────┴─────────┘
**/

-- Mostrar los modelos de coches y sus precios que no han sido vendidos aún:
  -- Cosas que debo de tener en cuenta:
    -- Coches que han sido vendidos.
    -- Quiero los coches que no han sido vendidos. NOT id_coche IN ventas

select modelo, precio 
from coches 
WHERE id_coche NOT IN (select id_coche from ventas );

/**
┌─────────────┬─────────┐
│   modelo    │ precio  │
├─────────────┼─────────┤
│ Pickup 2022 │ 31000.0 │
└─────────────┴─────────┘
**/

-- Calcular el total gastado por todos los clientes en coches:
  -- Cosas que debo de tener en cuenta:
    -- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.

select sum(precio) as precio_total 
from coches 
where id_coche IN (select id_coche from ventas);

/**
┌──────────────┐
│ precio_total │
├──────────────┤
│ 259000.0     │
└──────────────┘
**/

-- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos?

select v.id_coche, c.modelo, cl.nombre, v.fecha_venta
from coches as c, ventas as v, clientes as cl
where c.id_coche=v.id_coche and cl.id_cliente=v.id_cliente
order by fecha_venta desc;

/**
┌──────────┬────────────────┬─────────────────┬─────────────┐
│ id_coche │     modelo     │     nombre      │ fecha_venta │
├──────────┼────────────────┼─────────────────┼─────────────┤
│ 10       │ Eléctrico 2021 │ Elena Torres    │ 2023-10-05  │
│ 8        │ Deportivo 2023 │ Isabel Díaz     │ 2023-08-25  │
│ 7        │ Híbrido 2022   │ Miguel González │ 2023-07-20  │
│ 6        │ Compacto 2021  │ Laura Sánchez   │ 2023-06-15  │
│ 5        │ Camioneta 2023 │ Pedro Rodríguez │ 2023-05-05  │
│ 4        │ Coupé 2022     │ Ana Martínez    │ 2023-04-10  │
│ 3        │ SUV 2023       │ Carlos López    │ 2023-03-25  │
│ 2        │ Hatchback 2021 │ María Gómez     │ 2023-02-20  │
│ 1        │ Sedán 2022     │ Juan Pérez      │ 2023-01-15  │
└──────────┴────────────────┴─────────────────┴─────────────┘
**/

-- Encontrar el modelo de coche más caro.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX

select modelo from coches where precio=(select MAX(precio) from coches);

/**
┌────────────────┐
│     modelo     │
├────────────────┤
│ Eléctrico 2021 │
└────────────────┘
**/

-- Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT

select cl.*, COUNT(v.id_cliente) as coches_comprados
from clientes as cl, ventas as v 
where cl.id_cliente=v.id_cliente 
group by v.id_cliente;

/**
┌────────────┬─────────────────┬──────┬────────────────┬──────────────────┐
│ id_cliente │     nombre      │ edad │   direccion    │ coches_comprados │
├────────────┼─────────────────┼──────┼────────────────┼──────────────────┤
│ 1          │ Juan Pérez      │ 30   │ Calle A #123   │ 1                │
│ 2          │ María Gómez     │ 25   │ Avenida B #456 │ 1                │
│ 3          │ Carlos López    │ 35   │ Calle C #789   │ 1                │
│ 4          │ Ana Martínez    │ 28   │ Avenida D #101 │ 1                │
│ 5          │ Pedro Rodríguez │ 40   │ Calle E #234   │ 1                │
│ 6          │ Laura Sánchez   │ 32   │ Avenida F #567 │ 1                │
│ 7          │ Miguel González │ 27   │ Calle G #890   │ 1                │
│ 8          │ Isabel Díaz     │ 38   │ Avenida H #111 │ 1                │
│ 10         │ Elena Torres    │ 29   │ Avenida J #333 │ 1                │
└────────────┴─────────────────┴──────┴────────────────┴──────────────────┘
**/

-- Encontrar los clientes que han comprado coches de la marca 'Toyota':
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?.

select cl.* 
from clientes as cl, ventas as v, coches as c
where cl.id_cliente=v.id_cliente and c.id_coche=v.id_coche and c.marca regexp 'Toyota';

/**
┌────────────┬────────────┬──────┬──────────────┐
│ id_cliente │   nombre   │ edad │  direccion   │
├────────────┼────────────┼──────┼──────────────┤
│ 1          │ Juan Pérez │ 30   │ Calle A #123 │
└────────────┴────────────┴──────┴──────────────┘
**/

-- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. 

select avg(edad) as edad_promedio 
from clientes
WHERE id_cliente IN (select v.id_cliente from ventas as v, coches as c WHERE v.id_coche = c.id_coche and c.precio > 25000); 

/**
┌──────────────────┐
│  edad_promedio   │
├──────────────────┤
│ 32.8333333333333 │
└──────────────────┘
**/

-- Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

select modelo, precio 
from coches 
where id_coche IN (select v.id_coche from ventas as v, clientes as cl where v.id_cliente=cl.id_cliente and cl.edad > 30);

/**
┌────────────────┬─────────┐
│     modelo     │ precio  │
├────────────────┼─────────┤
│ SUV 2023       │ 30000.0 │
│ Camioneta 2023 │ 32000.0 │
│ Compacto 2021  │ 20000.0 │
│ Deportivo 2023 │ 35000.0 │
└────────────────┴─────────┘
**/

-- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

select c.modelo, COUNT(*) as total_ventas 
from coches as c, clientes as cl, ventas as v 
where cl.id_cliente=v.id_cliente and c.id_coche=v.id_coche and v.fecha_venta = 2022 
group by c.modelo;

/**
No se devuelve nada 
**/

-- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. AVG
select c.*
from coches as c, ventas as v, clientes as cl
where cl.id_cliente=v.id_cliente and c.id_coche=v.id_coche and c.precio > (select avg(precio) from coches) and cl.edad < 30;

/**
┌──────────┬────────────────┬───────┬──────┬─────────┐
│ id_coche │     modelo     │ marca │ año  │ precio  │
├──────────┼────────────────┼───────┼──────┼─────────┤
│ 10       │ Eléctrico 2021 │ Tesla │ 2021 │ 40000.0 │
└──────────┴────────────────┴───────┴──────┴─────────┘
**/

-- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio

SELECT c.marca, count(*) as total_ventas 
from coches as c, clientes as cl, ventas as v 
where cl.id_cliente=v.id_cliente and c.id_coche=v.id_coche 
group by c.marca 
order by total_ventas desc;

/**
┌────────────┬──────────────┐
│   marca    │ total_ventas │
├────────────┼──────────────┤
│ Volkswagen │ 1            │
│ Toyota     │ 1            │
│ Tesla      │ 1            │
│ Nissan     │ 1            │
│ Mazda      │ 1            │
│ Hyundai    │ 1            │
│ Honda      │ 1            │
│ Ford       │ 1            │
│ Chevrolet  │ 1            │
└────────────┴──────────────┘
**/