--Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

select codigo_oficina, ciudad from oficina;

/**
┌────────────────┬──────────────────────┐
│ codigo_oficina │        ciudad        │
├────────────────┼──────────────────────┤
│ BCN-ES         │ Barcelona            │
│ BOS-USA        │ Boston               │
│ LON-UK         │ Londres              │
│ MAD-ES         │ Madrid               │
│ PAR-FR         │ Paris                │
│ SFC-USA        │ San Francisco        │
│ SYD-AU         │ Sydney               │
│ TAL-ES         │ Talavera de la Reina │
│ TOK-JP         │ Tokyo                │
└────────────────┴──────────────────────┘
**/

--Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

select ciudad, telefono from oficina where pais = 'España';

/**
┌──────────────────────┬────────────────┐
│        ciudad        │    telefono    │
├──────────────────────┼────────────────┤
│ Barcelona            │ +34 93 3561182 │
│ Madrid               │ +34 91 7514487 │
│ Talavera de la Reina │ +34 925 867231 │
└──────────────────────┴────────────────┘´
**/

--Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

select nombre, apellido1, apellido2, email from empleado where codigo_jefe = 7;

/**
┌─────────┬───────────┬───────────┬──────────────────────────┐
│ nombre  │ apellido1 │ apellido2 │          email           │
├─────────┼───────────┼───────────┼──────────────────────────┤
│ Mariano │ López     │ Murcia    │ mlopez@jardineria.es     │
│ Lucio   │ Campoamor │ Martín    │ lcampoamor@jardineria.es │
│ Hilario │ Rodriguez │ Huertas   │ hrodriguez@jardineria.es │
└─────────┴───────────┴───────────┴──────────────────────────┘
**/

--Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

select puesto, nombre, apellido1, apellido2, email from empleado where puesto = 'Director General';

/**
┌──────────────────┬────────┬───────────┬───────────┬──────────────────────┐
│      puesto      │ nombre │ apellido1 │ apellido2 │        email         │
├──────────────────┼────────┼───────────┼───────────┼──────────────────────┤
│ Director General │ Marcos │ Magaña    │ Perez     │ marcos@jardineria.es │
└──────────────────┴────────┴───────────┴───────────┴──────────────────────┘
**/

--Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

select nombre, apellido1, apellido2, puesto from empleado where puesto not regexp 'Representante Ventas';

/**
┌──────────┬────────────┬───────────┬───────────────────────┐
│  nombre  │ apellido1  │ apellido2 │        puesto         │
├──────────┼────────────┼───────────┼───────────────────────┤
│ Marcos   │ Magaña     │ Perez     │ Director General      │
│ Ruben    │ López      │ Martinez  │ Subdirector Marketing │
│ Alberto  │ Soria      │ Carrasco  │ Subdirector Ventas    │
│ Maria    │ Solís      │ Jerez     │ Secretaria            │
│ Carlos   │ Soria      │ Jimenez   │ Director Oficina      │
│ Emmanuel │ Magaña     │ Perez     │ Director Oficina      │
│ Francois │ Fignon     │           │ Director Oficina      │
│ Michael  │ Bolton     │           │ Director Oficina      │
│ Hilary   │ Washington │           │ Director Oficina      │
│ Nei      │ Nishikori  │           │ Director Oficina      │
│ Amy      │ Johnson    │           │ Director Oficina      │
│ Kevin    │ Fallmer    │           │ Director Oficina      │
└──────────┴────────────┴───────────┴───────────────────────┘
**/

--Devuelve un listado con el nombre de los todos los clientes españoles.

select nombre_cliente from cliente where pais = 'Spain';

/**
┌────────────────────────────────┐
│         nombre_cliente         │
├────────────────────────────────┤
│ Lasas S.A.                     │
│ Beragua                        │
│ Club Golf Puerta del hierro    │
│ Naturagua                      │
│ DaraDistribuciones             │
│ Madrileña de riegos            │
│ Lasas S.A.                     │
│ Camunas Jardines S.L.          │
│ Dardena S.A.                   │
│ Jardin de Flores               │
│ Flores Marivi                  │
│ Flowers, S.A                   │
│ Naturajardin                   │
│ Golf S.A.                      │
│ Americh Golf Management SL     │
│ Aloha                          │
│ El Prat                        │
│ Sotogrande                     │
│ Vivero Humanes                 │
│ Fuenla City                    │
│ Jardines y Mansiones Cactus SL │
│ Jardinerías Matías SL          │
│ Agrojardin                     │
│ Top Campo                      │
│ Jardineria Sara                │
│ Campohermoso                   │
│ Flores S.L.                    │
└────────────────────────────────┘
**/

--Devuelve un listado con los distintos estados por los que puede pasar un pedido.

select estado from pedido group by estado;

/**
┌───────────┐
│  estado   │
├───────────┤
│ Entregado │
│ Pendiente │
│ Rechazado │
└───────────┘
**/

--Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos.

select codigo_cliente from pago where fecha_pago regexp '2008' group by codigo_cliente; 

/**
┌────────────────┐
│ codigo_cliente │
├────────────────┤
│ 1              │
│ 13             │
│ 14             │
│ 26             │
└────────────────┘
**/

--Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido where fecha_entrega > fecha_esperada;


/**
┌───────────────┬────────────────┬────────────────┬───────────────┐
│ codigo_pedido │ codigo_cliente │ fecha_esperada │ fecha_entrega │
├───────────────┼────────────────┼────────────────┼───────────────┤
│ 9             │ 1              │ 2008-12-27     │ 2008-12-28    │
│ 13            │ 7              │ 2009-01-14     │ 2009-01-15    │
│ 16            │ 7              │ 2009-01-07     │ 2009-01-15    │
│ 17            │ 7              │ 2009-01-09     │ 2009-01-11    │
│ 18            │ 9              │ 2009-01-06     │ 2009-01-07    │
│ 22            │ 9              │ 2009-01-11     │ 2009-01-13    │
│ 28            │ 3              │ 2009-02-17     │ 2009-02-20    │
│ 31            │ 13             │ 2008-09-30     │ 2008-10-04    │
│ 32            │ 4              │ 2007-01-19     │ 2007-01-27    │
│ 38            │ 19             │ 2009-03-06     │ 2009-03-07    │
│ 39            │ 19             │ 2009-03-07     │ 2009-03-09    │
│ 40            │ 19             │ 2009-03-10     │ 2009-03-13    │
│ 42            │ 19             │ 2009-03-23     │ 2009-03-27    │
│ 43            │ 23             │ 2009-03-26     │ 2009-03-28    │
│ 44            │ 23             │ 2009-03-27     │ 2009-03-30    │
│ 45            │ 23             │ 2009-03-04     │ 2009-03-07    │
│ 46            │ 23             │ 2009-03-04     │ 2009-03-05    │
│ 49            │ 26             │ 2008-07-22     │ 2008-07-30    │
│ 55            │ 14             │ 2009-01-10     │ 2009-01-11    │
│ 60            │ 1              │ 2008-12-27     │ 2008-12-28    │
│ 68            │ 3              │ 2009-02-17     │ 2009-02-20    │
│ 92            │ 27             │ 2009-04-30     │ 2009-05-03    │
│ 96            │ 35             │ 2008-04-12     │ 2008-04-13    │
│ 103           │ 30             │ 2009-01-20     │ 2009-01-24    │
│ 106           │ 30             │ 2009-05-15     │ 2009-05-20    │
│ 112           │ 36             │ 2009-04-06     │ 2009-05-07    │
│ 113           │ 36             │ 2008-11-09     │ 2009-01-09    │
│ 114           │ 36             │ 2009-01-29     │ 2009-01-31    │
│ 115           │ 36             │ 2009-01-26     │ 2009-02-27    │
│ 123           │ 30             │ 2009-01-20     │ 2009-01-24    │
│ 126           │ 30             │ 2009-05-15     │ 2009-05-20    │
│ 128           │ 38             │ 2008-12-10     │ 2008-12-29    │
└───────────────┴────────────────┴────────────────┴───────────────┘
**/

--Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.

select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido where fecha_entrega <= date(fecha_esperada, '-2 days');

/**
┌───────────────┬────────────────┬────────────────┬───────────────┐
│ codigo_pedido │ codigo_cliente │ fecha_esperada │ fecha_entrega │
├───────────────┼────────────────┼────────────────┼───────────────┤
│ 2             │ 5              │ 2007-10-28     │ 2007-10-26    │
│ 24            │ 14             │ 2008-07-31     │ 2008-07-25    │
│ 30            │ 13             │ 2008-09-03     │ 2008-08-31    │
│ 36            │ 14             │ 2008-12-15     │ 2008-12-10    │
│ 53            │ 13             │ 2008-11-15     │ 2008-11-09    │
│ 89            │ 35             │ 2007-12-13     │ 2007-12-10    │
│ 91            │ 27             │ 2009-03-29     │ 2009-03-27    │
│ 93            │ 27             │ 2009-05-30     │ 2009-05-17    │
└───────────────┴────────────────┴────────────────┴───────────────┘
**/

--Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

select * from pedido where estado = 'Rechazado';

/**
┌───────────────┬──────────────┬────────────────┬───────────────┬───────────┬──────────────────────────────────────────────────────────────┬────────────────┐
│ codigo_pedido │ fecha_pedido │ fecha_esperada │ fecha_entrega │  estado   │                         comentarios                          │ codigo_cliente │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 3             │ 2008-06-20   │ 2008-06-25     │               │ Rechazado │ Limite de credito superado                                   │ 5              │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 14            │ 2009-01-02   │ 2009-01-02     │               │ Rechazado │ mal pago                                                     │ 7              │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 21            │ 2009-01-09   │ 2009-01-09     │ 2009-01-09    │ Rechazado │ mal pago                                                     │ 9              │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 23            │ 2008-12-30   │ 2009-01-10     │               │ Rechazado │ El pedido fue anulado por el cliente                         │ 5              │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 25            │ 2009-02-02   │ 2009-02-08     │               │ Rechazado │ El cliente carece de saldo en la cuenta asociada             │ 1              │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 26            │ 2009-02-06   │ 2009-02-12     │               │ Rechazado │ El cliente anula la operacion para adquirir mas producto     │ 3              │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 29            │ 2008-08-01   │ 2008-09-01     │ 2008-09-01    │ Rechazado │ El cliente no está conforme con el pedido                    │ 14             │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 31            │ 2008-09-04   │ 2008-09-30     │ 2008-10-04    │ Rechazado │ El cliente ha rechazado por llegar 5 dias tarde              │ 13             │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 33            │ 2007-05-20   │ 2007-05-28     │               │ Rechazado │ El pedido fue anulado por el cliente                         │ 4              │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 35            │ 2008-03-10   │ 2009-03-20     │               │ Rechazado │ Limite de credito superado                                   │ 4              │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 40            │ 2009-03-09   │ 2009-03-10     │ 2009-03-13    │ Rechazado │                                                              │ 19             │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 46            │ 2009-04-03   │ 2009-03-04     │ 2009-03-05    │ Rechazado │                                                              │ 23             │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 56            │ 2008-12-19   │ 2009-01-20     │               │ Rechazado │ El cliente a anulado el pedido el dia 2009-01-10             │ 13             │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 65            │ 2009-02-02   │ 2009-02-08     │               │ Rechazado │ El cliente carece de saldo en la cuenta asociada             │ 1              │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 66            │ 2009-02-06   │ 2009-02-12     │               │ Rechazado │ El cliente anula la operacion para adquirir mas producto     │ 3              │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 74            │ 2009-01-14   │ 2009-01-22     │               │ Rechazado │ El pedido no llego el dia que queria el cliente por fallo de │ 15             │
│               │              │                │               │           │ l transporte                                                 │                │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 81            │ 2009-01-18   │ 2009-01-24     │               │ Rechazado │ Los producto estaban en mal estado                           │ 28             │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 101           │ 2009-03-07   │ 2009-03-27     │               │ Rechazado │ El pedido fue rechazado por el cliente                       │ 16             │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 105           │ 2009-02-14   │ 2009-02-20     │               │ Rechazado │ el producto ha sido rechazado por la pesima calidad          │ 30             │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 113           │ 2008-10-28   │ 2008-11-09     │ 2009-01-09    │ Rechazado │ El producto ha sido rechazado por la tardanza de el envio    │ 36             │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 117           │ 2008-08-25   │ 2008-10-01     │               │ Rechazado │ El pedido ha sido rechazado por la acumulacion de pago pendi │ 38             │
│               │              │                │               │           │ entes del cliente                                            │                │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 120           │ 2009-03-07   │ 2009-03-27     │               │ Rechazado │ El pedido fue rechazado por el cliente                       │ 16             │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 125           │ 2009-02-14   │ 2009-02-20     │               │ Rechazado │ el producto ha sido rechazado por la pesima calidad          │ 30             │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────┼────────────────┤
│ 128           │ 2008-11-10   │ 2008-12-10     │ 2008-12-29    │ Rechazado │ El pedido ha sido rechazado por el cliente por el retraso en │ 38             │
│               │              │                │               │           │  la entrega                                                  │                │
└───────────────┴──────────────┴────────────────┴───────────────┴───────────┴──────────────────────────────────────────────────────────────┴────────────────┘
**/

--Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.

select * from pedido where fecha_entrega REGEXP '^[0-9]{4}-01-[0-9]{2}$';

/**
┌───────────────┬──────────────┬────────────────┬───────────────┬───────────┬───────────────────────────────────────────────────────────┬────────────────┐
│ codigo_pedido │ fecha_pedido │ fecha_esperada │ fecha_entrega │  estado   │                        comentarios                        │ codigo_cliente │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼───────────────────────────────────────────────────────────┼────────────────┤
│ 1             │ 2006-01-17   │ 2006-01-19     │ 2006-01-19    │ Entregado │ Pagado a plazos                                           │ 5              │
│ 13            │ 2009-01-12   │ 2009-01-14     │ 2009-01-15    │ Entregado │                                                           │ 7              │
│ 15            │ 2009-01-09   │ 2009-01-12     │ 2009-01-11    │ Entregado │                                                           │ 7              │
│ 16            │ 2009-01-06   │ 2009-01-07     │ 2009-01-15    │ Entregado │                                                           │ 7              │
│ 17            │ 2009-01-08   │ 2009-01-09     │ 2009-01-11    │ Entregado │ mal estado                                                │ 7              │
│ 18            │ 2009-01-05   │ 2009-01-06     │ 2009-01-07    │ Entregado │                                                           │ 9              │
│ 21            │ 2009-01-09   │ 2009-01-09     │ 2009-01-09    │ Rechazado │ mal pago                                                  │ 9              │
│ 22            │ 2009-01-11   │ 2009-01-11     │ 2009-01-13    │ Entregado │                                                           │ 9              │
│ 32            │ 2007-01-07   │ 2007-01-19     │ 2007-01-27    │ Entregado │ Entrega tardia, el cliente puso reclamacion               │ 4              │
│ 55            │ 2008-12-10   │ 2009-01-10     │ 2009-01-11    │ Entregado │ Retrasado 1 dia por problemas de transporte               │ 14             │
│ 58            │ 2009-01-24   │ 2009-01-31     │ 2009-01-30    │ Entregado │ Todo correcto                                             │ 3              │
│ 64            │ 2009-01-24   │ 2009-01-31     │ 2009-01-30    │ Entregado │ Todo correcto                                             │ 1              │
│ 75            │ 2009-01-11   │ 2009-01-13     │ 2009-01-13    │ Entregado │ El pedido llego perfectamente                             │ 15             │
│ 79            │ 2009-01-12   │ 2009-01-13     │ 2009-01-13    │ Entregado │                                                           │ 28             │
│ 82            │ 2009-01-20   │ 2009-01-29     │ 2009-01-29    │ Entregado │ El pedido llego un poco mas tarde de la hora fijada       │ 28             │
│ 95            │ 2008-01-04   │ 2008-01-19     │ 2008-01-19    │ Entregado │                                                           │ 35             │
│ 100           │ 2009-01-10   │ 2009-01-15     │ 2009-01-15    │ Entregado │ El pedido llego perfectamente                             │ 16             │
│ 102           │ 2008-12-28   │ 2009-01-08     │ 2009-01-08    │ Entregado │ Pago pendiente                                            │ 16             │
│ 103           │ 2009-01-15   │ 2009-01-20     │ 2009-01-24    │ Pendiente │                                                           │ 30             │
│ 113           │ 2008-10-28   │ 2008-11-09     │ 2009-01-09    │ Rechazado │ El producto ha sido rechazado por la tardanza de el envio │ 36             │
│ 114           │ 2009-01-15   │ 2009-01-29     │ 2009-01-31    │ Entregado │ El envio llego dos dias más tarde debido al mal tiempo    │ 36             │
│ 119           │ 2009-01-10   │ 2009-01-15     │ 2009-01-15    │ Entregado │ El pedido llego perfectamente                             │ 16             │
│ 121           │ 2008-12-28   │ 2009-01-08     │ 2009-01-08    │ Entregado │ Pago pendiente                                            │ 16             │
│ 123           │ 2009-01-15   │ 2009-01-20     │ 2009-01-24    │ Pendiente │                                                           │ 30             │
└───────────────┴──────────────┴────────────────┴───────────────┴───────────┴───────────────────────────────────────────────────────────┴────────────────┘
**/

--Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

select * from pago where fecha_pago regexp '2008' and forma_pago = 'PayPal';

/**
┌────────────────┬────────────┬────────────────┬────────────┬───────┐
│ codigo_cliente │ forma_pago │ id_transaccion │ fecha_pago │ total │
├────────────────┼────────────┼────────────────┼────────────┼───────┤
│ 1              │ PayPal     │ ak-std-000001  │ 2008-11-10 │ 2000  │
│ 1              │ PayPal     │ ak-std-000002  │ 2008-12-10 │ 2000  │
│ 13             │ PayPal     │ ak-std-000014  │ 2008-08-04 │ 2246  │
│ 14             │ PayPal     │ ak-std-000015  │ 2008-07-15 │ 4160  │
│ 26             │ PayPal     │ ak-std-000020  │ 2008-03-18 │ 18846 │
└────────────────┴────────────┴────────────────┴────────────┴───────┘
**/

--Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

select forma_pago from pago group by forma_pago;

/**
┌───────────────┐
│  forma_pago   │
├───────────────┤
│ Cheque        │
│ PayPal        │
│ Transferencia │
└───────────────┘
**/

--Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

select * from producto where gama = 'Ornamentales' and cantidad_en_stock > 100 order by precio_venta desc;

/**
┌─────────────────┬──────────────────────────────────────────────┬──────────────┬─────────────┬──────────────────┬──────────────────────────────────────────────────────────────┬───────────────────┬──────────────┬──────────────────┐
│ codigo_producto │                    nombre                    │     gama     │ dimensiones │    proveedor     │                         descripcion                          │ cantidad_en_stock │ precio_venta │ precio_proveedor │
├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-115          │ Forsytia Intermedia \"Lynwood\"              │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 7            │ 5                │
├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-116          │ Hibiscus Syriacus  \"Diana\" -Blanco Puro    │ Ornamentales │ 35-45       │ Viveros EL OASIS │ Por su capacidad de soportar podas, pueden ser fácilmente mo │ 120               │ 7            │ 5                │
│                 │                                              │              │             │                  │ ldeadas como bonsái en el transcurso de pocos años. Flores d │                   │              │                  │
│                 │                                              │              │             │                  │ e muchos colores según la variedad, desde el blanco puro al  │                   │              │                  │
│                 │                                              │              │             │                  │ rojo intenso, del amarillo al anaranjado. La flor apenas dur │                   │              │                  │
│                 │                                              │              │             │                  │ a 1 día, pero continuamente aparecen nuevas y la floración s │                   │              │                  │
│                 │                                              │              │             │                  │ e prolonga durante todo el periodo de crecimiento vegetativo │                   │              │                  │
│                 │                                              │              │             │                  │ .                                                            │                   │              │                  │
├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-117          │ Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo │ Ornamentales │ 35-45       │ Viveros EL OASIS │ Por su capacidad de soportar podas, pueden ser fácilmente mo │ 120               │ 7            │ 5                │
│                 │                                              │              │             │                  │ ldeadas como bonsái en el transcurso de pocos años. Flores d │                   │              │                  │
│                 │                                              │              │             │                  │ e muchos colores según la variedad, desde el blanco puro al  │                   │              │                  │
│                 │                                              │              │             │                  │ rojo intenso, del amarillo al anaranjado. La flor apenas dur │                   │              │                  │
│                 │                                              │              │             │                  │ a 1 día, pero continuamente aparecen nuevas y la floración s │                   │              │                  │
│                 │                                              │              │             │                  │ e prolonga durante todo el periodo de crecimiento vegetativo │                   │              │                  │
│                 │                                              │              │             │                  │ .                                                            │                   │              │                  │
├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-118          │ Hibiscus Syriacus \"Pink Giant\" Rosa        │ Ornamentales │ 35-45       │ Viveros EL OASIS │ Por su capacidad de soportar podas, pueden ser fácilmente mo │ 120               │ 7            │ 5                │
│                 │                                              │              │             │                  │ ldeadas como bonsái en el transcurso de pocos años. Flores d │                   │              │                  │
│                 │                                              │              │             │                  │ e muchos colores según la variedad, desde el blanco puro al  │                   │              │                  │
│                 │                                              │              │             │                  │ rojo intenso, del amarillo al anaranjado. La flor apenas dur │                   │              │                  │
│                 │                                              │              │             │                  │ a 1 día, pero continuamente aparecen nuevas y la floración s │                   │              │                  │
│                 │                                              │              │             │                  │ e prolonga durante todo el periodo de crecimiento vegetativo │                   │              │                  │
│                 │                                              │              │             │                  │ .                                                            │                   │              │                  │
├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-112          │ Escallonia (Mix)                             │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │
├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-113          │ Evonimus Emerald Gayeti                      │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │
├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-114          │ Evonimus Pulchellus                          │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │
├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-119          │ Laurus Nobilis Arbusto - Ramificado Bajo     │ Ornamentales │ 40-50       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │
├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-120          │ Lonicera Nitida                              │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │
├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-121          │ Lonicera Nitida \"Maigrum\"                  │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │
├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-122          │ Lonicera Pileata                             │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │
├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-123          │ Philadelphus \"Virginal\"                    │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │
├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-124          │ Prunus pisardii                              │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │
├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-125          │ Viburnum Tinus \"Eve Price\"                 │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │
├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-126          │ Weigelia \"Bristol Ruby\"                    │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │
└─────────────────┴──────────────────────────────────────────────┴──────────────┴─────────────┴──────────────────┴──────────────────────────────────────────────────────────────┴───────────────────┴──────────────┴──────────────────┘
**/

--Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

select * from cliente where ciudad = 'Madrid' and codigo_empleado_rep_ventas between 11 and 30;

/**
┌────────────────┬─────────────────────────────┬─────────────────┬───────────────────┬───────────┬───────────┬───────────────────┬──────────────────┬────────┬─────────────┬───────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │       nombre_cliente        │ nombre_contacto │ apellido_contacto │ telefono  │    fax    │ linea_direccion1  │ linea_direccion2 │ ciudad │   region    │ pais  │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼─────────────────────────────┼─────────────────┼───────────────────┼───────────┼───────────┼───────────────────┼──────────────────┼────────┼─────────────┼───────┼───────────────┼────────────────────────────┼────────────────┤
│ 7              │ Beragua                     │ Jose            │ Bermejo           │ 654987321 │ 916549872 │ C/pintor segundo  │ Getafe           │ Madrid │ Madrid      │ Spain │ 28942         │ 11                         │ 20000          │
│ 8              │ Club Golf Puerta del hierro │ Paco            │ Lopez             │ 62456810  │ 919535678 │ C/sinesio delgado │ Madrid           │ Madrid │ Madrid      │ Spain │ 28930         │ 11                         │ 40000          │
│ 9              │ Naturagua                   │ Guillermo       │ Rengifo           │ 689234750 │ 916428956 │ C/majadahonda     │ Boadilla         │ Madrid │ Madrid      │ Spain │ 28947         │ 11                         │ 32000          │
│ 10             │ DaraDistribuciones          │ David           │ Serrano           │ 675598001 │ 916421756 │ C/azores          │ Fuenlabrada      │ Madrid │ Madrid      │ Spain │ 28946         │ 11                         │ 50000          │
│ 11             │ Madrileña de riegos         │ Jose            │ Tacaño            │ 655983045 │ 916689215 │ C/Lagañas         │ Fuenlabrada      │ Madrid │ Madrid      │ Spain │ 28943         │ 11                         │ 20000          │
│ 15             │ Jardin de Flores            │ Javier          │ Villar            │ 654865643 │ 914538776 │ C/ Oña 34         │                  │ Madrid │ Madrid      │ Spain │ 28950         │ 30                         │ 40000          │
│ 18             │ Naturajardin                │ Victoria        │ Cruz              │ 612343529 │ 916548735 │ Plaza Magallón 15 │                  │ Madrid │ Madrid      │ Spain │ 28011         │ 30                         │ 5050           │
│ 36             │ Flores S.L.                 │ Antonio         │ Romero            │ 654352981 │ 685249700 │ Avenida España    │                  │ Madrid │ Fuenlabrada │ Spain │ 29643         │ 18                         │ 6000           │
└────────────────┴─────────────────────────────┴─────────────────┴───────────────────┴───────────┴───────────┴───────────────────┴──────────────────┴────────┴─────────────┴───────┴───────────────┴────────────────────────────┴────────────────┘
**/

--Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

select c.nombre_cliente, e.nombre, e.apellido1, e.apellido2 from cliente as c, empleado as e where e.codigo_empleado = c.codigo_empleado_rep_ventas and e.puesto = 'Representante Ventas' group by cliente;

/**
┌────────────────────────────────┬─────────────────┬────────────┬───────────┐
│         nombre_cliente         │     nombre      │ apellido1  │ apellido2 │
├────────────────────────────────┼─────────────────┼────────────┼───────────┤
│ Agrojardin                     │ Julian          │ Bellinelli │           │
│ Aloha                          │ José Manuel     │ Martinez   │ De la Osa │
│ Americh Golf Management SL     │ José Manuel     │ Martinez   │ De la Osa │
│ Campohermoso                   │ Julian          │ Bellinelli │           │
│ Camunas Jardines S.L.          │ Mariano         │ López      │ Murcia    │
│ Dardena S.A.                   │ Mariano         │ López      │ Murcia    │
│ El Jardin Viviente S.L         │ Mariko          │ Kishi      │           │
│ El Prat                        │ José Manuel     │ Martinez   │ De la Osa │
│ Flores Marivi                  │ Felipe          │ Rosas      │ Marquez   │
│ Flowers, S.A                   │ Felipe          │ Rosas      │ Marquez   │
│ Fuenla City                    │ Felipe          │ Rosas      │ Marquez   │
│ Gardening Associates           │ Walter Santiago │ Sanchez    │ Lopez     │
│ Gerudo Valley                  │ Lorena          │ Paxton     │           │
│ GoldFish Garden                │ Walter Santiago │ Sanchez    │ Lopez     │
│ Golf S.A.                      │ José Manuel     │ Martinez   │ De la Osa │
│ Jardin de Flores               │ Julian          │ Bellinelli │           │
│ Jardineria Sara                │ Felipe          │ Rosas      │ Marquez   │
│ Jardinerías Matías SL          │ Lucio           │ Campoamor  │ Martín    │
│ Jardines y Mansiones Cactus SL │ Lucio           │ Campoamor  │ Martín    │
│ Lasas S.A.                     │ Mariano         │ López      │ Murcia    │
│ Musée du Louvre                │ Lionel          │ Narvaez    │           │
│ Naturajardin                   │ Julian          │ Bellinelli │           │
│ Sotogrande                     │ José Manuel     │ Martinez   │ De la Osa │
│ Tendo Garden                   │ Lorena          │ Paxton     │           │
│ Top Campo                      │ Felipe          │ Rosas      │ Marquez   │
│ Tutifruti S.A                  │ Mariko          │ Kishi      │           │
│ Vivero Humanes                 │ Julian          │ Bellinelli │           │
│ france telecom                 │ Lionel          │ Narvaez    │           │
└────────────────────────────────┴─────────────────┴────────────┴───────────┘
**/

--Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

select c.nombre_cliente, e.nombre from cliente as c, empleado as e, pago as p where c.codigo_cliente NOT IN (select codigo_cliente from pago) and c.codigo_empleado_rep_ventas=e.codigo_empleado group by c.codigo_cliente;

/**
┌─────────────────────────────┬─────────────┐
│       nombre_cliente        │   nombre    │
├─────────────────────────────┼─────────────┤
│ Lasas S.A.                  │ Mariano     │
│ Club Golf Puerta del hierro │ Emmanuel    │
│ DaraDistribuciones          │ Emmanuel    │
│ Madrileña de riegos         │ Emmanuel    │
│ Lasas S.A.                  │ Mariano     │
│ Flowers, S.A                │ Felipe      │
│ Naturajardin                │ Julian      │
│ Americh Golf Management SL  │ José Manuel │
│ Aloha                       │ José Manuel │
│ El Prat                     │ José Manuel │
│ Vivero Humanes              │ Julian      │
│ Fuenla City                 │ Felipe      │
│ Top Campo                   │ Felipe      │
│ Campohermoso                │ Julian      │
│ france telecom              │ Lionel      │
│ Musée du Louvre             │ Lionel      │
│ Flores S.L.                 │ Michael     │
│ The Magic Garden            │ Michael     │
└─────────────────────────────┴─────────────┘
**/

--Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.

select c.nombre_cliente from cliente as c, empleado as e, pago as p where c.codigo_cliente NOT IN (select codigo_cliente from pago) and c.codigo_empleado_rep_ventas=e.codigo_empleado group by c.codigo_cliente;

/**
┌─────────────────────────────┐
│       nombre_cliente        │
├─────────────────────────────┤
│ Lasas S.A.                  │
│ Club Golf Puerta del hierro │
│ DaraDistribuciones          │
│ Madrileña de riegos         │
│ Lasas S.A.                  │
│ Flowers, S.A                │
│ Naturajardin                │
│ Americh Golf Management SL  │
│ Aloha                       │
│ El Prat                     │
│ Vivero Humanes              │
│ Fuenla City                 │
│ Top Campo                   │
│ Campohermoso                │
│ france telecom              │
│ Musée du Louvre             │
│ Flores S.L.                 │
│ The Magic Garden            │
└─────────────────────────────┘
**/

--Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

select c.nombre_cliente, e.nombre, o.ciudad from empleado as e, cliente as c, pago as p, oficina as o where p.codigo_cliente = c.codigo_cliente and c.codigo_empleado_rep_ventas = e.codigo_empleado and e.codigo_oficina = o.codigo_oficina and e.puesto = 'Representante Ventas' group by c.codigo_cliente;

/**
┌────────────────────────────────┬─────────────────┬──────────────────────┐
│         nombre_cliente         │     nombre      │        ciudad        │
├────────────────────────────────┼─────────────────┼──────────────────────┤
│ GoldFish Garden                │ Walter Santiago │ San Francisco        │
│ Gardening Associates           │ Walter Santiago │ San Francisco        │
│ Gerudo Valley                  │ Lorena          │ Boston               │
│ Tendo Garden                   │ Lorena          │ Boston               │
│ Camunas Jardines S.L.          │ Mariano         │ Madrid               │
│ Dardena S.A.                   │ Mariano         │ Madrid               │
│ Jardin de Flores               │ Julian          │ Sydney               │
│ Flores Marivi                  │ Felipe          │ Talavera de la Reina │
│ Golf S.A.                      │ José Manuel     │ Barcelona            │
│ Sotogrande                     │ José Manuel     │ Barcelona            │
│ Jardines y Mansiones Cactus SL │ Lucio           │ Madrid               │
│ Jardinerías Matías SL          │ Lucio           │ Madrid               │
│ Agrojardin                     │ Julian          │ Sydney               │
│ Jardineria Sara                │ Felipe          │ Talavera de la Reina │
│ Tutifruti S.A                  │ Mariko          │ Sydney               │
│ El Jardin Viviente S.L         │ Mariko          │ Sydney               │
└────────────────────────────────┴─────────────────┴──────────────────────┘
**/

--Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante. 

select c.nombre_cliente, e.nombre, o.ciudad from cliente as c, empleado as e, pago as p, oficina as o where c.codigo_cliente NOT IN (select codigo_cliente from pago) and c.codigo_empleado_rep_ventas=e.codigo_empleado and e.codigo_oficina=o.codigo_oficina group by c.codigo_cliente;

/**
┌─────────────────────────────┬─────────────┬──────────────────────┐
│       nombre_cliente        │   nombre    │        ciudad        │
├─────────────────────────────┼─────────────┼──────────────────────┤
│ Lasas S.A.                  │ Mariano     │ Madrid               │
│ Club Golf Puerta del hierro │ Emmanuel    │ Barcelona            │
│ DaraDistribuciones          │ Emmanuel    │ Barcelona            │
│ Madrileña de riegos         │ Emmanuel    │ Barcelona            │
│ Lasas S.A.                  │ Mariano     │ Madrid               │
│ Flowers, S.A                │ Felipe      │ Talavera de la Reina │
│ Naturajardin                │ Julian      │ Sydney               │
│ Americh Golf Management SL  │ José Manuel │ Barcelona            │
│ Aloha                       │ José Manuel │ Barcelona            │
│ El Prat                     │ José Manuel │ Barcelona            │
│ Vivero Humanes              │ Julian      │ Sydney               │
│ Fuenla City                 │ Felipe      │ Talavera de la Reina │
│ Top Campo                   │ Felipe      │ Talavera de la Reina │
│ Campohermoso                │ Julian      │ Sydney               │
│ france telecom              │ Lionel      │ Paris                │
│ Musée du Louvre             │ Lionel      │ Paris                │
│ Flores S.L.                 │ Michael     │ San Francisco        │
│ The Magic Garden            │ Michael     │ San Francisco        │
└─────────────────────────────┴─────────────┴──────────────────────┘
**/

--Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

select c.nombre_cliente from cliente as c, empleado as e, oficina as o where c.codigo_empleado_rep_ventas=e.codigo_empleado and e.codigo_oficina=o.codigo_oficina and c.ciudad = 'Fuenlabrada' group by c.codigo_cliente;

/**
┌─────────────────┐
│ nombre_cliente  │
├─────────────────┤
│ Lasas S.A.      │
│ Lasas S.A.      │
│ Flores Marivi   │
│ Fuenla City     │
│ Jardineria Sara │
│ Campohermoso    │
└─────────────────┘
**/

--Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

select c.nombre_cliente, e.nombre, o.ciudad from cliente as c, empleado as e, oficina as o where c.codigo_empleado_rep_ventas = e.codigo_empleado and e.codigo_oficina = o.codigo_oficina and e.puesto = 'Representante Ventas';

/**
┌────────────────────────────────┬─────────────────┬──────────────────────┐
│         nombre_cliente         │     nombre      │        ciudad        │
├────────────────────────────────┼─────────────────┼──────────────────────┤
│ GoldFish Garden                │ Walter Santiago │ San Francisco        │
│ Gardening Associates           │ Walter Santiago │ San Francisco        │
│ Gerudo Valley                  │ Lorena          │ Boston               │
│ Tendo Garden                   │ Lorena          │ Boston               │
│ Lasas S.A.                     │ Mariano         │ Madrid               │
│ Lasas S.A.                     │ Mariano         │ Madrid               │
│ Camunas Jardines S.L.          │ Mariano         │ Madrid               │
│ Dardena S.A.                   │ Mariano         │ Madrid               │
│ Jardin de Flores               │ Julian          │ Sydney               │
│ Flores Marivi                  │ Felipe          │ Talavera de la Reina │
│ Flowers, S.A                   │ Felipe          │ Talavera de la Reina │
│ Naturajardin                   │ Julian          │ Sydney               │
│ Golf S.A.                      │ José Manuel     │ Barcelona            │
│ Americh Golf Management SL     │ José Manuel     │ Barcelona            │
│ Aloha                          │ José Manuel     │ Barcelona            │
│ El Prat                        │ José Manuel     │ Barcelona            │
│ Sotogrande                     │ José Manuel     │ Barcelona            │
│ Vivero Humanes                 │ Julian          │ Sydney               │
│ Fuenla City                    │ Felipe          │ Talavera de la Reina │
│ Jardines y Mansiones Cactus SL │ Lucio           │ Madrid               │
│ Jardinerías Matías SL          │ Lucio           │ Madrid               │
│ Agrojardin                     │ Julian          │ Sydney               │
│ Top Campo                      │ Felipe          │ Talavera de la Reina │
│ Jardineria Sara                │ Felipe          │ Talavera de la Reina │
│ Campohermoso                   │ Julian          │ Sydney               │
│ france telecom                 │ Lionel          │ Paris                │
│ Musée du Louvre                │ Lionel          │ Paris                │
│ Tutifruti S.A                  │ Mariko          │ Sydney               │
│ El Jardin Viviente S.L         │ Mariko          │ Sydney               │
└────────────────────────────────┴─────────────────┴──────────────────────┘
**/

--Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

select e.nombre as Nombre_empleado, j.nombre as Nombre_jefe from empleado as e, empleado as j where e.codigo_jefe=j.codigo_empleado;

/**
┌─────────────────┬─────────────┐
│ Nombre_empleado │ Nombre_jefe │
├─────────────────┼─────────────┤
│ Ruben           │ Marcos      │
│ Alberto         │ Ruben       │
│ Maria           │ Ruben       │
│ Felipe          │ Alberto     │
│ Juan Carlos     │ Alberto     │
│ Carlos          │ Alberto     │
│ Mariano         │ Carlos      │
│ Lucio           │ Carlos      │
│ Hilario         │ Carlos      │
│ Emmanuel        │ Alberto     │
│ José Manuel     │ Emmanuel    │
│ David           │ Emmanuel    │
│ Oscar           │ Emmanuel    │
│ Francois        │ Alberto     │
│ Lionel          │ Francois    │
│ Laurent         │ Francois    │
│ Michael         │ Alberto     │
│ Walter Santiago │ Michael     │
│ Hilary          │ Alberto     │
│ Marcus          │ Hilary      │
│ Lorena          │ Hilary      │
│ Nei             │ Alberto     │
│ Narumi          │ Nei         │
│ Takuma          │ Nei         │
│ Amy             │ Alberto     │
│ Larry           │ Amy         │
│ John            │ Amy         │
│ Kevin           │ Alberto     │
│ Julian          │ Kevin       │
│ Mariko          │ Kevin       │
└─────────────────┴─────────────┘
**/
--Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

select e.nombre as "Nombre empleado", j.nombre as "Nombre jefe", jj.nombre as "Jefe del jefe" from empleado as e, empleado as j, empleado as jj where e.codigo_jefe=j.codigo_empleado and j.codigo_jefe=jj.codigo_empleado;

/**
┌─────────────────┬─────────────┬───────────────┐
│ Nombre empleado │ Nombre jefe │ Jefe del jefe │
├─────────────────┼─────────────┼───────────────┤
│ Alberto         │ Ruben       │ Marcos        │
│ Maria           │ Ruben       │ Marcos        │
│ Felipe          │ Alberto     │ Ruben         │
│ Juan Carlos     │ Alberto     │ Ruben         │
│ Carlos          │ Alberto     │ Ruben         │
│ Mariano         │ Carlos      │ Alberto       │
│ Lucio           │ Carlos      │ Alberto       │
│ Hilario         │ Carlos      │ Alberto       │
│ Emmanuel        │ Alberto     │ Ruben         │
│ José Manuel     │ Emmanuel    │ Alberto       │
│ David           │ Emmanuel    │ Alberto       │
│ Oscar           │ Emmanuel    │ Alberto       │
│ Francois        │ Alberto     │ Ruben         │
│ Lionel          │ Francois    │ Alberto       │
│ Laurent         │ Francois    │ Alberto       │
│ Michael         │ Alberto     │ Ruben         │
│ Walter Santiago │ Michael     │ Alberto       │
│ Hilary          │ Alberto     │ Ruben         │
│ Marcus          │ Hilary      │ Alberto       │
│ Lorena          │ Hilary      │ Alberto       │
│ Nei             │ Alberto     │ Ruben         │
│ Narumi          │ Nei         │ Alberto       │
│ Takuma          │ Nei         │ Alberto       │
│ Amy             │ Alberto     │ Ruben         │
│ Larry           │ Amy         │ Alberto       │
│ John            │ Amy         │ Alberto       │
│ Kevin           │ Alberto     │ Ruben         │
│ Julian          │ Kevin       │ Alberto       │
│ Mariko          │ Kevin       │ Alberto       │
└─────────────────┴─────────────┴───────────────┘
**/

--Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

select c.nombre_cliente, p.fecha_esperada,p.fecha_entrega from cliente as c, pedido as p where p.fecha_esperada<p.fecha_entrega and c.codigo_cliente=p.codigo_cliente group by c.nombre_cliente;
/**
┌────────────────────────────────┬────────────────┬───────────────┐
│         nombre_cliente         │ fecha_esperada │ fecha_entrega │
├────────────────────────────────┼────────────────┼───────────────┤
│ Beragua                        │ 2009-01-14     │ 2009-01-15    │
│ Camunas Jardines S.L.          │ 2008-09-30     │ 2008-10-04    │
│ Dardena S.A.                   │ 2009-01-10     │ 2009-01-11    │
│ El Jardin Viviente S.L         │ 2008-12-10     │ 2008-12-29    │
│ Flores S.L.                    │ 2009-04-06     │ 2009-05-07    │
│ Gardening Associates           │ 2009-02-17     │ 2009-02-20    │
│ Gerudo Valley                  │ 2007-01-19     │ 2007-01-27    │
│ GoldFish Garden                │ 2008-12-27     │ 2008-12-28    │
│ Golf S.A.                      │ 2009-03-06     │ 2009-03-07    │
│ Jardineria Sara                │ 2009-01-20     │ 2009-01-24    │
│ Jardinerías Matías SL          │ 2009-04-30     │ 2009-05-03    │
│ Jardines y Mansiones Cactus SL │ 2008-07-22     │ 2008-07-30    │
│ Naturagua                      │ 2009-01-06     │ 2009-01-07    │
│ Sotogrande                     │ 2009-03-26     │ 2009-03-28    │
│ Tutifruti S.A                  │ 2008-04-12     │ 2008-04-13    │
└────────────────────────────────┴────────────────┴───────────────┘
**/

--Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

select c.codigo_cliente, c.nombre_cliente, GROUP_CONCAT(DISTINCT g.gama) as Gamas from cliente as c, pedido as p, detalle_pedido as dp, producto as pr, gama_producto as g where c.codigo_cliente=p.codigo_cliente and p.codigo_pedido=dp.codigo_pedido and dp.codigo_producto=pr.codigo_producto and pr.gama=g.gama group by c.codigo_cliente;

/**
┌────────────────┬────────────────────────────────┬───────────────────────────────────────────────┐
│ codigo_cliente │         nombre_cliente         │                     Gamas                     │
├────────────────┼────────────────────────────────┼───────────────────────────────────────────────┤
│ 1              │ GoldFish Garden                │ Frutales,Aromáticas,Ornamentales              │
│ 3              │ Gardening Associates           │ Frutales,Ornamentales                         │
│ 4              │ Gerudo Valley                  │ Herramientas,Ornamentales,Frutales            │
│ 5              │ Tendo Garden                   │ Frutales,Ornamentales,Aromáticas              │
│ 7              │ Beragua                        │ Herramientas,Frutales,Ornamentales            │
│ 9              │ Naturagua                      │ Herramientas,Frutales,Ornamentales            │
│ 13             │ Camunas Jardines S.L.          │ Aromáticas,Frutales,Ornamentales              │
│ 14             │ Dardena S.A.                   │ Herramientas,Frutales,Ornamentales            │
│ 15             │ Jardin de Flores               │ Frutales,Ornamentales,Aromáticas,Herramientas │
│ 16             │ Flores Marivi                  │ Ornamentales,Frutales,Aromáticas,Herramientas │
│ 19             │ Golf S.A.                      │ Herramientas,Aromáticas                       │
│ 23             │ Sotogrande                     │ Aromáticas,Frutales                           │
│ 26             │ Jardines y Mansiones Cactus SL │ Frutales,Ornamentales                         │
│ 27             │ Jardinerías Matías SL          │ Aromáticas,Frutales,Herramientas              │
│ 28             │ Agrojardin                     │ Ornamentales,Frutales                         │
│ 30             │ Jardineria Sara                │ Frutales,Ornamentales,Aromáticas,Herramientas │
│ 35             │ Tutifruti S.A                  │ Frutales,Ornamentales                         │
│ 36             │ Flores S.L.                    │ Frutales                                      │
│ 38             │ El Jardin Viviente S.L         │ Frutales,Ornamentales,Aromáticas,Herramientas │
└────────────────┴────────────────────────────────┴───────────────────────────────────────────────┘
**/

