create schema demo;

-- deletion not detected
create table consoles(id integer PRIMARY KEY, name varchar(255), timestamp TIMESTAMPTZ, ignore boolean);

-- deletions detected using soft-deletion
create table consoles_with_softdeletion(id integer PRIMARY KEY, name varchar(255), timestamp TIMESTAMPTZ, del_timestamp TIMESTAMPTZ);
alter table consoles_with_softdeletion add column ignore boolean default false;
alter table consoles_with_softdeletion drop column ignore;

-- target tables
create table copy_consoles(id integer PRIMARY KEY, name varchar(255), timestamp TIMESTAMPTZ);
create table copy_consoles_with_softdeletion(id integer PRIMARY KEY, name varchar(255), timestamp TIMESTAMPTZ, del_timestamp TIMESTAMPTZ);
alter table copy_consoles_with_softdeletion add column ignore boolean default false;



-- sample data
-- insert into consoles (id, name, timestamp) values (1, 'Amiga', now());

insert into consoles_with_softdeletion (id, name, timestamp) values (1, 'Amiga', now());

