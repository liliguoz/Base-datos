-------------------------------------------------Creación de tablas----------------------------------------------------------------

create table fabricante(
    codigo integer primary key,
    nombre text
);

create table producto(
    codigo integer primary key,
    nombre text,
    precio real,
    codigo_fabricante integer references fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

---------------------------------------Consultas con multitabla con clausula where----------------------------------------

--Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.

select p.nombre, p.precio, f.nombre from producto p, fabricante f 
where p.codigo_fabricante = f.codigo;

/**
┌─────────────────────────────────┬────────┬─────────────────┐
│             nombre              │ precio │     nombre      │
├─────────────────────────────────┼────────┼─────────────────┤
│ Disco duro SATA3 1TB            │ 86.99  │ Seagate         │
│ Memoria RAM DDR4 8GB            │ 120.0  │ Crucial         │
│ Disco SSD 1 TB                  │ 150.99 │ Samsung         │
│ GeForce GTX 1050Ti              │ 185.0  │ Gigabyte        │
│ GeForce GTX 1080 Xtreme         │ 755.0  │ Crucial         │
│ Monitor 24 LED Full HD          │ 202.0  │ Asus            │
│ Monitor 27 LED Full HD          │ 245.99 │ Asus            │
│ Portátil Yoga 520               │ 559.0  │ Lenovo          │
│ Portátil Ideapd 320             │ 444.0  │ Lenovo          │
│ Impresora HP Deskjet 3720       │ 59.99  │ Hewlett-Packard │
│ Impresora HP Laserjet Pro M26nw │ 180.0  │ Hewlett-Packard │
└─────────────────────────────────┴────────┴─────────────────┘
**/

--Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.

select p.nombre, p.precio, f.nombre from producto p, fabricante f 
where p.codigo_fabricante = f.codigo 
order by f.nombre asc;

/**
┌─────────────────────────────────┬────────┬─────────────────┐
│             nombre              │ precio │     nombre      │
├─────────────────────────────────┼────────┼─────────────────┤
│ Monitor 24 LED Full HD          │ 202.0  │ Asus            │
│ Monitor 27 LED Full HD          │ 245.99 │ Asus            │
│ Memoria RAM DDR4 8GB            │ 120.0  │ Crucial         │
│ GeForce GTX 1080 Xtreme         │ 755.0  │ Crucial         │
│ GeForce GTX 1050Ti              │ 185.0  │ Gigabyte        │
│ Impresora HP Deskjet 3720       │ 59.99  │ Hewlett-Packard │
│ Impresora HP Laserjet Pro M26nw │ 180.0  │ Hewlett-Packard │
│ Portátil Yoga 520               │ 559.0  │ Lenovo          │
│ Portátil Ideapd 320             │ 444.0  │ Lenovo          │
│ Disco SSD 1 TB                  │ 150.99 │ Samsung         │
│ Disco duro SATA3 1TB            │ 86.99  │ Seagate         │
└─────────────────────────────────┴────────┴─────────────────┘
**/

--Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.

select p.codigo, p.nombre, f.codigo, f.nombre from producto p, fabricante f
where p.codigo_fabricante = f.codigo;

/**
┌────────┬─────────────────────────────────┬────────┬─────────────────┐
│ codigo │             nombre              │ codigo │     nombre      │
├────────┼─────────────────────────────────┼────────┼─────────────────┤
│ 1      │ Disco duro SATA3 1TB            │ 5      │ Seagate         │
│ 2      │ Memoria RAM DDR4 8GB            │ 6      │ Crucial         │
│ 3      │ Disco SSD 1 TB                  │ 4      │ Samsung         │
│ 4      │ GeForce GTX 1050Ti              │ 7      │ Gigabyte        │
│ 5      │ GeForce GTX 1080 Xtreme         │ 6      │ Crucial         │
│ 6      │ Monitor 24 LED Full HD          │ 1      │ Asus            │
│ 7      │ Monitor 27 LED Full HD          │ 1      │ Asus            │
│ 8      │ Portátil Yoga 520               │ 2      │ Lenovo          │
│ 9      │ Portátil Ideapd 320             │ 2      │ Lenovo          │
│ 10     │ Impresora HP Deskjet 3720       │ 3      │ Hewlett-Packard │
│ 11     │ Impresora HP Laserjet Pro M26nw │ 3      │ Hewlett-Packard │
└────────┴─────────────────────────────────┴────────┴─────────────────┘
**/

--Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.

select p.nombre, f.nombre, min(p.precio) as producto_mas_barato from producto p, fabricante f
where p.codigo_fabricante = f.codigo;

/**
┌───────────────────────────┬─────────────────┬─────────────────────┐
│          nombre           │     nombre      │ producto_mas_barato │
├───────────────────────────┼─────────────────┼─────────────────────┤
│ Impresora HP Deskjet 3720 │ Hewlett-Packard │ 59.99               │
└───────────────────────────┴─────────────────┴─────────────────────┘
**/

--Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

select p.nombre, max(p.precio) as producto_mas_caro, f.nombre  from producto p, fabricante f
where p.codigo_fabricante = f.codigo;

/**
┌─────────────────────────┬───────────────────┬─────────┐
│         nombre          │ producto_mas_caro │ nombre  │
├─────────────────────────┼───────────────────┼─────────┤
│ GeForce GTX 1080 Xtreme │ 755.0             │ Crucial │
└─────────────────────────┴───────────────────┴─────────┘
**/

--Devuelve una lista de todos los productos del fabricante Lenovo.

select p.* from producto p, fabricante f 
where p.codigo_fabricante = f.codigo and f.nombre = 'Lenovo';

/**
┌────────┬─────────────────────┬────────┬───────────────────┐
│ codigo │       nombre        │ precio │ codigo_fabricante │
├────────┼─────────────────────┼────────┼───────────────────┤
│ 8      │ Portátil Yoga 520   │ 559.0  │ 2                 │
│ 9      │ Portátil Ideapd 320 │ 444.0  │ 2                 │
└────────┴─────────────────────┴────────┴───────────────────┘
**/

--Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.

select p.* from producto p, fabricante f 
where p.codigo_fabricante = f.codigo and f.nombre = 'Crucial' and p.precio > 200;

/**
┌────────┬─────────────────────────┬────────┬───────────────────┐
│ codigo │         nombre          │ precio │ codigo_fabricante │
├────────┼─────────────────────────┼────────┼───────────────────┤
│ 5      │ GeForce GTX 1080 Xtreme │ 755.0  │ 6                 │
└────────┴─────────────────────────┴────────┴───────────────────┘
**/

--Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.

select p.* from producto p, fabricante f 
where p.codigo_fabricante = f.codigo and (f.nombre = 'Asus' or f.nombre = 'Hewlett-Packardy' or f.nombre = 'Seagate');

/**
┌────────┬────────────────────────┬────────┬───────────────────┐
│ codigo │         nombre         │ precio │ codigo_fabricante │
├────────┼────────────────────────┼────────┼───────────────────┤
│ 1      │ Disco duro SATA3 1TB   │ 86.99  │ 5                 │
│ 6      │ Monitor 24 LED Full HD │ 202.0  │ 1                 │
│ 7      │ Monitor 27 LED Full HD │ 245.99 │ 1                 │
└────────┴────────────────────────┴────────┴───────────────────┘
**/

--Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.

select p.* from producto p, fabricante f 
where p.codigo_fabricante = f.codigo and f.nombre in ('Asus', 'Hewlett-Packardy', 'Seagate');

/**
┌────────┬────────────────────────┬────────┬───────────────────┐
│ codigo │         nombre         │ precio │ codigo_fabricante │
├────────┼────────────────────────┼────────┼───────────────────┤
│ 1      │ Disco duro SATA3 1TB   │ 86.99  │ 5                 │
│ 6      │ Monitor 24 LED Full HD │ 202.0  │ 1                 │
│ 7      │ Monitor 27 LED Full HD │ 245.99 │ 1                 │
└────────┴────────────────────────┴────────┴───────────────────┘
**/

--Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.

select p.nombre, p.precio, f.nombre from fabricante f, producto p
where p.codigo_fabricante = f.codigo and f.nombre regexp 'e$';

/**
┌──────────────────────┬────────┬──────────┐
│        nombre        │ precio │  nombre  │
├──────────────────────┼────────┼──────────┤
│ Disco duro SATA3 1TB │ 86.99  │ Seagate  │
│ GeForce GTX 1050Ti   │ 185.0  │ Gigabyte │
└──────────────────────┴────────┴──────────┘
**/

--Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.

select p.nombre, p.precio, f.nombre from producto p, fabricante f 
where p.codigo_fabricante = f.codigo and f.nombre regexp 'w';

/**
┌─────────────────────────────────┬────────┬─────────────────┐
│             nombre              │ precio │     nombre      │
├─────────────────────────────────┼────────┼─────────────────┤
│ Impresora HP Deskjet 3720       │ 59.99  │ Hewlett-Packard │
│ Impresora HP Laserjet Pro M26nw │ 180.0  │ Hewlett-Packard │
└─────────────────────────────────┴────────┴─────────────────┘
**/

--Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

select p.precio, p.nombre, f.nombre from producto p, fabricante f
where p.codigo_fabricante = f.codigo and p.precio >= 180 
order by p.precio desc, p.nombre asc;

/**
┌────────┬─────────────────────────────────┬─────────────────┐
│ precio │             nombre              │     nombre      │
├────────┼─────────────────────────────────┼─────────────────┤
│ 755.0  │ GeForce GTX 1080 Xtreme         │ Crucial         │
│ 559.0  │ Portátil Yoga 520               │ Lenovo          │
│ 444.0  │ Portátil Ideapd 320             │ Lenovo          │
│ 245.99 │ Monitor 27 LED Full HD          │ Asus            │
│ 202.0  │ Monitor 24 LED Full HD          │ Asus            │
│ 185.0  │ GeForce GTX 1050Ti              │ Gigabyte        │
│ 180.0  │ Impresora HP Laserjet Pro M26nw │ Hewlett-Packard │
└────────┴─────────────────────────────────┴─────────────────┘
**/

--Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.

select f.codigo, f.nombre from fabricante f, producto p
where f.codigo = p.codigo_fabricante;

/**
┌────────┬─────────────────┐
│ codigo │     nombre      │
├────────┼─────────────────┤
│ 5      │ Seagate         │
│ 6      │ Crucial         │
│ 4      │ Samsung         │
│ 7      │ Gigabyte        │
│ 6      │ Crucial         │
│ 1      │ Asus            │
│ 1      │ Asus            │
│ 2      │ Lenovo          │
│ 2      │ Lenovo          │
│ 3      │ Hewlett-Packard │
│ 3      │ Hewlett-Packard │
└────────┴─────────────────┘
**/

-----------------------------------Consultas con multitabla con LEFT JOIN y RIGHT JOIN-------------------------------------------------

--Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.

select * from fabricante as f left join producto as p on f.codigo = p.codigo_fabricante;

/**
┌────────┬─────────────────┬────────┬─────────────────────────────────┬────────┬───────────────────┐
│ codigo │     nombre      │ codigo │             nombre              │ precio │ codigo_fabricante │
├────────┼─────────────────┼────────┼─────────────────────────────────┼────────┼───────────────────┤
│ 1      │ Asus            │ 6      │ Monitor 24 LED Full HD          │ 202.0  │ 1                 │
│ 1      │ Asus            │ 7      │ Monitor 27 LED Full HD          │ 245.99 │ 1                 │
│ 2      │ Lenovo          │ 9      │ Portátil Ideapd 320             │ 444.0  │ 2                 │
│ 2      │ Lenovo          │ 8      │ Portátil Yoga 520               │ 559.0  │ 2                 │
│ 3      │ Hewlett-Packard │ 10     │ Impresora HP Deskjet 3720       │ 59.99  │ 3                 │
│ 3      │ Hewlett-Packard │ 11     │ Impresora HP Laserjet Pro M26nw │ 180.0  │ 3                 │
│ 4      │ Samsung         │ 3      │ Disco SSD 1 TB                  │ 150.99 │ 4                 │
│ 5      │ Seagate         │ 1      │ Disco duro SATA3 1TB            │ 86.99  │ 5                 │
│ 6      │ Crucial         │ 5      │ GeForce GTX 1080 Xtreme         │ 755.0  │ 6                 │
│ 6      │ Crucial         │ 2      │ Memoria RAM DDR4 8GB            │ 120.0  │ 6                 │
│ 7      │ Gigabyte        │ 4      │ GeForce GTX 1050Ti              │ 185.0  │ 7                 │
│ 8      │ Huawei          │        │                                 │        │                   │
│ 9      │ Xiaomi          │        │                                 │        │                   │
└────────┴─────────────────┴────────┴─────────────────────────────────┴────────┴───────────────────┘
**/

Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.

select * from fabricante as f left join producto as p on f.codigo = p.codigo_fabricante where p.codigo_fabricante is null;

/**
┌────────┬────────┬────────┬────────┬────────┬───────────────────┐
│ codigo │ nombre │ codigo │ nombre │ precio │ codigo_fabricante │
├────────┼────────┼────────┼────────┼────────┼───────────────────┤
│ 8      │ Huawei │        │        │        │                   │
│ 9      │ Xiaomi │        │        │        │                   │
└────────┴────────┴────────┴────────┴────────┴───────────────────┘
**/

--------------------------------------------------------Consultas realizando calculos-----------------------------------------------------

--Calcula el número total de productos que hay en la tabla productos.

select count(codigo) as num_productos from producto;

/**
┌───────────────┐
│ num_productos │
├───────────────┤
│ 11            │
└───────────────┘
**/

--Calcula el número total de fabricantes que hay en la tabla fabricante.

select count(codigo) as num_fabricantes from fabricante;

/**
┌─────────────────┐
│ num_fabricantes │
├─────────────────┤
│ 9               │
└─────────────────┘
**/

--Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.

select distinct(count(codigo)) as num_id from fabricante;

/**
┌────────┐
│ num_id │
├────────┤
│ 9      │
└────────┘
**/

--Calcula la media del precio de todos los productos.

select avg(precio) as media_precio from producto;

/**
┌──────────────────┐
│   media_precio   │
├──────────────────┤
│ 271.723636363636 │
└──────────────────┘
**/

--Calcula el precio más barato de todos los productos.

select min(precio) as precio_barato from producto;

/**
┌───────────────┐
│ precio_barato │
├───────────────┤
│ 59.99         │
└───────────────┘
**/

--Calcula el precio más caro de todos los productos.

select max(precio) as precio_caro from producto;

/**
┌─────────────┐
│ precio_caro │
├─────────────┤
│ 755.0       │
└─────────────┘
**/

--Lista el nombre y el precio del producto más barato.

select nombre, min(precio) as precio_más_barato from producto;

/**
┌───────────────────────────┬───────────────────┐
│          nombre           │ precio_más_barato │
├───────────────────────────┼───────────────────┤
│ Impresora HP Deskjet 3720 │ 59.99             │
└───────────────────────────┴───────────────────┘
**/

--Lista el nombre y el precio del producto más caro.

select nombre, max(precio) as precio_mas_caro from producto;

/**
┌─────────────────────────┬─────────────────┐
│         nombre          │ precio_mas_caro │
├─────────────────────────┼─────────────────┤
│ GeForce GTX 1080 Xtreme │ 755.0           │
└─────────────────────────┴─────────────────┘
**/

--Calcula la suma de los precios de todos los productos.

select sum(precio) as suma_precio from producto;

/**
┌─────────────┐
│ suma_precio │
├─────────────┤
│ 2988.96     │
└─────────────┘
**/

--Calcula el número de productos que tiene el fabricante Asus.

select count(p.codigo) as num_productos from producto p, fabricante f
where p.codigo_fabricante = f.codigo and f.nombre in ('Asus'); 

/**
┌───────────────┐
│ num_productos │
├───────────────┤
│ 2             │
└───────────────┘
**/

--Calcula la media del precio de todos los productos del fabricante Asus.

select avg(p.precio) as precio_medio from producto p, fabricante f 
where p.codigo_fabricante = f.codigo and f.nombre in ('Asus');

/**
┌──────────────┐
│ precio_medio │
├──────────────┤
│ 223.995      │
└──────────────┘
**/

--Calcula el precio más barato de todos los productos del fabricante Asus.

select min(p.precio) as precio_min from producto p, fabricante f 
where p.codigo_fabricante = f.codigo and f.nombre in ('Asus');

/**
┌────────────┐
│ precio_min │
├────────────┤
│ 202.0      │
└────────────┘
**/

--Calcula el precio más caro de todos los productos del fabricante Asus.

select max(p.precio) as precio_max from producto p, fabricante f 
where p.codigo_fabricante = f.codigo and f.nombre in ('Asus');

/**
┌────────────┐
│ precio_max │
├────────────┤
│ 245.99     │
└────────────┘
**/

--Calcula la suma de todos los productos del fabricante Asus.

select sum(p.precio) as suma_precio from producto p, fabricante f 
where p.codigo_fabricante = f.codigo and f.nombre in ('Asus');

/**
┌─────────────┐
│ suma_precio │
├─────────────┤
│ 447.99      │
└─────────────┘
**/

--Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.

select max(p.precio) as precio_max, min(p.precio) as precio_min, avg(p.precio) as media_precio, count(p.codigo) as num_productos
from producto p, fabricante f where p.codigo_fabricante = f.codigo and f.nombre in ('Crucial');

/**
┌────────────┬────────────┬──────────────┬───────────────┐
│ precio_max │ precio_min │ media_precio │ num_productos │
├────────────┼────────────┼──────────────┼───────────────┤
│ 755.0      │ 120.0      │ 437.5        │ 2             │
└────────────┴────────────┴──────────────┴───────────────┘
**/

--Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.

/**

**/

--Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
--Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.
--Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
--Calcula el número de productos que tienen un precio mayor o igual a 180€.

select count(codigo) as num_productos from producto where precio >=180;

/**
┌───────────────┐
│ num_productos │
├───────────────┤
│ 7             │
└───────────────┘
**/

--Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.

select f.nombre, count(p.codigo) as num from producto p, fabricante f 
where p.codigo_fabricante = f.codigo and p.precio >= 180
group by f.codigo; 

/**
┌─────────────────┬─────┐
│     nombre      │ num │
├─────────────────┼─────┤
│ Asus            │ 2   │
│ Lenovo          │ 2   │
│ Hewlett-Packard │ 1   │
│ Crucial         │ 1   │
│ Gigabyte        │ 1   │
└─────────────────┴─────┘
**/

--Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.

select f.codigo, avg(p.precio) from producto p, fabricante f 
where p.codigo_fabricante = f.codigo
group by f.codigo;

/**
┌────────┬───────────────┐
│ codigo │ avg(p.precio) │
├────────┼───────────────┤
│ 1      │ 223.995       │
│ 2      │ 501.5         │
│ 3      │ 119.995       │
│ 4      │ 150.99        │
│ 5      │ 86.99         │
│ 6      │ 437.5         │
│ 7      │ 185.0         │
└────────┴───────────────┘
**/

--Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.

select f.nombre, avg(p.precio) as precio_medio from producto p, fabricante f 
where p.codigo_fabricante = f.codigo
group by f.nombre;

/**
┌─────────────────┬──────────────┐
│     nombre      │ precio_medio │
├─────────────────┼──────────────┤
│ Asus            │ 223.995      │
│ Crucial         │ 437.5        │
│ Gigabyte        │ 185.0        │
│ Hewlett-Packard │ 119.995      │
│ Lenovo          │ 501.5        │
│ Samsung         │ 150.99       │
│ Seagate         │ 86.99        │
└─────────────────┴──────────────┘
**/

--Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.

