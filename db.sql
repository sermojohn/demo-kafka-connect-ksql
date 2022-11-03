create schema demo;

create table consoles(id integer PRIMARY KEY, name varchar(255), timestamp TIMESTAMPTZ);

create table copy_consoles(id integer PRIMARY KEY, name varchar(255), timestamp TIMESTAMPTZ);
-- insert into consoles (id, name, timestamp) values (1, 'Amiga', now());

