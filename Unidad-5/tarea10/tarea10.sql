-- Proporciona una consulta que muestre solo los clientes de Brasil.

select * from customers where Country = 'Brazil';

/**
┌────────────┬───────────┬───────────┬──────────────────────────────────────────────────┬─────────────────────────────────┬─────────────────────┬───────┬─────────┬────────────┬────────────────────┬────────────────────┬───────────────────────────────┬──────────────┐
│ CustomerId │ FirstName │ LastName  │                     Company                      │             Address             │        City         │ State │ Country │ PostalCode │       Phone        │        Fax         │             Email             │ SupportRepId │
├────────────┼───────────┼───────────┼──────────────────────────────────────────────────┼─────────────────────────────────┼─────────────────────┼───────┼─────────┼────────────┼────────────────────┼────────────────────┼───────────────────────────────┼──────────────┤
│ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
└────────────┴───────────┴───────────┴──────────────────────────────────────────────────┴─────────────────────────────────┴─────────────────────┴───────┴─────────┴────────────┴────────────────────┴────────────────────┴───────────────────────────────┴──────────────┘
**/

-- Proporciona una consulta que muestre las facturas de clientes que son de Brasil. La tabla resultante debe mostrar el nombre completo del cliente, ID de factura, fecha de la factura y país de facturación.

select cus.FirstName, inv.InvoiceId, inv.InvoiceDate, inv.BillingCity from customers as cus, invoices as inv where cus.CustomerId=inv.CustomerId group by cus.FirstName;

select cus.FirstName, inv.InvoiceId, inv.InvoiceDate, inv.BillingCity from customers as cus join invoices as inv on cus.CustomerId=inv.CustomerId group by cus.FirstName;

