--¿Sabías que la mayoría de los adultos sanos pueden ser donantes? Aunque existen ciertas condiciones que debes cumplir para realizar con éxito una donación. Descubre los requisitos básicos para donar sangre.

--Para la poder donar sangre se deben cumplir varias condiciones:

	--Tener un peso superior a 50Kg.
	--No haber donado en un periodo anterior a 90 días en caso de ser hombre y 120 días en caso de mujer.

--Teniendo en cuenta esta información se pide:

--Crea una base datos llamada donación.

--Crea una tabla llamada persona con los siguientes campos:

	--Identificador Auto Incremental (Integer) PK
	--Identificador (Texto)
	--Peso. (Entero)
	--Admitido. Texto(Si/No).(Valores de dominio:Si/No)
	--Sexo. Texto (H/M).(Valores de dominio:H/M)
	--Fecha Última Donación.

DROP DATABASE IF EXISTS examen;

CREATE DATABASE examen;

USE examen;

CREATE table persona(
	id INT PRIMARY KEY AUTO_INCREMENT,
	identificador VARCHAR(100),
	peso INT,
	admitido VARCHAR(10),
	sexo VARCHAR(10),
	fecha DATETIME
);

--Se pide:

-- Realiza los siguientes procedimientos:

    -- (1) Realizar un procedimiento que realice la inserción de datos aleatorios en la tabla.
	-- El procedimiento debe de recibir como parámetro de entrada, al menos, el número de registros que se desea insertar y se debe de lanzar,
	-- al menos, en dos ocasiones, para verificar su correcto funcionamiento. Los datos deben de ser aleatorios, es decir,
	-- en cada inserción de debe de auto generar o seleccionar uno al azar, de los campos requeridos.


    -- (2) Realiza un procedimiento que permita actualizar el la fecha de última donación, teniendo como parámetro de entrada el identificador de la persona,
	-- y una fecha.


    	-- (3) Crea un procedimiento llamado CalcularTotalDonaciones que calcule la cantidad total de donaciones realizadas por cada persona y
    	-- la almacene en una tabla llamada total_donaciones. La tabla total_donaciones debe tener dos columnas: id_persona (texto) y cantidad_total (integer).

drop table if exists total_donaciones;

create table total_donaciones(
	id_persona VARCHAR(50),
	cantidad_total INT
);


    	-- (4) Crea un procedimiento que me permita eliminar una persona de la tabla total_donaciones.

DROP PROCEDURE IF EXISTS total_donaciones;

-- Realizar cada una de las siguientes funciones:

    -- (1) Realiza una función que determine si una persona almacenada en la tabla persona puede realizar una donación.
	-- Para ello la función recibe como parámetro de entrada el identificador de esta persona, y una fecha de donación.
	-- Revisa las condiciones para que una persona pueda o no donar.
	-- Posteriormente actualice el valor de la última donación de la persona indicada con el parámetro de entrada.

drop function if exists apto_donar;

   	 
    -- (2) Realiza una función que determine que persona es la que más donaciones ha realizado.

drop if EXISTS function mas_donaciones;


--Triggers

  	-- (1) Realiza un trigger que actualiza total_donaciones con cada una de las inserciones que se realicen en la tabla Persona.

DROP TRIGGER IF EXISTS actualizar_total_donaciones;

  	-- (2) Realiza un trigger que elimine todos los registros en la tabla persona cuando se elimine un registro de la tabla total_donaciones.

DROP TRIGGER IF EXISTS eliminar_persona;

