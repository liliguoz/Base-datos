<div align="justify">

# Trabajo con Sakila

Vamos a realizar el trabajo con una BBDD existente en la documentación  oficial de MySql. Su nombre es __Sakila__.

Se pide:
- Realiza la carga de la BBDD de Sakila, tal y como se muestra en los enlaces proporcionados.
- Realiza cada una de las siguientes consultas:

1. Actores que tienen de primer nombre __Scarlett__.

```sql
select * from actor where first_name = 'Scarlett';
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       81 | SCARLETT   | DAMON     | 2006-02-15 04:34:33 |
|      124 | SCARLETT   | BENING    | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
2 rows in set (0,00 sec)
```
      
2. Actores que tienen de apellido __Johansson__.
 
```sql
select * from actor where last_name = 'Johansson';
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|        8 | MATTHEW    | JOHANSSON | 2006-02-15 04:34:33 |
|       64 | RAY        | JOHANSSON | 2006-02-15 04:34:33 |
|      146 | ALBERT     | JOHANSSON | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
3 rows in set (0,01 sec)
```

3. Actores que contengan una __O__ en su nombre.
 
```sql
select * from actor where first_name regexp 'o';
+----------+-------------+--------------+---------------------+
| actor_id | first_name  | last_name    | last_update         |
+----------+-------------+--------------+---------------------+
|        1 | PENELOPE    | GUINESS      | 2006-02-15 04:34:33 |
|        5 | JOHNNY      | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
|        9 | JOE         | SWANK        | 2006-02-15 04:34:33 |
|       11 | ZERO        | CAGE         | 2006-02-15 04:34:33 |
|       19 | BOB         | FAWCETT      | 2006-02-15 04:34:33 |
|       24 | CAMERON     | STREEP       | 2006-02-15 04:34:33 |
|       28 | WOODY       | HOFFMAN      | 2006-02-15 04:34:33 |
|       38 | TOM         | MCKELLEN     | 2006-02-15 04:34:33 |
|       39 | GOLDIE      | BRODY        | 2006-02-15 04:34:33 |
|       40 | JOHNNY      | CAGE         | 2006-02-15 04:34:33 |
|       41 | JODIE       | DEGENERES    | 2006-02-15 04:34:33 |
|       42 | TOM         | MIRANDA      | 2006-02-15 04:34:33 |
|       54 | PENELOPE    | PINKETT      | 2006-02-15 04:34:33 |
|       63 | CAMERON     | WRAY         | 2006-02-15 04:34:33 |
|       78 | GROUCHO     | SINATRA      | 2006-02-15 04:34:33 |
|       82 | WOODY       | JOLIE        | 2006-02-15 04:34:33 |
|       91 | CHRISTOPHER | BERRY        | 2006-02-15 04:34:33 |
|      104 | PENELOPE    | CRONYN       | 2006-02-15 04:34:33 |
|      106 | GROUCHO     | DUNST        | 2006-02-15 04:34:33 |
|      111 | CAMERON     | ZELLWEGER    | 2006-02-15 04:34:33 |
|      113 | MORGAN      | HOPKINS      | 2006-02-15 04:34:33 |
|      114 | MORGAN      | MCDORMAND    | 2006-02-15 04:34:33 |
|      115 | HARRISON    | BALE         | 2006-02-15 04:34:33 |
|      120 | PENELOPE    | MONROE       | 2006-02-15 04:34:33 |
|      137 | MORGAN      | WILLIAMS     | 2006-02-15 04:34:33 |
|      140 | WHOOPI      | HURT         | 2006-02-15 04:34:33 |
|      151 | GEOFFREY    | HESTON       | 2006-02-15 04:34:33 |
|      162 | OPRAH       | KILMER       | 2006-02-15 04:34:33 |
|      163 | CHRISTOPHER | WEST         | 2006-02-15 04:34:33 |
|      171 | OLYMPIA     | PFEIFFER     | 2006-02-15 04:34:33 |
|      172 | GROUCHO     | WILLIAMS     | 2006-02-15 04:34:33 |
|      176 | JON         | CHASE        | 2006-02-15 04:34:33 |
|      188 | ROCK        | DUKAKIS      | 2006-02-15 04:34:33 |
|      191 | GREGORY     | GOODING      | 2006-02-15 04:34:33 |
|      192 | JOHN        | SUVARI       | 2006-02-15 04:34:33 |
|      200 | THORA       | TEMPLE       | 2006-02-15 04:34:33 |
+----------+-------------+--------------+---------------------+
36 rows in set (0,00 sec)
```

4. Actores que contengan una __O__ en su nombre y en una __A__ en su apellido.

```sql
select * from actor where first_name regexp 'o' and last_name regexp 'a';
+----------+------------+--------------+---------------------+
| actor_id | first_name | last_name    | last_update         |
+----------+------------+--------------+---------------------+
|        5 | JOHNNY     | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
|        9 | JOE        | SWANK        | 2006-02-15 04:34:33 |
|       11 | ZERO       | CAGE         | 2006-02-15 04:34:33 |
|       19 | BOB        | FAWCETT      | 2006-02-15 04:34:33 |
|       28 | WOODY      | HOFFMAN      | 2006-02-15 04:34:33 |
|       40 | JOHNNY     | CAGE         | 2006-02-15 04:34:33 |
|       42 | TOM        | MIRANDA      | 2006-02-15 04:34:33 |
|       63 | CAMERON    | WRAY         | 2006-02-15 04:34:33 |
|       78 | GROUCHO    | SINATRA      | 2006-02-15 04:34:33 |
|      114 | MORGAN     | MCDORMAND    | 2006-02-15 04:34:33 |
|      115 | HARRISON   | BALE         | 2006-02-15 04:34:33 |
|      137 | MORGAN     | WILLIAMS     | 2006-02-15 04:34:33 |
|      172 | GROUCHO    | WILLIAMS     | 2006-02-15 04:34:33 |
|      176 | JON        | CHASE        | 2006-02-15 04:34:33 |
|      188 | ROCK       | DUKAKIS      | 2006-02-15 04:34:33 |
|      192 | JOHN       | SUVARI       | 2006-02-15 04:34:33 |
+----------+------------+--------------+---------------------+
16 rows in set (0,00 sec)
```

5. Actores que contengan dos __O__ en su nombre y en una __A__ en su apellido.

```sql
select * from actor where first_name regexp '.*o.*o.*' and last_name regexp '.*a.*';
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       28 | WOODY      | HOFFMAN   | 2006-02-15 04:34:33 |
|       78 | GROUCHO    | SINATRA   | 2006-02-15 04:34:33 |
|      172 | GROUCHO    | WILLIAMS  | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
3 rows in set (0,00 sec)
```

6. Actores donde su tercera letra sea __B__.

```sql
select * from actor where first_name regexp '..b';
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       15 | CUBA       | OLIVIER   | 2006-02-15 04:34:33 |
|       19 | BOB        | FAWCETT   | 2006-02-15 04:34:33 |
|      118 | CUBA       | ALLEN     | 2006-02-15 04:34:33 |
|      125 | ALBERT     | NOLTE     | 2006-02-15 04:34:33 |
|      146 | ALBERT     | JOHANSSON | 2006-02-15 04:34:33 |
|      182 | DEBBIE     | AKROYD    | 2006-02-15 04:34:33 |
|      189 | CUBA       | BIRCH     | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
7 rows in set (0,00 sec)
```

7. Ciudades que empiezan por __a__.

```sql
select * from city where city regexp '^a';
+---------+-------------------------+------------+---------------------+
| city_id | city                    | country_id | last_update         |
+---------+-------------------------+------------+---------------------+
|       1 | A Coruña (La Coruña)    |         87 | 2006-02-15 04:45:25 |
|       2 | Abha                    |         82 | 2006-02-15 04:45:25 |
|       3 | Abu Dhabi               |        101 | 2006-02-15 04:45:25 |
|       4 | Acuña                   |         60 | 2006-02-15 04:45:25 |
|       5 | Adana                   |         97 | 2006-02-15 04:45:25 |
|       6 | Addis Abeba             |         31 | 2006-02-15 04:45:25 |
|       7 | Aden                    |        107 | 2006-02-15 04:45:25 |
|       8 | Adoni                   |         44 | 2006-02-15 04:45:25 |
|       9 | Ahmadnagar              |         44 | 2006-02-15 04:45:25 |
|      10 | Akishima                |         50 | 2006-02-15 04:45:25 |
|      11 | Akron                   |        103 | 2006-02-15 04:45:25 |
|      12 | al-Ayn                  |        101 | 2006-02-15 04:45:25 |
|      13 | al-Hawiya               |         82 | 2006-02-15 04:45:25 |
|      14 | al-Manama               |         11 | 2006-02-15 04:45:25 |
|      15 | al-Qadarif              |         89 | 2006-02-15 04:45:25 |
|      16 | al-Qatif                |         82 | 2006-02-15 04:45:25 |
|      17 | Alessandria             |         49 | 2006-02-15 04:45:25 |
|      18 | Allappuzha (Alleppey)   |         44 | 2006-02-15 04:45:25 |
|      19 | Allende                 |         60 | 2006-02-15 04:45:25 |
|      20 | Almirante Brown         |          6 | 2006-02-15 04:45:25 |
|      21 | Alvorada                |         15 | 2006-02-15 04:45:25 |
|      22 | Ambattur                |         44 | 2006-02-15 04:45:25 |
|      23 | Amersfoort              |         67 | 2006-02-15 04:45:25 |
|      24 | Amroha                  |         44 | 2006-02-15 04:45:25 |
|      25 | Angra dos Reis          |         15 | 2006-02-15 04:45:25 |
|      26 | Anápolis                |         15 | 2006-02-15 04:45:25 |
|      27 | Antofagasta             |         22 | 2006-02-15 04:45:25 |
|      28 | Aparecida de Goiânia    |         15 | 2006-02-15 04:45:25 |
|      29 | Apeldoorn               |         67 | 2006-02-15 04:45:25 |
|      30 | Araçatuba               |         15 | 2006-02-15 04:45:25 |
|      31 | Arak                    |         46 | 2006-02-15 04:45:25 |
|      32 | Arecibo                 |         77 | 2006-02-15 04:45:25 |
|      33 | Arlington               |        103 | 2006-02-15 04:45:25 |
|      34 | Ashdod                  |         48 | 2006-02-15 04:45:25 |
|      35 | Ashgabat                |         98 | 2006-02-15 04:45:25 |
|      36 | Ashqelon                |         48 | 2006-02-15 04:45:25 |
|      37 | Asunción                |         73 | 2006-02-15 04:45:25 |
|      38 | Athenai                 |         39 | 2006-02-15 04:45:25 |
|      39 | Atšinsk                 |         80 | 2006-02-15 04:45:25 |
|      40 | Atlixco                 |         60 | 2006-02-15 04:45:25 |
|      41 | Augusta-Richmond County |        103 | 2006-02-15 04:45:25 |
|      42 | Aurora                  |        103 | 2006-02-15 04:45:25 |
|      43 | Avellaneda              |          6 | 2006-02-15 04:45:25 |
+---------+-------------------------+------------+---------------------+
43 rows in set (0,01 sec)
```

8. Ciudades que acaban por __s__.

```sql
select * from city where city regexp 's$';
+---------+----------------------------+------------+---------------------+
| city_id | city                       | country_id | last_update         |
+---------+----------------------------+------------+---------------------+
|      25 | Angra dos Reis             |         15 | 2006-02-15 04:45:25 |
|      26 | Anápolis                   |         15 | 2006-02-15 04:45:25 |
|      79 | Bilbays                    |         29 | 2006-02-15 04:45:25 |
|     102 | Caracas                    |        104 | 2006-02-15 04:45:25 |
|     118 | Ciomas                     |         45 | 2006-02-15 04:45:25 |
|     120 | Citrus Heights             |        103 | 2006-02-15 04:45:25 |
|     125 | Coatzacoalcos              |         60 | 2006-02-15 04:45:25 |
|     135 | Dallas                     |        103 | 2006-02-15 04:45:25 |
|     137 | Daugavpils                 |         54 | 2006-02-15 04:45:25 |
|     147 | Dos Quebradas              |         24 | 2006-02-15 04:45:25 |
|     190 | Águas Lindas de Goiás      |         15 | 2006-02-15 04:45:25 |
|     212 | Huejutla de Reyes          |         60 | 2006-02-15 04:45:25 |
|     221 | Imus                       |         75 | 2006-02-15 04:45:25 |
|     238 | Jelets                     |         80 | 2006-02-15 04:45:25 |
|     266 | Kilis                      |         97 | 2006-02-15 04:45:25 |
|     297 | Le Mans                    |         34 | 2006-02-15 04:45:25 |
|     330 | Matamoros                  |         60 | 2006-02-15 04:45:25 |
|     333 | Memphis                    |        103 | 2006-02-15 04:45:25 |
|     391 | Ozamis                     |         75 | 2006-02-15 04:45:25 |
|     401 | Patras                     |         39 | 2006-02-15 04:45:25 |
|     413 | Poços de Caldas            |         15 | 2006-02-15 04:45:25 |
|     424 | Quilmes                    |          6 | 2006-02-15 04:45:25 |
|     441 | Saint Louis                |        103 | 2006-02-15 04:45:25 |
|     442 | Saint-Denis                |         79 | 2006-02-15 04:45:25 |
|     446 | Salinas                    |        103 | 2006-02-15 04:45:25 |
|     460 | Santiago de los Caballeros |         27 | 2006-02-15 04:45:25 |
|     482 | Sivas                      |         97 | 2006-02-15 04:45:25 |
|     497 | Springs                    |         85 | 2006-02-15 04:45:25 |
|     499 | Sterling Heights           |        103 | 2006-02-15 04:45:25 |
|     529 | Tarsus                     |         97 | 2006-02-15 04:45:25 |
|     570 | Vilnius                    |         56 | 2006-02-15 04:45:25 |
+---------+----------------------------+------------+---------------------+
31 rows in set (0,01 sec)
```

9. Ciudades del country __61__.

```sql
select ci.* from country co
inner join city ci on ci.country_id = co.country_id
where ci.country_id = 61;
+---------+----------+------------+---------------------+
| city_id | city     | country_id | last_update         |
+---------+----------+------------+---------------------+
|     115 | Chisinau |         61 | 2006-02-15 04:45:25 |
+---------+----------+------------+---------------------+
1 row in set (0,00 sec)
```

10. Ciudades del country __Spain__.

```sql
select ci.* from country co
inner join city ci on ci.country_id = co.country_id
where co.country = 'Spain';
+---------+-------------------------+------------+---------------------+
| city_id | city                    | country_id | last_update         |
+---------+-------------------------+------------+---------------------+
|       1 | A Coruña (La Coruña)    |         87 | 2006-02-15 04:45:25 |
|     146 | Donostia-San Sebastián  |         87 | 2006-02-15 04:45:25 |
|     181 | Gijón                   |         87 | 2006-02-15 04:45:25 |
|     388 | Ourense (Orense)        |         87 | 2006-02-15 04:45:25 |
|     459 | Santiago de Compostela  |         87 | 2006-02-15 04:45:25 |
+---------+-------------------------+------------+---------------------+
5 rows in set (0,00 sec)
```

11. Ciudades con nombres compuestos.

