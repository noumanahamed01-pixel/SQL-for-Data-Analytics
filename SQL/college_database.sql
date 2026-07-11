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
#IN operator is used to check a value matches any value in the given list
#1. Display students from BCA and B_com.
select * from students where department in ('bca','b_com','BTechCSe');
#2. Display students whose age is 20,22 and 31.
select * from students where age in (20,22,31);
#3. Display students whose marks are 67,72,88.
select * from students where marks in (67,72,88);
#.4 display student who are not from bca.
select * from students where department not in ('bca');
select * from students where department != 'bca';
#5. Display students whose department is BTechCSe and Master'S.
select * from students where department in ('BTechCSe',"Master's");
#6. Display students whose percentage is 67.4,78.16,97.63.
select * from students where percentage in (97.63,78.16,67.4);
#7. display students whose names are alice, sunny, girish.
select * from students where name in ('alice','sunny','girish');
# BETWEEEN is used to select value within specified range.
#1.display students whose marks are between 60 and 90.
select * from students where marks between 60 and 90;
#2. Display students whose age is between 20 and 30
select * from students where age between 20 and 30;
#3. Display students whose percentage is between 70 and 90.
select * from students where percentage between 70 and 90;
#4. Display students whose marks are not between 50 and 80.
select * from students where marks not between 50 and 80;
#5. Display students whose age is not between 18 and 25.
select * from students where age not between 18 and 25;
#6. Display students whose name are alphabetically between A and H.
select * from students where name between 'A' and 'H';
#7. Display students whose percentage is between 60 and 80.
select * from students where percentage between 60 and 80;
#IS NULL is used to find rows where a column has no value (NULL).
#IS NOT NULL is used to find rows where a column contains a value.
#Important: NULL does not mean 0 or an empty string (''). It means missing or unknown data.
alter table students modify column percentage decimal(5,2) null;
update students set percentage=null where name='sunny';
#1. Display studens whose percenatage is null
select * from students where percentage is null;
#2. Display students whose percentage is not null;
select * from students where percentage is not null;
#3.Make one student's Department null and display those students.
alter table students modify department varchar(20) null;
update students set department=null where name='girish';
select * from students where department is null;
#4. Display students whose department is not null 
select * from students where department is not null;
#5. Make one students marks null and display students whose marks are null.
alter table students modify marks int null;
UPDATE students SET marks = NULL WHERE name = 'girish';
select * from students where marks is null;
#6. Display students whose marks are not null
select * from students where marks is not null;
#7.Restore the updated value after practice
update students set department='B_com' where name='girish';
update students set marks='88' where name='girish';
update students set percentage=82.4 where student_id=11;
select * from students;


#A JOIN is used to combine data from two or more tables based on a related column.
#Instead of storing all information in one huge table, databases split data into multiple related tables.
#JOIN helps us retrieve that related data together
create table college_students(STUDENT_ID INT PRIMARY KEY,STUDENT_NAME VARCHAR(10),AGE INT );
CREATE TABLE COURSE_TABLE(COURSE_ID INT PRIMARY KEY,COURSE_NAME VARCHAR(10));
CREATE TABLE ENROLLMENTS(STUDENT_ID INT,COURSE_ID INT);
INSERT INTO COLLEGE_STUDENTS VALUES(1,'ALICE',20),(2,'BOB',23),(3,'SUNNY',21);
INSERT INTO COURSE_TABLE VALUES(101,'PYTHON'),(102,'SQL'),(103,'EXCEL');
INSERT INTO ENROLLMENTS VALUES(1,101),(1,102),(2,103),(3,101);
SELECT COLLEGE_STUDENTS.STUDENT_NAME,COURSE_TABLE.COURSE_NAME FROM COLLEGE_STUDENTS INNER JOIN COURSE_TABLE ON COLLEGE_STUDENTS.STUDENT_ID=COURSE_TABLE.STUDENT_ID;




 