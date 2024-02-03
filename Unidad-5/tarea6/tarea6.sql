-- Obtener todos los clientes.

select * from Clientes;

/**
┌────┬─────────────────┬───────────────────────────┐
│ id │     nombre      │           email           │
├────┼─────────────────┼───────────────────────────┤
│ 1  │ Juan Pérez      │ juan@example.com          │
│ 2  │ María Gómez     │ maria@example.com         │
│ 3  │ Carlos López    │ carlos@example.com        │
│ 4  │ Ana Rodríguez   │ ana@example.com           │
│ 5  │ Luisa Martínez  │ luisa@example.com         │
│ 6  │ Pedro Sánchez   │ pedro@example.com         │
│ 7  │ Laura García    │ laura@example.com         │
│ 8  │ Miguel Martín   │ miguel@example.com        │
│ 9  │ Elena González  │ elena@example.com         │
│ 10 │ David Torres    │ david@example.com         │
│ 11 │ Sofía Ruiz      │ sofia@example.com         │
│ 12 │ Javier López    │ javier@example.com        │
│ 13 │ Carmen Vargas   │ carmen@example.com        │
│ 14 │ Daniel Muñoz    │ daniel@example.com        │
│ 15 │ Isabel Serrano  │ isabel@example.com        │
│ 16 │ Alejandro Muñoz │ alejandro@example.com     │
│ 17 │ Raquel Herrera  │ raquel@example.com        │
│ 18 │ Francisco Mora  │ francisco@example.com     │
│ 19 │ Marina Díaz     │ marina@example.com        │
│ 20 │ Antonio Jiménez │ antonio@example.com       │
│ 21 │ Beatriz Romero  │ beatriz@example.com       │
│ 22 │ Carlos Gómez    │ carlos.gomez@example.com  │
│ 23 │ Clara Sánchez   │ clara.sanchez@example.com │
│ 24 │ Andrés Martínez │ andres@example.com        │
│ 25 │ Lucía Díaz      │ lucia@example.com         │
│ 26 │ Mario Serrano   │ mario@example.com         │
│ 27 │ Eva Torres      │ eva.torres@example.com    │
│ 28 │ Roberto Ruiz    │ roberto@example.com       │
│ 29 │ Celia García    │ celia@example.com         │
└────┴─────────────────┴───────────────────────────┘
**/

-- Obtener la cantidad total de productos en todos los pedidos

select sum(cantidad) as total_pedidos from Pedidos

/**
┌───────────────┐
│ total_pedidos │
├───────────────┤
│ 54            │
└───────────────┘
**/

-- Obtener el precio promedio de los productos:

select avg(precio) as precio_promedio from Productos;

/**
┌──────────────────┐
│ precio_promedio  │
├──────────────────┤
│ 188.294285714286 │
└──────────────────┘
**/

-- Obtener los clientes que tienen un email válido (contiene '@'):

select email from Clientes where email regexp '^[a-zA-Z0-9]+@[a-z]+\.[a-z]{2,3}';

/**
┌───────────────────────┐
│         email         │
├───────────────────────┤
│ alejandro@example.com │
│ ana@example.com       │
│ andres@example.com    │
│ antonio@example.com   │
│ beatriz@example.com   │
│ carlos@example.com    │
│ carmen@example.com    │
│ celia@example.com     │
│ daniel@example.com    │
│ david@example.com     │
│ elena@example.com     │
│ francisco@example.com │
│ isabel@example.com    │
│ javier@example.com    │
│ juan@example.com      │
│ laura@example.com     │
│ lucia@example.com     │
│ luisa@example.com     │
│ maria@example.com     │
│ marina@example.com    │
│ mario@example.com     │
│ miguel@example.com    │
│ pedro@example.com     │
│ raquel@example.com    │
│ roberto@example.com   │
│ sofia@example.com     │
└───────────────────────┘
**/

-- Obtener el producto más caro.

select nombre, max(precio) as producto_más_caro from Productos;

/**
┌────────┬───────────────────┐
│ nombre │ producto_más_caro │
├────────┼───────────────────┤
│ Laptop │ 1200.0            │
└────────┴───────────────────┘
**/