```sql
select * from city where city regexp ' ';
+---------+----------------------------+------------+---------------------+
| city_id | city                       | country_id | last_update         |
+---------+----------------------------+------------+---------------------+
|       1 | A Coruña (La Coruña)       |         87 | 2006-02-15 04:45:25 |
|       3 | Abu Dhabi                  |        101 | 2006-02-15 04:45:25 |
|       6 | Addis Abeba                |         31 | 2006-02-15 04:45:25 |
|      18 | Allappuzha (Alleppey)      |         44 | 2006-02-15 04:45:25 |
|      20 | Almirante Brown            |          6 | 2006-02-15 04:45:25 |
|      25 | Angra dos Reis             |         15 | 2006-02-15 04:45:25 |
|      28 | Aparecida de Goiânia       |         15 | 2006-02-15 04:45:25 |
|      41 | Augusta-Richmond County    |        103 | 2006-02-15 04:45:25 |
|      45 | Bahía Blanca               |          6 | 2006-02-15 04:45:25 |
|      53 | Bandar Seri Begawan        |         16 | 2006-02-15 04:45:25 |
|      57 | Bat Yam                    |         48 | 2006-02-15 04:45:25 |
|      69 | Benin City                 |         69 | 2006-02-15 04:45:25 |
|      71 | Berhampore (Baharampur)    |         44 | 2006-02-15 04:45:25 |
|      84 | Boa Vista                  |         15 | 2006-02-15 04:45:25 |
|     100 | Cam Ranh                   |        105 | 2006-02-15 04:45:25 |
|     101 | Cape Coral                 |        103 | 2006-02-15 04:45:25 |
|     111 | Charlotte Amalie           |        106 | 2006-02-15 04:45:25 |
|     120 | Citrus Heights             |        103 | 2006-02-15 04:45:25 |
|     121 | Città del Vaticano         |         41 | 2006-02-15 04:45:25 |
|     122 | Ciudad del Este            |         73 | 2006-02-15 04:45:25 |
|     124 | Coacalco de Berriozábal    |         60 | 2006-02-15 04:45:25 |
|     141 | Deba Habe                  |         69 | 2006-02-15 04:45:25 |
|     144 | Dhule (Dhulia)             |         44 | 2006-02-15 04:45:25 |
|     146 | Donostia-San Sebastián     |         87 | 2006-02-15 04:45:25 |
|     147 | Dos Quebradas              |         24 | 2006-02-15 04:45:25 |
|     153 | El Alto                    |         14 | 2006-02-15 04:45:25 |
|     154 | El Fuerte                  |         60 | 2006-02-15 04:45:25 |
|     155 | El Monte                   |        103 | 2006-02-15 04:45:25 |
|     177 | Garden Grove               |        103 | 2006-02-15 04:45:25 |
|     185 | Grand Prairie              |        103 | 2006-02-15 04:45:25 |
|     190 | Águas Lindas de Goiás      |         15 | 2006-02-15 04:45:25 |
|     212 | Huejutla de Reyes          |         60 | 2006-02-15 04:45:25 |
|     233 | Jalib al-Shuyukh           |         53 | 2006-02-15 04:45:25 |
|     246 | José Azueta                |         60 | 2006-02-15 04:45:25 |
|     247 | Juazeiro do Norte          |         15 | 2006-02-15 04:45:25 |
|     248 | Juiz de Fora               |         15 | 2006-02-15 04:45:25 |
|     262 | Kansas City                |        103 | 2006-02-15 04:45:25 |
|     279 | Kowloon and New Kowloon    |         42 | 2006-02-15 04:45:25 |
|     288 | La Paz                     |         60 | 2006-02-15 04:45:25 |
|     289 | La Plata                   |          6 | 2006-02-15 04:45:25 |
|     290 | La Romana                  |         27 | 2006-02-15 04:45:25 |
|     297 | Le Mans                    |         34 | 2006-02-15 04:45:25 |
|     324 | Mandi Bahauddin            |         72 | 2006-02-15 04:45:25 |
|     337 | Mit Ghamr                  |         29 | 2006-02-15 04:45:25 |
|     346 | Munger (Monghyr)           |         44 | 2006-02-15 04:45:25 |
|     352 | Nabereznyje Tšelny         |         80 | 2006-02-15 04:45:25 |
|     358 | Nakhon Sawan               |         94 | 2006-02-15 04:45:25 |
|     359 | Nam Dinh                   |        105 | 2006-02-15 04:45:25 |
|     366 | Nha Trang                  |        105 | 2006-02-15 04:45:25 |
|     368 | Novi Sad                   |        108 | 2006-02-15 04:45:25 |
|     373 | Ocumare del Tuy            |        104 | 2006-02-15 04:45:25 |
|     388 | Ourense (Orense)           |         87 | 2006-02-15 04:45:25 |
|     393 | Pachuca de Soto            |         60 | 2006-02-15 04:45:25 |
|     394 | Pak Kret                   |         94 | 2006-02-15 04:45:25 |
|     395 | Palghat (Palakkad)         |         44 | 2006-02-15 04:45:25 |
|     396 | Pangkal Pinang             |         45 | 2006-02-15 04:45:25 |
|     406 | Phnom Penh                 |         18 | 2006-02-15 04:45:25 |
|     413 | Poços de Caldas            |         15 | 2006-02-15 04:45:25 |
|     418 | Purnea (Purnia)            |         44 | 2006-02-15 04:45:25 |
|     425 | Rae Bareli                 |         44 | 2006-02-15 04:45:25 |
|     430 | Richmond Hill              |         20 | 2006-02-15 04:45:25 |
|     431 | Rio Claro                  |         15 | 2006-02-15 04:45:25 |
|     441 | Saint Louis                |        103 | 2006-02-15 04:45:25 |
|     449 | San Bernardino             |        103 | 2006-02-15 04:45:25 |
|     450 | San Felipe de Puerto Plata |         27 | 2006-02-15 04:45:25 |
|     451 | San Felipe del Progreso    |         60 | 2006-02-15 04:45:25 |
|     452 | San Juan Bautista Tuxtepec |         60 | 2006-02-15 04:45:25 |
|     453 | San Lorenzo                |         73 | 2006-02-15 04:45:25 |
|     454 | San Miguel de Tucumán      |          6 | 2006-02-15 04:45:25 |
|     456 | Santa Bárbara d´Oeste      |         15 | 2006-02-15 04:45:25 |
|     457 | Santa Fé                   |          6 | 2006-02-15 04:45:25 |
|     458 | Santa Rosa                 |         75 | 2006-02-15 04:45:25 |
|     459 | Santiago de Compostela     |         87 | 2006-02-15 04:45:25 |
|     460 | Santiago de los Caballeros |         27 | 2006-02-15 04:45:25 |
|     461 | Santo André                |         15 | 2006-02-15 04:45:25 |
|     467 | Shahr-e Kord               |         46 | 2006-02-15 04:45:25 |
|     476 | Shubra al-Khayma           |         29 | 2006-02-15 04:45:25 |
|     478 | Siliguri (Shiliguri)       |         44 | 2006-02-15 04:45:25 |
|     485 | São Bernardo do Campo      |         15 | 2006-02-15 04:45:25 |
|     486 | São Leopoldo               |         15 | 2006-02-15 04:45:25 |
|     493 | South Hill                 |          5 | 2006-02-15 04:45:25 |
|     498 | Stara Zagora               |         17 | 2006-02-15 04:45:25 |
|     499 | Sterling Heights           |        103 | 2006-02-15 04:45:25 |
|     507 | Sungai Petani              |         59 | 2006-02-15 04:45:25 |
|     533 | Tel Aviv-Jaffa             |         48 | 2006-02-15 04:45:25 |
|     562 | Valle de la Pascua         |        104 | 2006-02-15 04:45:25 |
|     563 | Valle de Santiago          |         60 | 2006-02-15 04:45:25 |
|     566 | Varanasi (Benares)         |         44 | 2006-02-15 04:45:25 |
|     567 | Vicente López              |          6 | 2006-02-15 04:45:25 |
|     569 | Vila Velha                 |         15 | 2006-02-15 04:45:25 |
|     572 | Vitória de Santo Antão     |         15 | 2006-02-15 04:45:25 |
|     582 | Yamuna Nagar               |         44 | 2006-02-15 04:45:25 |
+---------+----------------------------+------------+---------------------+
92 rows in set (0,00 sec)
```

12. Películas con una duración entre __80 y 100__.

```sql
select title from film where length between 80 and 100;
+-------------------------+--------+
| title                   | length |
+-------------------------+--------+
| ACADEMY DINOSAUR        |     86 |
| ALICE FANTASIA          |     94 |
| ALONE TRIP              |     82 |
| AMISTAD MIDSUMMER       |     85 |
| ANACONDA CONFESSIONS    |     92 |
| ANNIE IDENTITY          |     86 |
| ANTHEM LUKE             |     91 |
| ANYTHING SAVANNAH       |     82 |
| APACHE DIVINE           |     92 |
| ARMAGEDDON LOST         |     99 |
| ATTRACTION NEWTON       |     83 |
| BANG KWAI               |     87 |
| BASIC EASY              |     90 |
| BEAST HUNCHBACK         |     89 |
| BEHAVIOR RUNAWAY        |    100 |
| BEVERLY OUTLAW          |     85 |
| BILKO ANONYMOUS         |    100 |
| BILL OTHERS             |     93 |
| BLACKOUT PRIVATE        |     85 |
| BOUND CHEAPER           |     98 |
| BUTTERFLY CHOCOLAT      |     89 |
| CANYON STOCK            |     85 |
| CARIBBEAN LIBERTY       |     92 |
| CASABLANCA SUPER        |     85 |
| CHEAPER CLYDE           |     87 |
| CIRCUS YOUTH            |     90 |
| CLASH FREDDY            |     81 |
| CLUELESS BUCKET         |     95 |
| CONGENIALITY QUEST      |     87 |
| CORE SUIT               |     92 |
| DAISY MENAGERIE         |     84 |
| DARES PLUTO             |     89 |
| DARKNESS WAR            |     99 |
| DELIVERANCE MULHOLLAND  |    100 |
| DESPERATE TRAINSPOTTING |     81 |
| DETAILS PACKER          |     88 |
| DEVIL DESIRE            |     87 |
| DISTURBING SCARFACE     |     94 |
| DIVINE RESURRECTION     |    100 |
| DRUMS DYNAMITE          |     96 |
| EARLY HOME              |     96 |
| EARRING INSTINCT        |     98 |
| EARTH VISION            |     85 |
| EGYPT TENENBAUMS        |     85 |
| ENCOUNTERS CURTAIN      |     92 |
| ENDING CROWDS           |     85 |
| EXPENDABLE STALLION     |     97 |
| FATAL HAUNTED           |     91 |
| FEUD FROGMEN            |     98 |
| FIGHT JAWBREAKER        |     91 |
| FLAMINGOS CONNECTICUT   |     80 |
| FLATLINERS KILLER       |    100 |
| FORWARD TEMPLE          |     90 |
| FRENCH HOLIDAY          |     99 |
| FROST HEAD              |     82 |
| FUGITIVE MAGUIRE        |     83 |
| FULL FLATLINERS         |     94 |
| GANDHI KWAI             |     86 |
| GARDEN ISLAND           |     80 |
| GHOST GROUNDHOG         |     85 |
| GLEAMING JAWBREAKER     |     89 |
| GOLDFINGER SENSIBILITY  |     93 |
| GONE TROUBLE            |     84 |
| GRAIL FRANKENSTEIN      |     85 |
| GREATEST NORTH          |     93 |
| GUN BONNIE              |    100 |
| GUYS FALCON             |     84 |
| HAPPINESS UNITED        |    100 |
| HIGH ENCINO             |     84 |
| HILLS NEIGHBORS         |     93 |
| HOLY TADPOLE            |     88 |
| HONEY TIES              |     84 |
| HORN WORKING            |     95 |
| HUSTLER PARTY           |     83 |
| HYDE DOCTOR             |    100 |
| IDOLS SNATCHERS         |     84 |
| INVASION CYCLONE        |     97 |
| ISLAND EXORCIST         |     84 |
| JEEPERS WEDDING         |     84 |
| KANE EXORCIST           |     92 |
| LICENSE WEEKEND         |     91 |
| LOLA AGENT              |     85 |
| LOSER HUSTLER           |     80 |
| LOST BIRD               |     98 |
| LUCKY FLYING            |     97 |
| MADRE GABLES            |     98 |
| MEET CHOCOLATE          |     80 |
| MIDNIGHT WESTWARD       |     86 |
| MOON BUNCH              |     83 |
| MYSTIC TRUMAN           |     92 |
| NATIONAL STORY          |     92 |
| NONE SPIKING            |     83 |
| OPPOSITE NECKLACE       |     92 |
| OZ LIAISONS             |     85 |
| PACKER MADIGAN          |     84 |
| PANKY SUBMARINE         |     93 |
| PATIENT SISTER          |     99 |
| PEAK FOREVER            |     80 |
| PERDITION FARGO         |     99 |
| PERFECT GROOVE          |     82 |
| PET HAUNTING            |     99 |
| PIRATES ROXANNE         |    100 |
| PLUTO OLEANDER          |     84 |
| PREJUDICE OLEANDER      |     98 |
| PULP BEVERLY            |     89 |
| PUNK DIVORCE            |    100 |
| PURPLE MOVIE            |     88 |
| RAIDERS ANTITRUST       |     82 |
| REAR TRADING            |     97 |
| REIGN GENTLEMEN         |     82 |
| ROMAN PUNK              |     81 |
| ROOTS REMEMBER          |     89 |
| SABRINA MIDNIGHT        |     99 |
| SADDLE ANTITRUST        |     80 |
| SAVANNAH TOWN           |     84 |
| SEA VIRGIN              |     80 |
| SECRET GROUNDHOG        |     90 |
| SENSIBILITY REAR        |     98 |
| SHANE DARKNESS          |     93 |
| SHAWSHANK BUBBLE        |     80 |
| SLEUTH ORIENT           |     87 |
| SLING LUKE              |     84 |
| STAGE WORLD             |     85 |
| STING PERSONAL          |     93 |
| STONE FIRE              |     94 |
| SUICIDES SILENCE        |     93 |
| SUNDANCE INVASION       |     92 |
| TARZAN VIDEOTAPE        |     91 |
| TENENBAUMS COMMAND      |     99 |
| TERMINATOR CLUB         |     88 |
| TITANS JERK             |     91 |
| TREATMENT JEKYLL        |     87 |
| TRUMAN CRAZY            |     92 |
| TURN STAR               |     80 |
| TYCOON GATHERING        |     82 |
| UPTOWN YOUNG            |     84 |
| VARSITY TRIP            |     85 |
| VERTIGO NORTHWEST       |     90 |
| WAR NOTTING             |     80 |
| WARLOCK WEREWOLF        |     83 |
| WASTELAND DIVINE        |     85 |
| WINDOW SIDE             |     85 |
| WISDOM WORKER           |     98 |
| WITCHES PANIC           |    100 |
| WONKA SEA               |     85 |
| WYOMING STORM           |    100 |
| YENTL IDAHO             |     86 |
+-------------------------+--------+
147 rows in set (0,00 sec)
```

13. Peliculas con un rental_rate entre __1 y 3__.