/**
┌───────────┬───────────┬─────────────────────┬─────────────────────┐
│ FirstName │ InvoiceId │     InvoiceDate     │     BillingCity     │
├───────────┼───────────┼─────────────────────┼─────────────────────┤
│ Aaron     │ 50        │ 2009-08-06 00:00:00 │ Winnipeg            │
│ Alexandre │ 57        │ 2009-09-06 00:00:00 │ São Paulo           │
│ Astrid    │ 78        │ 2009-12-08 00:00:00 │ Vienne              │
│ Bjørn     │ 2         │ 2009-01-02 00:00:00 │ Oslo                │
│ Camille   │ 105       │ 2010-04-11 00:00:00 │ Paris               │
│ Daan      │ 3         │ 2009-01-03 00:00:00 │ Brussels            │
│ Dan       │ 113       │ 2010-05-12 00:00:00 │ Mountain View       │
│ Diego     │ 119       │ 2010-06-12 00:00:00 │ Buenos Aires        │
│ Dominique │ 8         │ 2009-02-01 00:00:00 │ Paris               │
│ Eduardo   │ 25        │ 2009-04-09 00:00:00 │ São Paulo           │
│ Edward    │ 49        │ 2009-08-06 00:00:00 │ Ottawa              │
│ Ellie     │ 27        │ 2009-04-22 00:00:00 │ Yellowknife         │
│ Emma      │ 11        │ 2009-02-06 00:00:00 │ London              │
│ Enrique   │ 41        │ 2009-06-23 00:00:00 │ Madrid              │
│ Fernanda  │ 35        │ 2009-06-05 00:00:00 │ Brasília            │
│ Frank     │ 13        │ 2009-02-19 00:00:00 │ Mountain View       │
│ František │ 77        │ 2009-12-08 00:00:00 │ Prague              │
│ François  │ 99        │ 2010-03-11 00:00:00 │ Montréal            │
│ Fynn      │ 6         │ 2009-01-19 00:00:00 │ Frankfurt           │
│ Hannah    │ 29        │ 2009-05-05 00:00:00 │ Berlin              │
│ Heather   │ 91        │ 2010-02-08 00:00:00 │ Orlando             │
│ Helena    │ 46        │ 2009-07-11 00:00:00 │ Prague              │
│ Hugh      │ 10        │ 2009-02-03 00:00:00 │ Dublin              │
│ Isabelle  │ 84        │ 2010-01-08 00:00:00 │ Dijon               │
│ Jack      │ 14        │ 2009-03-04 00:00:00 │ Redmond             │
│ Jennifer  │ 36        │ 2009-06-05 00:00:00 │ Vancouver           │
│ Joakim    │ 42        │ 2009-07-06 00:00:00 │ Stockholm           │
│ Johannes  │ 32        │ 2009-05-10 00:00:00 │ Amsterdam           │
│ John      │ 5         │ 2009-01-11 00:00:00 │ Boston              │
│ João      │ 28        │ 2009-05-05 00:00:00 │ Lisbon              │
│ Julia     │ 71        │ 2009-11-07 00:00:00 │ Salt Lake City      │
│ Kara      │ 56        │ 2009-09-06 00:00:00 │ Copenhagen          │
│ Kathy     │ 16        │ 2009-03-05 00:00:00 │ Reno                │
│ Ladislav  │ 85        │ 2010-01-08 00:00:00 │ Budapest            │
│ Leonie    │ 1         │ 2009-01-01 00:00:00 │ Stuttgart           │
│ Lucas     │ 63        │ 2009-10-07 00:00:00 │ Rome                │
│ Luis      │ 22        │ 2009-04-04 00:00:00 │ Santiago            │
│ Luís      │ 98        │ 2010-03-11 00:00:00 │ São José dos Campos │
│ Madalena  │ 126       │ 2010-07-13 00:00:00 │ Porto               │
│ Manoj     │ 120       │ 2010-06-12 00:00:00 │ Delhi               │
│ Marc      │ 106       │ 2010-04-11 00:00:00 │ Lyon                │
│ Mark      │ 4         │ 2009-01-06 00:00:00 │ Edmonton            │
│ Martha    │ 18        │ 2009-03-09 00:00:00 │ Halifax             │
│ Michelle  │ 112       │ 2010-05-12 00:00:00 │ New York            │
│ Niklas    │ 7         │ 2009-02-01 00:00:00 │ Berlin              │
│ Patrick   │ 39        │ 2009-06-10 00:00:00 │ Tucson              │
│ Phil      │ 43        │ 2009-07-06 00:00:00 │ London              │
│ Puja      │ 23        │ 2009-04-05 00:00:00 │ Bangalore           │
│ Richard   │ 70        │ 2009-11-07 00:00:00 │ Fort Worth          │
│ Robert    │ 48        │ 2009-07-24 00:00:00 │ Toronto             │
│ Roberto   │ 34        │ 2009-05-23 00:00:00 │ Rio de Janeiro      │
│ Stanisław │ 64        │ 2009-10-07 00:00:00 │ Warsaw              │
│ Steve     │ 20        │ 2009-03-22 00:00:00 │ Edinburgh           │
│ Terhi     │ 53        │ 2009-08-11 00:00:00 │ Helsinki            │
│ Tim       │ 15        │ 2009-03-04 00:00:00 │ Cupertino           │
│ Victor    │ 17        │ 2009-03-06 00:00:00 │ Madison             │
│ Wyatt     │ 9         │ 2009-02-02 00:00:00 │ Bordeaux            │
└───────────┴───────────┴─────────────────────┴─────────────────────┘
**/

-- Proporciona una consulta que muestre solo los empleados que son Agentes de Ventas.

select * from employees where Title = 'Sales Manager';

/**
┌────────────┬──────────┬───────────┬───────────────┬───────────┬─────────────────────┬─────────────────────┬──────────────┬─────────┬───────┬─────────┬────────────┬───────────────────┬───────────────────┬───────────────────────┐
│ EmployeeId │ LastName │ FirstName │     Title     │ ReportsTo │      BirthDate      │      HireDate       │   Address    │  City   │ State │ Country │ PostalCode │       Phone       │        Fax        │         Email         │
├────────────┼──────────┼───────────┼───────────────┼───────────┼─────────────────────┼─────────────────────┼──────────────┼─────────┼───────┼─────────┼────────────┼───────────────────┼───────────────────┼───────────────────────┤
│ 2          │ Edwards  │ Nancy     │ Sales Manager │ 1         │ 1958-12-08 00:00:00 │ 2002-05-01 00:00:00 │ 825 8 Ave SW │ Calgary │ AB    │ Canada  │ T2P 2T3    │ +1 (403) 262-3443 │ +1 (403) 262-3322 │ nancy@chinookcorp.com │
└────────────┴──────────┴───────────┴───────────────┴───────────┴─────────────────────┴─────────────────────┴──────────────┴─────────┴───────┴─────────┴────────────┴───────────────────┴───────────────────┴───────────────────────┘
**/

-- Proporciona una consulta que muestre una lista única de países de facturación de la tabla de Facturas.

select BillingCountry from invoices;

