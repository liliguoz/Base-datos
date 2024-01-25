 -- Actualizar el nivel de Bulbasaur.

 /**
select * from Pokemon;
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 1  │ Bulbasaur  │ 3       │ 10    │
│ 2  │ Charmander │ 2       │ 12    │
│ 3  │ Squirtle   │ 1       │ 8     │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 6  │ Vaporeon   │ 1       │ 25    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 11 │ Gyarados   │ 1       │ 30    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 13 │ Exeggutor  │ 3       │ 40    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 55    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
 **/

 UPDATE Pokemon set nivel = 40
 WHERE nombre = 'Bulbasaur';

/**
SELECT * FROM Pokemon where nombre = 'Bulbasaur';
┌────┬───────────┬─────────┬───────┐
│ id │  nombre   │ id_tipo │ nivel │
├────┼───────────┼─────────┼───────┤
│ 1  │ Bulbasaur │ 3       │ 40    │
└────┴───────────┴─────────┴───────┘
**/

-- Cambiar el tipo de Pikachu a "Eléctrico/Rojo".

/**
select * from tipo;
┌────┬───────────┐
│ id │  nombre   │
├────┼───────────┤
│ 1  │ Agua      │
│ 2  │ Fuego     │
│ 3  │ Planta    │
│ 4  │ Eléctrico │
│ 5  │ Tierra    │
└────┴───────────┘
**/

UPDATE tipo AS t SET nombre='Electrico/Rojo' 
FROM Pokemon AS p 
WHERE p.id_tipo=t.id AND p.nombre='Pikachu';

/**
select p.nombre, t.nombre as tipo 
from Pokemon as p, tipo as t       
WHERE p.id_tipo=t.id and  p.nombre='Pikachu'; 
┌─────────┬────────────────┐
│ nombre  │      tipo      │
├─────────┼────────────────┤
│ Pikachu │ Electrico/Rojo │
└─────────┴────────────────┘
**/

-- Incrementar el nivel de todos los Pokémon de tipo Agua.

/**
select * from Pokemon;
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 1  │ Bulbasaur  │ 3       │ 40    │
│ 2  │ Charmander │ 2       │ 12    │
│ 3  │ Squirtle   │ 1       │ 8     │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 6  │ Vaporeon   │ 1       │ 25    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 11 │ Gyarados   │ 1       │ 30    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 13 │ Exeggutor  │ 3       │ 40    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 55    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/

UPDATE Pokemon AS p SET nivel = nivel + 1 
FROM tipo AS t WHERE t.nombre='Agua' AND p.id_tipo=t.id;

/**
select p.* from Pokemon as p, tipo as t where p.id_tipo=t.id and t.nombre='Agua';
┌────┬───────────┬─────────┬───────┐
│ id │  nombre   │ id_tipo │ nivel │
├────┼───────────┼─────────┼───────┤
│ 3  │ Squirtle  │ 1       │ 9     │
│ 6  │ Vaporeon  │ 1       │ 26    │
│ 11 │ Gyarados  │ 1       │ 31    │
│ 18 │ Blastoise │ 1       │ 56    │
└────┴───────────┴─────────┴───────┘
**/

-- Eliminar a Jynx de la lista de Pokémon.

/**
select * from Pokemon;
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 1  │ Bulbasaur  │ 3       │ 40    │
│ 2  │ Charmander │ 2       │ 12    │
│ 3  │ Squirtle   │ 1       │ 8     │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 6  │ Vaporeon   │ 1       │ 25    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 11 │ Gyarados   │ 1       │ 30    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 13 │ Exeggutor  │ 3       │ 40    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 55    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/

/** 
No hay Jynx
**/

-- Eliminar el tipo "Hielo" de la lista de tipos de Pokémon.

 /**
 SELECT * FROM tipo;
┌────┬────────┐
│ id │ nombre │
├────┼────────┤
│ 1  │ Agua   │
│ 2  │ Fuego  │
│ 3  │ Planta │
│ 4  │ Rojo   │
│ 5  │ Tierra │
└────┴────────┘
**/

/** 
No hay tipo hielo
**/