```sql
select title, rental_rate from film where rental_rate between 1 and 3;
+-----------------------------+-------------+
| title                       | rental_rate |
+-----------------------------+-------------+
| ADAPTATION HOLES            |        2.99 |
| AFFAIR PREJUDICE            |        2.99 |
| AFRICAN EGG                 |        2.99 |
| AGENT TRUMAN                |        2.99 |
| ALABAMA DEVIL               |        2.99 |
| ALIEN CENTER                |        2.99 |
| ALLEY EVOLUTION             |        2.99 |
| AMISTAD MIDSUMMER           |        2.99 |
| ANALYZE HOOSIERS            |        2.99 |
| ANGELS LIFE                 |        2.99 |
| ANTITRUST TOMATOES          |        2.99 |
| ANYTHING SAVANNAH           |        2.99 |
| APOLLO TEEN                 |        2.99 |
| ARACHNOPHOBIA ROLLERCOASTER |        2.99 |
| ARIZONA BANG                |        2.99 |
| ARTIST COLDBLOODED          |        2.99 |
| ATLANTIS CAUSE              |        2.99 |
| BADMAN DAWN                 |        2.99 |
| BAKED CLEOPATRA             |        2.99 |
| BALLOON HOMEWARD            |        2.99 |
| BANG KWAI                   |        2.99 |
| BARBARELLA STREETCAR        |        2.99 |
| BAREFOOT MANCHURIAN         |        2.99 |
| BASIC EASY                  |        2.99 |
| BEACH HEARTBREAKERS         |        2.99 |
| BEAR GRACELAND              |        2.99 |
| BED HIGHBALL                |        2.99 |
| BERETS AGENT                |        2.99 |
| BEVERLY OUTLAW              |        2.99 |
| BILL OTHERS                 |        2.99 |
| BINGO TALENTED              |        2.99 |
| BLACKOUT PRIVATE            |        2.99 |
| BLANKET BEVERLY             |        2.99 |
| BLUES INSTINCT              |        2.99 |
| BRAVEHEART HUMAN            |        2.99 |
| BREAKING HOME               |        2.99 |
| BRINGING HYSTERICAL         |        2.99 |
| BUGSY SONG                  |        2.99 |
| BULWORTH COMMANDMENTS       |        2.99 |
| BUNCH MINDS                 |        2.99 |
| CAMPUS REMEMBER             |        2.99 |
| CANDIDATE PERDITION         |        2.99 |
| CAROL TEXAS                 |        2.99 |
| CASSIDY WYOMING             |        2.99 |
| CAUSE DATE                  |        2.99 |
| CHANCE RESURRECTION         |        2.99 |
| CHAPLIN LICENSE             |        2.99 |
| CHARADE DUFFEL              |        2.99 |
| CHARIOTS CONSPIRACY         |        2.99 |
| CHITTY LOCK                 |        2.99 |
| CHOCOLATE DUCK              |        2.99 |
| CIDER DESIRE                |        2.99 |
| CIRCUS YOUTH                |        2.99 |
| CLASH FREDDY                |        2.99 |
| CLONES PINOCCHIO            |        2.99 |
| CLUELESS BUCKET             |        2.99 |
| COLOR PHILADELPHIA          |        2.99 |
| COMFORTS RUSH               |        2.99 |
| CONFUSED CANDLES            |        2.99 |
| CONSPIRACY SPIRIT           |        2.99 |
| CONTACT ANONYMOUS           |        2.99 |
| CORE SUIT                   |        2.99 |
| COWBOY DOOM                 |        2.99 |
| CRANES RESERVOIR            |        2.99 |
| CRAZY HOME                  |        2.99 |
| CROSSROADS CASUALTIES       |        2.99 |
| CRUSADE HONEY               |        2.99 |
| CRYSTAL BREAKING            |        2.99 |
| CUPBOARD SINNERS            |        2.99 |
| CYCLONE FAMILY              |        2.99 |
| DARES PLUTO                 |        2.99 |
| DARKNESS WAR                |        2.99 |
| DEER VIRGINIAN              |        2.99 |
| DESIRE ALIEN                |        2.99 |
| DIARY PANIC                 |        2.99 |
| DINOSAUR SECRETARY          |        2.99 |
| DIRTY ACE                   |        2.99 |
| DISTURBING SCARFACE         |        2.99 |
| DIVIDE MONSTER              |        2.99 |
| DIVINE RESURRECTION         |        2.99 |
| DIVORCE SHINING             |        2.99 |
| DOCTOR GRAIL                |        2.99 |
| DOLLS RAGE                  |        2.99 |
| DREAM PICKUP                |        2.99 |
| DRIVER ANNIE                |        2.99 |
| DUCK RACER                  |        2.99 |
| DWARFS ALTER                |        2.99 |
| EGG IGBY                    |        2.99 |
| ENOUGH RAGING               |        2.99 |
| ESCAPE METROPOLIS           |        2.99 |
| EXORCIST STING              |        2.99 |
| EXPRESS LONELY              |        2.99 |
| EXTRAORDINARY CONQUERER     |        2.99 |
| EYES DRIVING                |        2.99 |
| FANTASIA PARK               |        2.99 |
| FARGO GANDHI                |        2.99 |
| FATAL HAUNTED               |        2.99 |
| FERRIS MOTHER               |        2.99 |
| FISH OPUS                   |        2.99 |
| FLATLINERS KILLER           |        2.99 |
| FLOATS GARDEN               |        2.99 |
| FLYING HOOK                 |        2.99 |
| FOREVER CANDIDATE           |        2.99 |
| FORREST SONS                |        2.99 |
| FORWARD TEMPLE              |        2.99 |
| FREAKY POCUS                |        2.99 |
| FRIDA SLIPPER               |        2.99 |
| FULL FLATLINERS             |        2.99 |
| GANGS PRIDE                 |        2.99 |
| GASLIGHT CRUSADE            |        2.99 |
| GENTLEMEN STAGE             |        2.99 |
| GIANT TROOPERS              |        2.99 |
| GLEAMING JAWBREAKER         |        2.99 |
| GLORY TRACY                 |        2.99 |
| GODFATHER DIARY             |        2.99 |
| GONE TROUBLE                |        2.99 |
| GORGEOUS BINGO              |        2.99 |
| GRADUATE LORD               |        2.99 |
| GRAIL FRANKENSTEIN          |        2.99 |
| GREATEST NORTH              |        2.99 |
| GREEK EVERYONE              |        2.99 |
| GUNFIGHTER MUSSOLINI        |        2.99 |
| HALF OUTFIELD               |        2.99 |
| HALLOWEEN NUTS              |        2.99 |
| HAMLET WISDOM               |        2.99 |
| HANKY OCTOBER               |        2.99 |
| HAPPINESS UNITED            |        2.99 |
| HARDLY ROBBERS              |        2.99 |
| HEAVEN FREEDOM              |        2.99 |
| HEDWIG ALTER                |        2.99 |
| HELLFIGHTERS SIERRA         |        2.99 |
| HIGH ENCINO                 |        2.99 |
| HOCUS FRIDA                 |        2.99 |
| HOMICIDE PEACH              |        2.99 |
| HOOSIERS BIRDCAGE           |        2.99 |
| HOPE TOOTSIE                |        2.99 |
| HORN WORKING                |        2.99 |
| HOUSE DYNAMITE              |        2.99 |
| HUMAN GRAFFITI              |        2.99 |
| HUNTER ALTER                |        2.99 |
| HUNTING MUSKETEERS          |        2.99 |
| HURRICANE AFFAIR            |        2.99 |
| HYDE DOCTOR                 |        2.99 |
| ICE CROSSING                |        2.99 |
| IDAHO LOVE                  |        2.99 |
| IDENTITY LOVER              |        2.99 |
| IDOLS SNATCHERS             |        2.99 |
| IMAGE PRINCESS              |        2.99 |
| INSIDER ARIZONA             |        2.99 |
| INSTINCT AIRPORT            |        2.99 |
| INTENTIONS EMPIRE           |        2.99 |
| INVASION CYCLONE            |        2.99 |
| ISLAND EXORCIST             |        2.99 |
| JACKET FRISCO               |        2.99 |
| JADE BUNCH                  |        2.99 |
| JASON TRAP                  |        2.99 |
| JAWS HARRY                  |        2.99 |
| JEEPERS WEDDING             |        2.99 |
| JEKYLL FROGMEN              |        2.99 |
| JERICHO MULAN               |        2.99 |
| JERK PAYCHECK               |        2.99 |
| JUMANJI BLADE               |        2.99 |
| KENTUCKIAN GIANT            |        2.99 |
| KILLER INNOCENT             |        2.99 |
| KNOCK WARLOCK               |        2.99 |
| KRAMER CHOCOLATE            |        2.99 |
| LABYRINTH LEAGUE            |        2.99 |
| LEATHERNECKS DWARFS         |        2.99 |
| LEBOWSKI SOLDIERS           |        2.99 |
| LIBERTY MAGNIFICENT         |        2.99 |
| LICENSE WEEKEND             |        2.99 |
| LIFE TWISTED                |        2.99 |
| LOCK REAR                   |        2.99 |
| LOLITA WORLD                |        2.99 |
| LONELY ELEPHANT             |        2.99 |
| LORD ARIZONA                |        2.99 |
| LOST BIRD                   |        2.99 |
| LOVELY JINGLE               |        2.99 |
| LOVER TRUMAN                |        2.99 |
| LUCK OPUS                   |        2.99 |
| LUCKY FLYING                |        2.99 |
| LUKE MUMMY                  |        2.99 |
| LUST LOCK                   |        2.99 |
| MADISON TRAP                |        2.99 |
| MADRE GABLES                |        2.99 |
| MAGNIFICENT CHITTY          |        2.99 |
| MAGUIRE APACHE              |        2.99 |
| MALKOVICH PET               |        2.99 |
| MANCHURIAN CURTAIN          |        2.99 |
| MANNEQUIN WORST             |        2.99 |
| MARRIED GO                  |        2.99 |
| MASK PEACH                  |        2.99 |
| MASSAGE IMAGE               |        2.99 |
| MEET CHOCOLATE              |        2.99 |
| MENAGERIE RUSHMORE          |        2.99 |
| METAL ARMAGEDDON            |        2.99 |
| METROPOLIS COMA             |        2.99 |
| MICROCOSMOS PARADISE        |        2.99 |
| MIGHTY LUCK                 |        2.99 |
| MIRACLE VIRTUAL             |        2.99 |
| MIXED DOORS                 |        2.99 |
| MONEY HAROLD                |        2.99 |
| MONSTER SPARTACUS           |        2.99 |
| MULHOLLAND BEAST            |        2.99 |
| MURDER ANTITRUST            |        2.99 |
| MUSCLE BRIGHT               |        2.99 |
| MUSSOLINI SPOILERS          |        2.99 |
| NASH CHOCOLAT               |        2.99 |
| NATIONAL STORY              |        2.99 |
| NEMO CAMPUS                 |        2.99 |
| NETWORK PEAK                |        2.99 |
| NOON PAPI                   |        2.99 |
| NORTHWEST POLISH            |        2.99 |
| OPERATION OPERATION         |        2.99 |
| ORDER BETRAYED              |        2.99 |
| ORIENT CLOSER               |        2.99 |
| OSCAR GOLD                  |        2.99 |
| OTHERS SOUP                 |        2.99 |
| OZ LIAISONS                 |        2.99 |
| PARADISE SABRINA            |        2.99 |
| PARIS WEEKEND               |        2.99 |
| PARTY KNOCK                 |        2.99 |
| PATRIOT ROMAN               |        2.99 |
| PATTON INTERVIEW            |        2.99 |
| PEACH INNOCENT              |        2.99 |
| PEARL DESTINY               |        2.99 |
| PERFECT GROOVE              |        2.99 |
| PHANTOM GLORY               |        2.99 |
| PICKUP DRIVING              |        2.99 |
| PILOT HOOSIERS              |        2.99 |
| PIZZA JUMANJI               |        2.99 |
| POLLOCK DELIVERANCE         |        2.99 |
| POND SEATTLE                |        2.99 |
| POTLUCK MIXED               |        2.99 |
| POTTER CONNECTICUT          |        2.99 |
| PRINCESS GIANT              |        2.99 |
| PRIX UNDEFEATED             |        2.99 |
| PSYCHO SHRUNK               |        2.99 |
| PULP BEVERLY                |        2.99 |
| PURE RUNNER                 |        2.99 |
| PURPLE MOVIE                |        2.99 |
| QUEST MUSSOLINI             |        2.99 |
| RACER EGG                   |        2.99 |
| RANDOM GO                   |        2.99 |
| REAP UNFAITHFUL             |        2.99 |
| REDEMPTION COMFORTS         |        2.99 |
| REIGN GENTLEMEN             |        2.99 |
| REMEMBER DIARY              |        2.99 |
| RESERVOIR ADAPTATION        |        2.99 |
| RIDER CADDYSHACK            |        2.99 |
| ROBBERS JOON                |        2.99 |
| ROLLERCOASTER BRINGING      |        2.99 |
| RUSHMORE MERMAID            |        2.99 |
| SADDLE ANTITRUST            |        2.99 |
| SAGEBRUSH CLUELESS          |        2.99 |
| SAINTS BRIDE                |        2.99 |
| SALUTE APOLLO               |        2.99 |
| SAMURAI LION                |        2.99 |
| SANTA PARIS                 |        2.99 |
| SCISSORHANDS SLUMS          |        2.99 |
| SEA VIRGIN                  |        2.99 |
| SEABISCUIT PUNK             |        2.99 |
| SEARCHERS WAIT              |        2.99 |
| SHAKESPEARE SADDLE          |        2.99 |
| SHANE DARKNESS              |        2.99 |
| SHANGHAI TYCOON             |        2.99 |
| SHIP WONDERLAND             |        2.99 |
| SHOCK CABIN                 |        2.99 |
| SHREK LICENSE               |        2.99 |
| SHRUNK DIVINE               |        2.99 |
| SINNERS ATLANTIS            |        2.99 |
| SKY MIRACLE                 |        2.99 |
| SLEEPY JAPANESE             |        2.99 |
| SMILE EARRING               |        2.99 |
| SNATCHERS MONTEZUMA         |        2.99 |
| SONS INTERVIEW              |        2.99 |
| SOUTH WAIT                  |        2.99 |
| SPEAKEASY DATE              |        2.99 |
| SPIKING ELEMENT             |        2.99 |
| SPINAL ROCKY                |        2.99 |
| SPY MILE                    |        2.99 |
| SQUAD FISH                  |        2.99 |
| STAGE WORLD                 |        2.99 |
| STAR OPERATION              |        2.99 |
| STATE WASTELAND             |        2.99 |
| STOCK GLASS                 |        2.99 |
| STRICTLY SCARFACE           |        2.99 |
| SUSPECTS QUILLS             |        2.99 |
| SWEET BROTHERHOOD           |        2.99 |
| TADPOLE PARK                |        2.99 |
| TARZAN VIDEOTAPE            |        2.99 |
| TELEMARK HEARTBREAKERS      |        2.99 |
| TOMORROW HUSTLER            |        2.99 |
| TOWN ARK                    |        2.99 |
| TROJAN TOMORROW             |        2.99 |
| TROUBLE DATE                |        2.99 |
| TURN STAR                   |        2.99 |
| TUXEDO MILE                 |        2.99 |
| UNCUT SUICIDES              |        2.99 |
| UNFAITHFUL KILL             |        2.99 |
| UNTOUCHABLES SUNRISE        |        2.99 |
| UPRISING UPTOWN             |        2.99 |
| UPTOWN YOUNG                |        2.99 |
| VACATION BOONDOCK           |        2.99 |
| VANISHING ROCKY             |        2.99 |
| VARSITY TRIP                |        2.99 |
| VERTIGO NORTHWEST           |        2.99 |
| WAGON JAWS                  |        2.99 |
| WARDROBE PHANTOM            |        2.99 |
| WARLOCK WEREWOLF            |        2.99 |
| WARS PLUTO                  |        2.99 |
| WASTELAND DIVINE            |        2.99 |
| WEEKEND PERSONAL            |        2.99 |
| WILLOW TRACY                |        2.99 |
| WINDOW SIDE                 |        2.99 |
| WON DARES                   |        2.99 |
| WONDERFUL DROP              |        2.99 |
| WONKA SEA                   |        2.99 |
| WORDS HUNTER                |        2.99 |
| WORKER TARZAN               |        2.99 |
| WORST BANGER                |        2.99 |
| WRONG BEHAVIOR              |        2.99 |
| ZOOLANDER FICTION           |        2.99 |
+-----------------------------+-------------+
323 rows in set (0,00 sec)
```

14. Películas con un titulo de más de __12 letras__.