-- Obtener los pedidos realizados en febrero de 2024.

select * from Pedidos where fecha_pedido regexp '2024-02';

/**
┌───────────┬────────────┬─────────────┬──────────┬──────────────┐
│ id_pedido │ id_cliente │ id_producto │ cantidad │ fecha_pedido │
├───────────┼────────────┼─────────────┼──────────┼──────────────┤
│ 1         │ 1          │ 1           │ 2        │ 2024-02-01   │
│ 2         │ 2          │ 2           │ 1        │ 2024-02-02   │
│ 3         │ 3          │ 3           │ 3        │ 2024-02-03   │
│ 4         │ 4          │ 4           │ 1        │ 2024-02-04   │
│ 5         │ 5          │ 5           │ 2        │ 2024-02-05   │
│ 6         │ 6          │ 6           │ 1        │ 2024-02-06   │
│ 7         │ 7          │ 7           │ 3        │ 2024-02-07   │
│ 8         │ 8          │ 8           │ 2        │ 2024-02-08   │
│ 9         │ 9          │ 9           │ 1        │ 2024-02-09   │
│ 10        │ 10         │ 10          │ 2        │ 2024-02-10   │
│ 11        │ 11         │ 11          │ 1        │ 2024-02-11   │
│ 12        │ 12         │ 12          │ 3        │ 2024-02-12   │
│ 13        │ 13         │ 13          │ 1        │ 2024-02-13   │
│ 14        │ 14         │ 14          │ 2        │ 2024-02-14   │
│ 15        │ 15         │ 15          │ 1        │ 2024-02-15   │
│ 16        │ 16         │ 16          │ 3        │ 2024-02-16   │
│ 17        │ 17         │ 17          │ 2        │ 2024-02-17   │
│ 18        │ 18         │ 18          │ 1        │ 2024-02-18   │
│ 19        │ 19         │ 19          │ 2        │ 2024-02-19   │
│ 20        │ 20         │ 20          │ 1        │ 2024-02-20   │
│ 21        │ 21         │ 21          │ 3        │ 2024-02-21   │
│ 22        │ 22         │ 22          │ 1        │ 2024-02-22   │
│ 23        │ 23         │ 23          │ 2        │ 2024-02-23   │
│ 24        │ 24         │ 24          │ 1        │ 2024-02-24   │
│ 25        │ 25         │ 25          │ 3        │ 2024-02-25   │
│ 26        │ 26         │ 26          │ 2        │ 2024-02-26   │
│ 27        │ 27         │ 27          │ 1        │ 2024-02-27   │
│ 28        │ 28         │ 28          │ 2        │ 2024-02-28   │
│ 29        │ 29         │ 29          │ 1        │ 2024-02-29   │
└───────────┴────────────┴─────────────┴──────────┴──────────────┘
**/

-- Obtener la cantidad total de productos en todos los pedidos por producto.

select pr.nombre, pe.cantidad from productos as pr, pedidos as pe where pr.id=pe.id_producto;

/**
┌───────────────────────────────────┬──────────┐
│              nombre               │ cantidad │
├───────────────────────────────────┼──────────┤
│ Laptop                            │ 2        │
│ Smartphone                        │ 1        │
│ TV LED                            │ 3        │
│ Tablet                            │ 1        │
│ Auriculares Bluetooth             │ 2        │
│ Impresora                         │ 1        │
│ Cámara Digital                    │ 3        │
│ Reproductor de Audio              │ 2        │
│ Altavoces Inalámbricos            │ 1        │
│ Reloj Inteligente                 │ 2        │
│ Teclado Inalámbrico               │ 1        │
│ Ratón Óptico                      │ 3        │
│ Monitor LED                       │ 1        │
│ Mochila para Portátil             │ 2        │
│ Disco Duro Externo                │ 1        │
│ Router Wi-Fi                      │ 3        │
│ Lámpara LED                       │ 2        │
│ Batería Externa                   │ 1        │
│ Estuche para Auriculares          │ 2        │
│ Tarjeta de Memoria                │ 1        │
│ Cargador Inalámbrico              │ 3        │
│ Kit de Limpieza para Computadoras │ 1        │
│ Funda para Tablet                 │ 2        │
│ Soporte para Teléfono             │ 1        │
│ Hub USB                           │ 3        │
│ Webcam HD                         │ 2        │
│ Funda para Laptop                 │ 1        │
│ Adaptador HDMI                    │ 2        │
└───────────────────────────────────┴──────────┘
**/