----------------CONSULTAS MULTITABLA (INNER JOIN)--------------------------------------------

--Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

select c.* from cliente as c LEFT JOIN pago as p ON c.codigo_cliente=p.codigo_cliente where p.codigo_cliente is null;

/**
┌────────────────┬─────────────────────────────┬─────────────────┬───────────────────┬────────────────┬────────────────┬──────────────────────────┬──────────────────┬──────────────────────┬─────────────┬────────────────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │       nombre_cliente        │ nombre_contacto │ apellido_contacto │    telefono    │      fax       │     linea_direccion1     │ linea_direccion2 │        ciudad        │   region    │      pais      │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼─────────────────────────────┼─────────────────┼───────────────────┼────────────────┼────────────────┼──────────────────────────┼──────────────────┼──────────────────────┼─────────────┼────────────────┼───────────────┼────────────────────────────┼────────────────┤
│ 6              │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145    │ 34914851312    │ C/Leganes 15             │                  │ Fuenlabrada          │ Madrid      │ Spain          │ 28945         │ 8                          │ 154310         │
│ 8              │ Club Golf Puerta del hierro │ Paco            │ Lopez             │ 62456810       │ 919535678      │ C/sinesio delgado        │ Madrid           │ Madrid               │ Madrid      │ Spain          │ 28930         │ 11                         │ 40000          │
│ 10             │ DaraDistribuciones          │ David           │ Serrano           │ 675598001      │ 916421756      │ C/azores                 │ Fuenlabrada      │ Madrid               │ Madrid      │ Spain          │ 28946         │ 11                         │ 50000          │
│ 11             │ Madrileña de riegos         │ Jose            │ Tacaño            │ 655983045      │ 916689215      │ C/Lagañas                │ Fuenlabrada      │ Madrid               │ Madrid      │ Spain          │ 28943         │ 11                         │ 20000          │
│ 12             │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145    │ 34914851312    │ C/Leganes 15             │                  │ Fuenlabrada          │ Madrid      │ Spain          │ 28945         │ 8                          │ 154310         │
│ 17             │ Flowers, S.A                │ Beatriz         │ Fernandez         │ 698754159      │ 978453216      │ C/Luis Salquillo4        │                  │ Montornes del valles │ Barcelona   │ Spain          │ 24586         │ 5                          │ 3500           │
│ 18             │ Naturajardin                │ Victoria        │ Cruz              │ 612343529      │ 916548735      │ Plaza Magallón 15        │                  │ Madrid               │ Madrid      │ Spain          │ 28011         │ 30                         │ 5050           │
│ 20             │ Americh Golf Management SL  │ Mario           │ Suarez            │ 964493072      │ 964493063      │ C/Letardo                │                  │ Barcelona            │ Cataluña    │ Spain          │ 12320         │ 12                         │ 20000          │
│ 21             │ Aloha                       │ Cristian        │ Rodrigez          │ 916485852      │ 914489898      │ C/Roman 3                │                  │ Canarias             │ Canarias    │ Spain          │ 35488         │ 12                         │ 50000          │
│ 22             │ El Prat                     │ Francisco       │ Camacho           │ 916882323      │ 916493211      │ Avenida Tibidabo         │                  │ Barcelona            │ Cataluña    │ Spain          │ 12320         │ 12                         │ 30000          │
│ 24             │ Vivero Humanes              │ Federico        │ Gomez             │ 654987690      │ 916040875      │ C/Miguel Echegaray 54    │                  │ Humanes              │ Madrid      │ Spain          │ 28970         │ 30                         │ 7430           │
│ 25             │ Fuenla City                 │ Tony            │ Muñoz Mena        │ 675842139      │ 915483754      │ C/Callo 52               │                  │ Fuenlabrada          │ Madrid      │ Spain          │ 28574         │ 5                          │ 4500           │
│ 29             │ Top Campo                   │ Joseluis        │ Sanchez           │ 685746512      │ 974315924      │ C/Ibiza 32               │                  │ Humanes              │ Madrid      │ Spain          │ 28574         │ 5                          │ 5500           │
│ 31             │ Campohermoso                │ Luis            │ Jimenez           │ 645925376      │ 916159116      │ C/Peru 78                │                  │ Fuenlabrada          │ Madrid      │ Spain          │ 28945         │ 30                         │ 3250           │
│ 32             │ france telecom              │ FraÃ§ois        │ Toulou            │ (33)5120578961 │ (33)5120578961 │ 6 place d Alleray 15Ã¨me │                  │ Paris                │             │ France         │ 75010         │ 16                         │ 10000          │
│ 33             │ Musée du Louvre             │ Pierre          │ Delacroux         │ (33)0140205050 │ (33)0140205442 │ Quai du Louvre           │                  │ Paris                │             │ France         │ 75058         │ 16                         │ 30000          │
│ 36             │ Flores S.L.                 │ Antonio         │ Romero            │ 654352981      │ 685249700      │ Avenida España           │                  │ Madrid               │ Fuenlabrada │ Spain          │ 29643         │ 18                         │ 6000           │
│ 37             │ The Magic Garden            │ Richard         │ Mcain             │ 926523468      │ 9364875882     │ Lihgting Park            │                  │ London               │ London      │ United Kingdom │ 65930         │ 18                         │ 10000          │
└────────────────┴─────────────────────────────┴─────────────────┴───────────────────┴────────────────┴────────────────┴──────────────────────────┴──────────────────┴──────────────────────┴─────────────┴────────────────┴───────────────┴────────────────────────────┴────────────────┘
**/

--Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

select c.* from cliente as c LEFT JOIN pedido as p ON c.codigo_cliente=p.codigo_cliente where p.codigo_cliente is null;

/**
┌────────────────┬─────────────────────────────┬─────────────────┬───────────────────┬────────────────┬────────────────┬──────────────────────────┬──────────────────┬──────────────────────┬───────────┬────────────────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │       nombre_cliente        │ nombre_contacto │ apellido_contacto │    telefono    │      fax       │     linea_direccion1     │ linea_direccion2 │        ciudad        │  region   │      pais      │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼─────────────────────────────┼─────────────────┼───────────────────┼────────────────┼────────────────┼──────────────────────────┼──────────────────┼──────────────────────┼───────────┼────────────────┼───────────────┼────────────────────────────┼────────────────┤
│ 6              │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145    │ 34914851312    │ C/Leganes 15             │                  │ Fuenlabrada          │ Madrid    │ Spain          │ 28945         │ 8                          │ 154310         │
│ 8              │ Club Golf Puerta del hierro │ Paco            │ Lopez             │ 62456810       │ 919535678      │ C/sinesio delgado        │ Madrid           │ Madrid               │ Madrid    │ Spain          │ 28930         │ 11                         │ 40000          │
│ 10             │ DaraDistribuciones          │ David           │ Serrano           │ 675598001      │ 916421756      │ C/azores                 │ Fuenlabrada      │ Madrid               │ Madrid    │ Spain          │ 28946         │ 11                         │ 50000          │
│ 11             │ Madrileña de riegos         │ Jose            │ Tacaño            │ 655983045      │ 916689215      │ C/Lagañas                │ Fuenlabrada      │ Madrid               │ Madrid    │ Spain          │ 28943         │ 11                         │ 20000          │
│ 12             │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145    │ 34914851312    │ C/Leganes 15             │                  │ Fuenlabrada          │ Madrid    │ Spain          │ 28945         │ 8                          │ 154310         │
│ 17             │ Flowers, S.A                │ Beatriz         │ Fernandez         │ 698754159      │ 978453216      │ C/Luis Salquillo4        │                  │ Montornes del valles │ Barcelona │ Spain          │ 24586         │ 5                          │ 3500           │
│ 18             │ Naturajardin                │ Victoria        │ Cruz              │ 612343529      │ 916548735      │ Plaza Magallón 15        │                  │ Madrid               │ Madrid    │ Spain          │ 28011         │ 30                         │ 5050           │
│ 20             │ Americh Golf Management SL  │ Mario           │ Suarez            │ 964493072      │ 964493063      │ C/Letardo                │                  │ Barcelona            │ Cataluña  │ Spain          │ 12320         │ 12                         │ 20000          │
│ 21             │ Aloha                       │ Cristian        │ Rodrigez          │ 916485852      │ 914489898      │ C/Roman 3                │                  │ Canarias             │ Canarias  │ Spain          │ 35488         │ 12                         │ 50000          │
│ 22             │ El Prat                     │ Francisco       │ Camacho           │ 916882323      │ 916493211      │ Avenida Tibidabo         │                  │ Barcelona            │ Cataluña  │ Spain          │ 12320         │ 12                         │ 30000          │
│ 24             │ Vivero Humanes              │ Federico        │ Gomez             │ 654987690      │ 916040875      │ C/Miguel Echegaray 54    │                  │ Humanes              │ Madrid    │ Spain          │ 28970         │ 30                         │ 7430           │
│ 25             │ Fuenla City                 │ Tony            │ Muñoz Mena        │ 675842139      │ 915483754      │ C/Callo 52               │                  │ Fuenlabrada          │ Madrid    │ Spain          │ 28574         │ 5                          │ 4500           │
│ 29             │ Top Campo                   │ Joseluis        │ Sanchez           │ 685746512      │ 974315924      │ C/Ibiza 32               │                  │ Humanes              │ Madrid    │ Spain          │ 28574         │ 5                          │ 5500           │
│ 31             │ Campohermoso                │ Luis            │ Jimenez           │ 645925376      │ 916159116      │ C/Peru 78                │                  │ Fuenlabrada          │ Madrid    │ Spain          │ 28945         │ 30                         │ 3250           │
│ 32             │ france telecom              │ FraÃ§ois        │ Toulou            │ (33)5120578961 │ (33)5120578961 │ 6 place d Alleray 15Ã¨me │                  │ Paris                │           │ France         │ 75010         │ 16                         │ 10000          │
│ 33             │ Musée du Louvre             │ Pierre          │ Delacroux         │ (33)0140205050 │ (33)0140205442 │ Quai du Louvre           │                  │ Paris                │           │ France         │ 75058         │ 16                         │ 30000          │
│ 37             │ The Magic Garden            │ Richard         │ Mcain             │ 926523468      │ 9364875882     │ Lihgting Park            │                  │ London               │ London    │ United Kingdom │ 65930         │ 18                         │ 10000          │
└────────────────┴─────────────────────────────┴─────────────────┴───────────────────┴────────────────┴────────────────┴──────────────────────────┴──────────────────┴──────────────────────┴───────────┴────────────────┴───────────────┴────────────────────────────┴────────────────┘
**/

--Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.

select c.* from cliente as c LEFT JOIN pago as p ON c.codigo_cliente=p.codigo_cliente 
LEFT JOIN pedido as pe ON c.codigo_cliente=pe.codigo_cliente 
where pe.codigo_cliente is null and p.codigo_cliente is null;
/**
┌────────────────┬─────────────────────────────┬─────────────────┬───────────────────┬────────────────┬────────────────┬──────────────────────────┬──────────────────┬──────────────────────┬───────────┬────────────────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │       nombre_cliente        │ nombre_contacto │ apellido_contacto │    telefono    │      fax       │     linea_direccion1     │ linea_direccion2 │        ciudad        │  region   │      pais      │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼─────────────────────────────┼─────────────────┼───────────────────┼────────────────┼────────────────┼──────────────────────────┼──────────────────┼──────────────────────┼───────────┼────────────────┼───────────────┼────────────────────────────┼────────────────┤
│ 6              │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145    │ 34914851312    │ C/Leganes 15             │                  │ Fuenlabrada          │ Madrid    │ Spain          │ 28945         │ 8                          │ 154310         │
│ 8              │ Club Golf Puerta del hierro │ Paco            │ Lopez             │ 62456810       │ 919535678      │ C/sinesio delgado        │ Madrid           │ Madrid               │ Madrid    │ Spain          │ 28930         │ 11                         │ 40000          │
│ 10             │ DaraDistribuciones          │ David           │ Serrano           │ 675598001      │ 916421756      │ C/azores                 │ Fuenlabrada      │ Madrid               │ Madrid    │ Spain          │ 28946         │ 11                         │ 50000          │
│ 11             │ Madrileña de riegos         │ Jose            │ Tacaño            │ 655983045      │ 916689215      │ C/Lagañas                │ Fuenlabrada      │ Madrid               │ Madrid    │ Spain          │ 28943         │ 11                         │ 20000          │
│ 12             │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145    │ 34914851312    │ C/Leganes 15             │                  │ Fuenlabrada          │ Madrid    │ Spain          │ 28945         │ 8                          │ 154310         │
│ 17             │ Flowers, S.A                │ Beatriz         │ Fernandez         │ 698754159      │ 978453216      │ C/Luis Salquillo4        │                  │ Montornes del valles │ Barcelona │ Spain          │ 24586         │ 5                          │ 3500           │
│ 18             │ Naturajardin                │ Victoria        │ Cruz              │ 612343529      │ 916548735      │ Plaza Magallón 15        │                  │ Madrid               │ Madrid    │ Spain          │ 28011         │ 30                         │ 5050           │
│ 20             │ Americh Golf Management SL  │ Mario           │ Suarez            │ 964493072      │ 964493063      │ C/Letardo                │                  │ Barcelona            │ Cataluña  │ Spain          │ 12320         │ 12                         │ 20000          │
│ 21             │ Aloha                       │ Cristian        │ Rodrigez          │ 916485852      │ 914489898      │ C/Roman 3                │                  │ Canarias             │ Canarias  │ Spain          │ 35488         │ 12                         │ 50000          │
│ 22             │ El Prat                     │ Francisco       │ Camacho           │ 916882323      │ 916493211      │ Avenida Tibidabo         │                  │ Barcelona            │ Cataluña  │ Spain          │ 12320         │ 12                         │ 30000          │
│ 24             │ Vivero Humanes              │ Federico        │ Gomez             │ 654987690      │ 916040875      │ C/Miguel Echegaray 54    │                  │ Humanes              │ Madrid    │ Spain          │ 28970         │ 30                         │ 7430           │
│ 25             │ Fuenla City                 │ Tony            │ Muñoz Mena        │ 675842139      │ 915483754      │ C/Callo 52               │                  │ Fuenlabrada          │ Madrid    │ Spain          │ 28574         │ 5                          │ 4500           │
│ 29             │ Top Campo                   │ Joseluis        │ Sanchez           │ 685746512      │ 974315924      │ C/Ibiza 32               │                  │ Humanes              │ Madrid    │ Spain          │ 28574         │ 5                          │ 5500           │
│ 31             │ Campohermoso                │ Luis            │ Jimenez           │ 645925376      │ 916159116      │ C/Peru 78                │                  │ Fuenlabrada          │ Madrid    │ Spain          │ 28945         │ 30                         │ 3250           │
│ 32             │ france telecom              │ FraÃ§ois        │ Toulou            │ (33)5120578961 │ (33)5120578961 │ 6 place d Alleray 15Ã¨me │                  │ Paris                │           │ France         │ 75010         │ 16                         │ 10000          │
│ 33             │ Musée du Louvre             │ Pierre          │ Delacroux         │ (33)0140205050 │ (33)0140205442 │ Quai du Louvre           │                  │ Paris                │           │ France         │ 75058         │ 16                         │ 30000          │
│ 37             │ The Magic Garden            │ Richard         │ Mcain             │ 926523468      │ 9364875882     │ Lihgting Park            │                  │ London               │ London    │ United Kingdom │ 65930         │ 18                         │ 10000          │
└────────────────┴─────────────────────────────┴─────────────────┴───────────────────┴────────────────┴────────────────┴──────────────────────────┴──────────────────┴──────────────────────┴───────────┴────────────────┴───────────────┴────────────────────────────┴────────────────┘
**/

--Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

select e.nombre from empleado as e LEFT JOIN oficina as o ON e.codigo_oficina=o.codigo_oficina where o.codigo_oficina is null;

/**
todos tienen una oficina asociada
**/

--Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.

select e.* from empleado as e
left join cliente as c on e.codigo_empleado = c.codigo_empleado_rep_ventas
where c.codigo_empleado_rep_ventas is null;

/**
┌─────────────────┬─────────────┬────────────┬───────────┬───────────┬───────────────────────────┬────────────────┬─────────────┬───────────────────────┐
│ codigo_empleado │   nombre    │ apellido1  │ apellido2 │ extension │           email           │ codigo_oficina │ codigo_jefe │        puesto         │
├─────────────────┼─────────────┼────────────┼───────────┼───────────┼───────────────────────────┼────────────────┼─────────────┼───────────────────────┤
│ 1               │ Marcos      │ Magaña     │ Perez     │ 3897      │ marcos@jardineria.es      │ TAL-ES         │             │ Director General      │
│ 2               │ Ruben       │ López      │ Martinez  │ 2899      │ rlopez@jardineria.es      │ TAL-ES         │ 1           │ Subdirector Marketing │
│ 3               │ Alberto     │ Soria      │ Carrasco  │ 2837      │ asoria@jardineria.es      │ TAL-ES         │ 2           │ Subdirector Ventas    │
│ 4               │ Maria       │ Solís      │ Jerez     │ 2847      │ msolis@jardineria.es      │ TAL-ES         │ 2           │ Secretaria            │
│ 6               │ Juan Carlos │ Ortiz      │ Serrano   │ 2845      │ cortiz@jardineria.es      │ TAL-ES         │ 3           │ Representante Ventas  │
│ 7               │ Carlos      │ Soria      │ Jimenez   │ 2444      │ csoria@jardineria.es      │ MAD-ES         │ 3           │ Director Oficina      │
│ 10              │ Hilario     │ Rodriguez  │ Huertas   │ 2444      │ hrodriguez@jardineria.es  │ MAD-ES         │ 7           │ Representante Ventas  │
│ 13              │ David       │ Palma      │ Aceituno  │ 2519      │ dpalma@jardineria.es      │ BCN-ES         │ 11          │ Representante Ventas  │
│ 14              │ Oscar       │ Palma      │ Aceituno  │ 2519      │ opalma@jardineria.es      │ BCN-ES         │ 11          │ Representante Ventas  │
│ 15              │ Francois    │ Fignon     │           │ 9981      │ ffignon@gardening.com     │ PAR-FR         │ 3           │ Director Oficina      │
│ 17              │ Laurent     │ Serra      │           │ 9982      │ lserra@gardening.com      │ PAR-FR         │ 15          │ Representante Ventas  │
│ 20              │ Hilary      │ Washington │           │ 7565      │ hwashington@gardening.com │ BOS-USA        │ 3           │ Director Oficina      │
│ 21              │ Marcus      │ Paxton     │           │ 7565      │ mpaxton@gardening.com     │ BOS-USA        │ 20          │ Representante Ventas  │
│ 23              │ Nei         │ Nishikori  │           │ 8734      │ nnishikori@gardening.com  │ TOK-JP         │ 3           │ Director Oficina      │
│ 24              │ Narumi      │ Riko       │           │ 8734      │ nriko@gardening.com       │ TOK-JP         │ 23          │ Representante Ventas  │
│ 25              │ Takuma      │ Nomura     │           │ 8735      │ tnomura@gardening.com     │ TOK-JP         │ 23          │ Representante Ventas  │
│ 26              │ Amy         │ Johnson    │           │ 3321      │ ajohnson@gardening.com    │ LON-UK         │ 3           │ Director Oficina      │
│ 27              │ Larry       │ Westfalls  │           │ 3322      │ lwestfalls@gardening.com  │ LON-UK         │ 26          │ Representante Ventas  │
│ 28              │ John        │ Walton     │           │ 3322      │ jwalton@gardening.com     │ LON-UK         │ 26          │ Representante Ventas  │
│ 29              │ Kevin       │ Fallmer    │           │ 3210      │ kfalmer@gardening.com     │ SYD-AU         │ 3           │ Director Oficina      │
└─────────────────┴─────────────┴────────────┴───────────┴───────────┴───────────────────────────┴────────────────┴─────────────┴───────────────────────┘
**/

--Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.

select e.*, o.*
from empleado as e
left join cliente as c on e.codigo_empleado = c.codigo_empleado_rep_ventas
join oficina as o on e.codigo_oficina = o.codigo_oficina
where c.codigo_empleado_rep_ventas is null;