/**
┌────────────────┐
│ BillingCountry │
├────────────────┤
│ Germany        │
│ Norway         │
│ Belgium        │
│ Canada         │
│ USA            │
│ Germany        │
│ Germany        │
│ France         │
│ France         │
│ Ireland        │
│ United Kingdom │
│ Germany        │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ France         │
│ United Kingdom │
│ Australia      │
│ Chile          │
│ India          │
│ Norway         │
│ Brazil         │
│ USA            │
│ Canada         │
│ Portugal       │
│ Germany        │
│ Germany        │
│ France         │
│ Netherlands    │
│ Chile          │
│ Brazil         │
│ Brazil         │
│ Canada         │
│ USA            │
│ USA            │
│ USA            │
│ Germany        │
│ Spain          │
│ Sweden         │
│ United Kingdom │
│ Australia      │
│ India          │
│ Czech Republic │
│ Canada         │
│ Canada         │
│ Canada         │
│ Canada         │
│ Portugal       │
│ Germany        │
│ Finland        │
│ United Kingdom │
│ Belgium        │
│ Denmark        │
│ Brazil         │
│ Brazil         │
│ USA            │
│ USA            │
│ Canada         │
│ Ireland        │
│ Italy          │
│ Poland         │
│ Sweden         │
│ Australia      │
│ Germany        │
│ Brazil         │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ Portugal       │
│ France         │
│ Poland         │
│ Norway         │
│ Czech Republic │
│ Austria        │
│ Denmark        │
│ Brazil         │
│ USA            │
│ USA            │
│ France         │
│ France         │
│ Hungary        │
│ Italy          │
│ Sweden         │
│ Chile          │
│ Austria        │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ Germany        │
│ Hungary        │
│ India          │
│ Brazil         │
│ Canada         │
│ Czech Republic │
│ Denmark        │
│ Canada         │
│ USA            │
│ Germany        │
│ France         │
│ France         │
│ France         │
│ Italy          │
│ United Kingdom │
│ Canada         │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ France         │
│ Australia      │
│ Argentina      │
│ India          │
│ Brazil         │
│ Czech Republic │
│ Brazil         │
│ USA            │
│ Portugal       │
│ Portugal       │
│ Germany        │
│ France         │
│ France         │
│ Poland         │
│ India          │
│ Brazil         │
│ Canada         │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Germany        │
│ Sweden         │
│ United Kingdom │
│ United Kingdom │
│ Argentina      │
│ Brazil         │
│ Austria        │
│ USA            │
│ Canada         │
│ Canada         │
│ Canada         │
│ Portugal       │
│ France         │
│ Hungary        │
│ United Kingdom │
│ Denmark        │
│ Brazil         │
│ Brazil         │
│ Canada         │
│ USA            │
│ USA            │
│ Canada         │
│ Italy          │
│ Netherlands    │
│ Spain          │
│ United Kingdom │
│ Argentina      │
│ Canada         │
│ Brazil         │
│ USA            │
│ USA            │
│ Canada         │
│ Canada         │
│ Portugal       │
│ France         │
│ Spain          │
│ Czech Republic │
│ Czech Republic │
│ Belgium        │
│ Brazil         │
│ Canada         │
│ USA            │
│ Canada         │
│ France         │
│ Finland        │
│ Ireland        │
│ Netherlands    │
│ United Kingdom │
│ India          │
│ Belgium        │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ Germany        │
│ Ireland        │
│ Brazil         │
│ Germany        │
│ Norway         │
│ Czech Republic │
│ Brazil         │
│ USA            │
│ USA            │
│ France         │
│ France         │
│ France         │
│ Finland        │
│ Netherlands    │
│ United Kingdom │
│ Norway         │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ France         │
│ Argentina      │
│ Chile          │
│ India          │
│ Germany        │
│ Czech Republic │
│ Brazil         │
│ USA            │
│ Portugal       │
│ Germany        │
│ Germany        │
│ France         │
│ Finland        │
│ Spain          │
│ India          │
│ Canada         │
│ Canada         │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ Germany        │
│ United Kingdom │
│ United Kingdom │
│ Australia      │
│ Chile          │
│ Germany        │
│ Belgium        │
│ USA            │
│ Canada         │
│ Canada         │
│ Portugal       │
│ Germany        │
│ France         │
│ Ireland        │
│ Australia      │
│ Brazil         │
│ Brazil         │
│ Brazil         │
│ Canada         │
│ USA            │
│ USA            │
│ Portugal       │
│ Netherlands    │
│ Poland         │
│ Sweden         │
│ United Kingdom │
│ Chile          │
│ Norway         │
│ Brazil         │
│ USA            │
│ USA            │
│ Canada         │
│ Canada         │
│ Germany        │
│ France         │
│ Sweden         │
│ Czech Republic │
│ Austria        │
│ Denmark        │
│ Brazil         │
│ Canada         │
│ USA            │
│ Canada         │
│ Finland        │
│ Hungary        │
│ Italy          │
│ Poland         │
│ United Kingdom │
│ India          │
│ Denmark        │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ Germany        │
│ Italy          │
│ Germany        │
│ Canada         │
│ Czech Republic │
│ Austria        │
│ Brazil         │
│ USA            │
│ USA            │
│ France         │
│ France         │
│ France         │
│ Hungary        │
│ Poland         │
│ Australia      │
│ Czech Republic │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Portugal       │
│ France         │
│ Chile          │
│ India          │
│ Brazil         │
│ Canada         │
│ Austria        │
│ Brazil         │
│ USA            │
│ Germany        │
│ Germany        │
│ France         │
│ France         │
│ Hungary        │
│ Sweden         │
│ Brazil         │
│ Canada         │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ France         │
│ United Kingdom │
│ United Kingdom │
│ Argentina      │
│ India          │
│ Canada         │
│ Denmark        │
│ USA            │
│ Canada         │
│ Canada         │
│ Portugal       │
│ Germany        │
│ France         │
│ Italy          │
│ Argentina      │
│ Brazil         │
│ Brazil         │
│ Canada         │
│ USA            │
│ USA            │
│ USA            │
│ Portugal       │
│ Poland         │
│ Spain          │
│ United Kingdom │
│ United Kingdom │
│ India          │
│ Czech Republic │
│ Canada         │
│ USA            │
│ Canada         │
│ Canada         │
│ Canada         │
│ Germany        │
│ France         │
│ United Kingdom │
│ Austria        │
│ Belgium        │
│ Brazil         │
│ Brazil         │
│ USA            │
│ USA            │
│ Canada         │
│ Hungary        │
│ Ireland        │
│ Netherlands    │
│ Spain          │
│ United Kingdom │
│ Brazil         │
│ Brazil         │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ Canada         │
│ France         │
│ Netherlands    │
│ Canada         │
│ Norway         │
│ Czech Republic │
│ Belgium        │
│ Brazil         │
│ USA            │
│ USA            │
│ France         │
│ France         │
│ Finland        │
│ Ireland        │
│ Spain          │
│ Argentina      │
│ Czech Republic │
│ USA            │
│ USA            │
│ USA            │
│ USA            │
│ Canada         │
│ Portugal       │
│ Finland        │
│ India          │
└────────────────┘
**/