```sql
select title from film where length(title) > 12;
+-----------------------------+
| title                       |
+-----------------------------+
| ACADEMY DINOSAUR            |
| ACE GOLDFINGER              |
| ADAPTATION HOLES            |
| AFFAIR PREJUDICE            |
| AIRPLANE SIERRA             |
| AIRPORT POLLOCK             |
| ALABAMA DEVIL               |
| ALADDIN CALENDAR            |
| ALAMO VIDEOTAPE             |
| ALASKA PHANTOM              |
| ALICE FANTASIA              |
| ALLEY EVOLUTION             |
| ALTER VICTORY               |
| AMELIE HELLFIGHTERS         |
| AMERICAN CIRCUS             |
| AMISTAD MIDSUMMER           |
| ANACONDA CONFESSIONS        |
| ANALYZE HOOSIERS            |
| ANNIE IDENTITY              |
| ANONYMOUS HUMAN             |
| ANTITRUST TOMATOES          |
| ANYTHING SAVANNAH           |
| APACHE DIVINE               |
| APOCALYPSE FLAMINGOS        |
| ARACHNOPHOBIA ROLLERCOASTER |
| ARGONAUTS TOWN              |
| ARK RIDGEMONT               |
| ARMAGEDDON LOST             |
| ARMY FLINTSTONES            |
| ARSENIC INDEPENDENCE        |
| ARTIST COLDBLOODED          |
| ATLANTIS CAUSE              |
| ATTRACTION NEWTON           |
| BACKLASH UNDEFEATED         |
| BAKED CLEOPATRA             |
| BALLOON HOMEWARD            |
| BALLROOM MOCKINGBIRD        |
| BANGER PINOCCHIO            |
| BARBARELLA STREETCAR        |
| BAREFOOT MANCHURIAN         |
| BEACH HEARTBREAKERS         |
| BEAR GRACELAND              |
| BEAST HUNCHBACK             |
| BEAUTY GREASE               |
| BEDAZZLED MARRIED           |
| BEETHOVEN EXORCIST          |
| BEHAVIOR RUNAWAY            |
| BETRAYED REAR               |
| BEVERLY OUTLAW              |
| BIKINI BORROWERS            |
| BILKO ANONYMOUS             |
| BINGO TALENTED              |
| BIRCH ANTITRUST             |
| BIRD INDEPENDENCE           |
| BIRDCAGE CASPER             |
| BIRDS PERDITION             |
| BLACKOUT PRIVATE            |
| BLANKET BEVERLY             |
| BLINDNESS GUN               |
| BLOOD ARGONAUTS             |
| BLUES INSTINCT              |
| BONNIE HOLOCAUST            |
| BOOGIE AMELIE               |
| BOONDOCK BALLROOM           |
| BORROWERS BEDAZZLED         |
| BOULEVARD MOB               |
| BOUND CHEAPER               |
| BOWFINGER GABLES            |
| BRANNIGAN SUNRISE           |
| BRAVEHEART HUMAN            |
| BREAKFAST GOLDFINGER        |
| BREAKING HOME               |
| BRIDE INTRIGUE              |
| BRIGHT ENCOUNTERS           |
| BRINGING HYSTERICAL         |
| BROOKLYN DESERT             |
| BROTHERHOOD BLANKET         |
| BUBBLE GROSSE               |
| BUCKET BROTHERHOOD          |
| BULL SHAWSHANK              |
| BULWORTH COMMANDMENTS       |
| BUTCH PANTHER               |
| BUTTERFLY CHOCOLAT          |
| CADDYSHACK JEDI             |
| CALENDAR GUNFIGHT           |
| CALIFORNIA BIRDS            |
| CAMELOT VACATION            |
| CAMPUS REMEMBER             |
| CANDIDATE PERDITION         |
| CANDLES GRAPES              |
| CAPER MOTIONS               |
| CARIBBEAN LIBERTY           |
| CASABLANCA SUPER            |
| CASPER DRAGONFLY            |
| CASSIDY WYOMING             |
| CASUALTIES ENCINO           |
| CAT CONEHEADS               |
| CATCH AMISTAD               |
| CELEBRITY HORN              |
| CENTER DINOSAUR             |
| CHAINSAW UPTOWN             |
| CHAMBER ITALIAN             |
| CHAMPION FLATLINERS         |
| CHANCE RESURRECTION         |
| CHAPLIN LICENSE             |
| CHARADE DUFFEL              |
| CHARIOTS CONSPIRACY         |
| CHASING FIGHT               |
| CHEAPER CLYDE               |
| CHICAGO NORTH               |
| CHICKEN HELLFIGHTERS        |
| CHINATOWN GLADIATOR         |
| CHISUM BEHAVIOR             |
| CHOCOLAT HARRY              |
| CHOCOLATE DUCK              |
| CHRISTMAS MOONSHINE         |
| CINCINATTI WHISPERER        |
| CITIZEN SHREK               |
| CLEOPATRA DEVIL             |
| CLERKS ANGELS               |
| CLOCKWORK PARADISE          |
| CLONES PINOCCHIO            |
| CLUB GRAFFITI               |
| CLUELESS BUCKET             |
| COAST RAINBOW               |
| COLDBLOODED DARLING         |
| COLOR PHILADELPHIA          |
| COMANCHEROS ENEMY           |
| COMFORTS RUSH               |
| COMMAND DARLING             |
| COMMANDMENTS EXPRESS        |
| CONEHEADS SMOOCHY           |
| CONFESSIONS MAGUIRE         |
| CONFIDENTIAL INTERVIEW      |
| CONFUSED CANDLES            |
| CONGENIALITY QUEST          |
| CONNECTICUT TRAMP           |
| CONNECTION MICROCOSMOS      |
| CONQUERER NUTS              |
| CONSPIRACY SPIRIT           |
| CONTACT ANONYMOUS           |
| CONTROL ANTHEM              |
| CONVERSATION DOWNHILL       |
| CRAFT OUTFIELD              |
| CRANES RESERVOIR            |
| CREATURES SHAKESPEARE       |
| CREEPERS KANE               |
| CROOKED FROGMEN             |
| CROSSING DIVORCE            |
| CROSSROADS CASUALTIES       |
| CROWDS TELEMARK             |
| CRUELTY UNFORGIVEN          |
| CRUSADE HONEY               |
| CRYSTAL BREAKING            |
| CUPBOARD SINNERS            |
| CURTAIN VIDEOTAPE           |
| CYCLONE FAMILY              |
| DADDY PITTSBURGH            |
| DAISY MENAGERIE             |
| DALMATIONS SWEDEN           |
| DANCING FEVER               |
| DANGEROUS UPTOWN            |
| DARLING BREAKING            |
| DARN FORRESTER              |
| DAUGHTER MADIGAN            |
| DAY UNFAITHFUL              |
| DECEIVER BETRAYED           |
| DEER VIRGINIAN              |
| DELIVERANCE MULHOLLAND      |
| DESERT POSEIDON             |
| DESPERATE TRAINSPOTTING     |
| DESTINATION JERK            |
| DESTINY SATURDAY            |
| DETAILS PACKER              |
| DETECTIVE VISION            |
| DINOSAUR SECRETARY          |
| DISCIPLE MOTHER             |
| DISTURBING SCARFACE         |
| DIVIDE MONSTER              |
| DIVINE RESURRECTION         |
| DIVORCE SHINING             |
| DOORS PRESIDENT             |
| DORADO NOTTING              |
| DOUBTFIRE LABYRINTH         |
| DOWNHILL ENOUGH             |
| DRACULA CRYSTAL             |
| DRAGONFLY STRANGERS         |
| DRIFTER COMMANDMENTS        |
| DRIVING POLISH              |
| DROP WATERFRONT             |
| DRUMLINE CYCLONE            |
| DRUMS DYNAMITE              |
| DUDE BLINDNESS              |
| DUFFEL APOCALYPSE           |
| DYNAMITE TARZAN             |
| EARRING INSTINCT            |
| EASY GLADIATOR              |
| EFFECT GLADIATOR            |
| EGYPT TENENBAUMS            |
| ELEMENT FREDDY              |
| ELEPHANT TROJAN             |
| ELIZABETH SHANE             |
| EMPIRE MALKOVICH            |
| ENCOUNTERS CURTAIN          |
| ENDING CROWDS               |
| ENGLISH BULWORTH            |
| ENOUGH RAGING               |
| ENTRAPMENT SATISFACTION     |
| ESCAPE METROPOLIS           |
| EVE RESURRECTION            |
| EVERYONE CRAFT              |
| EVOLUTION ALTER             |
| EXCITEMENT EVE              |
| EXORCIST STING              |
| EXPECATIONS NATURAL         |
| EXPENDABLE STALLION         |
| EXPRESS LONELY              |
| EXTRAORDINARY CONQUERER     |
| FACTORY DRAGON              |
| FALCON VOLUME               |
| FANTASIA PARK               |
| FANTASY TROOPERS            |
| FATAL HAUNTED               |
| FEATHERS METAL              |
| FELLOWSHIP AUTUMN           |
| FERRIS MOTHER               |
| FICTION CHRISTMAS           |
| FIDELITY DEVIL              |
| FIGHT JAWBREAKER            |
| FINDING ANACONDA            |
| FIREBALL PHILADELPHIA       |
| FIREHOUSE VIETNAM           |
| FLAMINGOS CONNECTICUT       |
| FLATLINERS KILLER           |
| FLINTSTONES HAPPINESS       |
| FLOATS GARDEN               |
| FOOL MOCKINGBIRD            |
| FOREVER CANDIDATE           |
| FORRESTER COMANCHEROS       |
| FORWARD TEMPLE              |
| FRANKENSTEIN STRANGER       |
| FREEDOM CLEOPATRA           |
| FRENCH HOLIDAY              |
| FRIDA SLIPPER               |
| FRISCO FORREST              |
| FROGMEN BREAKING            |
| FRONTIER CABIN              |
| FUGITIVE MAGUIRE            |
| FULL FLATLINERS             |
| GABLES METROPOLIS           |
| GALAXY SWEETHEARTS          |
| GAMES BOWFINGER             |
| GARDEN ISLAND               |
| GASLIGHT CRUSADE            |
| GATHERING CALENDAR          |
| GENTLEMEN STAGE             |
| GHOST GROUNDHOG             |
| GHOSTBUSTERS ELF            |
| GIANT TROOPERS              |
| GILBERT PELICAN             |
| GILMORE BOILED              |
| GLADIATOR WESTWARD          |
| GLEAMING JAWBREAKER         |
| GODFATHER DIARY             |
| GOLDFINGER SENSIBILITY      |
| GOLDMINE TYCOON             |
| GOODFELLAS SALUTE           |
| GORGEOUS BINGO              |
| GOSFORD DONNIE              |
| GRACELAND DYNAMITE          |
| GRADUATE LORD               |
| GRAFFITI LOVE               |
| GRAIL FRANKENSTEIN          |
| GREATEST NORTH              |
| GREEK EVERYONE              |
| GRINCH MASSAGE              |
| GRIT CLOCKWORK              |
| GROOVE FICTION              |
| GROSSE WONDERFUL            |
| GROUNDHOG UNCUT             |
| GUNFIGHT MOON               |
| GUNFIGHTER MUSSOLINI        |
| HALF OUTFIELD               |
| HALLOWEEN NUTS              |
| HAMLET WISDOM               |
| HANDICAP BOONDOCK           |
| HANKY OCTOBER               |
| HANOVER GALAXY              |
| HAPPINESS UNITED            |
| HARDLY ROBBERS              |
| HAROLD FRENCH               |
| HATE HANDICAP               |
| HAUNTED ANTITRUST           |
| HAUNTING PIANIST            |
| HEAD STRANGER               |
| HEARTBREAKERS BRIGHT        |
| HEAVEN FREEDOM              |
| HEAVYWEIGHTS BEAST          |
| HELLFIGHTERS SIERRA         |
| HIGHBALL POTTER             |
| HILLS NEIGHBORS             |
| HOLES BRANNIGAN             |
| HOLIDAY GAMES               |
| HOLLOW JEOPARDY             |
| HOLLYWOOD ANONYMOUS         |
| HOLOCAUST HIGHBALL          |
| HOMEWARD CIDER              |
| HOMICIDE PEACH              |
| HOOK CHARIOTS               |
| HOOSIERS BIRDCAGE           |
| HOTEL HAPPINESS             |
| HOUSE DYNAMITE              |
| HUMAN GRAFFITI              |
| HUNCHBACK IMPOSSIBLE        |
| HUNTING MUSKETEERS          |
| HURRICANE AFFAIR            |
| HUSTLER PARTY               |
| HYSTERICAL GRAIL            |
| IDENTITY LOVER              |
| IDOLS SNATCHERS             |
| ILLUSION AMELIE             |
| IMAGE PRINCESS              |
| IMPACT ALADDIN              |
| IMPOSSIBLE PREJUDICE        |
| INDEPENDENCE HOTEL          |
| INFORMER DOUBLE             |
| INNOCENT USUAL              |
| INSECTS STONE               |
| INSIDER ARIZONA             |
| INSTINCT AIRPORT            |
| INTENTIONS EMPIRE           |
| INTERVIEW LIAISONS          |
| INTOLERABLE INTENTIONS      |
| INTRIGUE WORST              |
| INVASION CYCLONE            |
| ISHTAR ROCKETEER            |
| ISLAND EXORCIST             |
| ITALIAN AFRICAN             |
| JACKET FRISCO               |
| JAWBREAKER BROOKLYN         |
| JEEPERS WEDDING             |
| JEKYLL FROGMEN              |
| JEOPARDY ENCINO             |
| JERICHO MULAN               |
| JERK PAYCHECK               |
| JET NEIGHBORS               |
| JINGLE SAGEBRUSH            |
| JOON NORTHWEST              |
| JUGGLER HARDLY              |
| JUMANJI BLADE               |
| JUMPING WRATH               |
| JUNGLE CLOSER               |
| KANE EXORCIST               |
| KENTUCKIAN GIANT            |
| KICK SAVANNAH               |
| KILL BROTHERHOOD            |
| KILLER INNOCENT             |
| KING EVOLUTION              |
| KISSING DOLLS               |
| KNOCK WARLOCK               |
| KRAMER CHOCOLATE            |
| KWAI HOMEWARD               |
| LABYRINTH LEAGUE            |
| LADYBUGS ARMAGEDDON         |
| LAMBS CINCINATTI            |
| LANGUAGE COWBOY             |
| LAWLESS VISION              |
| LAWRENCE LOVE               |
| LEAGUE HELLFIGHTERS         |
| LEATHERNECKS DWARFS         |
| LEBOWSKI SOLDIERS           |
| LEGALLY SECRETARY           |
| LESSON CLEOPATRA            |
| LIAISONS SWEET              |
| LIBERTY MAGNIFICENT         |
| LICENSE WEEKEND             |
| LIES TREATMENT              |
| LOATHING LEGALLY            |
| LONELY ELEPHANT             |
| LOSER HUSTLER               |
| LOUISIANA HARRY             |
| LOVE SUICIDES               |
| LOVELY JINGLE               |
| LOVERBOY ATTACKS            |
| MADIGAN DORADO              |
| MADNESS ATTACKS             |
| MAGIC MALLRATS              |
| MAGNIFICENT CHITTY          |
| MAGNOLIA FORRESTER          |
| MAGUIRE APACHE              |
| MAJESTIC FLOATS             |
| MALKOVICH PET               |
| MALLRATS UNITED             |
| MANCHURIAN CURTAIN          |
| MANNEQUIN WORST             |
| MASKED BUBBLE               |
| MASSACRE USUAL              |
| MASSAGE IMAGE               |
| MATRIX SNOWMAN              |
| MEET CHOCOLATE              |
| MEMENTO ZOOLANDER           |
| MENAGERIE RUSHMORE          |
| MERMAID INSECTS             |
| METAL ARMAGEDDON            |
| METROPOLIS COMA             |
| MICROCOSMOS PARADISE        |
| MIDNIGHT WESTWARD           |
| MIDSUMMER GROUNDHOG         |
| MINORITY KISS               |
| MIRACLE VIRTUAL             |
| MISSION ZOOLANDER           |
| MOCKINGBIRD HOLLYWOOD       |
| MOD SECRETARY               |
| MODERN DORADO               |
| MONSOON CAUSE               |
| MONSTER SPARTACUS           |
| MONTEREY LABYRINTH          |
| MONTEZUMA COMMAND           |
| MOONSHINE CABIN             |
| MOONWALKER FOOL             |
| MOSQUITO ARMAGEDDON         |
| MOTHER OLEANDER             |
| MOTIONS DETAILS             |
| MOURNING PURPLE             |
| MOVIE SHAKESPEARE           |
| MULHOLLAND BEAST            |
| MUMMY CREATURES             |
| MURDER ANTITRUST            |
| MUSCLE BRIGHT               |
| MUSIC BOONDOCK              |
| MUSKETEERS WAIT             |
| MUSSOLINI SPOILERS          |
| MYSTIC TRUMAN               |
| NAME DETECTIVE              |
| NASH CHOCOLAT               |
| NATIONAL STORY              |
| NATURAL STOCK               |
| NECKLACE OUTBREAK           |
| NEIGHBORS CHARADE           |
| NEWSIES STORY               |
| NEWTON LABYRINTH            |
| NIGHTMARE CHILL             |
| NORTH TEQUILA               |
| NORTHWEST POLISH            |
| NOTORIOUS REUNION           |
| NOTTING SPEAKEASY           |
| NOVOCAINE FLIGHT            |
| OCTOBER SUBMARINE           |
| OKLAHOMA JUMANJI            |
| OLEANDER CLUE               |
| OPERATION OPERATION         |
| OPPOSITE NECKLACE           |
| ORANGE GRAPES               |
| ORDER BETRAYED              |
| ORIENT CLOSER               |
| OUTBREAK DIVINE             |
| OUTFIELD MASSACRE           |
| PACIFIC AMISTAD             |
| PACKER MADIGAN              |
| PAJAMA JAWBREAKER           |
| PANKY SUBMARINE             |
| PAPI NECKLACE               |
| PARADISE SABRINA            |
| PARIS WEEKEND               |
| PAST SUICIDES               |
| PATHS CONTROL               |
| PATIENT SISTER              |
| PATRIOT ROMAN               |
| PATTON INTERVIEW            |
| PAYCHECK WAIT               |
| PEACH INNOCENT              |
| PEARL DESTINY               |
| PELICAN COMFORTS            |
| PERDITION FARGO             |
| PERFECT GROOVE              |
| PERSONAL LADYBUGS           |
| PHANTOM GLORY               |
| PHILADELPHIA WIFE           |
| PIANIST OUTFIELD            |
| PICKUP DRIVING              |
| PILOT HOOSIERS              |
| PINOCCHIO SIMON             |
| PIRATES ROXANNE             |
| PITTSBURGH HUNCHBACK        |
| PIZZA JUMANJI               |
| PLATOON INSTINCT            |
| PLUTO OLEANDER              |
| POLISH BROOKLYN             |
| POLLOCK DELIVERANCE         |
| POSEIDON FOREVER            |
| POTLUCK MIXED               |
| POTTER CONNECTICUT          |
| PREJUDICE OLEANDER          |
| PRESIDENT BANG              |
| PRIMARY GLASS               |
| PRINCESS GIANT              |
| PRIX UNDEFEATED             |
| PSYCHO SHRUNK               |
| QUEST MUSSOLINI             |
| RAGING AIRPLANE             |
| RAIDERS ANTITRUST           |
| RAINBOW SHOCK               |
| RANGE MOONWALKER            |
| REAP UNFAITHFUL             |
| REBEL AIRPORT               |
| RECORDS ZORRO               |
| REDEMPTION COMFORTS         |
| REIGN GENTLEMEN             |
| REMEMBER DIARY              |
| REQUIEM TYCOON              |
| RESERVOIR ADAPTATION        |
| RESURRECTION SILVERADO      |
| REUNION WITCHES             |
| RIDER CADDYSHACK            |
| RIDGEMONT SUBMARINE         |
| RINGS HEARTBREAKERS         |
| ROBBERY BRIGHT              |
| ROCK INSTINCT               |
| ROCKETEER MOTHER            |
| ROLLERCOASTER BRINGING      |
| ROOF CHAMPION               |
| ROOTS REMEMBER              |
| ROSES TREASURE              |
| ROXANNE REBEL               |
| RUGRATS SHAKESPEARE         |
| RUNAWAY TENENBAUMS          |
| RUNNER MADIGAN              |
| RUSH GOODFELLAS             |
| RUSHMORE MERMAID            |
| SABRINA MIDNIGHT            |
| SADDLE ANTITRUST            |
| SAGEBRUSH CLUELESS          |
| SALUTE APOLLO               |
| SATISFACTION CONFIDENTIAL   |
| SATURDAY LAMBS              |
| SAVANNAH TOWN               |
| SCALAWAG DUCK               |
| SCARFACE BANG               |
| SCHOOL JACKET               |
| SCISSORHANDS SLUMS          |
| SCORPION APOLLO             |
| SEABISCUIT PUNK             |
| SEARCHERS WAIT              |
| SEATTLE EXPECATIONS         |
| SECRET GROUNDHOG            |
| SECRETARY ROUGE             |
| SECRETS PARADISE            |
| SENSIBILITY REAR            |
| SHAKESPEARE SADDLE          |
| SHANE DARKNESS              |
| SHANGHAI TYCOON             |
| SHAWSHANK BUBBLE            |
| SHEPHERD MIDSUMMER          |
| SHINING ROSES               |
| SHIP WONDERLAND             |
| SHOOTIST SUPERFLY           |
| SHREK LICENSE               |
| SHRUNK DIVINE               |
| SIERRA DIVIDE               |
| SILVERADO GOLDFINGER        |
| SINNERS ATLANTIS            |
| SISTER FREDDY               |
| SLACKER LIAISONS            |
| SLEEPING SUSPECTS           |
| SLEEPLESS MONSOON           |
| SLEEPY JAPANESE             |
| SLEUTH ORIENT               |
| SLIPPER FIDELITY            |
| SMILE EARRING               |
| SMOKING BARBARELLA          |
| SMOOCHY CONTROL             |
| SNATCH SLIPPER              |
| SNATCHERS MONTEZUMA         |
| SNOWMAN ROLLERCOASTER       |
| SOLDIERS EVOLUTION          |
| SOMETHING DUCK              |
| SONS INTERVIEW              |
| SORORITY QUEEN              |
| SPARTACUS CHEAPER           |
| SPEAKEASY DATE              |
| SPICE SORORITY              |
| SPIKING ELEMENT             |
| SPIRIT FLINTSTONES          |
| SPIRITED CASUALTIES         |
| SPLENDOR PATTON             |
| SPOILERS HELLFIGHTERS       |
| STAGECOACH ARMAGEDDON       |
| STALLION SUNDANCE           |
| STAMPEDE DISTURBING         |
| STAR OPERATION              |
| STATE WASTELAND             |
| STEERS ARMAGEDDON           |
| STEPMOM DREAM               |
| STING PERSONAL              |
| STORM HAPPINESS             |
| STRAIGHT HOURS              |
| STRANGELOVE DESIRE          |
| STRANGER STRANGERS          |
| STRANGERS GRAFFITI          |
| STREAK RIDGEMONT            |
| STREETCAR INTENTIONS        |
| STRICTLY SCARFACE           |
| SUBMARINE BED               |
| SUICIDES SILENCE            |
| SUMMER SCARFACE             |
| SUN CONFESSIONS             |
| SUNDANCE INVASION           |
| SUNRISE LEAGUE              |
| SUPER WYOMING               |
| SUPERFLY TRIP               |
| SUSPECTS QUILLS             |
| SWEDEN SHINING              |
| SWEET BROTHERHOOD           |
| SWEETHEARTS SUSPECTS        |
| TALENTED HOMICIDE           |
| TARZAN VIDEOTAPE            |
| TELEGRAPH VOYAGE            |
| TELEMARK HEARTBREAKERS      |
| TEMPLE ATTRACTION           |
| TENENBAUMS COMMAND          |
| TERMINATOR CLUB             |
| THEORY MERMAID              |
| THIEF PELICAN               |
| THIN SAGEBRUSH              |
| TIMBERLAND SKY              |
| TITANIC BOONDOCK            |
| TOMATOES HELLFIGHTERS       |
| TOMORROW HUSTLER            |
| TOOTSIE PILOT               |
| TOURIST PELICAN             |
| TOWERS HURRICANE            |
| TRADING PINOCCHIO           |
| TRAFFIC HOBBIT              |
| TRAINSPOTTING STRANGERS     |
| TRANSLATION SUMMER          |
| TREASURE COMMAND            |
| TREATMENT JEKYLL            |
| TROJAN TOMORROW             |
| TROOPERS METAL              |
| TWISTED PIRATES             |
| TYCOON GATHERING            |
| UNBREAKABLE KARATE          |
| UNCUT SUICIDES              |
| UNDEFEATED DALMATIONS       |
| UNFAITHFUL KILL             |
| UNFORGIVEN ZOOLANDER        |
| UNTOUCHABLES SUNRISE        |
| UPRISING UPTOWN             |
| USUAL UNTOUCHABLES          |
| VACATION BOONDOCK           |
| VALENTINE VANISHING         |
| VALLEY PACKER               |
| VAMPIRE WHALE               |
| VANISHED GARDEN             |
| VANISHING ROCKY             |
| VELVET TERMINATOR           |
| VERTIGO NORTHWEST           |
| VICTORY ACADEMY             |
| VIDEOTAPE ARSENIC           |
| VIETNAM SMOOCHY             |
| VILLAIN DESPERATE           |
| VIRGINIAN PLUTO             |
| VIRTUAL SPOILERS            |
| VISION TORQUE               |
| VOLCANO TEXAS               |
| VOYAGE LEGALLY              |
| WANDA CHAMBER               |
| WARDROBE PHANTOM            |
| WARLOCK WEREWOLF            |
| WASH HEAVENLY               |
| WASTELAND DIVINE            |
| WATERFRONT DELIVERANCE      |
| WATERSHIP FRONTIER          |
| WEDDING APOLLO              |
| WEEKEND PERSONAL            |
| WEREWOLF LOLA               |
| WESTWARD SEABISCUIT         |
| WHISPERER GIANT             |
| WISDOM WORKER               |
| WITCHES PANIC               |
| WIZARD COLDBLOODED          |
| WOLVES DESIRE               |
| WONDERFUL DROP              |
| WONDERLAND CHRISTMAS        |
| WORKER TARZAN               |
| WORKING MICROCOSMOS         |
| WORLD LEATHERNECKS          |
| WRONG BEHAVIOR              |
| WYOMING STORM               |
| YOUNG LANGUAGE              |
| ZOOLANDER FICTION           |
+-----------------------------+
691 rows in set (0,00 sec)
```