-- Obtener todos los Pokémon.

select * from Pokemon;

/**
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 1  │ Bulbasaur  │ 3       │ 40    │
│ 2  │ Charmander │ 2       │ 12    │
│ 3  │ Squirtle   │ 1       │ 8     │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 6  │ Vaporeon   │ 1       │ 25    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 11 │ Gyarados   │ 1       │ 30    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 13 │ Exeggutor  │ 3       │ 40    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 55    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/

-- Obtener el nombre y nivel de los Pokémon de tipo Fuego.

/**
SELECT * from tipo;
┌────┬────────┐
│ id │ nombre │
├────┼────────┤
│ 1  │ Agua   │
│ 2  │ Fuego  │
│ 3  │ Planta │
│ 4  │ Rojo   │
│ 5  │ Tierra │
└────┴────────┘
**/

SELECT p.nombre, p.nivel, t.id 
from Pokemon as p, tipo as t
where p.id_tipo=t.id and p.id_tipo=2;

/**
┌────────────┬───────┬────┐
│   nombre   │ nivel │ id │
├────────────┼───────┼────┤
│ Charmander │ 12    │ 2  │
│ Flareon    │ 27    │ 2  │
│ Arcanine   │ 35    │ 2  │
│ Charizard  │ 50    │ 2  │
│ Dragonite  │ 60    │ 2  │
│ Flareon    │ 65    │ 2  │
└────────────┴───────┴────┘
**/

-- Obtener el nombre de los Pokémon que tienen un nivel superior a 30.

/**
select * from Pokemon;      
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 1  │ Bulbasaur  │ 3       │ 40    │
│ 2  │ Charmander │ 2       │ 12    │
│ 3  │ Squirtle   │ 1       │ 8     │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 6  │ Vaporeon   │ 1       │ 25    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 11 │ Gyarados   │ 1       │ 30    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 13 │ Exeggutor  │ 3       │ 40    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 55    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/

SELECT nombre
FROM Pokemon 
WHERE nivel > 30;

/**
┌────────────┐
│   nombre   │
├────────────┤
│ Gyarados   │
│ Arcanine   │
│ Exeggutor  │
│ Raichu     │
│ Sandslash  │
│ Venusaur   │
│ Charizard  │
│ Blastoise  │
│ Electabuzz │
│ Rhydon     │
│ Dragonite  │
│ Flareon    │
│ Venusaur   │
│ Zapdos     │
│ Rhydon     │
└────────────┘
**/

-- Obtener el nombre de los Pokémon ordenados por nivel de forma descendente.

/**
select * from Pokemon;
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 1  │ Bulbasaur  │ 3       │ 40    │
│ 2  │ Charmander │ 2       │ 12    │
│ 3  │ Squirtle   │ 1       │ 8     │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 6  │ Vaporeon   │ 1       │ 25    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 11 │ Gyarados   │ 1       │ 30    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 13 │ Exeggutor  │ 3       │ 40    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 55    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/

SELECT nombre, nivel 
FROM Pokemon 
ORDER BY nivel DESC;

/**
┌────────────┬───────┐
│   nombre   │ nivel │
├────────────┼───────┤
│ Rhydon     │ 80    │
│ Zapdos     │ 75    │
│ Venusaur   │ 70    │
│ Flareon    │ 65    │
│ Dragonite  │ 60    │
│ Blastoise  │ 55    │
│ Rhydon     │ 52    │
│ Charizard  │ 50    │
│ Electabuzz │ 48    │
│ Venusaur   │ 45    │
│ Bulbasaur  │ 40    │
│ Exeggutor  │ 40    │
│ Raichu     │ 38    │
│ Arcanine   │ 35    │
│ Sandslash  │ 33    │
│ Gyarados   │ 30    │
│ Flareon    │ 27    │
│ Vaporeon   │ 25    │
│ Jolteon    │ 22    │
│ Ivysaur    │ 18    │
│ Pikachu    │ 15    │
│ Cubone     │ 14    │
│ Charmander │ 12    │
│ Geodude    │ 11    │
│ Squirtle   │ 8     │
└────────────┴───────┘
**/

