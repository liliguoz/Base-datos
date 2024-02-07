-- Obtener el nombre del alumno y el nombre de la clase en la que está inscrito.

select a.nombre, c.nombre from alumnos as a, clases as c join inscripciones as i on i.id_alumno=a.id and i.id_clase=c.id;

/**
┌────────┬────────────────────────┐
│ nombre │         nombre         │
├────────┼────────────────────────┤
│ Juan   │ Matemáticas 101        │
│ Juan   │ Historia Antigua       │
│ María  │ Literatura Moderna     │
│ María  │ Biología Avanzada      │
│ Pedro  │ Química Orgánica       │
│ Pedro  │ Física Cuántica        │
│ Laura  │ Arte Contemporáneo     │
│ Laura  │ Inglés Avanzado        │
│ Carlos │ Economía Internacional │
│ Ana    │ Derecho Penal          │
└────────┴────────────────────────┘
**/

-- Obtener el nombre del alumno y la materia de las clases en las que está inscrito.

select a.nombre, c.materia from alumnos as a, clases as c join inscripciones as i on i.id_alumno=a.id and i.id_clase=c.id;

/**
┌────────┬─────────────┐
│ nombre │   materia   │
├────────┼─────────────┤
│ Juan   │ Matemáticas │
│ Juan   │ Historia    │
│ María  │ Literatura  │
│ María  │ Biología    │
│ Pedro  │ Química     │
│ Pedro  │ Física      │
│ Laura  │ Arte        │
│ Laura  │ Idiomas     │
│ Carlos │ Economía    │
│ Ana    │ Derecho     │
└────────┴─────────────┘
**/

-- Obtener el nombre del alumno, la edad y el nombre del profesor de las clases en las que está inscrito.

select a.nombre, a.edad, c.profesor from alumnos as a, clases as c join inscripciones as i on i.id_alumno=a.id and i.id_clase=c.id;

/**
┌────────┬──────┬────────────┐
│ nombre │ edad │  profesor  │
├────────┼──────┼────────────┤
│ Juan   │ 20   │ Profesor X │
│ Juan   │ 20   │ Profesor Y │
│ María  │ 21   │ Profesor Z │
│ María  │ 21   │ Profesor W │
│ Pedro  │ 19   │ Profesor V │
│ Pedro  │ 19   │ Profesor U │
│ Laura  │ 22   │ Profesor T │
│ Laura  │ 22   │ Profesor S │
│ Carlos │ 20   │ Profesor R │
│ Ana    │ 19   │ Profesor Q │
└────────┴──────┴────────────┘
**/

-- Obtener el nombre del alumno y la dirección de las clases en las que está inscrito.

select a.nombre, c.direccion from alumnos as a, clases as c join inscripciones as i on i.id_alumno=a.id and i.id_clase=c.id;
-- Obtener el nombre del alumno y el nombre de la clase junto con el profesor.
-- Obtener el nombre del alumno, la materia y el nombre del profesor de las clases en las que está inscrito.
-- Obtener el nombre del alumno, la edad y la materia de las clases en las que está inscrito.
-- Obtener el nombre del alumno, la dirección y el profesor de las clases en las que está inscrito.
-- Obtener el nombre del alumno y la materia de las clases en las que está inscrito, ordenado por el nombre del alumno.
-- Contar cuántos alumnos están inscritos en cada clase.
