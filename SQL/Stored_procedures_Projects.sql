CREATE TABLE Class_12 (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    marks INT
);
INSERT INTO Class_12 VALUES
(1, 'Rahul', 'BCA', 85),
(2, 'Aman', 'BSc', 72),
(3, 'Priya', 'BCom', 91),
(4, 'Kiran', 'BCA', 68),
(5, 'Anjali', 'BTech', 95);
select * from Class_12;

-- IN parameter
delimiter //
create procedure GetStudentById(in p_id int)
begin 
select * from Class_12 where student_id = p_id;
end//
delimiter ;
call GetStudentById(2);
drop procedure if exists GetStudentById;

-- Out parameter
delimiter //
create procedure Total_student(out Stu_count int)
begin
select count(*) into Stu_count from Class_12;
end //
delimiter ;
call Total_Student(@Stu_count);
select @Stu_count;
drop procedure if exists Total_student;

-- inout parameter
delimiter //
create procedure Bonus_marks(inout B_marks int)
begin 
select marks into B_marks from Class_12 where student_id = 1;
set  B_marks = B_marks + 5;
end //
delimiter ;
call Bonus_marks(@B_marks);
select @B_marks;
drop procedure Bonus_marks;