-- Obtener los clientes que han realizado más de un pedido.

select c.nombre, p.cantidad from clientes as c, pedidos as p where c.id=p.id_cliente and p.cantidad > 1;

/**
┌─────────────────┬──────────┐
│     nombre      │ cantidad │
├─────────────────┼──────────┤
│ Juan Pérez      │ 2        │
│ Carlos López    │ 3        │
│ Luisa Martínez  │ 2        │
│ Laura García    │ 3        │
│ Miguel Martín   │ 2        │
│ David Torres    │ 2        │
│ Javier López    │ 3        │
│ Daniel Muñoz    │ 2        │
│ Alejandro Muñoz │ 3        │
│ Raquel Herrera  │ 2        │
│ Marina Díaz     │ 2        │
│ Beatriz Romero  │ 3        │
│ Clara Sánchez   │ 2        │
│ Lucía Díaz      │ 3        │
│ Mario Serrano   │ 2        │
│ Roberto Ruiz    │ 2        │
└─────────────────┴──────────┘
**/

-- Obtener los productos que tienen un precio registrado.

select * from Productos where precio != '';

/**
┌────┬───────────────────────────────────┬────────┐
│ id │              nombre               │ precio │
├────┼───────────────────────────────────┼────────┤
│ 1  │ Laptop                            │ 1200.0 │
│ 2  │ Smartphone                        │ 699.99 │
│ 3  │ TV LED                            │ 799.5  │
│ 4  │ Tablet                            │ 299.99 │
│ 5  │ Auriculares Bluetooth             │ 79.99  │
│ 6  │ Impresora                         │ 199.99 │
│ 7  │ Cámara Digital                    │ 499.99 │
│ 8  │ Reproductor de Audio              │ 149.99 │
│ 9  │ Altavoces Inalámbricos            │ 129.99 │
│ 10 │ Reloj Inteligente                 │ 249.99 │
│ 11 │ Teclado Inalámbrico               │ 59.99  │
│ 12 │ Ratón Óptico                      │ 29.99  │
│ 13 │ Monitor LED                       │ 349.99 │
│ 14 │ Mochila para Portátil             │ 49.99  │
│ 15 │ Disco Duro Externo                │ 89.99  │
│ 16 │ Router Wi-Fi                      │ 69.99  │
│ 17 │ Lámpara LED                       │ 39.99  │
│ 18 │ Batería Externa                   │ 19.99  │
│ 19 │ Estuche para Auriculares          │ 14.99  │
│ 20 │ Tarjeta de Memoria                │ 24.99  │
│ 21 │ Cargador Inalámbrico              │ 34.99  │
│ 22 │ Kit de Limpieza para Computadoras │ 9.99   │
│ 23 │ Funda para Tablet                 │ 19.99  │
│ 24 │ Soporte para Teléfono             │ 14.99  │
│ 25 │ Hub USB                           │ 29.99  │
│ 26 │ Webcam HD                         │ 59.99  │
│ 27 │ Funda para Laptop                 │ 29.99  │
│ 28 │ Adaptador HDMI                    │ 12.99  │
└────┴───────────────────────────────────┴────────┘
**/

-- Obtener la fecha del primer pedido realizado:

select fecha_pedido from Pedidos order by fecha_pedido ASC LIMIT 1;

/**
┌──────────────┐
│ fecha_pedido │
├──────────────┤
│ 2024-02-01   │
└──────────────┘
**/

-- Obtener los productos cuyos nombres comienzan con 'A' o 'B':

select nombre from Productos where nombre regexp '^A|B';

/**
┌────────────────────────┐
│         nombre         │
├────────────────────────┤
│ Auriculares Bluetooth  │
│ Altavoces Inalámbricos │
│ Batería Externa        │
│ Adaptador HDMI         │
└────────────────────────┘
**/

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.

