/* Populate database with sample data. */


 insert into vets (name,age,date_of_graduation) values
 ('Vet William Tatcher',45,'2000-04-23'),
 ('Vet Maisy Smith',26,'2019-01-17'),
 ('Vet Stephanie Mendez',64,'1981-05-04'),
 ('Vet Jack Harkness',38,'2008-06-08');



insert into public.specializations (species_id,vets_id) values
 (1,1),(1,3),(2,3),(2,4);



 insert into public.visits (animals_id,vets_id,date_of_visits) values
 (1,1,'2020-05-24'),(1,3,'2020-07-22'),(2,4,'2021-02-02'),(3,2,'2020-01-05'),(3,2,'2020-03-14'),
 (3,2,'2020-05-24'),(4,3,'2021-05-04'),(5,4,'2021-02-24'),(6,2,'2019-12-21'),(6,1,'2020-08-10'),
 (6,2,'2021-04-07'),(7,3,'2019-09-29'),(8,4,'2020-10-03'),(8,4,'2020-11-04'),(9,2,'2019-01-24'),
 (9,2,'2019-05-15'),(9,2,'2019-02-27'),(9,2,'2020-08-03'),(10,3,'2020-05-24'),(10,1,'2021-01-11');


