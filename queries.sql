select owners.full_name, animals.name from animals inner join owners on animals.owner_id = owners.id where owners.id = 4;

select animals.name from animals inner join species on animals.species_id = species.id where species.id = 1;

select owners.full_name, animals.name from animals right join owners on animals.owner_id = owners.id;

select species.name, count(species.id) from animals inner join species on animals.species_id = species.id group by species.id;

select owners.full_name,animals.name from animals inner join owners on animals.owner_id = owners.id where owners.id = 2 and animals.species_id = 2;

select owners.full_name,animals.name from animals inner join owners on animals.owner_id = owners.id where owners.id = 5 and animals.escape_attempts = 0;

select owners.full_name,count(owner_id) from animals inner join owners on animals.owner_id = owners.id 
group by owner_id,owners.full_name 
having count(animals.owner_id) = (select max(dt.total) 
                                  from (select  count(owner_id) as total 
                                        from animals group by owner_id) as dt);