select id_cliente, sum(cantidad) as 'cantidad_total' from Pedidos group by id_cliente order by id_cliente;

/**
┌────────────┬────────────────┐
│ id_cliente │ cantidad_total │
├────────────┼────────────────┤
│ 1          │ 2              │
│ 2          │ 1              │
│ 3          │ 3              │
│ 4          │ 1              │
│ 5          │ 2              │
│ 6          │ 1              │
│ 7          │ 3              │
│ 8          │ 2              │
│ 9          │ 1              │
│ 10         │ 2              │
│ 11         │ 1              │
│ 12         │ 3              │
│ 13         │ 1              │
│ 14         │ 2              │
│ 15         │ 1              │
│ 16         │ 3              │
│ 17         │ 2              │
│ 18         │ 1              │
│ 19         │ 2              │
│ 20         │ 1              │
│ 21         │ 3              │
│ 22         │ 1              │
│ 23         │ 2              │
│ 24         │ 1              │
│ 25         │ 3              │
│ 26         │ 2              │
│ 27         │ 1              │
│ 28         │ 2              │
│ 29         │ 1              │
│ 30         │ 3              │
└────────────┴────────────────┘
**/

-- Obtener los clientes que han realizado más de un pedido en febrero de 2024.

 select c.* from Clientes as c, Pedidos as p where p.id_cliente=c.id and p.fecha_pedido regexp '^2024-02' group by id_cliente having COUNT(p.id_cliente)>1;

/**
No hay
**/

-- Obtener los productos con precio entre 100 y 500.

select * from Productos where precio between 100 and 500;

/**
┌────┬────────────────────────┬────────┐
│ id │         nombre         │ precio │
├────┼────────────────────────┼────────┤
│ 4  │ Tablet                 │ 299.99 │
│ 6  │ Impresora              │ 199.99 │
│ 7  │ Cámara Digital         │ 499.99 │
│ 8  │ Reproductor de Audio   │ 149.99 │
│ 9  │ Altavoces Inalámbricos │ 129.99 │
│ 10 │ Reloj Inteligente      │ 249.99 │
│ 13 │ Monitor LED            │ 349.99 │
└────┴────────────────────────┴────────┘
**/

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cantidad descendente.

select id_cliente, SUM(cantidad) as "cantidad_cliente" from Pedidos group by id_cliente order by id_cliente desc;

/**
┌────────────┬──────────────────┐
│ id_cliente │ cantidad_cliente │
├────────────┼──────────────────┤
│ 30         │ 3                │
│ 29         │ 1                │
│ 28         │ 2                │
│ 27         │ 1                │
│ 26         │ 2                │
│ 25         │ 3                │
│ 24         │ 1                │
│ 23         │ 2                │
│ 22         │ 1                │
│ 21         │ 3                │
│ 20         │ 1                │
│ 19         │ 2                │
│ 18         │ 1                │
│ 17         │ 2                │
│ 16         │ 3                │
│ 15         │ 1                │
│ 14         │ 2                │
│ 13         │ 1                │
│ 12         │ 3                │
│ 11         │ 1                │
│ 10         │ 2                │
│ 9          │ 1                │
│ 8          │ 2                │
│ 7          │ 3                │
│ 6          │ 1                │
│ 5          │ 2                │
│ 4          │ 1                │
│ 3          │ 3                │
│ 2          │ 1                │
│ 1          │ 2                │
└────────────┴──────────────────┘
**/

-- Obtener los clientes que tienen una 'a' en cualquier posición de su nombre.

select nombre from Clientes where nombre regexp 'a';

/**
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ Juan Pérez      │
│ María Gómez     │
│ Carlos López    │
│ Ana Rodríguez   │
│ Luisa Martínez  │
│ Laura García    │
│ Miguel Martín   │
│ Elena González  │
│ David Torres    │
│ Sofía Ruiz      │
│ Javier López    │
│ Carmen Vargas   │
│ Daniel Muñoz    │
│ Isabel Serrano  │
│ Alejandro Muñoz │
│ Raquel Herrera  │
│ Francisco Mora  │
│ Marina Díaz     │
│ Beatriz Romero  │
│ Carlos Gómez    │
│ Clara Sánchez   │
│ Andrés Martínez │
│ Lucía Díaz      │
│ Mario Serrano   │
│ Eva Torres      │
│ Celia García    │
└─────────────────┘
**/

