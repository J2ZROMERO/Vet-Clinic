/* Database schema to keep the structure of entire database. */

 create table vets(
 id int generated always as identity,
 name varchar (100),
 age int,
 date_of_graduation date,
 primary key (id));


 create table specializations(
 species_id int,
 vets_id int,
 primary key (species_id,vets_id));

ALTER TABLE public.specializations ADD CONSTRAINT specializations_fk FOREIGN KEY (species_id) REFERENCES public.species(id);
ALTER TABLE public.specializations ADD CONSTRAINT specializations_fk_1 FOREIGN KEY (vets_id) REFERENCES public.vets(id);


 create table visits (
 animals_id int,
 vets_id int,
 date_of_visits date,
 primary key (animals_id,vets_id,date_of_visits date));


ALTER TABLE public.visits ADD CONSTRAINT visits_fk FOREIGN KEY (animals_id) REFERENCES public.animals(id);
ALTER TABLE public.visits ADD CONSTRAINT visits_fk_1 FOREIGN KEY (vets_id) REFERENCES public.vets(id);