-- Obtener la cantidad de Pokémon por tipo.

/**
select * from Pokemon;
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 1  │ Bulbasaur  │ 3       │ 40    │
│ 2  │ Charmander │ 2       │ 12    │
│ 3  │ Squirtle   │ 1       │ 8     │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 6  │ Vaporeon   │ 1       │ 25    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 11 │ Gyarados   │ 1       │ 30    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 13 │ Exeggutor  │ 3       │ 40    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 55    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/

SELECT count(p.nombre) as número_pokemon, t.nombre
FROM Pokemon as p, tipo as t
WHERE p.id_tipo=t.id 
GROUP BY t.nombre;

/**
┌────────────────┬────────────────┐
│ número_pokemon │      nombre    │
├────────────────┼────────────────┤
│ 4              │ Agua           │
│ 6              │ Fuego          │
│ 5              │ Planta         │
│ 5              │ Eléctrico/Rojo │
│ 5              │ Tierra         │
└────────────────┴────────────────┘
**/

-- Obtener la información completa de un Pokémon específico. Selecciona el que desees.

/**
select * from Pokemon;
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 1  │ Bulbasaur  │ 3       │ 40    │
│ 2  │ Charmander │ 2       │ 12    │
│ 3  │ Squirtle   │ 1       │ 8     │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 6  │ Vaporeon   │ 1       │ 25    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 11 │ Gyarados   │ 1       │ 30    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 13 │ Exeggutor  │ 3       │ 40    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 55    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/

SELECT * FROM Pokemon WHERE id=1;

/**
┌────┬───────────┬─────────┬───────┐
│ id │  nombre   │ id_tipo │ nivel │
├────┼───────────┼─────────┼───────┤
│ 1  │ Bulbasaur │ 3       │ 40    │
└────┴───────────┴─────────┴───────┘
**/

-- Obtener el promedio de niveles de todos los Pokémon.

/**
select nivel from Pokemon; 
┌───────┐
│ nivel │
├───────┤
│ 40    │
│ 12    │
│ 8     │
│ 15    │
│ 11    │
│ 25    │
│ 27    │
│ 18    │
│ 22    │
│ 14    │
│ 30    │
│ 35    │
│ 40    │
│ 38    │
│ 33    │
│ 45    │
│ 50    │
│ 55    │
│ 48    │
│ 52    │
│ 60    │
│ 65    │
│ 70    │
│ 75    │
│ 80    │
└───────┘
**/

SELECT AVG(nivel) as nivel_medio
FROM Pokemon;

/**
┌─────────────┐
│ nivel_medio │
├─────────────┤
│ 38.72       │
└─────────────┘
**/

-- Obtener el nombre del Pokémon de mayor nivel.

SELECT nombre, MAX(nivel) 
from Pokemon;

/**
┌────────┬────────────┐
│ nombre │ MAX(nivel) │
├────────┼────────────┤
│ Rhydon │ 81         │
└────────┴────────────┘
**/

-- Actualizar el nombre de Bulbasaur a "Bulbasaur Nv. 15":

/**
select nombre from Pokemon where nombre ='Bulbasaur'; 
┌───────────┐
│  nombre   │
├───────────┤
│ Bulbasaur │
└───────────┘
**/

UPDATE Pokemon set nombre='Bulbasaur Nv. 15' WHERE nombre='Bulbasaur';

/**
select nombre from Pokemon where nombre ='Bulbasaur Nv. 15'; 
┌──────────────────┐
│      nombre      │
├──────────────────┤
│ Bulbasaur Nv. 15 │
└──────────────────┘
**/

-- Obtener los Pokémon cuyo nivel es igual a 50.