15. Peliculas con un rating de __PG__ o __G__.

```sql
select title, rating from film where rating ='PG' or rating = 'G';
+---------------------------+--------+
| title                     | rating |
+---------------------------+--------+
| ACADEMY DINOSAUR          | PG     |
| ACE GOLDFINGER            | G      |
| AFFAIR PREJUDICE          | G      |
| AFRICAN EGG               | G      |
| AGENT TRUMAN              | PG     |
| ALAMO VIDEOTAPE           | G      |
| ALASKA PHANTOM            | PG     |
| ALI FOREVER               | PG     |
| AMADEUS HOLY              | PG     |
| AMISTAD MIDSUMMER         | G      |
| ANGELS LIFE               | G      |
| ANNIE IDENTITY            | G      |
| ARIZONA BANG              | PG     |
| ARMAGEDDON LOST           | G      |
| ARSENIC INDEPENDENCE      | PG     |
| ATLANTIS CAUSE            | G      |
| AUTUMN CROW               | G      |
| BAKED CLEOPATRA           | G      |
| BALLROOM MOCKINGBIRD      | G      |
| BARBARELLA STREETCAR      | G      |
| BAREFOOT MANCHURIAN       | G      |
| BEACH HEARTBREAKERS       | G      |
| BEAUTY GREASE             | G      |
| BEDAZZLED MARRIED         | PG     |
| BEHAVIOR RUNAWAY          | PG     |
| BILL OTHERS               | PG     |
| BIRCH ANTITRUST           | PG     |
| BIRD INDEPENDENCE         | G      |
| BIRDS PERDITION           | G      |
| BLACKOUT PRIVATE          | PG     |
| BLANKET BEVERLY           | G      |
| BLOOD ARGONAUTS           | G      |
| BLUES INSTINCT            | G      |
| BOILED DARES              | PG     |
| BONNIE HOLOCAUST          | G      |
| BORN SPINAL               | PG     |
| BORROWERS BEDAZZLED       | G      |
| BOUND CHEAPER             | PG     |
| BRANNIGAN SUNRISE         | PG     |
| BREAKFAST GOLDFINGER      | G      |
| BRIDE INTRIGUE            | G      |
| BRINGING HYSTERICAL       | PG     |
| BUCKET BROTHERHOOD        | PG     |
| BUGSY SONG                | G      |
| BULWORTH COMMANDMENTS     | G      |
| BUNCH MINDS               | G      |
| BUTTERFLY CHOCOLAT        | G      |
| CAPER MOTIONS             | G      |
| CAROL TEXAS               | PG     |
| CARRIE BUNCH              | PG     |
| CASABLANCA SUPER          | G      |
| CASUALTIES ENCINO         | G      |
| CAT CONEHEADS             | G      |
| CATCH AMISTAD             | G      |
| CENTER DINOSAUR           | PG     |
| CHAINSAW UPTOWN           | PG     |
| CHAMPION FLATLINERS       | PG     |
| CHARADE DUFFEL            | PG     |
| CHASING FIGHT             | PG     |
| CHEAPER CLYDE             | G      |
| CHICKEN HELLFIGHTERS      | PG     |
| CHILL LUCK                | PG     |
| CHINATOWN GLADIATOR       | PG     |
| CHISUM BEHAVIOR           | G      |
| CHITTY LOCK               | G      |
| CIDER DESIRE              | PG     |
| CITIZEN SHREK             | G      |
| CLASH FREDDY              | G      |
| CLERKS ANGELS             | G      |
| COAST RAINBOW             | PG     |
| COLDBLOODED DARLING       | G      |
| COLOR PHILADELPHIA        | G      |
| CONNECTION MICROCOSMOS    | G      |
| CONQUERER NUTS            | G      |
| CONTROL ANTHEM            | G      |
| COWBOY DOOM               | PG     |
| CRAZY HOME                | PG     |
| CROSSROADS CASUALTIES     | G      |
| CROW GREASE               | PG     |
| CRUELTY UNFORGIVEN        | G      |
| CYCLONE FAMILY            | PG     |
| DADDY PITTSBURGH          | G      |
| DAISY MENAGERIE           | G      |
| DALMATIONS SWEDEN         | PG     |
| DANCING FEVER             | G      |
| DANGEROUS UPTOWN          | PG     |
| DARN FORRESTER            | G      |
| DAWN POND                 | PG     |
| DAY UNFAITHFUL            | G      |
| DAZED PUNK                | G      |
| DESPERATE TRAINSPOTTING   | G      |
| DESTINY SATURDAY          | G      |
| DIARY PANIC               | G      |
| DISCIPLE MOTHER           | PG     |
| DIVORCE SHINING           | G      |
| DOCTOR GRAIL              | G      |
| DOGMA FAMILY              | G      |
| DOWNHILL ENOUGH           | G      |
| DRACULA CRYSTAL           | G      |
| DREAM PICKUP              | PG     |
| DRUMLINE CYCLONE          | G      |
| DRUMS DYNAMITE            | PG     |
| DUDE BLINDNESS            | G      |
| DUFFEL APOCALYPSE         | G      |
| DWARFS ALTER              | G      |
| DYING MAKER               | PG     |
| EASY GLADIATOR            | G      |
| EFFECT GLADIATOR          | PG     |
| EGG IGBY                  | PG     |
| EGYPT TENENBAUMS          | PG     |
| EMPIRE MALKOVICH          | G      |
| ENCINO ELF                | G      |
| EVE RESURRECTION          | G      |
| EVERYONE CRAFT            | PG     |
| EXCITEMENT EVE            | G      |
| EXORCIST STING            | G      |
| EXPENDABLE STALLION       | PG     |
| EXTRAORDINARY CONQUERER   | G      |
| FANTASIA PARK             | G      |
| FARGO GANDHI              | G      |
| FATAL HAUNTED             | PG     |
| FERRIS MOTHER             | PG     |
| FICTION CHRISTMAS         | PG     |
| FIDELITY DEVIL            | G      |
| FIREBALL PHILADELPHIA     | PG     |
| FIREHOUSE VIETNAM         | G      |
| FLATLINERS KILLER         | G      |
| FOOL MOCKINGBIRD          | PG     |
| FRENCH HOLIDAY            | PG     |
| FRISCO FORREST            | PG     |
| FROST HEAD                | PG     |
| FULL FLATLINERS           | PG     |
| GABLES METROPOLIS         | PG     |
| GARDEN ISLAND             | G      |
| GASLIGHT CRUSADE          | PG     |
| GHOST GROUNDHOG           | G      |
| GILBERT PELICAN           | G      |
| GLADIATOR WESTWARD        | PG     |
| GLASS DYING               | G      |
| GOLDFINGER SENSIBILITY    | G      |
| GOODFELLAS SALUTE         | PG     |
| GOSFORD DONNIE            | G      |
| GRADUATE LORD             | G      |
| GRAFFITI LOVE             | PG     |
| GRAPES FURY               | G      |
| GREASE YOUTH              | G      |
| GREEK EVERYONE            | PG     |
| GRIT CLOCKWORK            | PG     |
| GUN BONNIE                | G      |
| HANGING DEEP              | G      |
| HAPPINESS UNITED          | G      |
| HARPER DYING              | G      |
| HATE HANDICAP             | PG     |
| HEARTBREAKERS BRIGHT      | G      |
| HEAVEN FREEDOM            | PG     |
| HEAVYWEIGHTS BEAST        | G      |
| HELLFIGHTERS SIERRA       | PG     |
| HILLS NEIGHBORS           | G      |
| HOCUS FRIDA               | G      |
| HOLES BRANNIGAN           | PG     |
| HOLLYWOOD ANONYMOUS       | PG     |
| HOOK CHARIOTS             | G      |
| HOOSIERS BIRDCAGE         | G      |
| HORN WORKING              | PG     |
| HUNGER ROOF               | G      |
| HURRICANE AFFAIR          | PG     |
| HYDE DOCTOR               | G      |
| HYSTERICAL GRAIL          | PG     |
| INSTINCT AIRPORT          | PG     |
| INTRIGUE WORST            | G      |
| INVASION CYCLONE          | PG     |
| IRON MOON                 | PG     |
| ITALIAN AFRICAN           | G      |
| JAPANESE RUN              | G      |
| JAWBREAKER BROOKLYN       | PG     |
| JAWS HARRY                | G      |
| JEDI BENEATH              | PG     |
| JEKYLL FROGMEN            | PG     |
| JERSEY SASSY              | PG     |
| JUMANJI BLADE             | G      |
| KENTUCKIAN GIANT          | PG     |
| KILL BROTHERHOOD          | G      |
| LADY STAGE                | PG     |
| LAWLESS VISION            | G      |
| LEGALLY SECRETARY         | PG     |
| LEGEND JEDI               | PG     |
| LIAISONS SWEET            | PG     |
| LIBERTY MAGNIFICENT       | G      |
| LION UNCUT                | PG     |
| LOLA AGENT                | PG     |
| LONELY ELEPHANT           | G      |
| LOSER HUSTLER             | PG     |
| LOVELY JINGLE             | PG     |
| LOVER TRUMAN              | G      |
| LUST LOCK                 | G      |
| MAGIC MALLRATS            | PG     |
| MAIDEN HOME               | PG     |
| MAJESTIC FLOATS           | PG     |
| MALKOVICH PET             | G      |
| MALLRATS UNITED           | PG     |
| MANCHURIAN CURTAIN        | PG     |
| MARRIED GO                | G      |
| MASSAGE IMAGE             | PG     |
| MEET CHOCOLATE            | G      |
| MENAGERIE RUSHMORE        | G      |
| MIDNIGHT WESTWARD         | G      |
| MIDSUMMER GROUNDHOG       | G      |
| MIGHTY LUCK               | PG     |
| MILE MULAN                | PG     |
| MINORITY KISS             | G      |
| MOB DUFFEL                | G      |
| MOCKINGBIRD HOLLYWOOD     | PG     |
| MODERN DORADO             | PG     |
| MONEY HAROLD              | PG     |
| MONSOON CAUSE             | PG     |
| MONSTER SPARTACUS         | PG     |
| MONTEREY LABYRINTH        | G      |
| MOON BUNCH                | PG     |
| MOONWALKER FOOL           | G      |
| MOSQUITO ARMAGEDDON       | G      |
| MOTIONS DETAILS           | PG     |
| MOURNING PURPLE           | PG     |
| MOVIE SHAKESPEARE         | PG     |
| MULAN MOON                | G      |
| MULHOLLAND BEAST          | PG     |
| MUPPET MILE               | PG     |
| MURDER ANTITRUST          | PG     |
| MUSCLE BRIGHT             | G      |
| MUSKETEERS WAIT           | PG     |
| MUSSOLINI SPOILERS        | G      |
| NECKLACE OUTBREAK         | PG     |
| NEWSIES STORY             | G      |
| NEWTON LABYRINTH          | PG     |
| NIGHTMARE CHILL           | PG     |
| NOON PAPI                 | G      |
| NORTHWEST POLISH          | PG     |
| NOVOCAINE FLIGHT          | G      |
| OKLAHOMA JUMANJI          | PG     |
| OLEANDER CLUE             | PG     |
| OPEN AFRICAN              | PG     |
| OPERATION OPERATION       | G      |
| OPPOSITE NECKLACE         | PG     |
| OSCAR GOLD                | PG     |
| OTHERS SOUP               | PG     |
| PACIFIC AMISTAD           | G      |
| PANIC CLUB                | G      |
| PANKY SUBMARINE           | G      |
| PAPI NECKLACE             | PG     |
| PARTY KNOCK               | PG     |
| PATHS CONTROL             | PG     |
| PATRIOT ROMAN             | PG     |
| PATTON INTERVIEW          | PG     |
| PEAK FOREVER              | PG     |
| PELICAN COMFORTS          | PG     |
| PET HAUNTING              | PG     |
| PICKUP DRIVING            | G      |
| PILOT HOOSIERS            | PG     |
| PINOCCHIO SIMON           | PG     |
| PIRATES ROXANNE           | PG     |
| POLISH BROOKLYN           | PG     |
| POLLOCK DELIVERANCE       | PG     |
| POTLUCK MIXED             | G      |
| POTTER CONNECTICUT        | PG     |
| PRESIDENT BANG            | PG     |
| PRIMARY GLASS             | G      |
| PRIVATE DROP              | PG     |
| PULP BEVERLY              | G      |
| PUNK DIVORCE              | PG     |
| QUEEN LUKE                | PG     |
| RAINBOW SHOCK             | PG     |
| RANGE MOONWALKER          | PG     |
| REBEL AIRPORT             | G      |
| RECORDS ZORRO             | PG     |
| RESURRECTION SILVERADO    | PG     |
| RIDER CADDYSHACK          | PG     |
| RINGS HEARTBREAKERS       | G      |
| ROCK INSTINCT             | G      |
| ROOM ROMAN                | PG     |
| RUSH GOODFELLAS           | PG     |
| SABRINA MIDNIGHT          | PG     |
| SAGEBRUSH CLUELESS        | G      |
| SAINTS BRIDE              | G      |
| SAMURAI LION              | G      |
| SANTA PARIS               | PG     |
| SASSY PACKER              | G      |
| SATISFACTION CONFIDENTIAL | G      |
| SATURDAY LAMBS            | G      |
| SCISSORHANDS SLUMS        | G      |
| SEA VIRGIN                | PG     |
| SECRET GROUNDHOG          | PG     |
| SECRETARY ROUGE           | PG     |
| SECRETS PARADISE          | G      |
| SENSIBILITY REAR          | PG     |
| SHANE DARKNESS            | PG     |
| SHANGHAI TYCOON           | PG     |
| SHAWSHANK BUBBLE          | PG     |
| SHINING ROSES             | G      |
| SIDE ARK                  | G      |
| SILVERADO GOLDFINGER      | PG     |
| SKY MIRACLE               | PG     |
| SLEEPLESS MONSOON         | G      |
| SLEEPY JAPANESE           | PG     |
| SLUMS DUCK                | PG     |
| SMILE EARRING             | G      |
| SNATCH SLIPPER            | PG     |
| SNOWMAN ROLLERCOASTER     | G      |
| SPIKING ELEMENT           | G      |
| SPLASH GUMP               | PG     |
| SPOILERS HELLFIGHTERS     | G      |
| SQUAD FISH                | PG     |
| STAGE WORLD               | PG     |
| STAR OPERATION            | PG     |
| STEERS ARMAGEDDON         | PG     |
| STOCK GLASS               | PG     |
| STONE FIRE                | G      |
| STRANGER STRANGERS        | G      |
| SUGAR WONKA               | PG     |
| SUICIDES SILENCE          | G      |
| SUMMER SCARFACE           | G      |
| SUPER WYOMING             | PG     |
| SUPERFLY TRIP             | PG     |
| SUSPECTS QUILLS           | PG     |
| SWEDEN SHINING            | PG     |
| SWEETHEARTS SUSPECTS      | G      |
| TADPOLE PARK              | PG     |
| TALENTED HOMICIDE         | PG     |
| TEEN APOLLO               | G      |
| TELEGRAPH VOYAGE          | PG     |
| TEMPLE ATTRACTION         | PG     |
| TEQUILA PAST              | PG     |
| TIMBERLAND SKY            | G      |
| TITANS JERK               | PG     |
| TOMATOES HELLFIGHTERS     | PG     |
| TOOTSIE PILOT             | PG     |
| TORQUE BOUND              | G      |
| TRACY CIDER               | G      |
| TRADING PINOCCHIO         | PG     |
| TRAFFIC HOBBIT            | G      |
| TRAMP OTHERS              | PG     |
| TRAP GUYS                 | G      |
| TREATMENT JEKYLL          | PG     |
| TROJAN TOMORROW           | PG     |
| TROUBLE DATE              | PG     |
| TRUMAN CRAZY              | G      |
| TURN STAR                 | G      |
| TWISTED PIRATES           | PG     |
| TYCOON GATHERING          | G      |
| UNBREAKABLE KARATE        | G      |
| UNFORGIVEN ZOOLANDER      | PG     |
| UPTOWN YOUNG              | PG     |
| VALLEY PACKER             | G      |
| VOLUME HOUSE              | PG     |
| WAGON JAWS                | PG     |
| WAKE JAWS                 | G      |
| WALLS ARTIST              | PG     |
| WAR NOTTING               | G      |
| WARDROBE PHANTOM          | G      |
| WARLOCK WEREWOLF          | G      |
| WARS PLUTO                | G      |
| WASTELAND DIVINE          | PG     |
| WATCH TRACY               | PG     |
| WATERFRONT DELIVERANCE    | G      |
| WATERSHIP FRONTIER        | G      |
| WEDDING APOLLO            | PG     |
| WEREWOLF LOLA             | G      |
| WEST LION                 | G      |
| WIZARD COLDBLOODED        | PG     |
| WON DARES                 | PG     |
| WONDERLAND CHRISTMAS      | PG     |
| WORDS HUNTER              | PG     |
| WORST BANGER              | PG     |
| YOUNG LANGUAGE            | G      |
+---------------------------+--------+
372 rows in set (0,01 sec)
```

