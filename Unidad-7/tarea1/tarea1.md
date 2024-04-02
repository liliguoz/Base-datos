<div align="justify">

# Tarea 1 de trabajo con índices

<div align="center">
<img src="https://hoplasoftware.com/wp-content/uploads/2021/07/1024px-MySQL.ff87215b43fd7292af172e2a5d9b844217262571.png" width=600/>
</div>

Un instituto de enseñanza guarda los siguientes datos de sus alumnos:
 - número de inscripción, comienza desde 1 cada año,
 - año de inscripción,
 - nombre del alumno,
 - documento del alumno,
 - domicilio,
 - ciudad,
 - provincia,
 - clave primaria: número de inscripto y año de inscripción.

## Creación de las tablas:

```sql
CREATE DATABASE IF NOT EXISTS tarea1;

CREATE TABLE alumnos(
numero_inscripcion int auto_increment,
anio_inscripcion int,
nombre varchar(50),
dni varchar(10),
domicilio varchar(50),
ciudad varchar(50),
provincia varchar(50),
primary key (numero_inscripcion, anio_inscripcion)
);
```

Se pide: 
- Elimine la tabla "alumno" si existe. 

```sql
drop table alumnos if not exists;
```

- Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de 
inscripción).
    >__Nota__:_Muestra el comando y la salida_. 
- Define los siguientes indices:
   - Un índice único por el campo "documento" y un índice común por ciudad y provincia.
        >__Nota__:_Muestra el comando y la salida. Justifica el tipo de indice en un comentario_. 
    - Vea los índices de la tabla.
        >__Nota__:_Muestra el comando y la salida __"show index"___.
- Intente ingresar un alumno con clave primaria repetida.
    >__Nota__:_Muestra el comando y la salida_.
- Intente ingresar un alumno con documento repetido.
    >__Nota__:_Muestra el comando y la salida_.
- Ingrese varios alumnos de la misma ciudad y provincia.
    >__Nota__:_Muestra el comando y la salida_.
- Elimina los indices creados, y muestra que ya no se encuentran.
    >__Nota__:_Muestra el comando y la salida_.
## Referencias

- [Índices en MySql](https://dev.mysql.com/doc/refman/8.0/en/mysql-indexes.html).
- [Apuntes sobre índices](../../Indices.md).

</div>