/**
select nombre, nivel from Pokemon; 
┌──────────────────┬───────┐
│      nombre      │ nivel │
├──────────────────┼───────┤
│ Bulbasaur Nv. 15 │ 40    │
│ Charmander       │ 12    │
│ Squirtle         │ 8     │
│ Pikachu          │ 15    │
│ Geodude          │ 11    │
│ Vaporeon         │ 25    │
│ Flareon          │ 27    │
│ Ivysaur          │ 18    │
│ Jolteon          │ 22    │
│ Cubone           │ 14    │
│ Gyarados         │ 30    │
│ Arcanine         │ 35    │
│ Exeggutor        │ 40    │
│ Raichu           │ 38    │
│ Sandslash        │ 33    │
│ Venusaur         │ 45    │
│ Charizard        │ 50    │
│ Blastoise        │ 55    │
│ Electabuzz       │ 48    │
│ Rhydon           │ 52    │
│ Dragonite        │ 60    │
│ Flareon          │ 65    │
│ Venusaur         │ 70    │
│ Zapdos           │ 75    │
│ Rhydon           │ 80    │
└──────────────────┴───────┘
**/

select nombre, nivel from Pokemon where nivel=50; 

/**
┌───────────┬───────┐
│  nombre   │ nivel │
├───────────┼───────┤
│ Charizard │ 50    │
└───────────┴───────┘
**/

-- Eliminar todos los Pokémon de nivel 40.

/**
select nombre, nivel from Pokemon; 
┌──────────────────┬───────┐
│      nombre      │ nivel │
├──────────────────┼───────┤
│ Bulbasaur Nv. 15 │ 40    │
│ Charmander       │ 12    │
│ Squirtle         │ 8     │
│ Pikachu          │ 15    │
│ Geodude          │ 11    │
│ Vaporeon         │ 25    │
│ Flareon          │ 27    │
│ Ivysaur          │ 18    │
│ Jolteon          │ 22    │
│ Cubone           │ 14    │
│ Gyarados         │ 30    │
│ Arcanine         │ 35    │
│ Exeggutor        │ 40    │
│ Raichu           │ 38    │
│ Sandslash        │ 33    │
│ Venusaur         │ 45    │
│ Charizard        │ 50    │
│ Blastoise        │ 55    │
│ Electabuzz       │ 48    │
│ Rhydon           │ 52    │
│ Dragonite        │ 60    │
│ Flareon          │ 65    │
│ Venusaur         │ 70    │
│ Zapdos           │ 75    │
│ Rhydon           │ 80    │
└──────────────────┴───────┘
**/

DELETE from Pokemon WHERE nivel=40;

/**
┌────────────┬───────┐
│   nombre   │ nivel │
├────────────┼───────┤
│ Charmander │ 12    │
│ Squirtle   │ 8     │
│ Pikachu    │ 15    │
│ Geodude    │ 11    │
│ Vaporeon   │ 25    │
│ Flareon    │ 27    │
│ Ivysaur    │ 18    │
│ Jolteon    │ 22    │
│ Cubone     │ 14    │
│ Gyarados   │ 30    │
│ Arcanine   │ 35    │
│ Raichu     │ 38    │
│ Sandslash  │ 33    │
│ Venusaur   │ 45    │
│ Charizard  │ 50    │
│ Blastoise  │ 55    │
│ Electabuzz │ 48    │
│ Rhydon     │ 52    │
│ Dragonite  │ 60    │
│ Flareon    │ 65    │
│ Venusaur   │ 70    │
│ Zapdos     │ 75    │
│ Rhydon     │ 80    │
└────────────┴───────┘
**/

-- Obtener el tipo y nivel de Pikachu.

/**
select * from Pokemon;                                
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 2  │ Charmander │ 2       │ 12    │
│ 3  │ Squirtle   │ 1       │ 8     │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 6  │ Vaporeon   │ 1       │ 25    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 11 │ Gyarados   │ 1       │ 30    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 55    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/

SELECT p.nombre, t.nombre as tipo, p.nivel 
FROM Pokemon as p, tipo as t
WHERE p.id_tipo=t.id and p.nombre='Pikachu';

/**
┌─────────┬────────────────┬───────┐
│ nombre  │      tipo      │ nivel │
├─────────┼────────────────┼───────┤
│ Pikachu │ Eléctrico/Rojo │  15   │
└─────────┴────────────────┴───────┘
**/

-- Obtener los Pokémon de tipo Planta con nivel superior a 20:

