-- Creación de tabla cliente

create table cliente (
   ...> id integer primary key autoincrement,
   ...> nombre text,
   ...> apellido1 text,
   ...> apellido2 text, 
   ...> ciudad text,
   ...> categoria integer );

-- Creación tabla comercial

create table comercial (
   ...> id integer primary key autoincremental,
   ...> nombre text,
   ...> apellido1 text,
   ...> apellido2 text,
   ...> categoria real );

-- Creación tabla pedido

create table pedido (
   ...> id integer primary key autoincrement,
   ...> total real,
   ...> fecha text,
   ...> id_cliente integer reference cliente(id),
   ...> id_comercial integer reference comercial(id) );
