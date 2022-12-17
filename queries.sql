/* Who was the last animal seen by William Tatcher? */

 select  vets.name as vets, animals.name as animals ,date_of_visits from visits inner join animals on visits.animals_id = animals.id inner join vets on visits.vets_id =  vets.id group by visits.vets_id,vets.name,animals.name,visits.date_of_visits having visits.vets_id = 1 and date_of_visits = (select max( date_of_visits) from visits where vets_id= 1);

/* How many different animals did Stephanie Mendez see? */

 select dt.name,count(dt) from (select vets.name as name,count(animals_id) from visits inner join vets on visits.vets_id = vets.id where vets_id = 3 group by animals_id,vets_id,vets.name) as dt group by dt.name;

/* List all vets and their specialties, including vets with no specialties.*/

select  vets.name,species.name  from specializations right join vets on  specializations.vets_id = vets.id left join species on specializations.species_id = species.id group by vets.name,species.name;

/*List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */

select animals.name,visits.date_of_visits from visits inner join animals on visits.animals_id = animals.id where vets_id = 3 and visits.date_of_visits between  '2020-04-01' and '2020-08-30';

/* What animal has the most visits to vets? */

 select name as Animal_With_Most_Visits_To_the_vet from animals where id =  (select animals_id from visits group by animals_id having count(animals_id) =  (select max(calculateMaxVisits.animal) from (select count(animals_id) as animal from visits group by animals_id) as calculateMaxVisits)) ;

/* Who was Maisy Smith's first visit? */

select vets.name,animals.name,visits.date_of_visits from visits  inner join animals on  visits.animals_id = animals.id inner join vets on visits.vets_id = vets.id where date_of_visits =   (select min(dt.fecha) from  (select date_of_visits as fecha from visits where vets_id = 2) as dt );


/* Details for most recent visit: animal information, vet information, and date of visit. */

animals.name as animal,vets.name as vet,visits.date_of_visits from visits  inner join animals on  visits.animals_id = animals.id inner join vets on visits.vets_id = vets.id where date_of_visits =   (select max(dt.fecha) from  (select date_of_visits as fecha from visits) as dt );


/* How many visits were with a vet that did not specialize in that animal's species? */ 


select  vets.name,count(animals_id) as cuantity_of_visits from visits inner join vets on visits.vets_id = vets.id where vets_id =  (select dt.vet from  ( select  vets.id as vet,vets.name,species.name as specie  from specializations right join vets on  specializations.vets_id = vets.id left join species on specializations.species_id = species.id group by vets.name,species.name,vets.id) as dt where dt.specie is null) group by vets.name;

/* What specialty should Maisy Smith consider getting? Look for the species she gets the most. */

select dt.namevet,countSpecie as speciality_suggested,count(dt.countSpecie) as Most_species_trated  from (select  vets.name as namevet,animals.name,visits.animals_id,species.name as countSpecie from visits inner join animals on visits.animals_id = animals.id  left join species on animals.species_id = species.id inner join vets on visits.vets_id = vets.id  where vets_id = 2) as dt group by dt.countSpecie,dt.namevet limit 1;