/**
select * from tipo;
┌────┬────────┐
│ id │ nombre │
├────┼────────┤
│ 1  │ Agua   │
│ 2  │ Fuego  │
│ 3  │ Planta │
│ 4  │ Rojo   │
│ 5  │ Tierra │
└────┴────────┘

select * from Pokemon; 
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 2  │ Charmander │ 2       │ 12    │
│ 3  │ Squirtle   │ 1       │ 8     │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 6  │ Vaporeon   │ 1       │ 25    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 11 │ Gyarados   │ 1       │ 30    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 55    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/

SELECT p.nombre, t.nombre as tipo, p.nivel
FROM Pokemon as p, tipo as t 
WHERE p.id_tipo=t.id and p.nivel > 20 and t.nombre='Agua';

/**
┌───────────┬──────┬───────┐
│  nombre   │ tipo │ nivel │
├───────────┼──────┼───────┤
│ Vaporeon  │ Agua │ 25    │
│ Gyarados  │ Agua │ 30    │
│ Blastoise │ Agua │ 55    │
└───────────┴──────┴───────┘
**/

 - Actualizar el tipo de Pikachu a "Eléctrico/Azul":

 /**
 select * from tipo;                                       
┌────┬────────┐
│ id │ nombre │
├────┼────────┤
│ 1  │ Agua   │
│ 2  │ Fuego  │
│ 3  │ Planta │
│ 4  │ Rojo   │
│ 5  │ Tierra │
└────┴────────┘
**/

UPDATE tipo as t set nombre='Eléctrico/Azul' 
FROM Pokemon as p 
WHERE p.id_tipo=t.id and t.nombre='Eléctrico/Rojo' and p.nombre='Pikachu';

/**
┌────┬────────────────┐
│ id │     nombre     │
├────┼────────────────┤
│ 1  │ Agua           │
│ 2  │ Fuego          │
│ 3  │ Planta         │
│ 4  │ Eléctrico/Azul │
│ 5  │ Tierra         │
└────┴────────────────┘
**/

-- Eliminar todos los Pokémon de tipo Planta.

/**
select * from pokemon; 
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 2  │ Charmander │ 2       │ 12    │
│ 3  │ Squirtle   │ 1       │ 8     │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 6  │ Vaporeon   │ 1       │ 25    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 11 │ Gyarados   │ 1       │ 30    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 55    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/

DELETE FROM Pokemon WHERE id_tipo=(SELECT nombre from tipo where nombre='Planta');

/**
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 2  │ Charmander │ 2       │ 12    │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/

-- Obtener los Pokémon con nombre y tipo ordenados alfabéticamente.

/**
select * from pokemon;
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 2  │ Charmander │ 2       │ 12    │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/

SELECT p.nombre, t.nombre as tipo 
FROM Pokemon as p, tipo as t
WHERE p.id_tipo=t.id
ORDER BY p.nombre ASC;

/**
┌────────────┬────────────────┐
│   nombre   │      tipo      │
├────────────┼────────────────┤
│ Arcanine   │ Fuego          │
│ Charizard  │ Fuego          │
│ Charmander │ Fuego          │
│ Cubone     │ Tierra         │
│ Dragonite  │ Fuego          │
│ Electabuzz │ Eléctrico/Azul │
│ Flareon    │ Fuego          │
│ Flareon    │ Fuego          │
│ Geodude    │ Tierra         │
│ Ivysaur    │ Planta         │
│ Jolteon    │ Eléctrico/Azul │
│ Pikachu    │ Eléctrico/Azul │
│ Raichu     │ Eléctrico/Azul │
│ Rhydon     │ Tierra         │
│ Rhydon     │ Tierra         │
│ Sandslash  │ Tierra         │
│ Venusaur   │ Planta         │
│ Venusaur   │ Planta         │
│ Zapdos     │ Eléctrico/Azul │
└────────────┴────────────────┘
**/

-- Obtén todos los Pokémon cuyos nombres contienen las letras 'sa'.