/**
┌─────────────────┬─────────────┬────────────┬───────────┬───────────┬───────────────────────────┬────────────────┬─────────────┬───────────────────────┬────────────────┬──────────────────────┬────────────┬───────────────────┬───────────────┬─────────────────┬──────────────────────────────┬─────────────────────┐
│ codigo_empleado │   nombre    │ apellido1  │ apellido2 │ extension │           email           │ codigo_oficina │ codigo_jefe │        puesto         │ codigo_oficina │        ciudad        │    pais    │      region       │ codigo_postal │    telefono     │       linea_direccion1       │  linea_direccion2   │
├─────────────────┼─────────────┼────────────┼───────────┼───────────┼───────────────────────────┼────────────────┼─────────────┼───────────────────────┼────────────────┼──────────────────────┼────────────┼───────────────────┼───────────────┼─────────────────┼──────────────────────────────┼─────────────────────┤
│ 1               │ Marcos      │ Magaña     │ Perez     │ 3897      │ marcos@jardineria.es      │ TAL-ES         │             │ Director General      │ TAL-ES         │ Talavera de la Reina │ España     │ Castilla-LaMancha │ 45632         │ +34 925 867231  │ Francisco Aguirre, 32        │ 5º piso (exterior)  │
│ 2               │ Ruben       │ López      │ Martinez  │ 2899      │ rlopez@jardineria.es      │ TAL-ES         │ 1           │ Subdirector Marketing │ TAL-ES         │ Talavera de la Reina │ España     │ Castilla-LaMancha │ 45632         │ +34 925 867231  │ Francisco Aguirre, 32        │ 5º piso (exterior)  │
│ 3               │ Alberto     │ Soria      │ Carrasco  │ 2837      │ asoria@jardineria.es      │ TAL-ES         │ 2           │ Subdirector Ventas    │ TAL-ES         │ Talavera de la Reina │ España     │ Castilla-LaMancha │ 45632         │ +34 925 867231  │ Francisco Aguirre, 32        │ 5º piso (exterior)  │
│ 4               │ Maria       │ Solís      │ Jerez     │ 2847      │ msolis@jardineria.es      │ TAL-ES         │ 2           │ Secretaria            │ TAL-ES         │ Talavera de la Reina │ España     │ Castilla-LaMancha │ 45632         │ +34 925 867231  │ Francisco Aguirre, 32        │ 5º piso (exterior)  │
│ 6               │ Juan Carlos │ Ortiz      │ Serrano   │ 2845      │ cortiz@jardineria.es      │ TAL-ES         │ 3           │ Representante Ventas  │ TAL-ES         │ Talavera de la Reina │ España     │ Castilla-LaMancha │ 45632         │ +34 925 867231  │ Francisco Aguirre, 32        │ 5º piso (exterior)  │
│ 7               │ Carlos      │ Soria      │ Jimenez   │ 2444      │ csoria@jardineria.es      │ MAD-ES         │ 3           │ Director Oficina      │ MAD-ES         │ Madrid               │ España     │ Madrid            │ 28032         │ +34 91 7514487  │ Bulevar Indalecio Prieto, 32 │                     │
│ 10              │ Hilario     │ Rodriguez  │ Huertas   │ 2444      │ hrodriguez@jardineria.es  │ MAD-ES         │ 7           │ Representante Ventas  │ MAD-ES         │ Madrid               │ España     │ Madrid            │ 28032         │ +34 91 7514487  │ Bulevar Indalecio Prieto, 32 │                     │
│ 13              │ David       │ Palma      │ Aceituno  │ 2519      │ dpalma@jardineria.es      │ BCN-ES         │ 11          │ Representante Ventas  │ BCN-ES         │ Barcelona            │ España     │ Barcelona         │ 08019         │ +34 93 3561182  │ Avenida Diagonal, 38         │ 3A escalera Derecha │
│ 14              │ Oscar       │ Palma      │ Aceituno  │ 2519      │ opalma@jardineria.es      │ BCN-ES         │ 11          │ Representante Ventas  │ BCN-ES         │ Barcelona            │ España     │ Barcelona         │ 08019         │ +34 93 3561182  │ Avenida Diagonal, 38         │ 3A escalera Derecha │
│ 15              │ Francois    │ Fignon     │           │ 9981      │ ffignon@gardening.com     │ PAR-FR         │ 3           │ Director Oficina      │ PAR-FR         │ Paris                │ Francia    │ EMEA              │ 75017         │ +33 14 723 4404 │ 29 Rue Jouffroy d'abbans     │                     │
│ 17              │ Laurent     │ Serra      │           │ 9982      │ lserra@gardening.com      │ PAR-FR         │ 15          │ Representante Ventas  │ PAR-FR         │ Paris                │ Francia    │ EMEA              │ 75017         │ +33 14 723 4404 │ 29 Rue Jouffroy d'abbans     │                     │
│ 20              │ Hilary      │ Washington │           │ 7565      │ hwashington@gardening.com │ BOS-USA        │ 3           │ Director Oficina      │ BOS-USA        │ Boston               │ EEUU       │ MA                │ 02108         │ +1 215 837 0825 │ 1550 Court Place             │ Suite 102           │
│ 21              │ Marcus      │ Paxton     │           │ 7565      │ mpaxton@gardening.com     │ BOS-USA        │ 20          │ Representante Ventas  │ BOS-USA        │ Boston               │ EEUU       │ MA                │ 02108         │ +1 215 837 0825 │ 1550 Court Place             │ Suite 102           │
│ 23              │ Nei         │ Nishikori  │           │ 8734      │ nnishikori@gardening.com  │ TOK-JP         │ 3           │ Director Oficina      │ TOK-JP         │ Tokyo                │ Japón      │ Chiyoda-Ku        │ 102-8578      │ +81 33 224 5000 │ 4-1 Kioicho                  │                     │
│ 24              │ Narumi      │ Riko       │           │ 8734      │ nriko@gardening.com       │ TOK-JP         │ 23          │ Representante Ventas  │ TOK-JP         │ Tokyo                │ Japón      │ Chiyoda-Ku        │ 102-8578      │ +81 33 224 5000 │ 4-1 Kioicho                  │                     │
│ 25              │ Takuma      │ Nomura     │           │ 8735      │ tnomura@gardening.com     │ TOK-JP         │ 23          │ Representante Ventas  │ TOK-JP         │ Tokyo                │ Japón      │ Chiyoda-Ku        │ 102-8578      │ +81 33 224 5000 │ 4-1 Kioicho                  │                     │
│ 26              │ Amy         │ Johnson    │           │ 3321      │ ajohnson@gardening.com    │ LON-UK         │ 3           │ Director Oficina      │ LON-UK         │ Londres              │ Inglaterra │ EMEA              │ EC2N 1HN      │ +44 20 78772041 │ 52 Old Broad Street          │ Ground Floor        │
│ 27              │ Larry       │ Westfalls  │           │ 3322      │ lwestfalls@gardening.com  │ LON-UK         │ 26          │ Representante Ventas  │ LON-UK         │ Londres              │ Inglaterra │ EMEA              │ EC2N 1HN      │ +44 20 78772041 │ 52 Old Broad Street          │ Ground Floor        │
│ 28              │ John        │ Walton     │           │ 3322      │ jwalton@gardening.com     │ LON-UK         │ 26          │ Representante Ventas  │ LON-UK         │ Londres              │ Inglaterra │ EMEA              │ EC2N 1HN      │ +44 20 78772041 │ 52 Old Broad Street          │ Ground Floor        │
│ 29              │ Kevin       │ Fallmer    │           │ 3210      │ kfalmer@gardening.com     │ SYD-AU         │ 3           │ Director Oficina      │ SYD-AU         │ Sydney               │ Australia  │ APAC              │ NSW 2010      │ +61 2 9264 2451 │ 5-11 Wentworth Avenue        │ Floor #2            │
└─────────────────┴─────────────┴────────────┴───────────┴───────────┴───────────────────────────┴────────────────┴─────────────┴───────────────────────┴────────────────┴──────────────────────┴────────────┴───────────────────┴───────────────┴─────────────────┴──────────────────────────────┴─────────────────────┘
**/

--Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.

select e.* from empleado as e
left join oficina as o on e.codigo_oficina = o.codigo_oficina
left join cliente as c on e.codigo_empleado = c.codigo_empleado_rep_ventas
where o.codigo_oficina is null or c.codigo_empleado_rep_ventas is null;

/**
┌─────────────────┬─────────────┬────────────┬───────────┬───────────┬───────────────────────────┬────────────────┬─────────────┬───────────────────────┐
│ codigo_empleado │   nombre    │ apellido1  │ apellido2 │ extension │           email           │ codigo_oficina │ codigo_jefe │        puesto         │
├─────────────────┼─────────────┼────────────┼───────────┼───────────┼───────────────────────────┼────────────────┼─────────────┼───────────────────────┤
│ 1               │ Marcos      │ Magaña     │ Perez     │ 3897      │ marcos@jardineria.es      │ TAL-ES         │             │ Director General      │
│ 2               │ Ruben       │ López      │ Martinez  │ 2899      │ rlopez@jardineria.es      │ TAL-ES         │ 1           │ Subdirector Marketing │
│ 3               │ Alberto     │ Soria      │ Carrasco  │ 2837      │ asoria@jardineria.es      │ TAL-ES         │ 2           │ Subdirector Ventas    │
│ 4               │ Maria       │ Solís      │ Jerez     │ 2847      │ msolis@jardineria.es      │ TAL-ES         │ 2           │ Secretaria            │
│ 6               │ Juan Carlos │ Ortiz      │ Serrano   │ 2845      │ cortiz@jardineria.es      │ TAL-ES         │ 3           │ Representante Ventas  │
│ 7               │ Carlos      │ Soria      │ Jimenez   │ 2444      │ csoria@jardineria.es      │ MAD-ES         │ 3           │ Director Oficina      │
│ 10              │ Hilario     │ Rodriguez  │ Huertas   │ 2444      │ hrodriguez@jardineria.es  │ MAD-ES         │ 7           │ Representante Ventas  │
│ 13              │ David       │ Palma      │ Aceituno  │ 2519      │ dpalma@jardineria.es      │ BCN-ES         │ 11          │ Representante Ventas  │
│ 14              │ Oscar       │ Palma      │ Aceituno  │ 2519      │ opalma@jardineria.es      │ BCN-ES         │ 11          │ Representante Ventas  │
│ 15              │ Francois    │ Fignon     │           │ 9981      │ ffignon@gardening.com     │ PAR-FR         │ 3           │ Director Oficina      │
│ 17              │ Laurent     │ Serra      │           │ 9982      │ lserra@gardening.com      │ PAR-FR         │ 15          │ Representante Ventas  │
│ 20              │ Hilary      │ Washington │           │ 7565      │ hwashington@gardening.com │ BOS-USA        │ 3           │ Director Oficina      │
│ 21              │ Marcus      │ Paxton     │           │ 7565      │ mpaxton@gardening.com     │ BOS-USA        │ 20          │ Representante Ventas  │
│ 23              │ Nei         │ Nishikori  │           │ 8734      │ nnishikori@gardening.com  │ TOK-JP         │ 3           │ Director Oficina      │
│ 24              │ Narumi      │ Riko       │           │ 8734      │ nriko@gardening.com       │ TOK-JP         │ 23          │ Representante Ventas  │
│ 25              │ Takuma      │ Nomura     │           │ 8735      │ tnomura@gardening.com     │ TOK-JP         │ 23          │ Representante Ventas  │
│ 26              │ Amy         │ Johnson    │           │ 3321      │ ajohnson@gardening.com    │ LON-UK         │ 3           │ Director Oficina      │
│ 27              │ Larry       │ Westfalls  │           │ 3322      │ lwestfalls@gardening.com  │ LON-UK         │ 26          │ Representante Ventas  │
│ 28              │ John        │ Walton     │           │ 3322      │ jwalton@gardening.com     │ LON-UK         │ 26          │ Representante Ventas  │
│ 29              │ Kevin       │ Fallmer    │           │ 3210      │ kfalmer@gardening.com     │ SYD-AU         │ 3           │ Director Oficina      │
└─────────────────┴─────────────┴────────────┴───────────┴───────────┴───────────────────────────┴────────────────┴─────────────┴───────────────────────┘
**/

--Devuelve un listado de los productos que nunca han aparecido en un pedido.

select distinct p.* from producto as p left join detalle_pedido as dp on p.codigo_producto = dp.codigo_producto
where dp.codigo_producto is null;