16. Peliculas que no tengan un rating de __NC-17__.

```sql
select title, rating from film where rating not in ('NC-17');
+-----------------------------+--------+
| title                       | rating |
+-----------------------------+--------+
| ACADEMY DINOSAUR            | PG     |
| ACE GOLDFINGER              | G      |
| AFFAIR PREJUDICE            | G      |
| AFRICAN EGG                 | G      |
| AGENT TRUMAN                | PG     |
| AIRPLANE SIERRA             | PG-13  |
| AIRPORT POLLOCK             | R      |
| ALABAMA DEVIL               | PG-13  |
| ALAMO VIDEOTAPE             | G      |
| ALASKA PHANTOM              | PG     |
| ALI FOREVER                 | PG     |
| ALONE TRIP                  | R      |
| ALTER VICTORY               | PG-13  |
| AMADEUS HOLY                | PG     |
| AMELIE HELLFIGHTERS         | R      |
| AMERICAN CIRCUS             | R      |
| AMISTAD MIDSUMMER           | G      |
| ANACONDA CONFESSIONS        | R      |
| ANALYZE HOOSIERS            | R      |
| ANGELS LIFE                 | G      |
| ANNIE IDENTITY              | G      |
| ANTHEM LUKE                 | PG-13  |
| ANYTHING SAVANNAH           | R      |
| APOCALYPSE FLAMINGOS        | R      |
| APOLLO TEEN                 | PG-13  |
| ARACHNOPHOBIA ROLLERCOASTER | PG-13  |
| ARGONAUTS TOWN              | PG-13  |
| ARIZONA BANG                | PG     |
| ARMAGEDDON LOST             | G      |
| ARMY FLINTSTONES            | R      |
| ARSENIC INDEPENDENCE        | PG     |
| ATLANTIS CAUSE              | G      |
| ATTACKS HATE                | PG-13  |
| ATTRACTION NEWTON           | PG-13  |
| AUTUMN CROW                 | G      |
| BACKLASH UNDEFEATED         | PG-13  |
| BADMAN DAWN                 | R      |
| BAKED CLEOPATRA             | G      |
| BALLROOM MOCKINGBIRD        | G      |
| BANGER PINOCCHIO            | R      |
| BARBARELLA STREETCAR        | G      |
| BAREFOOT MANCHURIAN         | G      |
| BASIC EASY                  | PG-13  |
| BEACH HEARTBREAKERS         | G      |
| BEAR GRACELAND              | R      |
| BEAST HUNCHBACK             | R      |
| BEAUTY GREASE               | G      |
| BEDAZZLED MARRIED           | PG     |
| BEETHOVEN EXORCIST          | PG-13  |
| BEHAVIOR RUNAWAY            | PG     |
| BERETS AGENT                | PG-13  |
| BEVERLY OUTLAW              | R      |
| BILKO ANONYMOUS             | PG-13  |
| BILL OTHERS                 | PG     |
| BINGO TALENTED              | PG-13  |
| BIRCH ANTITRUST             | PG     |
| BIRD INDEPENDENCE           | G      |
| BIRDS PERDITION             | G      |
| BLACKOUT PRIVATE            | PG     |
| BLADE POLISH                | PG-13  |
| BLANKET BEVERLY             | G      |
| BLINDNESS GUN               | PG-13  |
| BLOOD ARGONAUTS             | G      |
| BLUES INSTINCT              | G      |
| BOILED DARES                | PG     |
| BONNIE HOLOCAUST            | G      |
| BOOGIE AMELIE               | R      |
| BORN SPINAL                 | PG     |
| BORROWERS BEDAZZLED         | G      |
| BOULEVARD MOB               | R      |
| BOUND CHEAPER               | PG     |
| BRANNIGAN SUNRISE           | PG     |
| BRAVEHEART HUMAN            | PG-13  |
| BREAKFAST GOLDFINGER        | G      |
| BREAKING HOME               | PG-13  |
| BRIDE INTRIGUE              | G      |
| BRIGHT ENCOUNTERS           | PG-13  |
| BRINGING HYSTERICAL         | PG     |
| BROOKLYN DESERT             | R      |
| BROTHERHOOD BLANKET         | R      |
| BUBBLE GROSSE               | R      |
| BUCKET BROTHERHOOD          | PG     |
| BUGSY SONG                  | G      |
| BULWORTH COMMANDMENTS       | G      |
| BUNCH MINDS                 | G      |
| BUTCH PANTHER               | PG-13  |
| BUTTERFLY CHOCOLAT          | G      |
| CAMPUS REMEMBER             | R      |
| CANDIDATE PERDITION         | R      |
| CANYON STOCK                | R      |
| CAPER MOTIONS               | G      |
| CAROL TEXAS                 | PG     |
| CARRIE BUNCH                | PG     |
| CASABLANCA SUPER            | G      |
| CASPER DRAGONFLY            | PG-13  |
| CASUALTIES ENCINO           | G      |
| CAT CONEHEADS               | G      |
| CATCH AMISTAD               | G      |
| CAUSE DATE                  | R      |
| CELEBRITY HORN              | PG-13  |
| CENTER DINOSAUR             | PG     |
| CHAINSAW UPTOWN             | PG     |
| CHAMPION FLATLINERS         | PG     |
| CHANCE RESURRECTION         | R      |
| CHARADE DUFFEL              | PG     |
| CHARIOTS CONSPIRACY         | R      |
| CHASING FIGHT               | PG     |
| CHEAPER CLYDE               | G      |
| CHICAGO NORTH               | PG-13  |
| CHICKEN HELLFIGHTERS        | PG     |
| CHILL LUCK                  | PG     |
| CHINATOWN GLADIATOR         | PG     |
| CHISUM BEHAVIOR             | G      |
| CHITTY LOCK                 | G      |
| CHOCOLATE DUCK              | R      |
| CIDER DESIRE                | PG     |
| CIRCUS YOUTH                | PG-13  |
| CITIZEN SHREK               | G      |
| CLASH FREDDY                | G      |
| CLEOPATRA DEVIL             | PG-13  |
| CLERKS ANGELS               | G      |
| CLOCKWORK PARADISE          | PG-13  |
| CLONES PINOCCHIO            | R      |
| CLOSER BANG                 | R      |
| CLUB GRAFFITI               | PG-13  |
| CLUELESS BUCKET             | R      |
| CLYDE THEORY                | PG-13  |
| COAST RAINBOW               | PG     |
| COLDBLOODED DARLING         | G      |
| COLOR PHILADELPHIA          | G      |
| COMANCHEROS ENEMY           | R      |
| COMMAND DARLING             | PG-13  |
| COMMANDMENTS EXPRESS        | R      |
| CONFESSIONS MAGUIRE         | PG-13  |
| CONFUSED CANDLES            | PG-13  |
| CONGENIALITY QUEST          | PG-13  |
| CONNECTICUT TRAMP           | R      |
| CONNECTION MICROCOSMOS      | G      |
| CONQUERER NUTS              | G      |
| CONSPIRACY SPIRIT           | PG-13  |
| CONTACT ANONYMOUS           | PG-13  |
| CONTROL ANTHEM              | G      |
| CONVERSATION DOWNHILL       | R      |
| CORE SUIT                   | PG-13  |
| COWBOY DOOM                 | PG     |
| CRAZY HOME                  | PG     |
| CROOKED FROGMEN             | PG-13  |
| CROSSING DIVORCE            | R      |
| CROSSROADS CASUALTIES       | G      |
| CROW GREASE                 | PG     |
| CROWDS TELEMARK             | R      |
| CRUELTY UNFORGIVEN          | G      |
| CRUSADE HONEY               | R      |
| CUPBOARD SINNERS            | R      |
| CURTAIN VIDEOTAPE           | PG-13  |
| CYCLONE FAMILY              | PG     |
| DADDY PITTSBURGH            | G      |
| DAISY MENAGERIE             | G      |
| DALMATIONS SWEDEN           | PG     |
| DANCING FEVER               | G      |
| DANGEROUS UPTOWN            | PG     |
| DARES PLUTO                 | PG-13  |
| DARLING BREAKING            | PG-13  |
| DARN FORRESTER              | G      |
| DATE SPEED                  | R      |
| DAUGHTER MADIGAN            | PG-13  |
| DAWN POND                   | PG     |
| DAY UNFAITHFUL              | G      |
| DAZED PUNK                  | G      |
| DEEP CRUSADE                | PG-13  |
| DELIVERANCE MULHOLLAND      | R      |
| DESERT POSEIDON             | R      |
| DESPERATE TRAINSPOTTING     | G      |
| DESTINATION JERK            | PG-13  |
| DESTINY SATURDAY            | G      |
| DETAILS PACKER              | R      |
| DETECTIVE VISION            | PG-13  |
| DEVIL DESIRE                | R      |
| DIARY PANIC                 | G      |
| DINOSAUR SECRETARY          | R      |
| DISCIPLE MOTHER             | PG     |
| DISTURBING SCARFACE         | R      |
| DIVIDE MONSTER              | PG-13  |
| DIVINE RESURRECTION         | R      |
| DIVORCE SHINING             | G      |
| DOCTOR GRAIL                | G      |
| DOGMA FAMILY                | G      |
| DOLLS RAGE                  | PG-13  |
| DOOM DANCING                | R      |
| DOUBLE WRATH                | R      |
| DOUBTFIRE LABYRINTH         | R      |
| DOWNHILL ENOUGH             | G      |
| DRACULA CRYSTAL             | G      |
| DREAM PICKUP                | PG     |
| DRIFTER COMMANDMENTS        | PG-13  |
| DRIVER ANNIE                | PG-13  |
| DROP WATERFRONT             | R      |
| DRUMLINE CYCLONE            | G      |
| DRUMS DYNAMITE              | PG     |
| DUDE BLINDNESS              | G      |
| DUFFEL APOCALYPSE           | G      |
| DURHAM PANKY                | R      |
| DWARFS ALTER                | G      |
| DYING MAKER                 | PG     |
| DYNAMITE TARZAN             | PG-13  |
| EARRING INSTINCT            | R      |
| EASY GLADIATOR              | G      |
| EFFECT GLADIATOR            | PG     |
| EGG IGBY                    | PG     |
| EGYPT TENENBAUMS            | PG     |
| ELEPHANT TROJAN             | PG-13  |
| EMPIRE MALKOVICH            | G      |
| ENCINO ELF                  | G      |
| ENGLISH BULWORTH            | PG-13  |
| ENTRAPMENT SATISFACTION     | R      |
| ESCAPE METROPOLIS           | R      |
| EVE RESURRECTION            | G      |
| EVERYONE CRAFT              | PG     |
| EVOLUTION ALTER             | PG-13  |
| EXCITEMENT EVE              | G      |
| EXORCIST STING              | G      |
| EXPECATIONS NATURAL         | PG-13  |
| EXPENDABLE STALLION         | PG     |
| EXPRESS LONELY              | R      |
| EXTRAORDINARY CONQUERER     | G      |
| EYES DRIVING                | PG-13  |
| FACTORY DRAGON              | PG-13  |
| FALCON VOLUME               | PG-13  |
| FAMILY SWEET                | R      |
| FANTASIA PARK               | G      |
| FANTASY TROOPERS            | PG-13  |
| FARGO GANDHI                | G      |
| FATAL HAUNTED               | PG     |
| FEATHERS METAL              | PG-13  |
| FERRIS MOTHER               | PG     |
| FEUD FROGMEN                | R      |
| FEVER EMPIRE                | R      |
| FICTION CHRISTMAS           | PG     |
| FIDDLER LOST                | R      |
| FIDELITY DEVIL              | G      |
| FIGHT JAWBREAKER            | R      |
| FINDING ANACONDA            | R      |
| FIRE WOLVES                 | R      |
| FIREBALL PHILADELPHIA       | PG     |
| FIREHOUSE VIETNAM           | G      |
| FISH OPUS                   | R      |
| FLAMINGOS CONNECTICUT       | PG-13  |
| FLATLINERS KILLER           | G      |
| FLIGHT LIES                 | R      |
| FLINTSTONES HAPPINESS       | PG-13  |
| FLOATS GARDEN               | PG-13  |
| FOOL MOCKINGBIRD            | PG     |
| FORREST SONS                | R      |
| FREAKY POCUS                | R      |
| FREEDOM CLEOPATRA           | PG-13  |
| FRENCH HOLIDAY              | PG     |
| FRIDA SLIPPER               | R      |
| FRISCO FORREST              | PG     |
| FROGMEN BREAKING            | R      |
| FRONTIER CABIN              | PG-13  |
| FROST HEAD                  | PG     |
| FUGITIVE MAGUIRE            | R      |
| FULL FLATLINERS             | PG     |
| FURY MURDER                 | PG-13  |
| GABLES METROPOLIS           | PG     |
| GALAXY SWEETHEARTS          | R      |
| GAMES BOWFINGER             | PG-13  |
| GANDHI KWAI                 | PG-13  |
| GANGS PRIDE                 | PG-13  |
| GARDEN ISLAND               | G      |
| GASLIGHT CRUSADE            | PG     |
| GATHERING CALENDAR          | PG-13  |
| GHOST GROUNDHOG             | G      |
| GHOSTBUSTERS ELF            | R      |
| GIANT TROOPERS              | R      |
| GILBERT PELICAN             | G      |
| GILMORE BOILED              | R      |
| GLADIATOR WESTWARD          | PG     |
| GLASS DYING                 | G      |
| GLORY TRACY                 | PG-13  |
| GO PURPLE                   | R      |
| GOLD RIVER                  | R      |
| GOLDFINGER SENSIBILITY      | G      |
| GOLDMINE TYCOON             | R      |
| GONE TROUBLE                | R      |
| GOODFELLAS SALUTE           | PG     |
| GORGEOUS BINGO              | R      |
| GOSFORD DONNIE              | G      |
| GRACELAND DYNAMITE          | R      |
| GRADUATE LORD               | G      |
| GRAFFITI LOVE               | PG     |
| GRAPES FURY                 | G      |
| GREASE YOUTH                | G      |
| GREEDY ROOTS                | R      |
| GREEK EVERYONE              | PG     |
| GRINCH MASSAGE              | R      |
| GRIT CLOCKWORK              | PG     |
| GROSSE WONDERFUL            | R      |
| GROUNDHOG UNCUT             | PG-13  |
| GUN BONNIE                  | G      |
| GUNFIGHTER MUSSOLINI        | PG-13  |
| GUYS FALCON                 | R      |
| HALF OUTFIELD               | PG-13  |
| HALLOWEEN NUTS              | PG-13  |
| HAMLET WISDOM               | R      |
| HANDICAP BOONDOCK           | R      |
| HANGING DEEP                | G      |
| HAPPINESS UNITED            | G      |
| HARDLY ROBBERS              | R      |
| HARPER DYING                | G      |
| HARRY IDAHO                 | PG-13  |
| HATE HANDICAP               | PG     |
| HAUNTING PIANIST            | R      |
| HAWK CHILL                  | PG-13  |
| HEAD STRANGER               | R      |
| HEARTBREAKERS BRIGHT        | G      |
| HEAVEN FREEDOM              | PG     |
| HEAVYWEIGHTS BEAST          | G      |
| HELLFIGHTERS SIERRA         | PG     |
| HIGH ENCINO                 | R      |
| HIGHBALL POTTER             | R      |
| HILLS NEIGHBORS             | G      |
| HOBBIT ALIEN                | PG-13  |
| HOCUS FRIDA                 | G      |
| HOLES BRANNIGAN             | PG     |
| HOLIDAY GAMES               | PG-13  |
| HOLLYWOOD ANONYMOUS         | PG     |
| HOLOCAUST HIGHBALL          | R      |
| HOLY TADPOLE                | R      |
| HOME PITY                   | R      |
| HOMEWARD CIDER              | R      |
| HOMICIDE PEACH              | PG-13  |
| HONEY TIES                  | R      |
| HOOK CHARIOTS               | G      |
| HOOSIERS BIRDCAGE           | G      |
| HORN WORKING                | PG     |
| HORROR REIGN                | R      |
| HOTEL HAPPINESS             | PG-13  |
| HOUSE DYNAMITE              | R      |
| HUNCHBACK IMPOSSIBLE        | PG-13  |
| HUNGER ROOF                 | G      |
| HUNTER ALTER                | PG-13  |
| HURRICANE AFFAIR            | PG     |
| HYDE DOCTOR                 | G      |
| HYSTERICAL GRAIL            | PG     |
| ICE CROSSING                | R      |
| IDAHO LOVE                  | PG-13  |
| IDENTITY LOVER              | PG-13  |
| ILLUSION AMELIE             | R      |
| IMAGE PRINCESS              | PG-13  |
| IMPACT ALADDIN              | PG-13  |
| INNOCENT USUAL              | PG-13  |
| INSTINCT AIRPORT            | PG     |
| INTENTIONS EMPIRE           | PG-13  |
| INTERVIEW LIAISONS          | R      |
| INTOLERABLE INTENTIONS      | PG-13  |
| INTRIGUE WORST              | G      |
| INVASION CYCLONE            | PG     |
| IRON MOON                   | PG     |
| ISHTAR ROCKETEER            | R      |
| ITALIAN AFRICAN             | G      |
| JACKET FRISCO               | PG-13  |
| JAPANESE RUN                | G      |
| JAWBREAKER BROOKLYN         | PG     |
| JAWS HARRY                  | G      |
| JEDI BENEATH                | PG     |
| JEEPERS WEDDING             | R      |
| JEKYLL FROGMEN              | PG     |
| JEOPARDY ENCINO             | R      |
| JERSEY SASSY                | PG     |
| JET NEIGHBORS               | R      |
| JINGLE SAGEBRUSH            | PG-13  |
| JUGGLER HARDLY              | PG-13  |
| JUMANJI BLADE               | G      |
| KANE EXORCIST               | R      |
| KARATE MOON                 | PG-13  |
| KENTUCKIAN GIANT            | PG     |
| KICK SAVANNAH               | PG-13  |
| KILL BROTHERHOOD            | G      |
| KILLER INNOCENT             | R      |
| KISS GLORY                  | PG-13  |
| KISSING DOLLS               | R      |
| KNOCK WARLOCK               | PG-13  |
| KRAMER CHOCOLATE            | R      |
| KWAI HOMEWARD               | PG-13  |
| LABYRINTH LEAGUE            | PG-13  |
| LADY STAGE                  | PG     |
| LAMBS CINCINATTI            | PG-13  |
| LAWLESS VISION              | G      |
| LEAGUE HELLFIGHTERS         | PG-13  |
| LEATHERNECKS DWARFS         | PG-13  |
| LEBOWSKI SOLDIERS           | PG-13  |
| LEGALLY SECRETARY           | PG     |
| LEGEND JEDI                 | PG     |
| LIAISONS SWEET              | PG     |
| LIBERTY MAGNIFICENT         | G      |
| LIGHTS DEER                 | R      |
| LION UNCUT                  | PG     |
| LOATHING LEGALLY            | R      |
| LOCK REAR                   | R      |
| LOLA AGENT                  | PG     |
| LONELY ELEPHANT             | G      |
| LORD ARIZONA                | PG-13  |
| LOSE INCH                   | R      |
| LOSER HUSTLER               | PG     |
| LOST BIRD                   | PG-13  |
| LOUISIANA HARRY             | PG-13  |
| LOVE SUICIDES               | R      |
| LOVELY JINGLE               | PG     |
| LOVER TRUMAN                | G      |
| LOVERBOY ATTACKS            | PG-13  |
| LUCKY FLYING                | PG-13  |
| LUST LOCK                   | G      |
| MADIGAN DORADO              | R      |
| MADISON TRAP                | R      |
| MADNESS ATTACKS             | PG-13  |
| MADRE GABLES                | PG-13  |
| MAGIC MALLRATS              | PG     |
| MAGNIFICENT CHITTY          | R      |
| MAGNOLIA FORRESTER          | PG-13  |
| MAIDEN HOME                 | PG     |
| MAJESTIC FLOATS             | PG     |
| MAKER GABLES                | PG-13  |
| MALKOVICH PET               | G      |
| MALLRATS UNITED             | PG     |
| MALTESE HOPE                | PG-13  |
| MANCHURIAN CURTAIN          | PG     |
| MANNEQUIN WORST             | PG-13  |
| MARRIED GO                  | G      |
| MASKED BUBBLE               | PG-13  |
| MASSACRE USUAL              | R      |
| MASSAGE IMAGE               | PG     |
| MATRIX SNOWMAN              | PG-13  |
| MAUDE MOD                   | R      |
| MEET CHOCOLATE              | G      |
| MENAGERIE RUSHMORE          | G      |
| METAL ARMAGEDDON            | PG-13  |
| METROPOLIS COMA             | PG-13  |
| MICROCOSMOS PARADISE        | PG-13  |
| MIDNIGHT WESTWARD           | G      |
| MIDSUMMER GROUNDHOG         | G      |
| MIGHTY LUCK                 | PG     |
| MILE MULAN                  | PG     |
| MILLION ACE                 | PG-13  |
| MINDS TRUMAN                | PG-13  |
| MINE TITANS                 | PG-13  |
| MINORITY KISS               | G      |
| MIRACLE VIRTUAL             | PG-13  |
| MISSION ZOOLANDER           | PG-13  |
| MIXED DOORS                 | PG-13  |
| MOB DUFFEL                  | G      |
| MOCKINGBIRD HOLLYWOOD       | PG     |
| MODERN DORADO               | PG     |
| MONEY HAROLD                | PG     |
| MONSOON CAUSE               | PG     |
| MONSTER SPARTACUS           | PG     |
| MONTEREY LABYRINTH          | G      |
| MOON BUNCH                  | PG     |
| MOONSHINE CABIN             | PG-13  |
| MOONWALKER FOOL             | G      |
| MOSQUITO ARMAGEDDON         | G      |
| MOTHER OLEANDER             | R      |
| MOTIONS DETAILS             | PG     |
| MOULIN WAKE                 | PG-13  |
| MOURNING PURPLE             | PG     |
| MOVIE SHAKESPEARE           | PG     |
| MULAN MOON                  | G      |
| MULHOLLAND BEAST            | PG     |
| MUPPET MILE                 | PG     |
| MURDER ANTITRUST            | PG     |
| MUSCLE BRIGHT               | G      |
| MUSIC BOONDOCK              | R      |
| MUSKETEERS WAIT             | PG     |
| MUSSOLINI SPOILERS          | G      |
| NAME DETECTIVE              | PG-13  |
| NASH CHOCOLAT               | PG-13  |
| NATURAL STOCK               | PG-13  |
| NECKLACE OUTBREAK           | PG     |
| NEIGHBORS CHARADE           | R      |
| NETWORK PEAK                | PG-13  |
| NEWSIES STORY               | G      |
| NEWTON LABYRINTH            | PG     |
| NIGHTMARE CHILL             | PG     |
| NOON PAPI                   | G      |
| NORTHWEST POLISH            | PG     |
| NOTTING SPEAKEASY           | PG-13  |
| NOVOCAINE FLIGHT            | G      |
| OCTOBER SUBMARINE           | PG-13  |
| OKLAHOMA JUMANJI            | PG     |
| OLEANDER CLUE               | PG     |
| OPEN AFRICAN                | PG     |
| OPERATION OPERATION         | G      |
| OPPOSITE NECKLACE           | PG     |
| OPUS ICE                    | R      |
| ORANGE GRAPES               | PG-13  |
| ORDER BETRAYED              | PG-13  |
| ORIENT CLOSER               | R      |
| OSCAR GOLD                  | PG     |
| OTHERS SOUP                 | PG     |
| OUTLAW HANKY                | PG-13  |
| OZ LIAISONS                 | R      |
| PACIFIC AMISTAD             | G      |
| PACKER MADIGAN              | PG-13  |
| PAJAMA JAWBREAKER           | R      |
| PANIC CLUB                  | G      |
| PANKY SUBMARINE             | G      |
| PAPI NECKLACE               | PG     |
| PARADISE SABRINA            | PG-13  |
| PARIS WEEKEND               | PG-13  |
| PARK CITIZEN                | PG-13  |
| PARTY KNOCK                 | PG     |
| PAST SUICIDES               | PG-13  |
| PATHS CONTROL               | PG     |
| PATRIOT ROMAN               | PG     |
| PATTON INTERVIEW            | PG     |
| PAYCHECK WAIT               | PG-13  |
| PEACH INNOCENT              | PG-13  |
| PEAK FOREVER                | PG     |
| PELICAN COMFORTS            | PG     |
| PERFECT GROOVE              | PG-13  |
| PERSONAL LADYBUGS           | PG-13  |
| PET HAUNTING                | PG     |
| PHILADELPHIA WIFE           | PG-13  |
| PICKUP DRIVING              | G      |
| PILOT HOOSIERS              | PG     |
| PINOCCHIO SIMON             | PG     |
| PIRATES ROXANNE             | PG     |
| PITTSBURGH HUNCHBACK        | PG-13  |
| PLATOON INSTINCT            | PG-13  |
| PLUTO OLEANDER              | R      |
| POLISH BROOKLYN             | PG     |
| POLLOCK DELIVERANCE         | PG     |
| POND SEATTLE                | PG-13  |
| POSEIDON FOREVER            | PG-13  |
| POTLUCK MIXED               | G      |
| POTTER CONNECTICUT          | PG     |
| PREJUDICE OLEANDER          | PG-13  |
| PRESIDENT BANG              | PG     |
| PRIMARY GLASS               | G      |
| PRIVATE DROP                | PG     |
| PRIX UNDEFEATED             | R      |
| PSYCHO SHRUNK               | PG-13  |
| PULP BEVERLY                | G      |
| PUNK DIVORCE                | PG     |
| PURPLE MOVIE                | R      |
| QUEEN LUKE                  | PG     |
| QUEST MUSSOLINI             | R      |
| QUILLS BULL                 | R      |
| RAGE GAMES                  | R      |
| RAGING AIRPLANE             | R      |
| RAIDERS ANTITRUST           | PG-13  |
| RAINBOW SHOCK               | PG     |
| RANGE MOONWALKER            | PG     |
| REAP UNFAITHFUL             | PG-13  |
| REBEL AIRPORT               | G      |
| RECORDS ZORRO               | PG     |
| REDS POCUS                  | PG-13  |
| REIGN GENTLEMEN             | PG-13  |
| REMEMBER DIARY              | R      |
| REQUIEM TYCOON              | R      |
| RESERVOIR ADAPTATION        | PG-13  |
| RESURRECTION SILVERADO      | PG     |
| REUNION WITCHES             | R      |
| RIDER CADDYSHACK            | PG     |
| RIDGEMONT SUBMARINE         | PG-13  |
| RIGHT CRANES                | PG-13  |
| RINGS HEARTBREAKERS         | G      |
| RIVER OUTLAW                | PG-13  |
| ROAD ROXANNE                | R      |
| ROBBERS JOON                | PG-13  |
| ROBBERY BRIGHT              | R      |
| ROCK INSTINCT               | G      |
| ROCKETEER MOTHER            | PG-13  |
| ROCKY WAR                   | PG-13  |
| ROLLERCOASTER BRINGING      | PG-13  |
| ROOF CHAMPION               | R      |
| ROOM ROMAN                  | PG     |
| ROOTS REMEMBER              | PG-13  |
| ROSES TREASURE              | PG-13  |
| ROXANNE REBEL               | R      |
| RUGRATS SHAKESPEARE         | PG-13  |
| RULES HUMAN                 | R      |
| RUN PACIFIC                 | R      |
| RUSH GOODFELLAS             | PG     |
| RUSHMORE MERMAID            | PG-13  |
| SABRINA MIDNIGHT            | PG     |
| SADDLE ANTITRUST            | PG-13  |
| SAGEBRUSH CLUELESS          | G      |
| SAINTS BRIDE                | G      |
| SALUTE APOLLO               | R      |
| SAMURAI LION                | G      |
| SANTA PARIS                 | PG     |
| SASSY PACKER                | G      |
| SATISFACTION CONFIDENTIAL   | G      |
| SATURDAY LAMBS              | G      |
| SATURN NAME                 | R      |
| SAVANNAH TOWN               | PG-13  |
| SCARFACE BANG               | PG-13  |
| SCHOOL JACKET               | PG-13  |
| SCISSORHANDS SLUMS          | G      |
| SEA VIRGIN                  | PG     |
| SEATTLE EXPECATIONS         | PG-13  |
| SECRET GROUNDHOG            | PG     |
| SECRETARY ROUGE             | PG     |
| SECRETS PARADISE            | G      |
| SENSE GREEK                 | R      |
| SENSIBILITY REAR            | PG     |
| SEVEN SWARM                 | R      |
| SHAKESPEARE SADDLE          | PG-13  |
| SHANE DARKNESS              | PG     |
| SHANGHAI TYCOON             | PG     |
| SHAWSHANK BUBBLE            | PG     |
| SHEPHERD MIDSUMMER          | R      |
| SHINING ROSES               | G      |
| SHIP WONDERLAND             | R      |
| SHOCK CABIN                 | PG-13  |
| SHOOTIST SUPERFLY           | PG-13  |
| SHOW LORD                   | PG-13  |
| SHREK LICENSE               | PG-13  |
| SHRUNK DIVINE               | R      |
| SIDE ARK                    | G      |
| SIEGE MADRE                 | R      |
| SILENCE KANE                | R      |
| SILVERADO GOLDFINGER        | PG     |
| SINNERS ATLANTIS            | PG-13  |
| SISTER FREDDY               | PG-13  |
| SKY MIRACLE                 | PG     |
| SLACKER LIAISONS            | R      |
| SLEEPING SUSPECTS           | PG-13  |
| SLEEPLESS MONSOON           | G      |
| SLEEPY JAPANESE             | PG     |
| SLING LUKE                  | R      |
| SLIPPER FIDELITY            | PG-13  |
| SLUMS DUCK                  | PG     |
| SMILE EARRING               | G      |
| SMOKING BARBARELLA          | PG-13  |
| SMOOCHY CONTROL             | R      |
| SNATCH SLIPPER              | PG     |
| SNATCHERS MONTEZUMA         | PG-13  |
| SNOWMAN ROLLERCOASTER       | G      |
| SOLDIERS EVOLUTION          | R      |
| SONG HEDWIG                 | PG-13  |
| SOUP WISDOM                 | R      |
| SOUTH WAIT                  | R      |
| SPEAKEASY DATE              | PG-13  |
| SPEED SUIT                  | PG-13  |
| SPIKING ELEMENT             | G      |
| SPINAL ROCKY                | PG-13  |
| SPIRIT FLINTSTONES          | R      |
| SPIRITED CASUALTIES         | PG-13  |
| SPLASH GUMP                 | PG     |
| SPLENDOR PATTON             | R      |
| SPOILERS HELLFIGHTERS       | G      |
| SPY MILE                    | PG-13  |
| SQUAD FISH                  | PG     |
| STAGE WORLD                 | PG     |
| STAGECOACH ARMAGEDDON       | R      |
| STALLION SUNDANCE           | PG-13  |
| STAMPEDE DISTURBING         | R      |
| STAR OPERATION              | PG     |
| STEERS ARMAGEDDON           | PG     |
| STOCK GLASS                 | PG     |
| STONE FIRE                  | G      |
| STORY SIDE                  | R      |
| STRAIGHT HOURS              | R      |
| STRANGER STRANGERS          | G      |
| STRANGERS GRAFFITI          | R      |
| STREAK RIDGEMONT            | PG-13  |
| STREETCAR INTENTIONS        | R      |
| STRICTLY SCARFACE           | PG-13  |
| SUBMARINE BED               | R      |
| SUGAR WONKA                 | PG     |
| SUICIDES SILENCE            | G      |
| SUIT WALLS                  | R      |
| SUMMER SCARFACE             | G      |
| SUN CONFESSIONS             | R      |
| SUNRISE LEAGUE              | PG-13  |
| SUPER WYOMING               | PG     |
| SUPERFLY TRIP               | PG     |
| SUSPECTS QUILLS             | PG     |
| SWARM GOLD                  | PG-13  |
| SWEDEN SHINING              | PG     |
| SWEET BROTHERHOOD           | R      |
| SWEETHEARTS SUSPECTS        | G      |
| TADPOLE PARK                | PG     |
| TALENTED HOMICIDE           | PG     |
| TARZAN VIDEOTAPE            | PG-13  |
| TAXI KICK                   | PG-13  |
| TEEN APOLLO                 | G      |
| TELEGRAPH VOYAGE            | PG     |
| TELEMARK HEARTBREAKERS      | PG-13  |
| TEMPLE ATTRACTION           | PG     |
| TENENBAUMS COMMAND          | PG-13  |
| TEQUILA PAST                | PG     |
| TERMINATOR CLUB             | R      |
| THEORY MERMAID              | PG-13  |
| THIEF PELICAN               | PG-13  |
| THIN SAGEBRUSH              | PG-13  |
| TIES HUNGER                 | R      |
| TIGHTS DAWN                 | R      |
| TIMBERLAND SKY              | G      |
| TITANIC BOONDOCK            | R      |
| TITANS JERK                 | PG     |
| TOMATOES HELLFIGHTERS       | PG     |
| TOMORROW HUSTLER            | R      |
| TOOTSIE PILOT               | PG     |
| TORQUE BOUND                | G      |
| TOURIST PELICAN             | PG-13  |
| TOWN ARK                    | R      |
| TRACY CIDER                 | G      |
| TRADING PINOCCHIO           | PG     |
| TRAFFIC HOBBIT              | G      |
| TRAIN BUNCH                 | R      |
| TRAINSPOTTING STRANGERS     | PG-13  |
| TRAMP OTHERS                | PG     |
| TRANSLATION SUMMER          | PG-13  |
| TRAP GUYS                   | G      |
| TREASURE COMMAND            | PG-13  |
| TREATMENT JEKYLL            | PG     |
| TRIP NEWTON                 | PG-13  |
| TROJAN TOMORROW             | PG     |
| TROOPERS METAL              | R      |
| TROUBLE DATE                | PG     |
| TRUMAN CRAZY                | G      |
| TURN STAR                   | G      |
| TUXEDO MILE                 | R      |
| TWISTED PIRATES             | PG     |
| TYCOON GATHERING            | G      |
| UNBREAKABLE KARATE          | G      |
| UNCUT SUICIDES              | PG-13  |
| UNDEFEATED DALMATIONS       | PG-13  |
| UNFAITHFUL KILL             | R      |
| UNFORGIVEN ZOOLANDER        | PG     |
| UNITED PILOT                | R      |
| UPTOWN YOUNG                | PG     |
| USUAL UNTOUCHABLES          | PG-13  |
| VACATION BOONDOCK           | R      |
| VALENTINE VANISHING         | PG-13  |
| VALLEY PACKER               | G      |
| VANISHED GARDEN             | R      |
| VELVET TERMINATOR           | R      |
| VERTIGO NORTHWEST           | R      |
| VICTORY ACADEMY             | PG-13  |
| VIETNAM SMOOCHY             | PG-13  |
| VILLAIN DESPERATE           | PG-13  |
| VIRGIN DAISY                | PG-13  |
| VIRGINIAN PLUTO             | R      |
| VISION TORQUE               | PG-13  |
| VOICE PEACH                 | PG-13  |
| VOLUME HOUSE                | PG     |
| VOYAGE LEGALLY              | PG-13  |
| WAGON JAWS                  | PG     |
| WAIT CIDER                  | PG-13  |
| WAKE JAWS                   | G      |
| WALLS ARTIST                | PG     |
| WANDA CHAMBER               | PG-13  |
| WAR NOTTING                 | G      |
| WARDROBE PHANTOM            | G      |
| WARLOCK WEREWOLF            | G      |
| WARS PLUTO                  | G      |
| WASH HEAVENLY               | R      |
| WASTELAND DIVINE            | PG     |
| WATCH TRACY                 | PG     |
| WATERFRONT DELIVERANCE      | G      |
| WATERSHIP FRONTIER          | G      |
| WEDDING APOLLO              | PG     |
| WEEKEND PERSONAL            | R      |
| WEREWOLF LOLA               | G      |
| WEST LION                   | G      |
| WHALE BIKINI                | PG-13  |
| WHISPERER GIANT             | PG-13  |
| WILD APOLLO                 | R      |
| WILLOW TRACY                | R      |
| WIND PHANTOM                | R      |
| WINDOW SIDE                 | R      |
| WISDOM WORKER               | R      |
| WIZARD COLDBLOODED          | PG     |
| WOMEN DORADO                | R      |
| WON DARES                   | PG     |
| WONDERLAND CHRISTMAS        | PG     |
| WORDS HUNTER                | PG     |
| WORKER TARZAN               | R      |
| WORKING MICROCOSMOS         | R      |
| WORLD LEATHERNECKS          | PG-13  |
| WORST BANGER                | PG     |
| WRONG BEHAVIOR              | PG-13  |
| WYOMING STORM               | PG-13  |
| YENTL IDAHO                 | R      |
| YOUNG LANGUAGE              | G      |
| ZOOLANDER FICTION           | R      |
+-----------------------------+--------+
790 rows in set (0,01 sec)
```

