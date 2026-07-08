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
 select * from students limit 3;
 select * from students limit 5;
 select * from students order by marks desc limit 3;
 select * from students order by marks asc limit 2;
 select * from students order by age desc limit 10;
 select student_id as id, name as student_name from students; # alias (as) is used to give a temporary name to column or table in the output of a query.
 #aggregate functions
 select count(*) from students; # count return total no of rows
 select count(marks) from students; # we can also count for a specific column
 select sum(marks) from students; # sum() adds all values of numeric column and it only worls on numeric data
 select avg(marks) from students; # avg() return average of numeric column 
 select max(marks) from students; # max() return maximum value of numeric column
 select min(marks) from students; # min () return minimum value of numeric column
 select avg(percentage) from students;
 select sum(age) from students;
select max(percentage) from students;
select min(age) from students;
select count(department) from students;

 