-- Proporciona una consulta que muestre las facturas de clientes que son de Brasil.

select inv.*, cus.Country from invoices as inv, customers as cus where cus.CustomerId=inv.CustomerId and cus.Country='Brazil';

select inv.*, cus.Country from invoices as inv join customers as cus on cus.CustomerId=inv.CustomerId and cus.Country='Brazil';
/**
┌───────────┬────────────┬─────────────────────┬─────────────────────────────────┬─────────────────────┬──────────────┬────────────────┬───────────────────┬───────┬─────────┐
│ InvoiceId │ CustomerId │     InvoiceDate     │         BillingAddress          │     BillingCity     │ BillingState │ BillingCountry │ BillingPostalCode │ Total │ Country │
├───────────┼────────────┼─────────────────────┼─────────────────────────────────┼─────────────────────┼──────────────┼────────────────┼───────────────────┼───────┼─────────┤
│ 98        │ 1          │ 2010-03-11 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.98  │ Brazil  │
│ 121       │ 1          │ 2010-06-13 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.96  │ Brazil  │
│ 143       │ 1          │ 2010-09-15 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 5.94  │ Brazil  │
│ 195       │ 1          │ 2011-05-06 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 0.99  │ Brazil  │
│ 316       │ 1          │ 2012-10-27 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 1.98  │ Brazil  │
│ 327       │ 1          │ 2012-12-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 13.86 │ Brazil  │
│ 382       │ 1          │ 2013-08-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 8.91  │ Brazil  │
│ 25        │ 10         │ 2009-04-09 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 8.91  │ Brazil  │
│ 154       │ 10         │ 2010-11-14 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │ Brazil  │
│ 177       │ 10         │ 2011-02-16 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 3.96  │ Brazil  │
│ 199       │ 10         │ 2011-05-21 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 5.94  │ Brazil  │
│ 251       │ 10         │ 2012-01-09 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 0.99  │ Brazil  │
│ 372       │ 10         │ 2013-07-02 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │ Brazil  │
│ 383       │ 10         │ 2013-08-12 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 13.86 │ Brazil  │
│ 57        │ 11         │ 2009-09-06 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │ Brazil  │
│ 68        │ 11         │ 2009-10-17 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 13.86 │ Brazil  │
│ 123       │ 11         │ 2010-06-17 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 8.91  │ Brazil  │
│ 252       │ 11         │ 2012-01-22 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │ Brazil  │
│ 275       │ 11         │ 2012-04-25 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 3.96  │ Brazil  │
│ 297       │ 11         │ 2012-07-28 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 5.94  │ Brazil  │
│ 349       │ 11         │ 2013-03-18 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 0.99  │ Brazil  │
│ 34        │ 12         │ 2009-05-23 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 0.99  │ Brazil  │
│ 155       │ 12         │ 2010-11-14 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │ Brazil  │
│ 166       │ 12         │ 2010-12-25 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 13.86 │ Brazil  │
│ 221       │ 12         │ 2011-08-25 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 8.91  │ Brazil  │
│ 350       │ 12         │ 2013-03-31 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │ Brazil  │
│ 373       │ 12         │ 2013-07-03 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 3.96  │ Brazil  │
│ 395       │ 12         │ 2013-10-05 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 5.94  │ Brazil  │
│ 35        │ 13         │ 2009-06-05 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │ Brazil  │
│ 58        │ 13         │ 2009-09-07 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 3.96  │ Brazil  │
│ 80        │ 13         │ 2009-12-10 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 5.94  │ Brazil  │
│ 132       │ 13         │ 2010-07-31 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 0.99  │ Brazil  │
│ 253       │ 13         │ 2012-01-22 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │ Brazil  │
│ 264       │ 13         │ 2012-03-03 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 13.86 │ Brazil  │
│ 319       │ 13         │ 2012-11-01 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 8.91  │ Brazil  │
└───────────┴────────────┴─────────────────────┴─────────────────────────────────┴─────────────────────┴──────────────┴────────────────┴───────────────────┴───────┴─────────┘
**/