-- Obtener el precio máximo de los productos.

select max(precio) as precio_max from productos; 

/**
┌────────────┐
│ precio_max │
├────────────┤
│ 1200.0     │
└────────────┘
**/

-- Obtener los pedidos realizados por el cliente con ID 1 en febrero de 2024.

select * from Pedidos where id_cliente=1 and fecha_pedido regexp '2024-02';

/**
┌───────────┬────────────┬─────────────┬──────────┬──────────────┐
│ id_pedido │ id_cliente │ id_producto │ cantidad │ fecha_pedido │
├───────────┼────────────┼─────────────┼──────────┼──────────────┤
│ 1         │ 1          │ 1           │ 2        │ 2024-02-01   │
└───────────┴────────────┴─────────────┴──────────┴──────────────┘
**/

-- Obtener la cantidad total de productos en todos los pedidos por producto ordenado por total de productos descendente.

select id_producto, sum(cantidad) as "cantidad_total" from Pedidos group by id_producto order by cantidad_total DESC;

/**
┌─────────────┬────────────────┐
│ id_producto │ cantidad_total │
├─────────────┼────────────────┤
│ 30          │ 3              │
│ 25          │ 3              │
│ 21          │ 3              │
│ 16          │ 3              │
│ 12          │ 3              │
│ 7           │ 3              │
│ 3           │ 3              │
│ 28          │ 2              │
│ 26          │ 2              │
│ 23          │ 2              │
│ 19          │ 2              │
│ 17          │ 2              │
│ 14          │ 2              │
│ 10          │ 2              │
│ 8           │ 2              │
│ 5           │ 2              │
│ 1           │ 2              │
│ 29          │ 1              │
│ 27          │ 1              │
│ 24          │ 1              │
│ 22          │ 1              │
│ 20          │ 1              │
│ 18          │ 1              │
│ 15          │ 1              │
│ 13          │ 1              │
│ 11          │ 1              │
│ 9           │ 1              │
│ 6           │ 1              │
│ 4           │ 1              │
│ 2           │ 1              │
└─────────────┴────────────────┘
**/
 
-- Obtener los productos que no tienen un precio registrado.

select * from Productos where precio='';

/**
No hay resultado
**/

-- Obtener la fecha del último pedido realizado.

select fecha_pedido from Pedidos order by fecha_pedido desc limit 1;

/**
┌──────────────┐
│ fecha_pedido │
├──────────────┤
│ 2024-03-01   │
└──────────────┘
**/

-- Obtener los clientes cuyo nombre tiene al menos 5 caracteres.

select nombre from Clientes where nombre regexp '[a-zA-Z]{5,}';

/**
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ Carlos López    │
│ Luisa Martínez  │
│ Pedro Sánchez   │
│ Laura García    │
│ Miguel Martín   │
│ Elena González  │
│ David Torres    │
│ Javier López    │
│ Carmen Vargas   │
│ Daniel Muñoz    │
│ Isabel Serrano  │
│ Alejandro Muñoz │
│ Raquel Herrera  │
│ Francisco Mora  │
│ Marina Díaz     │
│ Antonio Jiménez │
│ Beatriz Romero  │
│ Carlos Gómez    │
│ Clara Sánchez   │
│ Mario Serrano   │
│ Eva Torres      │
│ Roberto Ruiz    │
│ Celia García    │
└─────────────────┘
**/

-- Obtener los productos que tienen la letra 'o' en cualquier posición del nombre.

select nombre from Productos where nombre regexp 'o';