/**
select * from Pokemon;
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 2  │ Charmander │ 2       │ 12    │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/

SELECT nombre 
FROM Pokemon
WHERE nombre like '%sa%';

/**
┌───────────┐
│  nombre   │
├───────────┤
│ Ivysaur   │
│ Sandslash │
│ Venusaur  │
│ Venusaur  │
└───────────┘
**/

-- Encuentra todos los Pokémon cuyo nivel es 40, 50 o 60.

/**
select nombre, nivel from Pokemon; 
┌────────────┬───────┐
│   nombre   │ nivel │
├────────────┼───────┤
│ Charmander │ 12    │
│ Pikachu    │ 15    │
│ Geodude    │ 11    │
│ Flareon    │ 27    │
│ Ivysaur    │ 18    │
│ Jolteon    │ 22    │
│ Cubone     │ 14    │
│ Arcanine   │ 35    │
│ Raichu     │ 38    │
│ Sandslash  │ 33    │
│ Venusaur   │ 45    │
│ Charizard  │ 50    │
│ Electabuzz │ 48    │
│ Rhydon     │ 52    │
│ Dragonite  │ 60    │
│ Flareon    │ 65    │
│ Venusaur   │ 70    │
│ Zapdos     │ 75    │
│ Rhydon     │ 80    │
└────────────┴───────┘
**/

SELECT nombre, nivel
FROM Pokemon
WHERE nivel in (40, 50, 60);

/**
┌───────────┬───────┐
│  nombre   │ nivel │
├───────────┼───────┤
│ Charizard │ 50    │
│ Dragonite │ 60    │
└───────────┴───────┘
**/

-- Obtén todos los Pokémon de tipo Fuego cuyos nombres comienzan con la letra 'C'.

/**
select * from Pokemon;
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 2  │ Charmander │ 2       │ 12    │
│ 4  │ Pikachu    │ 4       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/

SELECT p.nombre, t.nombre as tipo
FROM Pokemon as p, tipo as t
WHERE p.id_tipo=t.id and t.nombre='Fuego' and p.nombre like 'C%';

/**
┌────────────┬───────┐
│   nombre   │ tipo  │
├────────────┼───────┤
│ Charmander │ Fuego │
│ Charizard  │ Fuego │
└────────────┴───────┘
**/

-- Encuentra los nombres y tipos de los Pokémon cuyo nivel es mayor que el promedio de todos los Pokémon en la base de datos.

/**
select nombre, nivel 
from Pokemon;
┌────────────┬───────┐
│   nombre   │ nivel │
├────────────┼───────┤
│ Charmander │ 12    │
│ Pikachu    │ 15    │
│ Geodude    │ 11    │
│ Flareon    │ 27    │
│ Ivysaur    │ 18    │
│ Jolteon    │ 22    │
│ Cubone     │ 14    │
│ Arcanine   │ 35    │
│ Raichu     │ 38    │
│ Sandslash  │ 33    │
│ Venusaur   │ 45    │
│ Charizard  │ 50    │
│ Electabuzz │ 48    │
│ Rhydon     │ 52    │
│ Dragonite  │ 60    │
│ Flareon    │ 65    │
│ Venusaur   │ 70    │
│ Zapdos     │ 75    │
│ Rhydon     │ 80    │
└────────────┴───────┘
**/

SELECT p.nombre, t.nombre as tipo, p.nivel
FROM Pokemon as p, tipo as t
WHERE p.id_tipo=t.id and p.nivel >= (SELECT AVG(nivel) from Pokemon);

/**
┌────────────┬────────────────┬───────┐
│   nombre   │      tipo      │ nivel │
├────────────┼────────────────┼───────┤
│ Venusaur   │ Planta         │ 45    │
│ Charizard  │ Fuego          │ 50    │
│ Electabuzz │ Electrico/Rojo │ 48    │
│ Rhydon     │ Tierra         │ 52    │
│ Dragonite  │ Fuego          │ 60    │
│ Flareon    │ Fuego          │ 65    │
│ Venusaur   │ Planta         │ 70    │
│ Zapdos     │ Electrico/Rojo │ 75    │
│ Rhydon     │ Tierra         │ 80    │
└────────────┴────────────────┴───────┘
**/
