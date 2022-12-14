/*Queries that provide answers to the questions from all projects.*/
insert into animals(id,name,date_of_birth,escape_attempts,neutered,weigth_kg) values (6,'Plantmon','2021-11-15',2,true,-5.7);
insert into animals(id,name,date_of_birth,escape_attempts,neutered,weigth_kg) values (7,'Squirtle','1993-03-02',3,false,-12.13);
insert into animals(id,name,date_of_birth,escape_attempts,neutered,weigth_kg) values (8,'Angemon','2005-06-12',1,true,-45);
insert into animals(id,name,date_of_birth,escape_attempts,neutered,weigth_kg) values (9,'Boarmon','2005-06-07',7,true,20.4);
insert into animals(id,name,date_of_birth,escape_attempts,neutered,weigth_kg) values (10,'Blossom','1998-10-13',3,true,17);
insert into animals(id,name,date_of_birth,escape_attempts,neutered,weigth_kg) values (11,'Ditto','2022-05-14',4,true,22);

begin;
ALTER TABLE animals RENAME COLUMN species TO unspecified;
rollback;

begin;
update animals set species = 'digimon' where name like '%mon';
update animals set species = 'pokemon' where name not like '%mon';
commit;

begin;
truncate table animals;
rollback;



begin;
savepoint beforeDeleteAnimals;
delete from animals where date_of_birth > '2022-01-01';
savepoint updateAllAnimals;
update animals set weigth_kg =  (weigth_kg * -1);
rollback to updateAllAnimals;
update animals set weigth_kg =  (weigth_kg * -1) where weigth_kg < 0 ;
commit;


