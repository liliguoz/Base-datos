-----------------------------------------------------------------Consultas de una tabla-----------------------------------------------------------------

--Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.

select nombre, apellido1, apellido2  from persona where tipo = 'alumno' order by apellido1 desc, apellido2 desc, nombre desc;

/**
┌──────────┬───────────┬───────────┐
│  nombre  │ apellido1 │ apellido2 │
├──────────┼───────────┼───────────┤
│ Salvador │ Sánchez   │ Pérez     │
│ Ismael   │ Strosin   │ Turcotte  │
│ Juan     │ Saez      │ Vega      │
│ Inma     │ Lakin     │ Yundt     │
│ José     │ Koss      │ Bayer     │
│ Ramón    │ Herzog    │ Tremblay  │
│ Irene    │ Hernández │ Martínez  │
│ Daniel   │ Herman    │ Pacocha   │
│ Pedro    │ Heller    │ Pagac     │
│ Juan     │ Gutiérrez │ López     │
│ Sonia    │ Gea       │ Ruiz      │
│ Antonio  │ Domínguez │ Guerrero  │
└──────────┴───────────┴───────────┘
**/

--Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.

select nombre, apellido1, apellido2 from persona where tipo = 'alumno' and telefono is null;
/**
┌────────┬───────────┬───────────┐
│ nombre │ apellido1 │ apellido2 │
├────────┼───────────┼───────────┤
│ Pedro  │ Heller    │ Pagac     │
│ Ismael │ Strosin   │ Turcotte  │
└────────┴───────────┴───────────┘
**/

--Devuelve el listado de los alumnos que nacieron en 1999.

select * from persona where tipo = 'alumno' and fecha_nacimiento REGEXP '1999';

/**
┌────┬───────────┬─────────┬───────────┬───────────┬─────────┬─────────────────┬───────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre  │ apellido1 │ apellido2 │ ciudad  │    direccion    │ telefono  │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼─────────┼───────────┼───────────┼─────────┼─────────────────┼───────────┼──────────────────┼──────┼────────┤
│ 7  │ 97258166K │ Ismael  │ Strosin   │ Turcotte  │ Almería │ C/ Neptuno      │           │ 1999/05/24       │ H    │ alumno │
│ 22 │ 41491230N │ Antonio │ Domínguez │ Guerrero  │ Almería │ C/ Cabo de Gata │ 626652498 │ 1999/02/11       │ H    │ alumno │
└────┴───────────┴─────────┴───────────┴───────────┴─────────┴─────────────────┴───────────┴──────────────────┴──────┴────────┘
**/

--Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.

select * from persona where tipo = 'profesor' and telefono is null and nif REGEXP 'K$';
/**
┌────┬───────────┬───────────┬───────────┬───────────┬─────────┬───────────────────────────┬──────────┬──────────────────┬──────┬──────────┐
│ id │    nif    │  nombre   │ apellido1 │ apellido2 │ ciudad  │         direccion         │ telefono │ fecha_nacimiento │ sexo │   tipo   │
├────┼───────────┼───────────┼───────────┼───────────┼─────────┼───────────────────────────┼──────────┼──────────────────┼──────┼──────────┤
│ 16 │ 10485008K │ Antonio   │ Fahey     │ Considine │ Almería │ C/ Sierra de los Filabres │          │ 1982/03/18       │ H    │ profesor │
│ 17 │ 85869555K │ Guillermo │ Ruecker   │ Upton     │ Almería │ C/ Sierra de Gádor        │          │ 1973/05/05       │ H    │ profesor │
└────┴───────────┴───────────┴───────────┴───────────┴─────────┴───────────────────────────┴──────────┴──────────────────┴──────┴──────────┘**/

--Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.

select * from asignatura where cuatrimestre = '1' and curso = '3' and id = '7';

/**
no hay resultado
**/

-----------------------------------------------------------------Consultas multitabla (Join)------------------------------------------------------------------
--Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).

select p.* from persona as p INNER JOIN alumno_se_matricula_asignatura as a ON p.id = a.id_alumno INNER JOIN asignatura as asig ON a.id_asignatura = asig.id
where p.sexo = 'M' and asig.nombre = 'Grado en Ingienería Informática';

/**

**/

--Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).


--Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
--Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.
--Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
--Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.

-----------------------------------------------------------------Consultas multitabla (Where)--------------------------------------------------------------------
--Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
--Devuelve un listado con los profesores que no están asociados a un departamento.

select p.nombre from persona as p, profesor as prof, departamento as dep where p.id = prof.id_profesor, prof.id_departamento = dep.id and dep.id not in (select id_departamento from profesor);
select p.nombre from persona as p,profesor as p, departamento as d where d.id not in (select id_departamento from profesor) group by p.id_profesor;
--Devuelve un listado con los departamentos que no tienen profesores asociados.
--Devuelve un listado con los profesores que no imparten ninguna asignatura.
--Devuelve un listado con las asignaturas que no tienen un profesor asignado.
--Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.

-------------------------------------------------------------------Consultas resúmen (Funciones)--------------------------------------------------------------------
--Devuelve el número total de alumnas que hay.

select 
--Calcula cuántos alumnos nacieron en 1999.
--Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.
--Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.
--Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
--Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
--Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.
--Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
--Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.

----------------------------------------------------------------------Subconsultas-----------------------------------------------------------
--Devuelve todos los datos del alumno más joven.
--Devuelve un listado con los profesores que no están asociados a un departamento.
--Devuelve un listado con los departamentos que no tienen profesores asociados.
--Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.
--Devuelve un listado con las asignaturas que no tienen un profesor asignado.
--Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.