--Proporciona una consulta que muestre las facturas asociadas con cada agente de ventas. La tabla resultante debe incluir el nombre completo del Agente de Ventas.

select emp.FirstName, emp.LastName, inv.* from employees as emp join invoices as inv where emp.EmployeeId=cus.SupportRepId and cus.CustomerId=inv.CustomerId and emp.Title='Sales Manager';
/**

**/

--Proporciona una consulta que muestre el Total de la Factura, nombre del cliente, país y nombre del Agente de Ventas para todas las facturas y clientes.

select inv.Total, cus.FirstName, cus.Country, emp.FirstName from invoices as inv, customers as cus where 
/**

**/

--¿Cuántas facturas hubo en 2009 y 2011? ¿Cuáles son las ventas totales respectivas para cada uno de esos años?

/**

**/

--Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para el ID de factura 37.

/**

**/

--Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para cada Factura. PISTA: GROUP BY

/**

**/

--Proporciona una consulta que incluya el nombre de la pista con cada ítem de línea de factura.

/**

**/

--Proporciona una consulta que incluya el nombre de la pista comprada Y el nombre del artista con cada ítem de línea de factura.

/**

**/

--Proporciona una consulta que muestre el número total de pistas en cada lista de reproducción. El nombre de la lista de reproducción debe estar incluido en la tabla resultante.

/**

**/

--Proporciona una consulta que muestre todas las pistas, pero no muestre IDs. La tabla resultante debe incluir el nombre del álbum, el tipo de medio y el género.

/**

**/

--Proporciona una consulta que muestre todas las facturas.

/**

**/

--Proporciona una consulta que muestre las ventas totales realizadas por cada agente de ventas.

/**

**/

--¿Qué agente de ventas realizó más ventas en 2009?

/**

**/

--Escribir una consulta que muestre todas las playlists de la base de datos.

/**

**/

--Escribe una consulta que liste todas las canciones de una playlist.

/**

**/

--Escribe una consulta que liste exclusivamente el nombre de las canciones de una playlist concreta, con el nombre de su género y el nombre de tipo de medio.

/**

**/
