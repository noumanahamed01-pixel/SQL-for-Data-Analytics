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
#GROUP BY : is use to group rows that have same values in one or more columns so that aggregate functions can be applied to each group
select department,count(*) from students group by department; #count students in each department
select department,avg(marks) from students group by department; # return the average marks of each department
select department,max(marks) from students group by department; # return the highest marks of each department
select department,min(marks) from students group by department; # return the lowest marks of each department
select department,sum(marks) from students group by department; # return the sum of each department
select department,avg(percentage) from students group by department; # return the average percentage of each department
select department,sum(age) from students group by department;
#Display the number of students in each department, sorted by the highest student count.
select department,max(marks),count(*) as total_students from students group by department order by total_students desc;
#Display the department with the highest average marks.
select department,avg(marks) as average_marks from students group by department order by average_marks desc;
#Display the department with the highest total marks.
select department,sum(marks) as total_marks from students group by department order by total_marks desc limit 1;
#HAVING : IS USED TO FILTER GROUPED DATA AFTER GROUP BY.
#Show departments having more than 2 students.
select department,count(*) as total_students from students group by department having total_students>2;
#2.	Show departments whose average marks are greater than 70. 
select department,avg(marks) as average_marks from students group by department having average_marks>70;
#3.	Show departments whose highest marks are greater than 85. 
select department,max(marks) as highest_marks from students group by department having highest_marks>85;
#4.	Show departments whose total marks are greater than 150. 
select department,sum(marks) as total_marks from students group by department having total_marks>150;
#5.	Show departments whose average percentage is greater than 75. 
select department,avg(percentage) as average_percentage from students group by department having average_percentage>75;
#LIKE is used to search for a specific pattern in text (VARCHAR) columns.
#1.	Display students whose name starts with A. 
select * from students where name like 'A%';
#2.	Display students whose name ends with y. 
select * from students where name like '%y';
#3.	Display students whose name contains ar. 
select * from students where name like '%ar%';
#4.	Display students whose department starts with B. 
select * from students where department like 'B%';
#5.	Display students whose department ends with A. 
select * from students where department like '%A';
#6.	Display students whose second letter is a. 
select * from students where name like '_a%';
#7.	Display students whose name has exactly 5 characters. 
select * from students where name like '_____';




 