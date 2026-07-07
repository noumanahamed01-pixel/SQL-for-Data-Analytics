create database collegedb;
use collegedb;
create table students
 (student_id int auto_increment not null primary key,
 name varchar(15) not null,
 age int not null,
 department varchar(10) not null,
 marks float(4) not null);
 alter table students add column percentage float(4) not null;
 select * from students;
 alter table students modify column marks int not null;
 desc students;
 insert into students (name,age,department,marks,percentage) values ("alice",20,"bca",67,67.4),
 ("bob",22,"B_com",83,83.21),
 ("carlie",17,"2ndPuc",97,97.63),
 ("dadu",18,"B_com",54,54.55),
 ("elina",27,"bca",78,78.16),
 ("fanta",24,"bca",23,23.62),
 ("girish",31,"BTechCSe",88,88.1),
 ("harish",32,"Bca",72,72.41),
 ("insa",44,"BTechCSe",69,69.44),
 ("jhonny",53,"Master's",67,67.51);
 select * from students;
 select distinct department from students;
 select * from students where marks>80;
 insert into students (name,age,department,marks,percentage) values ("sunny",20,"B_com",82,82.11);
 select * from students;
 select * from students where age=20 and marks>80;
 select * from students where department="Bca";
 update students set marks=37,percentage=37.5 where name="fanta";
 select * from students;
 delete from students where name="fanta";
 select * from students;
 select * from students order by marks desc;
 select * from students order by marks asc;
  