/**
┌───────────────────────────────────┐
│              nombre               │
├───────────────────────────────────┤
│ Laptop                            │
│ Smartphone                        │
│ Auriculares Bluetooth             │
│ Impresora                         │
│ Reproductor de Audio              │
│ Altavoces Inalámbricos            │
│ Reloj Inteligente                 │
│ Teclado Inalámbrico               │
│ Ratón Óptico                      │
│ Monitor LED                       │
│ Mochila para Portátil             │
│ Disco Duro Externo                │
│ Router Wi-Fi                      │
│ Tarjeta de Memoria                │
│ Cargador Inalámbrico              │
│ Kit de Limpieza para Computadoras │
│ Soporte para Teléfono             │
│ Funda para Laptop                 │
│ Adaptador HDMI                    │
└───────────────────────────────────┘
**/

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.

select id_cliente, sum(cantidad) as "cantidad_productos" from Pedidos group by id_cliente order by id_cliente;

/**
┌────────────┬────────────────────┐
│ id_cliente │ cantidad_productos │
├────────────┼────────────────────┤
│ 1          │ 2                  │
│ 2          │ 1                  │
│ 3          │ 3                  │
│ 4          │ 1                  │
│ 5          │ 2                  │
│ 6          │ 1                  │
│ 7          │ 3                  │
│ 8          │ 2                  │
│ 9          │ 1                  │
│ 10         │ 2                  │
│ 11         │ 1                  │
│ 12         │ 3                  │
│ 13         │ 1                  │
│ 14         │ 2                  │
│ 15         │ 1                  │
│ 16         │ 3                  │
│ 17         │ 2                  │
│ 18         │ 1                  │
│ 19         │ 2                  │
│ 20         │ 1                  │
│ 21         │ 3                  │
│ 22         │ 1                  │
│ 23         │ 2                  │
│ 24         │ 1                  │
│ 25         │ 3                  │
│ 26         │ 2                  │
│ 27         │ 1                  │
│ 28         │ 2                  │
│ 29         │ 1                  │
│ 30         │ 3                  │
└────────────┴────────────────────┘
**/

-- Obtener los clientes cuyos nombres no contienen la letra 'i':

select nombre from Clientes where nombre NOT regexp '[iIíÍ]';

/**
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ Juan Pérez      │
│ Carlos López    │
│ Pedro Sánchez   │
│ Elena González  │
│ Carmen Vargas   │
│ Alejandro Muñoz │
│ Raquel Herrera  │
│ Carlos Gómez    │
│ Clara Sánchez   │
│ Eva Torres      │
└─────────────────┘
**/

-- Obtener los pedidos realizados por el cliente con ID 2 en febrero de 2024.

select * from pedidos where id_cliente = 2 and fecha_pedido regexp '2024-02';

/**
┌───────────┬────────────┬─────────────┬──────────┬──────────────┐
│ id_pedido │ id_cliente │ id_producto │ cantidad │ fecha_pedido │
├───────────┼────────────┼─────────────┼──────────┼──────────────┤
│ 2         │ 2          │ 2           │ 1        │ 2024-02-02   │
└───────────┴────────────┴─────────────┴──────────┴──────────────┘
**/

-- Obtener el precio mínimo de los productos.-

select min(precio) as precio_mínimo from Productos;

/**
┌───────────────┐
│ precio_mínimo │
├───────────────┤
│ 9.99          │
└───────────────┘
**/

-- Obtener los clientes que han realizado al menos un pedido en febrero de 2024.

select id_cliente, cantidad, fecha_pedido from pedidos where cantidad >= 1 and fecha_pedido regexp '2024-02';

/**
┌────────────┬──────────┬──────────────┐
│ id_cliente │ cantidad │ fecha_pedido │
├────────────┼──────────┼──────────────┤
│ 1          │ 2        │ 2024-02-01   │
│ 2          │ 1        │ 2024-02-02   │
│ 3          │ 3        │ 2024-02-03   │
│ 4          │ 1        │ 2024-02-04   │
│ 5          │ 2        │ 2024-02-05   │
│ 6          │ 1        │ 2024-02-06   │
│ 7          │ 3        │ 2024-02-07   │
│ 8          │ 2        │ 2024-02-08   │
│ 9          │ 1        │ 2024-02-09   │
│ 10         │ 2        │ 2024-02-10   │
│ 11         │ 1        │ 2024-02-11   │
│ 12         │ 3        │ 2024-02-12   │
│ 13         │ 1        │ 2024-02-13   │
│ 14         │ 2        │ 2024-02-14   │
│ 15         │ 1        │ 2024-02-15   │
│ 16         │ 3        │ 2024-02-16   │
│ 17         │ 2        │ 2024-02-17   │
│ 18         │ 1        │ 2024-02-18   │
│ 19         │ 2        │ 2024-02-19   │
│ 20         │ 1        │ 2024-02-20   │
│ 21         │ 3        │ 2024-02-21   │
│ 22         │ 1        │ 2024-02-22   │
│ 23         │ 2        │ 2024-02-23   │
│ 24         │ 1        │ 2024-02-24   │
│ 25         │ 3        │ 2024-02-25   │
│ 26         │ 2        │ 2024-02-26   │
│ 27         │ 1        │ 2024-02-27   │
│ 28         │ 2        │ 2024-02-28   │
│ 29         │ 1        │ 2024-02-29   │
└────────────┴──────────┴──────────────┘
**/

