/* Populate database with sample data. */
insert into owners (full_name,age)
values ('Sam Smith',34)
       ,('Jennifer',19)
       ,('Bob',45)
       ,('Melody',77)
       ,('Dean Winchester',14)
       ,('Jodie Whittaker',38);
       
insert into species (name) values 
        ('Pokemon')
        ,('Digimon');

update animals set species_id = 2 where name like '%mon';
update animals set species_id = 1 where name not like '%mon';

update animals set owner_id = 1 where id = 1;                                           ^
update animals set owner_id = 2 where id = 2 or id = 3;
update animals set owner_id = 3 where id = 4 or id = 6;
update animals set owner_id = 4 where id = 5 or id = 7 or id = 10;
update animals set owner_id = 5 where id = 8 or id = 9;