17. Peliculas con un rating __PG__ y duracion de más de __120__.

```sql
select title, rating, length from film where rating = 'PG' and length > 120;
+-----------------------+--------+--------+
| title                 | rating | length |
+-----------------------+--------+--------+
| AGENT TRUMAN          | PG     |    169 |
| ALASKA PHANTOM        | PG     |    136 |
| ALI FOREVER           | PG     |    150 |
| ARIZONA BANG          | PG     |    121 |
| ARSENIC INDEPENDENCE  | PG     |    137 |
| BIRCH ANTITRUST       | PG     |    162 |
| BORN SPINAL           | PG     |    179 |
| BRANNIGAN SUNRISE     | PG     |    121 |
| BRINGING HYSTERICAL   | PG     |    136 |
| BUCKET BROTHERHOOD    | PG     |    133 |
| CAROL TEXAS           | PG     |    151 |
| CENTER DINOSAUR       | PG     |    152 |
| CHICKEN HELLFIGHTERS  | PG     |    122 |
| CHILL LUCK            | PG     |    142 |
| COWBOY DOOM           | PG     |    146 |
| CRAZY HOME            | PG     |    136 |
| CYCLONE FAMILY        | PG     |    176 |
| DANGEROUS UPTOWN      | PG     |    121 |
| DISCIPLE MOTHER       | PG     |    141 |
| DREAM PICKUP          | PG     |    135 |
| DYING MAKER           | PG     |    168 |
| EVERYONE CRAFT        | PG     |    163 |
| FERRIS MOTHER         | PG     |    142 |
| FIREBALL PHILADELPHIA | PG     |    148 |
| FOOL MOCKINGBIRD      | PG     |    158 |
| GABLES METROPOLIS     | PG     |    161 |
| GLADIATOR WESTWARD    | PG     |    173 |
| GREEK EVERYONE        | PG     |    176 |
| GRIT CLOCKWORK        | PG     |    137 |
| HOLES BRANNIGAN       | PG     |    128 |
| HYSTERICAL GRAIL      | PG     |    150 |
| JEDI BENEATH          | PG     |    128 |
| KENTUCKIAN GIANT      | PG     |    169 |
| LIAISONS SWEET        | PG     |    140 |
| MAIDEN HOME           | PG     |    138 |
| MAJESTIC FLOATS       | PG     |    130 |
| MALLRATS UNITED       | PG     |    133 |
| MANCHURIAN CURTAIN    | PG     |    177 |
| MASSAGE IMAGE         | PG     |    161 |
| MIGHTY LUCK           | PG     |    122 |
| MONEY HAROLD          | PG     |    135 |
| MONSOON CAUSE         | PG     |    182 |
| MOTIONS DETAILS       | PG     |    166 |
| MOURNING PURPLE       | PG     |    146 |
| MULHOLLAND BEAST      | PG     |    157 |
| MURDER ANTITRUST      | PG     |    166 |
| NECKLACE OUTBREAK     | PG     |    132 |
| NIGHTMARE CHILL       | PG     |    149 |
| NORTHWEST POLISH      | PG     |    172 |
| OLEANDER CLUE         | PG     |    161 |
| OPEN AFRICAN          | PG     |    131 |
| PAPI NECKLACE         | PG     |    128 |
| PATTON INTERVIEW      | PG     |    175 |
| POLLOCK DELIVERANCE   | PG     |    137 |
| PRESIDENT BANG        | PG     |    144 |
| QUEEN LUKE            | PG     |    163 |
| RANGE MOONWALKER      | PG     |    147 |
| RECORDS ZORRO         | PG     |    182 |
| RIDER CADDYSHACK      | PG     |    177 |
| SANTA PARIS           | PG     |    154 |
| SECRETARY ROUGE       | PG     |    158 |
| SKY MIRACLE           | PG     |    132 |
| SLEEPY JAPANESE       | PG     |    137 |
| SLUMS DUCK            | PG     |    147 |
| SPLASH GUMP           | PG     |    175 |
| SQUAD FISH            | PG     |    136 |
| STAR OPERATION        | PG     |    181 |
| STEERS ARMAGEDDON     | PG     |    140 |
| STOCK GLASS           | PG     |    160 |
| SWEDEN SHINING        | PG     |    176 |
| TADPOLE PARK          | PG     |    155 |
| TALENTED HOMICIDE     | PG     |    173 |
| TELEGRAPH VOYAGE      | PG     |    148 |
| TOOTSIE PILOT         | PG     |    157 |
| TRADING PINOCCHIO     | PG     |    170 |
| TRAMP OTHERS          | PG     |    171 |
| TWISTED PIRATES       | PG     |    152 |
| UNFORGIVEN ZOOLANDER  | PG     |    129 |
| VOLUME HOUSE          | PG     |    132 |
| WAGON JAWS            | PG     |    152 |
| WALLS ARTIST          | PG     |    135 |
| WORST BANGER          | PG     |    185 |
+-----------------------+--------+--------+
82 rows in set (0,00 sec)
```

