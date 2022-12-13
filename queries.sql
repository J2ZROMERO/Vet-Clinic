/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name like '%mon';
select name from animals where date_of_birth between '2016-01-01' and '2019-12-31';
select name from animals where neutered = true and escape_attempts < 3;
select date_of_birth from animals where name in ('Agumon','Pikachu');
select name,escape_attempts from animals where weigth_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name not  in ('Gabumon');
select * from animals where weigth_kg between 10.4 and 17.3;