/**
┌─────────────────┬─────────────────────────────────────────────────────────────┬──────────────┬─────────────┬───────────────────────────┬──────────────────────────────────────────────────────────────┬───────────────────┬──────────────┬──────────────────┐
│ codigo_producto │                           nombre                            │     gama     │ dimensiones │         proveedor         │                         descripcion                          │ cantidad_en_stock │ precio_venta │ precio_proveedor │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-104          │ Olea-Olivos                                                 │ Frutales     │ 12/4        │ Frutales Talavera S.A     │ Existen dos hipótesis sobre el origen del olivo, una que pos │ 50                │ 49           │ 39               │
│                 │                                                             │              │             │                           │ tula que proviene de las costas de Siria, Líbano e Israel y  │                   │              │                  │
│                 │                                                             │              │             │                           │ otra que considera que lo considera originario de Asia menor │                   │              │                  │
│                 │                                                             │              │             │                           │ . La llegada a Europa probablemente tuvo lugar de mano de lo │                   │              │                  │
│                 │                                                             │              │             │                           │ s Fenicios, en transito por Chipre, Creta, e Islas del Mar E │                   │              │                  │
│                 │                                                             │              │             │                           │ geo, pasando a Grecia y más tarde a Italia. Los primeros ind │                   │              │                  │
│                 │                                                             │              │             │                           │ icios de la presencia del olivo en las costas mediterráneas  │                   │              │                  │
│                 │                                                             │              │             │                           │ españolas coinciden con el dominio romano, aunque fueron pos │                   │              │                  │
│                 │                                                             │              │             │                           │ teriormente los árabes los que impulsaron su cultivo en Anda │                   │              │                  │
│                 │                                                             │              │             │                           │ lucía, convirtiendo a España en el primer país productor de  │                   │              │                  │
│                 │                                                             │              │             │                           │ aceite de oliva a nivel mundial.                             │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-14           │ Calamondin Mini                                             │ Frutales     │             │ Frutales Talavera S.A     │ Se trata de un pequeño arbolito de copa densa, con tendencia │ 15                │ 10           │ 8                │
│                 │                                                             │              │             │                           │  a la verticalidad, inerme o con cortas espinas. Sus hojas s │                   │              │                  │
│                 │                                                             │              │             │                           │ on pequeñas, elípticas de 5-10 cm de longitud, con los pecío │                   │              │                  │
│                 │                                                             │              │             │                           │ los estrechamente alados.Posee 1 o 2 flores en situación axi │                   │              │                  │
│                 │                                                             │              │             │                           │ lar, al final de las ramillas.Sus frutos son muy pequeños (3 │                   │              │                  │
│                 │                                                             │              │             │                           │ -3,5 cm de diámetro), con pocas semillas, esféricos u ovales │                   │              │                  │
│                 │                                                             │              │             │                           │ , con la zona apical aplanada; corteza de color naranja-roji │                   │              │                  │
│                 │                                                             │              │             │                           │ zo, muy fina y fácilmente separable de la pulpa, que es dulc │                   │              │                  │
│                 │                                                             │              │             │                           │ e, ácida y comestible..                                      │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-19           │ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │ Frutales     │             │ NaranjasValencianas.com   │                                                              │ 350               │ 4            │ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-20           │ Landora Amarillo, Rose Gaujard bicolor blanco-rojo          │ Frutales     │             │ Frutales Talavera S.A     │                                                              │ 350               │ 4            │ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-21           │ Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte │ Frutales     │             │ Frutales Talavera S.A     │                                                              │ 350               │ 4            │ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-24           │ Albaricoquero Corbato                                       │ Frutales     │             │ Melocotones de Cieza S.A. │ árbol que puede pasar de los 6 m de altura, en la región med │ 400               │ 8            │ 6                │
│                 │                                                             │              │             │                           │ iterránea con ramas formando una copa redondeada. La corteza │                   │              │                  │
│                 │                                                             │              │             │                           │  del tronco es pardo-violácea, agrietada; las ramas son roji │                   │              │                  │
│                 │                                                             │              │             │                           │ zas y extendidas cuando jóvenes y las ramas secundarias son  │                   │              │                  │
│                 │                                                             │              │             │                           │ cortas, divergentes y escasas. Las yemas latentes son frecue │                   │              │                  │
│                 │                                                             │              │             │                           │ ntes especialmente sobre las ramas viejas.                   │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-25           │ Albaricoquero Moniqui                                       │ Frutales     │             │ Melocotones de Cieza S.A. │ árbol que puede pasar de los 6 m de altura, en la región med │ 400               │ 8            │ 6                │
│                 │                                                             │              │             │                           │ iterránea con ramas formando una copa redondeada. La corteza │                   │              │                  │
│                 │                                                             │              │             │                           │  del tronco es pardo-violácea, agrietada; las ramas son roji │                   │              │                  │
│                 │                                                             │              │             │                           │ zas y extendidas cuando jóvenes y las ramas secundarias son  │                   │              │                  │
│                 │                                                             │              │             │                           │ cortas, divergentes y escasas. Las yemas latentes son frecue │                   │              │                  │
│                 │                                                             │              │             │                           │ ntes especialmente sobre las ramas viejas.                   │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-26           │ Albaricoquero Kurrot                                        │ Frutales     │             │ Melocotones de Cieza S.A. │ árbol que puede pasar de los 6 m de altura, en la región med │ 400               │ 8            │ 6                │
│                 │                                                             │              │             │                           │ iterránea con ramas formando una copa redondeada. La corteza │                   │              │                  │
│                 │                                                             │              │             │                           │  del tronco es pardo-violácea, agrietada; las ramas son roji │                   │              │                  │
│                 │                                                             │              │             │                           │ zas y extendidas cuando jóvenes y las ramas secundarias son  │                   │              │                  │
│                 │                                                             │              │             │                           │ cortas, divergentes y escasas. Las yemas latentes son frecue │                   │              │                  │
│                 │                                                             │              │             │                           │ ntes especialmente sobre las ramas viejas.                   │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-27           │ Cerezo Burlat                                               │ Frutales     │             │ Jerte Distribuciones S.L. │ Las principales especies de cerezo cultivadas en el mundo so │ 400               │ 8            │ 6                │
│                 │                                                             │              │             │                           │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │                   │              │                  │
│                 │                                                             │              │             │                           │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │                   │              │                  │
│                 │                                                             │              │             │                           │  son naturales del sureste de Europa y oeste de Asia. El cer │                   │              │                  │
│                 │                                                             │              │             │                           │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │                   │              │                  │
│                 │                                                             │              │             │                           │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │                   │              │                  │
│                 │                                                             │              │             │                           │ evado por los pájaros y las migraciones humanas. Fue uno de  │                   │              │                  │
│                 │                                                             │              │             │                           │ los frutales más apreciados por los griegos y con el Imperio │                   │              │                  │
│                 │                                                             │              │             │                           │  Romano se extendió a regiones muy diversas. En la actualida │                   │              │                  │
│                 │                                                             │              │             │                           │ d, el cerezo se encuentra difundido por numerosas regiones y │                   │              │                  │
│                 │                                                             │              │             │                           │  países del mundo con clima templado                         │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-28           │ Cerezo Picota                                               │ Frutales     │             │ Jerte Distribuciones S.L. │ Las principales especies de cerezo cultivadas en el mundo so │ 400               │ 8            │ 6                │
│                 │                                                             │              │             │                           │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │                   │              │                  │
│                 │                                                             │              │             │                           │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │                   │              │                  │
│                 │                                                             │              │             │                           │  son naturales del sureste de Europa y oeste de Asia. El cer │                   │              │                  │
│                 │                                                             │              │             │                           │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │                   │              │                  │
│                 │                                                             │              │             │                           │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │                   │              │                  │
│                 │                                                             │              │             │                           │ evado por los pájaros y las migraciones humanas. Fue uno de  │                   │              │                  │
│                 │                                                             │              │             │                           │ los frutales más apreciados por los griegos y con el Imperio │                   │              │                  │
│                 │                                                             │              │             │                           │  Romano se extendió a regiones muy diversas. En la actualida │                   │              │                  │
│                 │                                                             │              │             │                           │ d, el cerezo se encuentra difundido por numerosas regiones y │                   │              │                  │
│                 │                                                             │              │             │                           │  países del mundo con clima templado                         │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-30           │ Ciruelo R. Claudia Verde                                    │ Frutales     │             │ Frutales Talavera S.A     │ árbol de tamaño mediano que alcanza una altura máxima de 5-6 │ 400               │ 8            │ 6                │
│                 │                                                             │              │             │                           │  m. Tronco de corteza pardo-azulada, brillante, lisa o agrie │                   │              │                  │
│                 │                                                             │              │             │                           │ tada longitudinalmente. Produce ramas alternas, pequeñas, de │                   │              │                  │
│                 │                                                             │              │             │                           │ lgadas, unas veces lisas, glabras y otras pubescentes y vell │                   │              │                  │
│                 │                                                             │              │             │                           │ osas                                                         │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-32           │ Ciruelo Golden Japan                                        │ Frutales     │             │ Frutales Talavera S.A     │ árbol de tamaño mediano que alcanza una altura máxima de 5-6 │ 400               │ 8            │ 6                │
│                 │                                                             │              │             │                           │  m. Tronco de corteza pardo-azulada, brillante, lisa o agrie │                   │              │                  │
│                 │                                                             │              │             │                           │ tada longitudinalmente. Produce ramas alternas, pequeñas, de │                   │              │                  │
│                 │                                                             │              │             │                           │ lgadas, unas veces lisas, glabras y otras pubescentes y vell │                   │              │                  │
│                 │                                                             │              │             │                           │ osas                                                         │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-35           │ Ciruelo Claudia Negra                                       │ Frutales     │             │ Frutales Talavera S.A     │ árbol de tamaño mediano que alcanza una altura máxima de 5-6 │ 400               │ 8            │ 6                │
│                 │                                                             │              │             │                           │  m. Tronco de corteza pardo-azulada, brillante, lisa o agrie │                   │              │                  │
│                 │                                                             │              │             │                           │ tada longitudinalmente. Produce ramas alternas, pequeñas, de │                   │              │                  │
│                 │                                                             │              │             │                           │ lgadas, unas veces lisas, glabras y otras pubescentes y vell │                   │              │                  │
│                 │                                                             │              │             │                           │ osas                                                         │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-38           │ Higuera Verdal                                              │ Frutales     │             │ Frutales Talavera S.A     │ La higuera (Ficus carica L.) es un árbol típico de secano en │ 400               │ 9            │ 7                │
│                 │                                                             │              │             │                           │  los países mediterráneos. Su rusticidad y su fácil multipli │                   │              │                  │
│                 │                                                             │              │             │                           │ cación hacen de la higuera un frutal muy apropiado para el c │                   │              │                  │
│                 │                                                             │              │             │                           │ ultivo extensivo.. Siempre ha sido considerado como árbol qu │                   │              │                  │
│                 │                                                             │              │             │                           │ e no requiere cuidado alguno una vez plantado y arraigado, l │                   │              │                  │
│                 │                                                             │              │             │                           │ imitándose el hombre a recoger de él los frutos cuando madur │                   │              │                  │
│                 │                                                             │              │             │                           │ an, unos para consumo en fresco y otros para conserva. Las ú │                   │              │                  │
│                 │                                                             │              │             │                           │ nicas higueras con cuidados culturales esmerados, en muchas  │                   │              │                  │
│                 │                                                             │              │             │                           │ comarcas, son las brevales, por el interés económico de su p │                   │              │                  │
│                 │                                                             │              │             │                           │ rimera cosecha, la de brevas.                                │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-39           │ Higuera Breva                                               │ Frutales     │             │ Frutales Talavera S.A     │ La higuera (Ficus carica L.) es un árbol típico de secano en │ 400               │ 9            │ 7                │
│                 │                                                             │              │             │                           │  los países mediterráneos. Su rusticidad y su fácil multipli │                   │              │                  │
│                 │                                                             │              │             │                           │ cación hacen de la higuera un frutal muy apropiado para el c │                   │              │                  │
│                 │                                                             │              │             │                           │ ultivo extensivo.. Siempre ha sido considerado como árbol qu │                   │              │                  │
│                 │                                                             │              │             │                           │ e no requiere cuidado alguno una vez plantado y arraigado, l │                   │              │                  │
│                 │                                                             │              │             │                           │ imitándose el hombre a recoger de él los frutos cuando madur │                   │              │                  │
│                 │                                                             │              │             │                           │ an, unos para consumo en fresco y otros para conserva. Las ú │                   │              │                  │
│                 │                                                             │              │             │                           │ nicas higueras con cuidados culturales esmerados, en muchas  │                   │              │                  │
│                 │                                                             │              │             │                           │ comarcas, son las brevales, por el interés económico de su p │                   │              │                  │
│                 │                                                             │              │             │                           │ rimera cosecha, la de brevas.                                │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-44           │ Melocotonero Spring Crest                                   │ Frutales     │             │ Melocotones de Cieza S.A. │ Árbol caducifolio de porte bajo con corteza lisa, de color c │ 400               │ 8            │ 6                │
│                 │                                                             │              │             │                           │ eniciento. Sus hojas son alargadas con el margen ligeramente │                   │              │                  │
│                 │                                                             │              │             │                           │  aserrado, de color verde brillante, algo más claras por el  │                   │              │                  │
│                 │                                                             │              │             │                           │ envés. El melocotonero está muy arraigado en la cultura asiá │                   │              │                  │
│                 │                                                             │              │             │                           │ tica.\r\nEn Japón, el noble heroe Momotaro, una especie de C │                   │              │                  │
│                 │                                                             │              │             │                           │ id japonés, nació del interior de un enorme melocotón que fl │                   │              │                  │
│                 │                                                             │              │             │                           │ otaba río abajo.\r\nEn China se piensa que comer melocotón c │                   │              │                  │
│                 │                                                             │              │             │                           │ onfiere longevidad al ser humano, ya que formaba parte de la │                   │              │                  │
│                 │                                                             │              │             │                           │  dieta de sus dioses inmortales.                             │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-46           │ Melocotonero Federica                                       │ Frutales     │             │ Melocotones de Cieza S.A. │ Árbol caducifolio de porte bajo con corteza lisa, de color c │ 400               │ 8            │ 6                │
│                 │                                                             │              │             │                           │ eniciento. Sus hojas son alargadas con el margen ligeramente │                   │              │                  │
│                 │                                                             │              │             │                           │  aserrado, de color verde brillante, algo más claras por el  │                   │              │                  │
│                 │                                                             │              │             │                           │ envés. El melocotonero está muy arraigado en la cultura asiá │                   │              │                  │
│                 │                                                             │              │             │                           │ tica.\r\nEn Japón, el noble heroe Momotaro, una especie de C │                   │              │                  │
│                 │                                                             │              │             │                           │ id japonés, nació del interior de un enorme melocotón que fl │                   │              │                  │
│                 │                                                             │              │             │                           │ otaba río abajo.\r\nEn China se piensa que comer melocotón c │                   │              │                  │
│                 │                                                             │              │             │                           │ onfiere longevidad al ser humano, ya que formaba parte de la │                   │              │                  │
│                 │                                                             │              │             │                           │  dieta de sus dioses inmortales.                             │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-49           │ Parra Uva de Mesa                                           │ Frutales     │             │ Frutales Talavera S.A     │                                                              │ 400               │ 8            │ 6                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-5            │ Mandarino -Plantón joven                                    │ Frutales     │             │ Frutales Talavera S.A     │                                                              │ 15                │ 6            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-50           │ Peral Castell                                               │ Frutales     │             │ Frutales Talavera S.A     │ Árbol piramidal, redondeado en su juventud, luego oval, que  │ 400               │ 8            │ 6                │
│                 │                                                             │              │             │                           │ llega hasta 20 metros de altura y por término medio vive 65  │                   │              │                  │
│                 │                                                             │              │             │                           │ años.Tronco alto, grueso, de corteza agrietada, gris, de la  │                   │              │                  │
│                 │                                                             │              │             │                           │ cual se destacan con frecuencia placas lenticulares.Las rama │                   │              │                  │
│                 │                                                             │              │             │                           │ s se insertan formando ángulo agudo con el tronco (45º), de  │                   │              │                  │
│                 │                                                             │              │             │                           │ corteza lisa, primero verde y luego gris-violácea, con numer │                   │              │                  │
│                 │                                                             │              │             │                           │ osas lenticelas.                                             │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-51           │ Peral Williams                                              │ Frutales     │             │ Frutales Talavera S.A     │ Árbol piramidal, redondeado en su juventud, luego oval, que  │ 400               │ 8            │ 6                │
│                 │                                                             │              │             │                           │ llega hasta 20 metros de altura y por término medio vive 65  │                   │              │                  │
│                 │                                                             │              │             │                           │ años.Tronco alto, grueso, de corteza agrietada, gris, de la  │                   │              │                  │
│                 │                                                             │              │             │                           │ cual se destacan con frecuencia placas lenticulares.Las rama │                   │              │                  │
│                 │                                                             │              │             │                           │ s se insertan formando ángulo agudo con el tronco (45º), de  │                   │              │                  │
│                 │                                                             │              │             │                           │ corteza lisa, primero verde y luego gris-violácea, con numer │                   │              │                  │
│                 │                                                             │              │             │                           │ osas lenticelas.                                             │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-52           │ Peral Conference                                            │ Frutales     │             │ Frutales Talavera S.A     │ Árbol piramidal, redondeado en su juventud, luego oval, que  │ 400               │ 8            │ 6                │
│                 │                                                             │              │             │                           │ llega hasta 20 metros de altura y por término medio vive 65  │                   │              │                  │
│                 │                                                             │              │             │                           │ años.Tronco alto, grueso, de corteza agrietada, gris, de la  │                   │              │                  │
│                 │                                                             │              │             │                           │ cual se destacan con frecuencia placas lenticulares.Las rama │                   │              │                  │
│                 │                                                             │              │             │                           │ s se insertan formando ángulo agudo con el tronco (45º), de  │                   │              │                  │
│                 │                                                             │              │             │                           │ corteza lisa, primero verde y luego gris-violácea, con numer │                   │              │                  │
│                 │                                                             │              │             │                           │ osas lenticelas.                                             │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-55           │ Olivo Cipresino                                             │ Frutales     │             │ Frutales Talavera S.A     │ Existen dos hipótesis sobre el origen del olivo, una que pos │ 400               │ 8            │ 6                │
│                 │                                                             │              │             │                           │ tula que proviene de las costas de Siria, Líbano e Israel y  │                   │              │                  │
│                 │                                                             │              │             │                           │ otra que considera que lo considera originario de Asia menor │                   │              │                  │
│                 │                                                             │              │             │                           │ . La llegada a Europa probablemente tuvo lugar de mano de lo │                   │              │                  │
│                 │                                                             │              │             │                           │ s Fenicios, en transito por Chipre, Creta, e Islas del Mar E │                   │              │                  │
│                 │                                                             │              │             │                           │ geo, pasando a Grecia y más tarde a Italia. Los primeros ind │                   │              │                  │
│                 │                                                             │              │             │                           │ icios de la presencia del olivo en las costas mediterráneas  │                   │              │                  │
│                 │                                                             │              │             │                           │ españolas coinciden con el dominio romano, aunque fueron pos │                   │              │                  │
│                 │                                                             │              │             │                           │ teriormente los árabes los que impulsaron su cultivo en Anda │                   │              │                  │
│                 │                                                             │              │             │                           │ lucía, convirtiendo a España en el primer país productor de  │                   │              │                  │
│                 │                                                             │              │             │                           │ aceite de oliva a nivel mundial.                             │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-59           │ Albaricoquero                                               │ Frutales     │ 10/12       │ Melocotones de Cieza S.A. │ árbol que puede pasar de los 6 m de altura, en la región med │ 200               │ 22           │ 17               │
│                 │                                                             │              │             │                           │ iterránea con ramas formando una copa redondeada. La corteza │                   │              │                  │
│                 │                                                             │              │             │                           │  del tronco es pardo-violácea, agrietada; las ramas son roji │                   │              │                  │
│                 │                                                             │              │             │                           │ zas y extendidas cuando jóvenes y las ramas secundarias son  │                   │              │                  │
│                 │                                                             │              │             │                           │ cortas, divergentes y escasas. Las yemas latentes son frecue │                   │              │                  │
│                 │                                                             │              │             │                           │ ntes especialmente sobre las ramas viejas.                   │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-61           │ Albaricoquero                                               │ Frutales     │ 14/16       │ Melocotones de Cieza S.A. │ árbol que puede pasar de los 6 m de altura, en la región med │ 200               │ 49           │ 39               │
│                 │                                                             │              │             │                           │ iterránea con ramas formando una copa redondeada. La corteza │                   │              │                  │
│                 │                                                             │              │             │                           │  del tronco es pardo-violácea, agrietada; las ramas son roji │                   │              │                  │
│                 │                                                             │              │             │                           │ zas y extendidas cuando jóvenes y las ramas secundarias son  │                   │              │                  │
│                 │                                                             │              │             │                           │ cortas, divergentes y escasas. Las yemas latentes son frecue │                   │              │                  │
│                 │                                                             │              │             │                           │ ntes especialmente sobre las ramas viejas.                   │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-62           │ Albaricoquero                                               │ Frutales     │ 16/18       │ Melocotones de Cieza S.A. │ árbol que puede pasar de los 6 m de altura, en la región med │ 200               │ 70           │ 56               │
│                 │                                                             │              │             │                           │ iterránea con ramas formando una copa redondeada. La corteza │                   │              │                  │
│                 │                                                             │              │             │                           │  del tronco es pardo-violácea, agrietada; las ramas son roji │                   │              │                  │
│                 │                                                             │              │             │                           │ zas y extendidas cuando jóvenes y las ramas secundarias son  │                   │              │                  │
│                 │                                                             │              │             │                           │ cortas, divergentes y escasas. Las yemas latentes son frecue │                   │              │                  │
│                 │                                                             │              │             │                           │ ntes especialmente sobre las ramas viejas.                   │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-63           │ Cerezo                                                      │ Frutales     │ 8/10        │ Jerte Distribuciones S.L. │ Las principales especies de cerezo cultivadas en el mundo so │ 300               │ 11           │ 8                │
│                 │                                                             │              │             │                           │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │                   │              │                  │
│                 │                                                             │              │             │                           │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │                   │              │                  │
│                 │                                                             │              │             │                           │  son naturales del sureste de Europa y oeste de Asia. El cer │                   │              │                  │
│                 │                                                             │              │             │                           │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │                   │              │                  │
│                 │                                                             │              │             │                           │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │                   │              │                  │
│                 │                                                             │              │             │                           │ evado por los pájaros y las migraciones humanas. Fue uno de  │                   │              │                  │
│                 │                                                             │              │             │                           │ los frutales más apreciados por los griegos y con el Imperio │                   │              │                  │
│                 │                                                             │              │             │                           │  Romano se extendió a regiones muy diversas. En la actualida │                   │              │                  │
│                 │                                                             │              │             │                           │ d, el cerezo se encuentra difundido por numerosas regiones y │                   │              │                  │
│                 │                                                             │              │             │                           │  países del mundo con clima templado                         │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-65           │ Cerezo                                                      │ Frutales     │ 12/14       │ Jerte Distribuciones S.L. │ Las principales especies de cerezo cultivadas en el mundo so │ 200               │ 32           │ 25               │
│                 │                                                             │              │             │                           │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │                   │              │                  │
│                 │                                                             │              │             │                           │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │                   │              │                  │
│                 │                                                             │              │             │                           │  son naturales del sureste de Europa y oeste de Asia. El cer │                   │              │                  │
│                 │                                                             │              │             │                           │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │                   │              │                  │
│                 │                                                             │              │             │                           │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │                   │              │                  │
│                 │                                                             │              │             │                           │ evado por los pájaros y las migraciones humanas. Fue uno de  │                   │              │                  │
│                 │                                                             │              │             │                           │ los frutales más apreciados por los griegos y con el Imperio │                   │              │                  │
│                 │                                                             │              │             │                           │  Romano se extendió a regiones muy diversas. En la actualida │                   │              │                  │
│                 │                                                             │              │             │                           │ d, el cerezo se encuentra difundido por numerosas regiones y │                   │              │                  │
│                 │                                                             │              │             │                           │  países del mundo con clima templado                         │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-68           │ Cerezo                                                      │ Frutales     │ 18/20       │ Jerte Distribuciones S.L. │ Las principales especies de cerezo cultivadas en el mundo so │ 50                │ 80           │ 64               │
│                 │                                                             │              │             │                           │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │                   │              │                  │
│                 │                                                             │              │             │                           │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │                   │              │                  │
│                 │                                                             │              │             │                           │  son naturales del sureste de Europa y oeste de Asia. El cer │                   │              │                  │
│                 │                                                             │              │             │                           │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │                   │              │                  │
│                 │                                                             │              │             │                           │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │                   │              │                  │
│                 │                                                             │              │             │                           │ evado por los pájaros y las migraciones humanas. Fue uno de  │                   │              │                  │
│                 │                                                             │              │             │                           │ los frutales más apreciados por los griegos y con el Imperio │                   │              │                  │
│                 │                                                             │              │             │                           │  Romano se extendió a regiones muy diversas. En la actualida │                   │              │                  │
│                 │                                                             │              │             │                           │ d, el cerezo se encuentra difundido por numerosas regiones y │                   │              │                  │
│                 │                                                             │              │             │                           │  países del mundo con clima templado                         │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-70           │ Ciruelo                                                     │ Frutales     │ 8/10        │ Frutales Talavera S.A     │ árbol de tamaño mediano que alcanza una altura máxima de 5-6 │ 50                │ 11           │ 8                │
│                 │                                                             │              │             │                           │  m. Tronco de corteza pardo-azulada, brillante, lisa o agrie │                   │              │                  │
│                 │                                                             │              │             │                           │ tada longitudinalmente. Produce ramas alternas, pequeñas, de │                   │              │                  │
│                 │                                                             │              │             │                           │ lgadas, unas veces lisas, glabras y otras pubescentes y vell │                   │              │                  │
│                 │                                                             │              │             │                           │ osas                                                         │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-73           │ Granado                                                     │ Frutales     │ 8/10        │ Frutales Talavera S.A     │ pequeño árbol caducifolio, a veces con porte arbustivo, de 3 │ 50                │ 13           │ 10               │
│                 │                                                             │              │             │                           │  a 6 m de altura, con el tronco retorcido. Madera dura y cor │                   │              │                  │
│                 │                                                             │              │             │                           │ teza escamosa de color grisáceo. Las ramitas jóvenes son más │                   │              │                  │
│                 │                                                             │              │             │                           │  o menos cuadrangulares o angostas y de cuatro alas, posteri │                   │              │                  │
│                 │                                                             │              │             │                           │ ormente se vuelven redondas con corteza de color café grisác │                   │              │                  │
│                 │                                                             │              │             │                           │ eo, la mayoría de las ramas, pero especialmente las pequeñas │                   │              │                  │
│                 │                                                             │              │             │                           │  ramitas axilares, son en forma de espina o terminan en una  │                   │              │                  │
│                 │                                                             │              │             │                           │ espina aguda; la copa es extendida.                          │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-74           │ Granado                                                     │ Frutales     │ 10/12       │ Frutales Talavera S.A     │ pequeño árbol caducifolio, a veces con porte arbustivo, de 3 │ 50                │ 22           │ 17               │
│                 │                                                             │              │             │                           │  a 6 m de altura, con el tronco retorcido. Madera dura y cor │                   │              │                  │
│                 │                                                             │              │             │                           │ teza escamosa de color grisáceo. Las ramitas jóvenes son más │                   │              │                  │
│                 │                                                             │              │             │                           │  o menos cuadrangulares o angostas y de cuatro alas, posteri │                   │              │                  │
│                 │                                                             │              │             │                           │ ormente se vuelven redondas con corteza de color café grisác │                   │              │                  │
│                 │                                                             │              │             │                           │ eo, la mayoría de las ramas, pero especialmente las pequeñas │                   │              │                  │
│                 │                                                             │              │             │                           │  ramitas axilares, son en forma de espina o terminan en una  │                   │              │                  │
│                 │                                                             │              │             │                           │ espina aguda; la copa es extendida.                          │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-76           │ Granado                                                     │ Frutales     │ 14/16       │ Frutales Talavera S.A     │ pequeño árbol caducifolio, a veces con porte arbustivo, de 3 │ 50                │ 49           │ 39               │
│                 │                                                             │              │             │                           │  a 6 m de altura, con el tronco retorcido. Madera dura y cor │                   │              │                  │
│                 │                                                             │              │             │                           │ teza escamosa de color grisáceo. Las ramitas jóvenes son más │                   │              │                  │
│                 │                                                             │              │             │                           │  o menos cuadrangulares o angostas y de cuatro alas, posteri │                   │              │                  │
│                 │                                                             │              │             │                           │ ormente se vuelven redondas con corteza de color café grisác │                   │              │                  │
│                 │                                                             │              │             │                           │ eo, la mayoría de las ramas, pero especialmente las pequeñas │                   │              │                  │
│                 │                                                             │              │             │                           │  ramitas axilares, son en forma de espina o terminan en una  │                   │              │                  │
│                 │                                                             │              │             │                           │ espina aguda; la copa es extendida.                          │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-83           │ Higuera                                                     │ Frutales     │ 18/20       │ Frutales Talavera S.A     │ La higuera (Ficus carica L.) es un árbol típico de secano en │ 50                │ 80           │ 64               │
│                 │                                                             │              │             │                           │  los países mediterráneos. Su rusticidad y su fácil multipli │                   │              │                  │
│                 │                                                             │              │             │                           │ cación hacen de la higuera un frutal muy apropiado para el c │                   │              │                  │
│                 │                                                             │              │             │                           │ ultivo extensivo.. Siempre ha sido considerado como árbol qu │                   │              │                  │
│                 │                                                             │              │             │                           │ e no requiere cuidado alguno una vez plantado y arraigado, l │                   │              │                  │
│                 │                                                             │              │             │                           │ imitándose el hombre a recoger de él los frutos cuando madur │                   │              │                  │
│                 │                                                             │              │             │                           │ an, unos para consumo en fresco y otros para conserva. Las ú │                   │              │                  │
│                 │                                                             │              │             │                           │ nicas higueras con cuidados culturales esmerados, en muchas  │                   │              │                  │
│                 │                                                             │              │             │                           │ comarcas, son las brevales, por el interés económico de su p │                   │              │                  │
│                 │                                                             │              │             │                           │ rimera cosecha, la de brevas.                                │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-88           │ Manzano                                                     │ Frutales     │ 12/14       │ Frutales Talavera S.A     │ alcanza como máximo 10 m. de altura y tiene una copa globosa │ 50                │ 32           │ 25               │
│                 │                                                             │              │             │                           │ . Tronco derecho que normalmente alcanza de 2 a 2,5 m. de al │                   │              │                  │
│                 │                                                             │              │             │                           │ tura, con corteza cubierta de lenticelas, lisa, adherida, de │                   │              │                  │
│                 │                                                             │              │             │                           │  color ceniciento verdoso sobre los ramos y escamosa y gris  │                   │              │                  │
│                 │                                                             │              │             │                           │ parda sobre las partes viejas del árbol. Tiene una vida de u │                   │              │                  │
│                 │                                                             │              │             │                           │ nos 60-80 años. Las ramas se insertan en ángulo abierto sobr │                   │              │                  │
│                 │                                                             │              │             │                           │ e el tallo, de color verde oscuro, a veces tendiendo a negru │                   │              │                  │
│                 │                                                             │              │             │                           │ zco o violáceo. Los brotes jóvenes terminan con frecuencia e │                   │              │                  │
│                 │                                                             │              │             │                           │ n una espina                                                 │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-92           │ Melocotonero                                                │ Frutales     │ 8/10        │ Melocotones de Cieza S.A. │ Árbol caducifolio de porte bajo con corteza lisa, de color c │ 50                │ 11           │ 8                │
│                 │                                                             │              │             │                           │ eniciento. Sus hojas son alargadas con el margen ligeramente │                   │              │                  │
│                 │                                                             │              │             │                           │  aserrado, de color verde brillante, algo más claras por el  │                   │              │                  │
│                 │                                                             │              │             │                           │ envés. El melocotonero está muy arraigado en la cultura asiá │                   │              │                  │
│                 │                                                             │              │             │                           │ tica.\r\nEn Japón, el noble heroe Momotaro, una especie de C │                   │              │                  │
│                 │                                                             │              │             │                           │ id japonés, nació del interior de un enorme melocotón que fl │                   │              │                  │
│                 │                                                             │              │             │                           │ otaba río abajo.\r\nEn China se piensa que comer melocotón c │                   │              │                  │
│                 │                                                             │              │             │                           │ onfiere longevidad al ser humano, ya que formaba parte de la │                   │              │                  │
│                 │                                                             │              │             │                           │  dieta de sus dioses inmortales.                             │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-93           │ Melocotonero                                                │ Frutales     │ 10/12       │ Melocotones de Cieza S.A. │ Árbol caducifolio de porte bajo con corteza lisa, de color c │ 50                │ 22           │ 17               │
│                 │                                                             │              │             │                           │ eniciento. Sus hojas son alargadas con el margen ligeramente │                   │              │                  │
│                 │                                                             │              │             │                           │  aserrado, de color verde brillante, algo más claras por el  │                   │              │                  │
│                 │                                                             │              │             │                           │ envés. El melocotonero está muy arraigado en la cultura asiá │                   │              │                  │
│                 │                                                             │              │             │                           │ tica.\r\nEn Japón, el noble heroe Momotaro, una especie de C │                   │              │                  │
│                 │                                                             │              │             │                           │ id japonés, nació del interior de un enorme melocotón que fl │                   │              │                  │
│                 │                                                             │              │             │                           │ otaba río abajo.\r\nEn China se piensa que comer melocotón c │                   │              │                  │
│                 │                                                             │              │             │                           │ onfiere longevidad al ser humano, ya que formaba parte de la │                   │              │                  │
│                 │                                                             │              │             │                           │  dieta de sus dioses inmortales.                             │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-95           │ Melocotonero                                                │ Frutales     │ 14/16       │ Melocotones de Cieza S.A. │ Árbol caducifolio de porte bajo con corteza lisa, de color c │ 50                │ 49           │ 39               │
│                 │                                                             │              │             │                           │ eniciento. Sus hojas son alargadas con el margen ligeramente │                   │              │                  │
│                 │                                                             │              │             │                           │  aserrado, de color verde brillante, algo más claras por el  │                   │              │                  │
│                 │                                                             │              │             │                           │ envés. El melocotonero está muy arraigado en la cultura asiá │                   │              │                  │
│                 │                                                             │              │             │                           │ tica.\r\nEn Japón, el noble heroe Momotaro, una especie de C │                   │              │                  │
│                 │                                                             │              │             │                           │ id japonés, nació del interior de un enorme melocotón que fl │                   │              │                  │
│                 │                                                             │              │             │                           │ otaba río abajo.\r\nEn China se piensa que comer melocotón c │                   │              │                  │
│                 │                                                             │              │             │                           │ onfiere longevidad al ser humano, ya que formaba parte de la │                   │              │                  │
│                 │                                                             │              │             │                           │  dieta de sus dioses inmortales.                             │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-96           │ Membrillero                                                 │ Frutales     │ 8/10        │ Frutales Talavera S.A     │ arbolito caducifolio de 4-6 m de altura con el tronco tortuo │ 50                │ 11           │ 8                │
│                 │                                                             │              │             │                           │ so y la corteza lisa, grisácea, que se desprende en escamas  │                   │              │                  │
│                 │                                                             │              │             │                           │ con la edad. Copa irregular, con ramas inermes, flexuosas, p │                   │              │                  │
│                 │                                                             │              │             │                           │ arduzcas, punteadas. Ramillas jóvenes tomentosas             │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-97           │ Membrillero                                                 │ Frutales     │ 10/12       │ Frutales Talavera S.A     │ arbolito caducifolio de 4-6 m de altura con el tronco tortuo │ 50                │ 22           │ 17               │
│                 │                                                             │              │             │                           │ so y la corteza lisa, grisácea, que se desprende en escamas  │                   │              │                  │
│                 │                                                             │              │             │                           │ con la edad. Copa irregular, con ramas inermes, flexuosas, p │                   │              │                  │
│                 │                                                             │              │             │                           │ arduzcas, punteadas. Ramillas jóvenes tomentosas             │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-98           │ Membrillero                                                 │ Frutales     │ 12/14       │ Frutales Talavera S.A     │ arbolito caducifolio de 4-6 m de altura con el tronco tortuo │ 50                │ 32           │ 25               │
│                 │                                                             │              │             │                           │ so y la corteza lisa, grisácea, que se desprende en escamas  │                   │              │                  │
│                 │                                                             │              │             │                           │ con la edad. Copa irregular, con ramas inermes, flexuosas, p │                   │              │                  │
│                 │                                                             │              │             │                           │ arduzcas, punteadas. Ramillas jóvenes tomentosas             │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-99           │ Membrillero                                                 │ Frutales     │ 14/16       │ Frutales Talavera S.A     │ arbolito caducifolio de 4-6 m de altura con el tronco tortuo │ 50                │ 49           │ 39               │
│                 │                                                             │              │             │                           │ so y la corteza lisa, grisácea, que se desprende en escamas  │                   │              │                  │
│                 │                                                             │              │             │                           │ con la edad. Copa irregular, con ramas inermes, flexuosas, p │                   │              │                  │
│                 │                                                             │              │             │                           │ arduzcas, punteadas. Ramillas jóvenes tomentosas             │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-001          │ Arbustos Mix Maceta                                         │ Ornamentales │ 40-60       │ Valencia Garden Service   │                                                              │ 25                │ 5            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-100          │ Mimosa Injerto CLASICA Dealbata                             │ Ornamentales │ 100-110     │ Viveros EL OASIS          │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │ 100               │ 12           │ 9                │
│                 │                                                             │              │             │                           │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │                   │              │                  │
│                 │                                                             │              │             │                           │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │                   │              │                  │
│                 │                                                             │              │             │                           │ a). Arbol de follaje persistente muy usado en parques por su │                   │              │                  │
│                 │                                                             │              │             │                           │  atractiva floración amarilla hacia fines del invierno. Altu │                   │              │                  │
│                 │                                                             │              │             │                           │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │                   │              │                  │
│                 │                                                             │              │             │                           │ je perenne de tonos plateados, muy ornamental. Sus hojas son │                   │              │                  │
│                 │                                                             │              │             │                           │  de textura fina, de color verde y sus flores amarillas que  │                   │              │                  │
│                 │                                                             │              │             │                           │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │                   │              │                  │
│                 │                                                             │              │             │                           │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │                   │              │                  │
│                 │                                                             │              │             │                           │ mente curvada, con los bordes algo constreñidos entre las se │                   │              │                  │
│                 │                                                             │              │             │                           │ millas, que se disponen en el fruto longitudinalmente...     │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-103          │ Mimosa Semilla Bayleyana                                    │ Ornamentales │ 200-225     │ Viveros EL OASIS          │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │ 100               │ 10           │ 8                │
│                 │                                                             │              │             │                           │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │                   │              │                  │
│                 │                                                             │              │             │                           │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │                   │              │                  │
│                 │                                                             │              │             │                           │ a). Arbol de follaje persistente muy usado en parques por su │                   │              │                  │
│                 │                                                             │              │             │                           │  atractiva floración amarilla hacia fines del invierno. Altu │                   │              │                  │
│                 │                                                             │              │             │                           │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │                   │              │                  │
│                 │                                                             │              │             │                           │ je perenne de tonos plateados, muy ornamental. Sus hojas son │                   │              │                  │
│                 │                                                             │              │             │                           │  de textura fina, de color verde y sus flores amarillas que  │                   │              │                  │
│                 │                                                             │              │             │                           │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │                   │              │                  │
│                 │                                                             │              │             │                           │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │                   │              │                  │
│                 │                                                             │              │             │                           │ mente curvada, con los bordes algo constreñidos entre las se │                   │              │                  │
│                 │                                                             │              │             │                           │ millas, que se disponen en el fruto longitudinalmente...     │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-105          │ Mimosa Semilla Espectabilis                                 │ Ornamentales │ 160-170     │ Viveros EL OASIS          │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │ 100               │ 6            │ 4                │
│                 │                                                             │              │             │                           │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │                   │              │                  │
│                 │                                                             │              │             │                           │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │                   │              │                  │
│                 │                                                             │              │             │                           │ a). Arbol de follaje persistente muy usado en parques por su │                   │              │                  │
│                 │                                                             │              │             │                           │  atractiva floración amarilla hacia fines del invierno. Altu │                   │              │                  │
│                 │                                                             │              │             │                           │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │                   │              │                  │
│                 │                                                             │              │             │                           │ je perenne de tonos plateados, muy ornamental. Sus hojas son │                   │              │                  │
│                 │                                                             │              │             │                           │  de textura fina, de color verde y sus flores amarillas que  │                   │              │                  │
│                 │                                                             │              │             │                           │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │                   │              │                  │
│                 │                                                             │              │             │                           │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │                   │              │                  │
│                 │                                                             │              │             │                           │ mente curvada, con los bordes algo constreñidos entre las se │                   │              │                  │
│                 │                                                             │              │             │                           │ millas, que se disponen en el fruto longitudinalmente...     │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-106          │ Mimosa Semilla Longifolia                                   │ Ornamentales │ 200-225     │ Viveros EL OASIS          │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │ 100               │ 10           │ 8                │
│                 │                                                             │              │             │                           │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │                   │              │                  │
│                 │                                                             │              │             │                           │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │                   │              │                  │
│                 │                                                             │              │             │                           │ a). Arbol de follaje persistente muy usado en parques por su │                   │              │                  │
│                 │                                                             │              │             │                           │  atractiva floración amarilla hacia fines del invierno. Altu │                   │              │                  │
│                 │                                                             │              │             │                           │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │                   │              │                  │
│                 │                                                             │              │             │                           │ je perenne de tonos plateados, muy ornamental. Sus hojas son │                   │              │                  │
│                 │                                                             │              │             │                           │  de textura fina, de color verde y sus flores amarillas que  │                   │              │                  │
│                 │                                                             │              │             │                           │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │                   │              │                  │
│                 │                                                             │              │             │                           │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │                   │              │                  │
│                 │                                                             │              │             │                           │ mente curvada, con los bordes algo constreñidos entre las se │                   │              │                  │
│                 │                                                             │              │             │                           │ millas, que se disponen en el fruto longitudinalmente...     │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-107          │ Mimosa Semilla Floribunda 4 estaciones                      │ Ornamentales │ 120-140     │ Viveros EL OASIS          │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │ 100               │ 6            │ 4                │
│                 │                                                             │              │             │                           │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │                   │              │                  │
│                 │                                                             │              │             │                           │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │                   │              │                  │
│                 │                                                             │              │             │                           │ a). Arbol de follaje persistente muy usado en parques por su │                   │              │                  │
│                 │                                                             │              │             │                           │  atractiva floración amarilla hacia fines del invierno. Altu │                   │              │                  │
│                 │                                                             │              │             │                           │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │                   │              │                  │
│                 │                                                             │              │             │                           │ je perenne de tonos plateados, muy ornamental. Sus hojas son │                   │              │                  │
│                 │                                                             │              │             │                           │  de textura fina, de color verde y sus flores amarillas que  │                   │              │                  │
│                 │                                                             │              │             │                           │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │                   │              │                  │
│                 │                                                             │              │             │                           │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │                   │              │                  │
│                 │                                                             │              │             │                           │ mente curvada, con los bordes algo constreñidos entre las se │                   │              │                  │
│                 │                                                             │              │             │                           │ millas, que se disponen en el fruto longitudinalmente...     │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-108          │ Abelia Floribunda                                           │ Ornamentales │ 35-45       │ Viveros EL OASIS          │                                                              │ 100               │ 5            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-109          │ Callistemom (Mix)                                           │ Ornamentales │ 35-45       │ Viveros EL OASIS          │ Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y │ 100               │ 5            │ 4                │
│                 │                                                             │              │             │                           │  colgantes (de ahí lo de \"llorón\")..                       │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-110          │ Callistemom (Mix)                                           │ Ornamentales │ 40-60       │ Viveros EL OASIS          │ Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y │ 100               │ 2            │ 1                │
│                 │                                                             │              │             │                           │  colgantes (de ahí lo de \"llorón\")..                       │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-111          │ Corylus Avellana \"Contorta\"                               │ Ornamentales │ 35-45       │ Viveros EL OASIS          │                                                              │ 100               │ 5            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-112          │ Escallonia (Mix)                                            │ Ornamentales │ 35-45       │ Viveros EL OASIS          │                                                              │ 120               │ 5            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-113          │ Evonimus Emerald Gayeti                                     │ Ornamentales │ 35-45       │ Viveros EL OASIS          │                                                              │ 120               │ 5            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-114          │ Evonimus Pulchellus                                         │ Ornamentales │ 35-45       │ Viveros EL OASIS          │                                                              │ 120               │ 5            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-117          │ Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo                │ Ornamentales │ 35-45       │ Viveros EL OASIS          │ Por su capacidad de soportar podas, pueden ser fácilmente mo │ 120               │ 7            │ 5                │
│                 │                                                             │              │             │                           │ ldeadas como bonsái en el transcurso de pocos años. Flores d │                   │              │                  │
│                 │                                                             │              │             │                           │ e muchos colores según la variedad, desde el blanco puro al  │                   │              │                  │
│                 │                                                             │              │             │                           │ rojo intenso, del amarillo al anaranjado. La flor apenas dur │                   │              │                  │
│                 │                                                             │              │             │                           │ a 1 día, pero continuamente aparecen nuevas y la floración s │                   │              │                  │
│                 │                                                             │              │             │                           │ e prolonga durante todo el periodo de crecimiento vegetativo │                   │              │                  │
│                 │                                                             │              │             │                           │ .                                                            │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-118          │ Hibiscus Syriacus \"Pink Giant\" Rosa                       │ Ornamentales │ 35-45       │ Viveros EL OASIS          │ Por su capacidad de soportar podas, pueden ser fácilmente mo │ 120               │ 7            │ 5                │
│                 │                                                             │              │             │                           │ ldeadas como bonsái en el transcurso de pocos años. Flores d │                   │              │                  │
│                 │                                                             │              │             │                           │ e muchos colores según la variedad, desde el blanco puro al  │                   │              │                  │
│                 │                                                             │              │             │                           │ rojo intenso, del amarillo al anaranjado. La flor apenas dur │                   │              │                  │
│                 │                                                             │              │             │                           │ a 1 día, pero continuamente aparecen nuevas y la floración s │                   │              │                  │
│                 │                                                             │              │             │                           │ e prolonga durante todo el periodo de crecimiento vegetativo │                   │              │                  │
│                 │                                                             │              │             │                           │ .                                                            │                   │              │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-121          │ Lonicera Nitida \"Maigrum\"                                 │ Ornamentales │ 35-45       │ Viveros EL OASIS          │                                                              │ 120               │ 5            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-124          │ Prunus pisardii                                             │ Ornamentales │ 35-45       │ Viveros EL OASIS          │                                                              │ 120               │ 5            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-126          │ Weigelia \"Bristol Ruby\"                                   │ Ornamentales │ 35-45       │ Viveros EL OASIS          │                                                              │ 120               │ 5            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-131          │ Leptospermum formado PIRAMIDE                               │ Ornamentales │ 80-100      │ Viveros EL OASIS          │                                                              │ 50                │ 18           │ 14               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-132          │ Leptospermum COPA                                           │ Ornamentales │ 110/120     │ Viveros EL OASIS          │                                                              │ 50                │ 18           │ 14               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-133          │ Nerium oleander-CALIDAD \"GARDEN\"                          │ Ornamentales │ 40-45       │ Viveros EL OASIS          │                                                              │ 50                │ 2            │ 1                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-134          │ Nerium Oleander Arbusto GRANDE                              │ Ornamentales │ 160-200     │ Viveros EL OASIS          │                                                              │ 100               │ 38           │ 30               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-135          │ Nerium oleander COPA  Calibre 6/8                           │ Ornamentales │ 50-60       │ Viveros EL OASIS          │                                                              │ 100               │ 5            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-137          │ ROSAL TREPADOR                                              │ Ornamentales │             │ Viveros EL OASIS          │                                                              │ 100               │ 4            │ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-138          │ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │ Ornamentales │             │ Viveros EL OASIS          │                                                              │ 100               │ 4            │ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-142          │ Solanum Jazminoide                                          │ Ornamentales │ 150-160     │ Viveros EL OASIS          │                                                              │ 100               │ 2            │ 1                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-143          │ Wisteria Sinensis  azul, rosa, blanca                       │ Ornamentales │             │ Viveros EL OASIS          │                                                              │ 100               │ 9            │ 7                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-144          │ Wisteria Sinensis INJERTADAS DECÃ“                          │ Ornamentales │ 140-150     │ Viveros EL OASIS          │                                                              │ 100               │ 12           │ 9                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-145          │ Bougamvillea Sanderiana Tutor                               │ Ornamentales │ 80-100      │ Viveros EL OASIS          │                                                              │ 100               │ 2            │ 1                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-148          │ Bougamvillea Sanderiana Espaldera                           │ Ornamentales │ 45-50       │ Viveros EL OASIS          │                                                              │ 100               │ 7            │ 5                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-149          │ Bougamvillea Sanderiana Espaldera                           │ Ornamentales │ 140-150     │ Viveros EL OASIS          │                                                              │ 100               │ 17           │ 13               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-151          │ Bougamvillea Sanderiana, 3 tut. piramide                    │ Ornamentales │             │ Viveros EL OASIS          │                                                              │ 100               │ 6            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-153          │ Expositor Árboles clima mediterráneo                        │ Ornamentales │ 170-200     │ Viveros EL OASIS          │                                                              │ 100               │ 6            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-154          │ Expositor Árboles borde del mar                             │ Ornamentales │ 170-200     │ Viveros EL OASIS          │                                                              │ 100               │ 6            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-158          │ Brachychiton Acerifolius                                    │ Ornamentales │ 200-225     │ Viveros EL OASIS          │                                                              │ 100               │ 6            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-161          │ Cassia Corimbosa                                            │ Ornamentales │ 200-225     │ Viveros EL OASIS          │                                                              │ 100               │ 6            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-162          │ Cassia Corimbosa                                            │ Ornamentales │ 200-225     │ Viveros EL OASIS          │                                                              │ 100               │ 10           │ 8                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-163          │ Chitalpa Summer Bells                                       │ Ornamentales │ 200-225     │ Viveros EL OASIS          │                                                              │ 80                │ 10           │ 8                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-164          │ Erytrina Kafra                                              │ Ornamentales │ 170-180     │ Viveros EL OASIS          │                                                              │ 80                │ 6            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-166          │ Eucalyptus Citriodora                                       │ Ornamentales │ 170-200     │ Viveros EL OASIS          │                                                              │ 80                │ 6            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-167          │ Eucalyptus Ficifolia                                        │ Ornamentales │ 170-200     │ Viveros EL OASIS          │                                                              │ 80                │ 6            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-169          │ Hibiscus Syriacus  Var. Injertadas 1 Tallo                  │ Ornamentales │ 170-200     │ Viveros EL OASIS          │                                                              │ 80                │ 12           │ 9                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-170          │ Lagunaria Patersonii                                        │ Ornamentales │ 140-150     │ Viveros EL OASIS          │                                                              │ 80                │ 6            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-171          │ Lagunaria Patersonii                                        │ Ornamentales │ 200-225     │ Viveros EL OASIS          │                                                              │ 80                │ 10           │ 8                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-173          │ Morus Alba                                                  │ Ornamentales │ 200-225     │ Viveros EL OASIS          │                                                              │ 80                │ 6            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-175          │ Platanus Acerifolia                                         │ Ornamentales │ 200-225     │ Viveros EL OASIS          │                                                              │ 80                │ 10           │ 8                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-178          │ Salix Babylonica  Pendula                                   │ Ornamentales │ 170-200     │ Viveros EL OASIS          │                                                              │ 80                │ 6            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-180          │ Tamarix  Ramosissima Pink Cascade                           │ Ornamentales │ 170-200     │ Viveros EL OASIS          │                                                              │ 80                │ 6            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-182          │ Tecoma Stands                                               │ Ornamentales │ 200-225     │ Viveros EL OASIS          │                                                              │ 80                │ 6            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-183          │ Tecoma Stands                                               │ Ornamentales │ 200-225     │ Viveros EL OASIS          │                                                              │ 80                │ 10           │ 8                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-184          │ Tipuana Tipu                                                │ Ornamentales │ 170-200     │ Viveros EL OASIS          │                                                              │ 80                │ 6            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-185          │ Pleioblastus distichus-Bambú enano                          │ Ornamentales │ 15-20       │ Viveros EL OASIS          │                                                              │ 80                │ 6            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-187          │ Sasa palmata                                                │ Ornamentales │ 40-45       │ Viveros EL OASIS          │                                                              │ 80                │ 10           │ 8                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-189          │ Phylostachys aurea                                          │ Ornamentales │ 180-200     │ Viveros EL OASIS          │                                                              │ 80                │ 22           │ 17               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-190          │ Phylostachys aurea                                          │ Ornamentales │ 250-300     │ Viveros EL OASIS          │                                                              │ 80                │ 32           │ 25               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-191          │ Phylostachys Bambusa Spectabilis                            │ Ornamentales │ 180-200     │ Viveros EL OASIS          │                                                              │ 80                │ 24           │ 19               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-192          │ Phylostachys biseti                                         │ Ornamentales │ 160-170     │ Viveros EL OASIS          │                                                              │ 80                │ 22           │ 17               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-194          │ Pseudosasa japonica (Metake)                                │ Ornamentales │ 225-250     │ Viveros EL OASIS          │                                                              │ 80                │ 20           │ 16               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-195          │ Pseudosasa japonica (Metake)                                │ Ornamentales │ 30-40       │ Viveros EL OASIS          │                                                              │ 80                │ 6            │ 4                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-197          │ Cedrus Deodara \"Feeling Blue\" Novedad                     │ Ornamentales │ rastrero    │ Viveros EL OASIS          │                                                              │ 80                │ 12           │ 9                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-198          │ Juniperus chinensis \"Blue Alps\"                           │ Ornamentales │ 20-30       │ Viveros EL OASIS          │                                                              │ 80                │ 4            │ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-199          │ Juniperus Chinensis Stricta                                 │ Ornamentales │ 20-30       │ Viveros EL OASIS          │                                                              │ 80                │ 4            │ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-201          │ Juniperus squamata \"Blue Star\"                            │ Ornamentales │ 20-30       │ Viveros EL OASIS          │                                                              │ 80                │ 4            │ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-202          │ Juniperus x media Phitzeriana verde                         │ Ornamentales │ 20-30       │ Viveros EL OASIS          │                                                              │ 80                │ 4            │ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-212          │ Bismarckia Nobilis                                          │ Ornamentales │ 200 - 220   │ Viveros EL OASIS          │                                                              │ 4                 │ 217          │ 173              │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-215          │ Brahea Armata                                               │ Ornamentales │ 120 - 140   │ Viveros EL OASIS          │                                                              │ 100               │ 112          │ 89               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-216          │ Brahea Edulis                                               │ Ornamentales │ 80 - 100    │ Viveros EL OASIS          │                                                              │ 100               │ 19           │ 15               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-219          │ Butia Capitata                                              │ Ornamentales │ 90 - 110    │ Viveros EL OASIS          │                                                              │ 100               │ 29           │ 23               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-220          │ Butia Capitata                                              │ Ornamentales │ 90 - 120    │ Viveros EL OASIS          │                                                              │ 100               │ 36           │ 28               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-221          │ Butia Capitata                                              │ Ornamentales │ 85 - 105    │ Viveros EL OASIS          │                                                              │ 100               │ 59           │ 47               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-223          │ Chamaerops Humilis                                          │ Ornamentales │ 40 - 45     │ Viveros EL OASIS          │                                                              │ 100               │ 4            │ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-224          │ Chamaerops Humilis                                          │ Ornamentales │ 50 - 60     │ Viveros EL OASIS          │                                                              │ 100               │ 7            │ 5                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-228          │ Chamaerops Humilis \"Cerifera\"                             │ Ornamentales │ 70 - 80     │ Viveros EL OASIS          │                                                              │ 100               │ 32           │ 25               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-229          │ Chrysalidocarpus Lutescens -ARECA                           │ Ornamentales │ 130 - 150   │ Viveros EL OASIS          │                                                              │ 100               │ 22           │ 17               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-230          │ Cordyline Australis -DRACAENA                               │ Ornamentales │ 190 - 210   │ Viveros EL OASIS          │                                                              │ 100               │ 38           │ 30               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-231          │ Cycas Revoluta                                              │ Ornamentales │ 55 - 65     │ Viveros EL OASIS          │                                                              │ 100               │ 15           │ 12               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-232          │ Cycas Revoluta                                              │ Ornamentales │ 80 - 90     │ Viveros EL OASIS          │                                                              │ 100               │ 34           │ 27               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-233          │ Dracaena Drago                                              │ Ornamentales │ 60 - 70     │ Viveros EL OASIS          │                                                              │ 1                 │ 13           │ 10               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-235          │ Dracaena Drago                                              │ Ornamentales │ 150 - 175   │ Viveros EL OASIS          │                                                              │ 2                 │ 92           │ 73               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-238          │ Livistonia Decipiens                                        │ Ornamentales │ 90 - 110    │ Viveros EL OASIS          │                                                              │ 50                │ 19           │ 15               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-239          │ Livistonia Decipiens                                        │ Ornamentales │ 180 - 200   │ Viveros EL OASIS          │                                                              │ 50                │ 49           │ 39               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-242          │ Rhaphis Excelsa                                             │ Ornamentales │ 80 - 100    │ Viveros EL OASIS          │                                                              │ 50                │ 21           │ 16               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-244          │ Sabal Minor                                                 │ Ornamentales │ 60 - 75     │ Viveros EL OASIS          │                                                              │ 50                │ 11           │ 8                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-245          │ Sabal Minor                                                 │ Ornamentales │ 120 - 140   │ Viveros EL OASIS          │                                                              │ 50                │ 34           │ 27               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-246          │ Trachycarpus Fortunei                                       │ Ornamentales │ 90 - 105    │ Viveros EL OASIS          │                                                              │ 50                │ 18           │ 14               │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-248          │ Washingtonia Robusta                                        │ Ornamentales │ 60 - 70     │ Viveros EL OASIS          │                                                              │ 15                │ 3            │ 2                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-251          │ Zamia Furfuracaea                                           │ Ornamentales │ 90 - 110    │ Viveros EL OASIS          │                                                              │ 15                │ 168          │ 134              │
└─────────────────┴─────────────────────────────────────────────────────────────┴──────────────┴─────────────┴───────────────────────────┴──────────────────────────────────────────────────────────────┴───────────────────┴──────────────┴──────────────────┘
**/

--Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.

select distinct p.nombre, p.descripcion, gp.imagen from producto as p 
join detalle_pedido as dp on p.codigo_producto=dp.codigo_producto left join gama_producto as gp on p.gama=gp.gama;

/**
┌─────────────────────────────────────────────────────────────┬──────────────────────────────────────────────────────────────┬────────┐
│                           nombre                            │                         descripcion                          │ imagen │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Cerezo                                                      │ Las principales especies de cerezo cultivadas en el mundo so │        │
│                                                             │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │        │
│                                                             │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │        │
│                                                             │  son naturales del sureste de Europa y oeste de Asia. El cer │        │
│                                                             │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │        │
│                                                             │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │        │
│                                                             │ evado por los pájaros y las migraciones humanas. Fue uno de  │        │
│                                                             │ los frutales más apreciados por los griegos y con el Imperio │        │
│                                                             │  Romano se extendió a regiones muy diversas. En la actualida │        │
│                                                             │ d, el cerezo se encuentra difundido por numerosas regiones y │        │
│                                                             │  países del mundo con clima templado                         │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Camelia japonica                                            │ Arbusto excepcional por su floración otoñal, invernal o prim │        │
│                                                             │ averal. Flores: Las flores son solitarias, aparecen en el áp │        │
│                                                             │ ice de cada rama, y son con una corola simple o doble, y com │        │
│                                                             │ prendiendo varios colores. Suelen medir unos 7-12 cm de diÃ  │        │
│                                                             │ metro y tienen 5 sépalos y 5 pétalos. Estambres numerosos un │        │
│                                                             │ idos en la mitad o en 2/3 de su longitud.                    │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Pitimini rojo                                               │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Phoenix Canariensis                                         │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Mimosa DEALBATA Gaulois Astier                              │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │        │
│                                                             │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │        │
│                                                             │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │        │
│                                                             │ a). Arbol de follaje persistente muy usado en parques por su │        │
│                                                             │  atractiva floración amarilla hacia fines del invierno. Altu │        │
│                                                             │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │        │
│                                                             │ je perenne de tonos plateados, muy ornamental. Sus hojas son │        │
│                                                             │  de textura fina, de color verde y sus flores amarillas que  │        │
│                                                             │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │        │
│                                                             │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │        │
│                                                             │ mente curvada, con los bordes algo constreñidos entre las se │        │
│                                                             │ millas, que se disponen en el fruto longitudinalmente...     │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Naranjo calibre 8/10                                        │ El naranjo es un árbol pequeño, que no supera los 3-5 metros │        │
│                                                             │  de altura, con una copa compacta, cónica, transformada en e │        │
│                                                             │ sérica gracias a la poda. Su tronco es de color gris y liso, │        │
│                                                             │  y las hojas son perennes, coriáceas, de un verde intenso y  │        │
│                                                             │ brillante, con forma oval o elíptico-lanceolada. Poseen, en  │        │
│                                                             │ el caso del naranjo amargo, un típico peciolo alado en forma │        │
│                                                             │  de Â‘corazónÂ’, que en el naranjo dulce es más estrecho y m │        │
│                                                             │ enos patente.                                                │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Manzano Starking Delicious                                  │ alcanza como máximo 10 m. de altura y tiene una copa globosa │        │
│                                                             │ . Tronco derecho que normalmente alcanza de 2 a 2,5 m. de al │        │
│                                                             │ tura, con corteza cubierta de lenticelas, lisa, adherida, de │        │
│                                                             │  color ceniciento verdoso sobre los ramos y escamosa y gris  │        │
│                                                             │ parda sobre las partes viejas del árbol. Tiene una vida de u │        │
│                                                             │ nos 60-80 años. Las ramas se insertan en ángulo abierto sobr │        │
│                                                             │ e el tallo, de color verde oscuro, a veces tendiendo a negru │        │
│                                                             │ zco o violáceo. Los brotes jóvenes terminan con frecuencia e │        │
│                                                             │ n una espina                                                 │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Brachychiton Discolor                                       │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Chamaerops Humilis                                          │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Trachycarpus Fortunei                                       │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Nogal Común                                                 │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Lonicera Pileata                                            │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Philadelphus \"Virginal\"                                   │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Bismarckia Nobilis                                          │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Brahea Edulis                                               │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Butia Capitata                                              │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Ciruelo Santa Rosa                                          │ árbol de tamaño mediano que alcanza una altura máxima de 5-6 │        │
│                                                             │  m. Tronco de corteza pardo-azulada, brillante, lisa o agrie │        │
│                                                             │ tada longitudinalmente. Produce ramas alternas, pequeñas, de │        │
│                                                             │ lgadas, unas veces lisas, glabras y otras pubescentes y vell │        │
│                                                             │ osas                                                         │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Ciruelo Reina C. De Ollins                                  │ árbol de tamaño mediano que alcanza una altura máxima de 5-6 │        │
│                                                             │  m. Tronco de corteza pardo-azulada, brillante, lisa o agrie │        │
│                                                             │ tada longitudinalmente. Produce ramas alternas, pequeñas, de │        │
│                                                             │ lgadas, unas veces lisas, glabras y otras pubescentes y vell │        │
│                                                             │ osas                                                         │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Expositor Árboles clima continental                         │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Acer Negundo                                                │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Acer platanoides                                            │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Acer Pseudoplatanus                                         │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Peral                                                       │ Árbol piramidal, redondeado en su juventud, luego oval, que  │        │
│                                                             │ llega hasta 20 metros de altura y por término medio vive 65  │        │
│                                                             │ años.Tronco alto, grueso, de corteza agrietada, gris, de la  │        │
│                                                             │ cual se destacan con frecuencia placas lenticulares.Las rama │        │
│                                                             │ s se insertan formando ángulo agudo con el tronco (45º), de  │        │
│                                                             │ corteza lisa, primero verde y luego gris-violácea, con numer │        │
│                                                             │ osas lenticelas.                                             │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Limonero 30/40                                              │ El limonero, pertenece al grupo de los cítricos, teniendo su │        │
│                                                             │  origen hace unos 20 millones de años en el sudeste asiático │        │
│                                                             │ . Fue introducido por los árabes en el área mediterránea ent │        │
│                                                             │ re los años 1.000 a 1.200, habiendo experimentando numerosas │        │
│                                                             │  modificaciones debidas tanto a la selección natural mediant │        │
│                                                             │ e hibridaciones espontáneas como a las producidas por el     │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Ajedrea                                                     │ Planta aromática que fresca se utiliza para condimentar carn │        │
│                                                             │ es y ensaladas, y seca, para pastas, sopas y guisantes       │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Thymus Citriodra (Tomillo limón)                            │ Nombre común o vulgar: Tomillo, Tremoncillo Familia: Labiata │        │
│                                                             │ e (Labiadas).Origen: Región mediterránea.Arbustillo bajo, de │        │
│                                                             │  15 a 40 cm de altura. Las hojas son muy pequeñas, de unos 6 │        │
│                                                             │  mm de longitud; según la variedad pueden ser verdes, verdes │        │
│                                                             │  grisáceas, amarillas, o jaspeadas. Las flores aparecen de m │        │
│                                                             │ ediados de primavera hasta bien entrada la época estival y s │        │
│                                                             │ e presentan en racimos terminales que habitualmente son de c │        │
│                                                             │ olor violeta o púrpura aunque también pueden ser blancas. Es │        │
│                                                             │ ta planta despide un intenso y típico aroma, que se incremen │        │
│                                                             │ ta con el roce. El tomillo resulta de gran belleza cuando es │        │
│                                                             │ tá en flor. El tomillo atrae a avispas y abejas. En jardiner │        │
│                                                             │ ía se usa como manchas, para hacer borduras, para aromatizar │        │
│                                                             │  el ambiente, llenar huecos, cubrir rocas, para jardines en  │        │
│                                                             │ miniatura, etc. Arranque las flores y hojas secas del tallo  │        │
│                                                             │ y añadálos a un popurri, introdúzcalos en saquitos de hierba │        │
│                                                             │ s o en la almohada.También puede usar las ramas secas con fl │        │
│                                                             │ ores para añadir aroma y textura a cestos abiertos.          │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Higuera                                                     │ La higuera (Ficus carica L.) es un árbol típico de secano en │        │
│                                                             │  los países mediterráneos. Su rusticidad y su fácil multipli │        │
│                                                             │ cación hacen de la higuera un frutal muy apropiado para el c │        │
│                                                             │ ultivo extensivo.. Siempre ha sido considerado como árbol qu │        │
│                                                             │ e no requiere cuidado alguno una vez plantado y arraigado, l │        │
│                                                             │ imitándose el hombre a recoger de él los frutos cuando madur │        │
│                                                             │ an, unos para consumo en fresco y otros para conserva. Las ú │        │
│                                                             │ nicas higueras con cuidados culturales esmerados, en muchas  │        │
│                                                             │ comarcas, son las brevales, por el interés económico de su p │        │
│                                                             │ rimera cosecha, la de brevas.                                │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Níspero                                                     │ Aunque originario del Sudeste de China, el níspero llegó a E │        │
│                                                             │ uropa procedente de Japón en el siglo XVIII como árbol ornam │        │
│                                                             │ ental. En el siglo XIX se inició el consumo de los frutos en │        │
│                                                             │  toda el área mediterránea, donde se adaptó muy bien a las z │        │
│                                                             │ onas de cultivo de los cítricos.El cultivo intensivo comenzó │        │
│                                                             │  a desarrollarse a finales de los años 60 y principios de lo │        │
│                                                             │ s 70, cuando comenzaron a implantarse las variedades y técni │        │
│                                                             │ cas de cultivo actualmente utilizadas.                       │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Dracaena Drago                                              │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Petrosilium Hortense (Peregil)                              │ Nombre científico o latino: Petroselinum hortense, Petroseli │        │
│                                                             │ num crispum. Nombre común o vulgar: Perejil, Perejil rizado  │        │
│                                                             │ Familia: Umbelliferae (Umbelíferas). Origen: el origen del p │        │
│                                                             │ erejil se encuentra en el Mediterraneo. Esta naturalizada en │        │
│                                                             │  casi toda Europa. Se utiliza como condimento y para adorno, │        │
│                                                             │  pero también en ensaladas. Se suele regalar en las frutería │        │
│                                                             │ s y verdulerías.El perejil lo hay de 2 tipos: de hojas plana │        │
│                                                             │ s y de hojas rizadas.                                        │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Thymus Vulgaris                                             │ Nombre común o vulgar: Tomillo, Tremoncillo Familia: Labiata │        │
│                                                             │ e (Labiadas). Origen: Región mediterránea. Arbustillo bajo,  │        │
│                                                             │ de 15 a 40 cm de altura. Las hojas son muy pequeñas, de unos │        │
│                                                             │  6 mm de longitud; según la variedad pueden ser verdes, verd │        │
│                                                             │ es grisáceas, amarillas, o jaspeadas. Las flores aparecen de │        │
│                                                             │  mediados de primavera hasta bien entrada la época estival y │        │
│                                                             │  se presentan en racimos terminales que habitualmente son de │        │
│                                                             │  color violeta o púrpura aunque también pueden ser blancas.  │        │
│                                                             │ Esta planta despide un intenso y típico aroma, que se increm │        │
│                                                             │ enta con el roce. El tomillo resulta de gran belleza cuando  │        │
│                                                             │ está en flor. El tomillo atrae a avispas y abejas.\r\n En ja │        │
│                                                             │ rdinería se usa como manchas, para hacer borduras, para arom │        │
│                                                             │ atizar el ambiente, llenar huecos, cubrir rocas, para jardin │        │
│                                                             │ es en miniatura, etc. Arranque las flores y hojas secas del  │        │
│                                                             │ tallo y añadálos a un popurri, introdúzcalos en saquitos de  │        │
│                                                             │ hierbas o en la almohada. También puede usar las ramas secas │        │
│                                                             │  con flores para añadir aroma y textura a cestos abiertos.   │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Sierra de Poda 400MM                                        │ Gracias a la poda se consigue manipular un poco la naturalez │        │
│                                                             │ a, dándole la forma que más nos guste. Este trabajo básico d │        │
│                                                             │ e jardinería también facilita que las plantas crezcan de un  │        │
│                                                             │ modo más equilibrado, y que las flores y los frutos vuelvan  │        │
│                                                             │ cada año con regularidad. Lo mejor es dar forma cuando los e │        │
│                                                             │ jemplares son jóvenes, de modo que exijan pocos cuidados cua │        │
│                                                             │ ndo sean adultos. Además de saber cuándo y cómo hay que poda │        │
│                                                             │ r, tener unas herramientas adecuadas para esta labor es tamb │        │
│                                                             │ ién de vital importancia.                                    │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Pala                                                        │ Palas de acero con cresta de corte en la punta para cortar b │        │
│                                                             │ ien el terreno. Buena penetración en tierras muy compactas.  │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Nectarina                                                   │ Se trata de un árbol derivado por mutación de los melocotone │        │
│                                                             │ ros comunes, y los únicos caracteres diferenciales son la au │        │
│                                                             │ sencia de tomentosidad en la piel del fruto. La planta, si s │        │
│                                                             │ e deja crecer libremente, adopta un porte globoso con unas d │        │
│                                                             │ imensiones medias de 4-6 metros                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Kunquat  EXTRA con FRUTA                                    │ su nombre científico se origina en honor a un hoticultor esc │        │
│                                                             │ océs que recolectó especímenes en China, (\"Fortunella\"), R │        │
│                                                             │ obert Fortune (1812-1880), y \"margarita\", del latín margar │        │
│                                                             │ itus-a-um = perla, en alusión a sus pequeños y brillantes fr │        │
│                                                             │ utos. Se trata de un arbusto o árbol pequeño de 2-3 m de alt │        │
│                                                             │ ura, inerme o con escasas espinas.Hojas lanceoladas de 4-8 ( │        │
│                                                             │ -15) cm de longitud, con el ápice redondeado y la base cunea │        │
│                                                             │ da.Tienen el margen crenulado en su mitad superior, el haz v │        │
│                                                             │ erde brillante y el envés más pálido.Pecíolo ligeramente mar │        │
│                                                             │ ginado.Flores perfumadas solitarias o agrupadas en infloresc │        │
│                                                             │ encias axilares, blancas.El fruto es lo más característico,  │        │
│                                                             │ es el más pequeño de todos los cítricos y el único cuya cásc │        │
│                                                             │ ara se puede comer.Frutos pequeños, con semillas, de corteza │        │
│                                                             │  fina, dulce, aromática y comestible, y de pulpa naranja ama │        │
│                                                             │ rillenta y ligeramente ácida.Sus frutos son muy pequeños y t │        │
│                                                             │ ienen un carácter principalmente ornamental.                 │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Kaki                                                        │ De crecimiento algo lento los primeros años, llega a alcanza │        │
│                                                             │ r hasta doce metros de altura o más, aunque en cultivo se pr │        │
│                                                             │ efiere algo más bajo (5-6). Tronco corto y copa extendida. R │        │
│                                                             │ amifica muy poco debido a la dominancia apical. Porte más o  │        │
│                                                             │ menos piramidal, aunque con la edad se hace más globoso.     │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Expositor Mimosa Semilla Mix                                │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │        │
│                                                             │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │        │
│                                                             │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │        │
│                                                             │ a). Arbol de follaje persistente muy usado en parques por su │        │
│                                                             │  atractiva floración amarilla hacia fines del invierno. Altu │        │
│                                                             │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │        │
│                                                             │ je perenne de tonos plateados, muy ornamental. Sus hojas son │        │
│                                                             │  de textura fina, de color verde y sus flores amarillas que  │        │
│                                                             │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │        │
│                                                             │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │        │
│                                                             │ mente curvada, con los bordes algo constreñidos entre las se │        │
│                                                             │ millas, que se disponen en el fruto longitudinalmente...     │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Pinus Canariensis                                           │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Azadón                                                      │ Longitud:24cm. Herramienta fabricada en acero y pintura epox │        │
│                                                             │ i,alargando su durabilidad y preveniendo la corrosión.Diseño │        │
│                                                             │  pensado para el ahorro de trabajo.                          │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Granado Mollar de Elche                                     │ pequeño árbol caducifolio, a veces con porte arbustivo, de 3 │        │
│                                                             │  a 6 m de altura, con el tronco retorcido. Madera dura y cor │        │
│                                                             │ teza escamosa de color grisáceo. Las ramitas jóvenes son más │        │
│                                                             │  o menos cuadrangulares o angostas y de cuatro alas, posteri │        │
│                                                             │ ormente se vuelven redondas con corteza de color café grisác │        │
│                                                             │ eo, la mayoría de las ramas, pero especialmente las pequeñas │        │
│                                                             │  ramitas axilares, son en forma de espina o terminan en una  │        │
│                                                             │ espina aguda; la copa es extendida.                          │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Rastrillo de Jardín                                         │ Fabuloso rastillo que le ayudará a eliminar piedras, hojas,  │        │
│                                                             │ ramas y otros elementos incómodos en su jardín.              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Higuera Napolitana                                          │ La higuera (Ficus carica L.) es un árbol típico de secano en │        │
│                                                             │  los países mediterráneos. Su rusticidad y su fácil multipli │        │
│                                                             │ cación hacen de la higuera un frutal muy apropiado para el c │        │
│                                                             │ ultivo extensivo.. Siempre ha sido considerado como árbol qu │        │
│                                                             │ e no requiere cuidado alguno una vez plantado y arraigado, l │        │
│                                                             │ imitándose el hombre a recoger de él los frutos cuando madur │        │
│                                                             │ an, unos para consumo en fresco y otros para conserva. Las ú │        │
│                                                             │ nicas higueras con cuidados culturales esmerados, en muchas  │        │
│                                                             │ comarcas, son las brevales, por el interés económico de su p │        │
│                                                             │ rimera cosecha, la de brevas.                                │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Nerium oleander ARBOL Calibre 8/10                          │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Rosal copa                                                  │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Granado                                                     │ pequeño árbol caducifolio, a veces con porte arbustivo, de 3 │        │
│                                                             │  a 6 m de altura, con el tronco retorcido. Madera dura y cor │        │
│                                                             │ teza escamosa de color grisáceo. Las ramitas jóvenes son más │        │
│                                                             │  o menos cuadrangulares o angostas y de cuatro alas, posteri │        │
│                                                             │ ormente se vuelven redondas con corteza de color café grisác │        │
│                                                             │ eo, la mayoría de las ramas, pero especialmente las pequeñas │        │
│                                                             │  ramitas axilares, son en forma de espina o terminan en una  │        │
│                                                             │ espina aguda; la copa es extendida.                          │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Tuja orientalis \"Aurea nana\"                              │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ ROSAL TREPADOR                                              │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Peral Blanq. de Aranjuez                                    │ Árbol piramidal, redondeado en su juventud, luego oval, que  │        │
│                                                             │ llega hasta 20 metros de altura y por término medio vive 65  │        │
│                                                             │ años.Tronco alto, grueso, de corteza agrietada, gris, de la  │        │
│                                                             │ cual se destacan con frecuencia placas lenticulares.Las rama │        │
│                                                             │ s se insertan formando ángulo agudo con el tronco (45º), de  │        │
│                                                             │ corteza lisa, primero verde y luego gris-violácea, con numer │        │
│                                                             │ osas lenticelas.                                             │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Lavándula Dentata                                           │ Espliego de jardín, Alhucema rizada, Alhucema dentada, Cantu │        │
│                                                             │ eso rizado. Familia: Lamiaceae.Origen: España y Portugal. Ma │        │
│                                                             │ ta de unos 60 cm de alto. Las hojas son aromáticas, dentadas │        │
│                                                             │  y de color verde grisáceas.  Produce compactas espigas de f │        │
│                                                             │ lores pequeñas, ligeramente aromáticas, tubulares,de color a │        │
│                                                             │ zulado y con brácteas púrpuras.  Frutos: nuececillas alargad │        │
│                                                             │ as encerradas en el tubo del cáliz.  Se utiliza en jardineri │        │
│                                                             │ a y no en perfumeria como otros cantuesos, espliegos y lavan │        │
│                                                             │ das.  Tiene propiedades aromatizantes y calmantes. Adecuadas │        │
│                                                             │  para la formación de setos bajos. Se dice que su aroma ahuy │        │
│                                                             │ enta pulgones y otros insectos perjudiciales para las planta │        │
│                                                             │ s vecinas.                                                   │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Washingtonia Robusta                                        │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Expositor Cítricos Mix                                      │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Limonero calibre 8/10                                       │ El limonero, pertenece al grupo de los cítricos, teniendo su │        │
│                                                             │  origen hace unos 20 millones de años en el sudeste asiático │        │
│                                                             │ . Fue introducido por los árabes en el área mediterránea ent │        │
│                                                             │ re los años 1.000 a 1.200, habiendo experimentando numerosas │        │
│                                                             │  modificaciones debidas tanto a la selección natural mediant │        │
│                                                             │ e hibridaciones espontáneas como a las producidas por el     │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Melocotonero                                                │ Árbol caducifolio de porte bajo con corteza lisa, de color c │        │
│                                                             │ eniciento. Sus hojas son alargadas con el margen ligeramente │        │
│                                                             │  aserrado, de color verde brillante, algo más claras por el  │        │
│                                                             │ envés. El melocotonero está muy arraigado en la cultura asiá │        │
│                                                             │ tica.\r\nEn Japón, el noble heroe Momotaro, una especie de C │        │
│                                                             │ id japonés, nació del interior de un enorme melocotón que fl │        │
│                                                             │ otaba río abajo.\r\nEn China se piensa que comer melocotón c │        │
│                                                             │ onfiere longevidad al ser humano, ya que formaba parte de la │        │
│                                                             │  dieta de sus dioses inmortales.                             │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Calamondin Copa                                             │ Se trata de un pequeño arbolito de copa densa, con tendencia │        │
│                                                             │  a la verticalidad, inerme o con cortas espinas. Sus hojas s │        │
│                                                             │ on pequeñas, elípticas de 5-10 cm de longitud, con los pecío │        │
│                                                             │ los estrechamente alados.Posee 1 o 2 flores en situación axi │        │
│                                                             │ lar, al final de las ramillas.Sus frutos son muy pequeños (3 │        │
│                                                             │ -3,5 cm de diámetro), con pocas semillas, esféricos u ovales │        │
│                                                             │ , con la zona apical aplanada; corteza de color naranja-roji │        │
│                                                             │ zo, muy fina y fácilmente separable de la pulpa, que es dulc │        │
│                                                             │ e, ácida y comestible..                                      │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Sasa palmata                                                │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Mimosa Semilla Bayleyana                                    │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │        │
│                                                             │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │        │
│                                                             │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │        │
│                                                             │ a). Arbol de follaje persistente muy usado en parques por su │        │
│                                                             │  atractiva floración amarilla hacia fines del invierno. Altu │        │
│                                                             │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │        │
│                                                             │ je perenne de tonos plateados, muy ornamental. Sus hojas son │        │
│                                                             │  de textura fina, de color verde y sus flores amarillas que  │        │
│                                                             │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │        │
│                                                             │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │        │
│                                                             │ mente curvada, con los bordes algo constreñidos entre las se │        │
│                                                             │ millas, que se disponen en el fruto longitudinalmente...     │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Camelia japonica ejemplar                                   │ Arbusto excepcional por su floración otoñal, invernal o prim │        │
│                                                             │ averal. Flores: Las flores son solitarias, aparecen en el áp │        │
│                                                             │ ice de cada rama, y son con una corola simple o doble, y com │        │
│                                                             │ prendiendo varios colores. Suelen medir unos 7-12 cm de diÃ  │        │
│                                                             │ metro y tienen 5 sépalos y 5 pétalos. Estambres numerosos un │        │
│                                                             │ idos en la mitad o en 2/3 de su longitud.                    │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Brachychiton Rupestris                                      │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Melissa                                                     │ Es una planta perenne (dura varios años) conocida por el agr │        │
│                                                             │ adable y característico olor a limón que desprenden en veran │        │
│                                                             │ o. Nunca debe faltar en la huerta o jardín por su agradable  │        │
│                                                             │ aroma y por los variados usos que tiene: planta olorosa, con │        │
│                                                             │ dimentaria y medicinal. Su cultivo es muy fácil. Le va bien  │        │
│                                                             │ un suelo ligero, con buen drenaje y riego sin exceso. A plen │        │
│                                                             │ o sol o por lo menos 5 horas de sol por día. Cada año, su ab │        │
│                                                             │ onado mineral correspondiente.En otoño, la melisa pierde el  │        │
│                                                             │ agradable olor a limón que desprende en verano sus flores az │        │
│                                                             │ ules y blancas. En este momento se debe cortar a unos 20 cm. │        │
│                                                             │  del suelo. Brotará de forma densa en primavera.             │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Kunquat                                                     │ su nombre científico se origina en honor a un hoticultor esc │        │
│                                                             │ océs que recolectó especímenes en China, (\"Fortunella\"), R │        │
│                                                             │ obert Fortune (1812-1880), y \"margarita\", del latín margar │        │
│                                                             │ itus-a-um = perla, en alusión a sus pequeños y brillantes fr │        │
│                                                             │ utos. Se trata de un arbusto o árbol pequeño de 2-3 m de alt │        │
│                                                             │ ura, inerme o con escasas espinas.Hojas lanceoladas de 4-8 ( │        │
│                                                             │ -15) cm de longitud, con el ápice redondeado y la base cunea │        │
│                                                             │ da.Tienen el margen crenulado en su mitad superior, el haz v │        │
│                                                             │ erde brillante y el envés más pálido.Pecíolo ligeramente mar │        │
│                                                             │ ginado.Flores perfumadas solitarias o agrupadas en infloresc │        │
│                                                             │ encias axilares, blancas.El fruto es lo más característico,  │        │
│                                                             │ es el más pequeño de todos los cítricos y el único cuya cásc │        │
│                                                             │ ara se puede comer.Frutos pequeños, con semillas, de corteza │        │
│                                                             │  fina, dulce, aromática y comestible, y de pulpa naranja ama │        │
│                                                             │ rillenta y ligeramente ácida.Sus frutos son muy pequeños y t │        │
│                                                             │ ienen un carácter principalmente ornamental.                 │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Ciruelo                                                     │ árbol de tamaño mediano que alcanza una altura máxima de 5-6 │        │
│                                                             │  m. Tronco de corteza pardo-azulada, brillante, lisa o agrie │        │
│                                                             │ tada longitudinalmente. Produce ramas alternas, pequeñas, de │        │
│                                                             │ lgadas, unas veces lisas, glabras y otras pubescentes y vell │        │
│                                                             │ osas                                                         │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Manzano                                                     │ alcanza como máximo 10 m. de altura y tiene una copa globosa │        │
│                                                             │ . Tronco derecho que normalmente alcanza de 2 a 2,5 m. de al │        │
│                                                             │ tura, con corteza cubierta de lenticelas, lisa, adherida, de │        │
│                                                             │  color ceniciento verdoso sobre los ramos y escamosa y gris  │        │
│                                                             │ parda sobre las partes viejas del árbol. Tiene una vida de u │        │
│                                                             │ nos 60-80 años. Las ramas se insertan en ángulo abierto sobr │        │
│                                                             │ e el tallo, de color verde oscuro, a veces tendiendo a negru │        │
│                                                             │ zco o violáceo. Los brotes jóvenes terminan con frecuencia e │        │
│                                                             │ n una espina                                                 │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Lonicera Nitida                                             │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Olea-Olivos                                                 │ Existen dos hipótesis sobre el origen del olivo, una que pos │        │
│                                                             │ tula que proviene de las costas de Siria, Líbano e Israel y  │        │
│                                                             │ otra que considera que lo considera originario de Asia menor │        │
│                                                             │ . La llegada a Europa probablemente tuvo lugar de mano de lo │        │
│                                                             │ s Fenicios, en transito por Chipre, Creta, e Islas del Mar E │        │
│                                                             │ geo, pasando a Grecia y más tarde a Italia. Los primeros ind │        │
│                                                             │ icios de la presencia del olivo en las costas mediterráneas  │        │
│                                                             │ españolas coinciden con el dominio romano, aunque fueron pos │        │
│                                                             │ teriormente los árabes los que impulsaron su cultivo en Anda │        │
│                                                             │ lucía, convirtiendo a España en el primer país productor de  │        │
│                                                             │ aceite de oliva a nivel mundial.                             │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Phylostachys biseti                                         │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Rosal bajo 1Âª -En maceta-inicio brotación                  │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Cerezo Napoleón                                             │ Las principales especies de cerezo cultivadas en el mundo so │        │
│                                                             │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │        │
│                                                             │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │        │
│                                                             │  son naturales del sureste de Europa y oeste de Asia. El cer │        │
│                                                             │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │        │
│                                                             │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │        │
│                                                             │ evado por los pájaros y las migraciones humanas. Fue uno de  │        │
│                                                             │ los frutales más apreciados por los griegos y con el Imperio │        │
│                                                             │  Romano se extendió a regiones muy diversas. En la actualida │        │
│                                                             │ d, el cerezo se encuentra difundido por numerosas regiones y │        │
│                                                             │  países del mundo con clima templado                         │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Brahea Armata                                               │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Naranjo 2 años injerto                                      │ El naranjo es un árbol pequeño, que no supera los 3-5 metros │        │
│                                                             │  de altura, con una copa compacta, cónica, transformada en e │        │
│                                                             │ sérica gracias a la poda. Su tronco es de color gris y liso, │        │
│                                                             │  y las hojas son perennes, coriáceas, de un verde intenso y  │        │
│                                                             │ brillante, con forma oval o elíptico-lanceolada. Poseen, en  │        │
│                                                             │ el caso del naranjo amargo, un típico peciolo alado en forma │        │
│                                                             │  de Â‘corazónÂ’, que en el naranjo dulce es más estrecho y m │        │
│                                                             │ enos patente.                                                │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Mandarino calibre 8/10                                      │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Lagunaria patersonii  calibre 8/10                          │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Morus Alba  calibre 8/10                                    │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Melocotonero Paraguayo                                      │ Árbol caducifolio de porte bajo con corteza lisa, de color c │        │
│                                                             │ eniciento. Sus hojas son alargadas con el margen ligeramente │        │
│                                                             │  aserrado, de color verde brillante, algo más claras por el  │        │
│                                                             │ envés. El melocotonero está muy arraigado en la cultura asiá │        │
│                                                             │ tica.\r\nEn Japón, el noble heroe Momotaro, una especie de C │        │
│                                                             │ id japonés, nació del interior de un enorme melocotón que fl │        │
│                                                             │ otaba río abajo.\r\nEn China se piensa que comer melocotón c │        │
│                                                             │ onfiere longevidad al ser humano, ya que formaba parte de la │        │
│                                                             │  dieta de sus dioses inmortales.                             │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Erytrina Kafra                                              │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Tamarix  Ramosissima Pink Cascade                           │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Bougamvillea Sanderiana Tutor                               │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Kaki Rojo Brillante                                         │ De crecimiento algo lento los primeros años, llega a alcanza │        │
│                                                             │ r hasta doce metros de altura o más, aunque en cultivo se pr │        │
│                                                             │ efiere algo más bajo (5-6). Tronco corto y copa extendida. R │        │
│                                                             │ amifica muy poco debido a la dominancia apical. Porte más o  │        │
│                                                             │ menos piramidal, aunque con la edad se hace más globoso.     │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Prunus pisardii                                             │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Mejorana                                                    │ Origanum majorana. No hay que confundirlo con el orégano. Su │        │
│                                                             │  sabor se parece más al tomillo, pero es más dulce y aromáti │        │
│                                                             │ co.Se usan las hojas frescas o secas, picadas, machacadas o  │        │
│                                                             │ en polvo, en sopas, rellenos, quiches y tartas, tortillas, p │        │
│                                                             │ latos con papas y, como aderezo, en ramilletes de hierbas.El │        │
│                                                             │  sabor delicado de la mejorana se elimina durante la cocción │        │
│                                                             │ , de manera que es mejor agregarla cuando el plato esté en s │        │
│                                                             │ u punto o en aquéllos que apenas necesitan cocción.          │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Mentha Sativa                                               │ ¿Quién no conoce la Hierbabuena? Se trata de una plantita mu │        │
│                                                             │ y aromática, agradable y cultivada extensamente por toda Esp │        │
│                                                             │ aña. Es hierba perenne (por tanto vive varios años, no es an │        │
│                                                             │ ual). Puedes cultivarla en maceta o plantarla en la tierra d │        │
│                                                             │ el jardín o en un rincón del huerto. Lo más importante es qu │        │
│                                                             │ e cuente con bastante agua. En primavera debes aportar ferti │        │
│                                                             │ lizantes minerales. Vive mejor en semisombra que a pleno sol │        │
│                                                             │ .Si ves orugas o los agujeros en hojas consecuencia de su at │        │
│                                                             │ aque, retíralas una a una a mano; no uses insecticidas quími │        │
│                                                             │ cos.                                                         │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Salvia Mix                                                  │ La Salvia es un pequeño arbusto que llega hasta el metro de  │        │
│                                                             │ alto.Tiene una vida breve, de unos pocos años.En el jardín,  │        │
│                                                             │ como otras aromáticas, queda muy bien en una rocalla o para  │        │
│                                                             │ hacer una bordura perfumada a cada lado de un camino de Salv │        │
│                                                             │ ia. Abona después de cada corte y recorta el arbusto una vez │        │
│                                                             │  pase la floración.                                          │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Santolina Chamaecyparys                                     │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Limonero 2 años injerto                                     │ El limonero, pertenece al grupo de los cítricos, teniendo su │        │
│                                                             │  origen hace unos 20 millones de años en el sudeste asiático │        │
│                                                             │ . Fue introducido por los árabes en el área mediterránea ent │        │
│                                                             │ re los años 1.000 a 1.200, habiendo experimentando numerosas │        │
│                                                             │  modificaciones debidas tanto a la selección natural mediant │        │
│                                                             │ e hibridaciones espontáneas como a las producidas por el hom │        │
│                                                             │ bre, en este caso buscando las necesidades del mercado.      │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Nogal                                                       │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Jubaea Chilensis                                            │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Livistonia Australis                                        │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Pinus Halepensis                                            │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Pinus Pinea -Pino Piñonero                                  │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Thuja Esmeralda                                             │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Archontophoenix Cunninghamiana                              │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Beucarnea Recurvata                                         │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Naranjo -Plantón joven 1 año injerto                        │ El naranjo es un árbol pequeño, que no supera los 3-5 metros │        │
│                                                             │  de altura, con una copa compacta, cónica, transformada en e │        │
│                                                             │ sérica gracias a la poda. Su tronco es de color gris y liso, │        │
│                                                             │  y las hojas son perennes, coriáceas, de un verde intenso y  │        │
│                                                             │ brillante, con forma oval o elíptico-lanceolada. Poseen, en  │        │
│                                                             │ el caso del naranjo amargo, un típico peciolo alado en forma │        │
│                                                             │  de Â‘corazónÂ’, que en el naranjo dulce es más estrecho y m │        │
│                                                             │ enos patente.                                                │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Hibiscus Syriacus  \"Diana\" -Blanco Puro                   │ Por su capacidad de soportar podas, pueden ser fácilmente mo │        │
│                                                             │ ldeadas como bonsái en el transcurso de pocos años. Flores d │        │
│                                                             │ e muchos colores según la variedad, desde el blanco puro al  │        │
│                                                             │ rojo intenso, del amarillo al anaranjado. La flor apenas dur │        │
│                                                             │ a 1 día, pero continuamente aparecen nuevas y la floración s │        │
│                                                             │ e prolonga durante todo el periodo de crecimiento vegetativo │        │
│                                                             │ .                                                            │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Eucalyptus Ficifolia                                        │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Forsytia Intermedia \"Lynwood\"                             │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Rhaphis Humilis                                             │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Callistemom COPA                                            │ Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y │        │
│                                                             │  colgantes (de ahí lo de \"llorón\")..                       │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Sesbania Punicea                                            │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Cedrus Deodara                                              │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Tuja Occidentalis Woodwardii                                │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Yucca Jewel                                                 │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Landora Amarillo, Rose Gaujard bicolor blanco-rojo          │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Robinia Pseudoacacia Casque Rouge                           │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Manzano Golden Delicious                                    │ alcanza como máximo 10 m. de altura y tiene una copa globosa │        │
│                                                             │ . Tronco derecho que normalmente alcanza de 2 a 2,5 m. de al │        │
│                                                             │ tura, con corteza cubierta de lenticelas, lisa, adherida, de │        │
│                                                             │  color ceniciento verdoso sobre los ramos y escamosa y gris  │        │
│                                                             │ parda sobre las partes viejas del árbol. Tiene una vida de u │        │
│                                                             │ nos 60-80 años. Las ramas se insertan en ángulo abierto sobr │        │
│                                                             │ e el tallo, de color verde oscuro, a veces tendiendo a negru │        │
│                                                             │ zco o violáceo. Los brotes jóvenes terminan con frecuencia e │        │
│                                                             │ n una espina                                                 │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Níspero Tanaca                                              │ Aunque originario del Sudeste de China, el níspero llegó a E │        │
│                                                             │ uropa procedente de Japón en el siglo XVIII como árbol ornam │        │
│                                                             │ ental. En el siglo XIX se inició el consumo de los frutos en │        │
│                                                             │  toda el área mediterránea, donde se adaptó muy bien a las z │        │
│                                                             │ onas de cultivo de los cítricos.El cultivo intensivo comenzó │        │
│                                                             │  a desarrollarse a finales de los años 60 y principios de lo │        │
│                                                             │ s 70, cuando comenzaron a implantarse las variedades y técni │        │
│                                                             │ cas de cultivo actualmente utilizadas.                       │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Albaricoquero                                               │ árbol que puede pasar de los 6 m de altura, en la región med │        │
│                                                             │ iterránea con ramas formando una copa redondeada. La corteza │        │
│                                                             │  del tronco es pardo-violácea, agrietada; las ramas son roji │        │
│                                                             │ zas y extendidas cuando jóvenes y las ramas secundarias son  │        │
│                                                             │ cortas, divergentes y escasas. Las yemas latentes son frecue │        │
│                                                             │ ntes especialmente sobre las ramas viejas.                   │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Membrillero Gigante de Wranja                               │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Mandarino 2 años injerto                                    │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Manzano Reineta                                             │ alcanza como máximo 10 m. de altura y tiene una copa globosa │        │
│                                                             │ . Tronco derecho que normalmente alcanza de 2 a 2,5 m. de al │        │
│                                                             │ tura, con corteza cubierta de lenticelas, lisa, adherida, de │        │
│                                                             │  color ceniciento verdoso sobre los ramos y escamosa y gris  │        │
│                                                             │ parda sobre las partes viejas del árbol. Tiene una vida de u │        │
│                                                             │ nos 60-80 años. Las ramas se insertan en ángulo abierto sobr │        │
│                                                             │ e el tallo, de color verde oscuro, a veces tendiendo a negru │        │
│                                                             │ zco o violáceo. Los brotes jóvenes terminan con frecuencia e │        │
│                                                             │ n una espina                                                 │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Ciruelo Friar                                               │ árbol de tamaño mediano que alcanza una altura máxima de 5-6 │        │
│                                                             │  m. Tronco de corteza pardo-azulada, brillante, lisa o agrie │        │
│                                                             │ tada longitudinalmente. Produce ramas alternas, pequeñas, de │        │
│                                                             │ lgadas, unas veces lisas, glabras y otras pubescentes y vell │        │
│                                                             │ osas                                                         │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Nectarina                                                   │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Limonero -Plantón joven                                     │ El limonero, pertenece al grupo de los cítricos, teniendo su │        │
│                                                             │  origen hace unos 20 millones de años en el sudeste asiático │        │
│                                                             │ . Fue introducido por los árabes en el área mediterránea ent │        │
│                                                             │ re los años 1.000 a 1.200, habiendo experimentando numerosas │        │
│                                                             │  modificaciones debidas tanto a la selección natural mediant │        │
│                                                             │ e hibridaciones espontáneas como a las producidas por el     │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Melocotonero Amarillo de Agosto                             │ Árbol caducifolio de porte bajo con corteza lisa, de color c │        │
│                                                             │ eniciento. Sus hojas son alargadas con el margen ligeramente │        │
│                                                             │  aserrado, de color verde brillante, algo más claras por el  │        │
│                                                             │ envés. El melocotonero está muy arraigado en la cultura asiá │        │
│                                                             │ tica.\r\nEn Japón, el noble heroe Momotaro, una especie de C │        │
│                                                             │ id japonés, nació del interior de un enorme melocotón que fl │        │
│                                                             │ otaba río abajo.\r\nEn China se piensa que comer melocotón c │        │
│                                                             │ onfiere longevidad al ser humano, ya que formaba parte de la │        │
│                                                             │  dieta de sus dioses inmortales.                             │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Mimosa Semilla Cyanophylla                                  │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │        │
│                                                             │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │        │
│                                                             │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │        │
│                                                             │ a). Arbol de follaje persistente muy usado en parques por su │        │
│                                                             │  atractiva floración amarilla hacia fines del invierno. Altu │        │
│                                                             │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │        │
│                                                             │ je perenne de tonos plateados, muy ornamental. Sus hojas son │        │
│                                                             │  de textura fina, de color verde y sus flores amarillas que  │        │
│                                                             │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │        │
│                                                             │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │        │
│                                                             │ mente curvada, con los bordes algo constreñidos entre las se │        │
│                                                             │ millas, que se disponen en el fruto longitudinalmente...     │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Laurus Nobilis Arbusto - Ramificado Bajo                    │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Viburnum Tinus \"Eve Price\"                                │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Calamondin Copa EXTRA Con FRUTA                             │ Se trata de un pequeño arbolito de copa densa, con tendencia │        │
│                                                             │  a la verticalidad, inerme o con cortas espinas. Sus hojas s │        │
│                                                             │ on pequeñas, elípticas de 5-10 cm de longitud, con los pecío │        │
│                                                             │ los estrechamente alados.Posee 1 o 2 flores en situación axi │        │
│                                                             │ lar, al final de las ramillas.Sus frutos son muy pequeños (3 │        │
│                                                             │ -3,5 cm de diámetro), con pocas semillas, esféricos u ovales │        │
│                                                             │ , con la zona apical aplanada; corteza de color naranja-roji │        │
│                                                             │ zo, muy fina y fácilmente separable de la pulpa, que es dulc │        │
│                                                             │ e, ácida y comestible..                                      │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Juniperus horizontalis Wiltonii                             │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Bougamvillea roja, naranja                                  │                                                              │        │
└─────────────────────────────────────────────────────────────┴──────────────────────────────────────────────────────────────┴────────┘
**/

--Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
--Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
--Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.