18. ¿Cuantos actores hay?

```sql
select count(*) as num_actores from actor;
+-------------+
| num_actores |
+-------------+
|         200 |
+-------------+
1 row in set (0,00 sec)
```

19. ¿Cuántas ciudades tiene el country __Spain__?

```sql
select count(ci.city) from city ci
inner join country co on ci.country_id = co.country_id
where co.country = 'Spain';
+----------------+
| count(ci.city) |
+----------------+
|              5 |
+----------------+
1 row in set (0,00 sec)
```

20. ¿Cuántos countries hay que empiezan por __a__?

```sql
select * from country where country regexp '^a';
+------------+----------------+---------------------+
| country_id | country        | last_update         |
+------------+----------------+---------------------+
|          1 | Afghanistan    | 2006-02-15 04:44:00 |
|          2 | Algeria        | 2006-02-15 04:44:00 |
|          3 | American Samoa | 2006-02-15 04:44:00 |
|          4 | Angola         | 2006-02-15 04:44:00 |
|          5 | Anguilla       | 2006-02-15 04:44:00 |
|          6 | Argentina      | 2006-02-15 04:44:00 |
|          7 | Armenia        | 2006-02-15 04:44:00 |
|          8 | Australia      | 2006-02-15 04:44:00 |
|          9 | Austria        | 2006-02-15 04:44:00 |
|         10 | Azerbaijan     | 2006-02-15 04:44:00 |
+------------+----------------+---------------------+
10 rows in set (0,01 sec)
```

21. Media de duración de peliculas con __PG__.

```sql
select avg(length) from film where rating = 'PG';
+-------------+
| avg(length) |
+-------------+
|    112.0052 |
+-------------+
1 row in set (0,00 sec)
```

22. Suma de __rental_rate__ de todas las peliculas.

```sql
select sum(rental_rate) from film;
+------------------+
| sum(rental_rate) |
+------------------+
|          2980.00 |
+------------------+
1 row in set (0,00 sec)
```

23. Pelicula con mayor duración.

```sql
select max(length) from film;
+-------------+
| max(length) |
+-------------+
|         185 |
+-------------+
1 row in set (0,00 sec)
```

24. Película con menor duración.

```sql
select min(length) from film;
+-------------+
| min(length) |
+-------------+
|          46 |
+-------------+
1 row in set (0,00 sec)
```

25. Mostrar las ciudades del country __Spain__ (multitabla).

```sql
select ci.city from city ci
inner join country co
on ci.country_id = co.country_id
where co.country = 'Spain';
+-------------------------+
| city                    |
+-------------------------+
| A Coruña (La Coruña)    |
| Donostia-San Sebastián  |
| Gijón                   |
| Ourense (Orense)        |
| Santiago de Compostela  |
+-------------------------+
5 rows in set (0,00 sec)
```

26. Mostrar el nombre de la película y el nombre de los actores.

```sql
select 
    - Mostrar el nombre de la película y el de sus categorías.
    - Mostrar el country, la ciudad y dirección de cada miembro del staff.
    - Mostrar el country, la ciudad y dirección de cada customer.
    - Numero de películas de cada __rating__
    - Cuantas películas ha realizado el actor __ED CHASE__.
    - Media de duración de las películas cada categoría.

>__Nota__: _Se debe de mostrar la salida de cada una de las consultas_.

A continuación se muestran algunas de las vistas que se han utilizado en la base de datos Sakila:

```sql
--
-- View structure for view `customer_list`
--

CREATE VIEW customer_list AS
SELECT 
  cu.customer_id AS ID, 
    CONCAT(cu.first_name, _utf8mb4' ', cu.last_name) AS name, 
    a.address AS address, 
    a.postal_code AS `zip code`,
  a.phone AS phone, 
    city.city AS city, 
    country.country AS country, 
    IF(cu.active, _utf8mb4'active',_utf8mb4'') AS notes, 
    cu.store_id AS SID
FROM 
  customer AS cu JOIN address AS a 
    ON cu.address_id = a.address_id 
    JOIN city 
    ON a.city_id = city.city_id
  JOIN country 
    ON city.country_id = country.country_id;
--
-- View structure for view `film_list`
--

CREATE VIEW film_list AS
SELECT 
  film.film_id AS FID, 
    film.title AS title, 
    film.description AS description, 
    category.name AS category, 
    film.rental_rate AS price,
  film.length AS length, 
    film.rating AS rating, 
    GROUP_CONCAT(CONCAT(actor.first_name, _utf8mb4' ', actor.last_name) SEPARATOR ', ') AS actors
FROM 
  category LEFT JOIN film_category 
    ON category.category_id = film_category.category_id 
    LEFT JOIN film 
    ON film_category.film_id = film.film_id
  JOIN film_actor 
    ON film.film_id = film_actor.film_id
  JOIN actor 
    ON film_actor.actor_id = actor.actor_id
GROUP BY film.film_id, category.name;
```

Conociendo es estos momentos ya la __BBDD__, se pide:
- Muestra el resultado de la consulta de las vistas que se proporcionan.
- Crea __5__ vistas sobre la __BBDD__, y realizar la consulta, para mostrar los resultados. ___Las vistas deben de tener 3 o más tablas de la BBDD___.

</div>