-- Obtener la fecha del último pedido realizado por el cliente con ID 3.

select fecha_pedido from pedidos where id_cliente = 3 order by fecha_pedido desc limit 1;

/**
┌──────────────┐
│ fecha_pedido │
├──────────────┤
│ 2024-02-03   │
└──────────────┘
**/

-- Obtener los productos que tienen una 'a' al final del nombre.

select nombre from productos where nombre regexp 'a$';

/**
┌────────────────────┐
│       nombre       │
├────────────────────┤
│ Impresora          │
│ Batería Externa    │
│ Tarjeta de Memoria │
└────────────────────┘
**/

-- Obtener los clientes cuyos nombres tienen al menos 4 vocales (mayúsculas|minúsculas).

select nombre from clientes where nombre regexp '([aeiouAEIOU].*){4,}';

/**
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ Ana Rodríguez   │
│ Luisa Martínez  │
│ Laura García    │
│ Miguel Martín   │
│ Elena González  │
│ David Torres    │
│ Sofía Ruiz      │
│ Javier López    │
│ Carmen Vargas   │
│ Daniel Muñoz    │
│ Isabel Serrano  │
│ Alejandro Muñoz │
│ Raquel Herrera  │
│ Francisco Mora  │
│ Marina Díaz     │
│ Antonio Jiménez │
│ Beatriz Romero  │
│ Mario Serrano   │
│ Eva Torres      │
│ Roberto Ruiz    │
│ Celia García    │
└─────────────────┘
**/

-- Obtener los productos cuyo precio tenga al menos 4 números sin contrar los decimales.

select * from Productos where precio regexp '\d{4,}\.';

/**
┌────┬────────┬────────┐
│ id │ nombre │ precio │
├────┼────────┼────────┤
│ 1  │ Laptop │ 1200.0 │
└────┴────────┴────────┘
**/

-- Obtener los clientes cuyos nombres tienen al menos una 'a' seguida de una 'e'.

select nombre from clientes where nombre regexp 'ae';

/**
No hay resultado
**/

-- Obtener los productos cuyos nombres terminan con una consonante.

select nombre from Productos where nombre NOT regexp '[aeiouAEIOU]$';

/**
┌───────────────────────────────────┐
│              nombre               │
├───────────────────────────────────┤
│ Laptop                            │
│ TV LED                            │
│ Tablet                            │
│ Auriculares Bluetooth             │
│ Cámara Digital                    │
│ Altavoces Inalámbricos            │
│ Monitor LED                       │
│ Mochila para Portátil             │
│ Lámpara LED                       │
│ Estuche para Auriculares          │
│ Kit de Limpieza para Computadoras │
│ Funda para Tablet                 │
│ Hub USB                           │
│ Webcam HD                         │
│ Funda para Laptop                 │
└───────────────────────────────────┘
**/

-- Obtener los productos cuyos nombres empiezan con una vocal.

select nombre from productos where nombre regexp '^[AEIOUaeiou]';

/**
┌──────────────────────────┐
│          nombre          │
├──────────────────────────┤
│ Auriculares Bluetooth    │
│ Impresora                │
│ Altavoces Inalámbricos   │
│ Estuche para Auriculares │
│ Adaptador HDMI           │
└──────────────────────────┘
**/