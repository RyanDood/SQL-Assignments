
--Creating the Database
create database SISDB

--2. Data Definition Language (DDL):

--1. Write SQL scripts to create the mentioned tables with appropriate data types, constraints, and relationships. 

create table Students(
student_id int not null primary key,
first_name varchar(50) not null,
last_name varchar(50) null,
date_of_birth varchar(50) not null,
email varchar(50) not null,
phone_number varchar(15) not null,
)

create table Courses(
course_id int not null primary key,
course_name varchar(80) not null,
credits varchar(50) not null,
teacher_id int not null,
)

create table Enrollments(
enrollment_id int not null primary key,
student_id int not null,
course_id int not null,
enrollment_date varchar(50) not null,
)

create table Teacher(
teacher_id int not null primary key,
first_name varchar(50) not null,
last_name varchar(50) null,
email varchar(50) not null,
)

create table Payments(
payment_id int not null primary key,
student_id int not null,
amount int not null,
payment_date varchar(50) not null,
)

alter table Courses
add constraint FK_Courses_Teacher
foreign key(teacher_id) references Teacher(teacher_id)

alter table Enrollments
add constraint FK_Enrollments_Students
foreign key(student_id) references Students(student_id)

alter table Enrollments
add constraint FK_Enrollments_Courses
foreign key(course_id) references Courses(course_id)

alter table Payments
add constraint FK_Payments_Students
foreign key(student_id) references Students(student_id)

--INSERTING RECORDS:

--3. Data Manipulation Language (DML):

--3 a).Insert at least 10 sample records into each of the following tables

insert into Students(student_id, first_name, last_name, date_of_birth, email, phone_number)
values
(1, 'Ryan', 'Paul', '2002-03-13', 'ryan@email.com', '548796227'),
(2, 'Ajith', 'Kumar', '1998-08-22', 'ajith@email.com', '9876543210'),
(3, 'vijay', 'David', '1990-12-05', 'vija@email.com', '1122334455'),
(4, 'Emily', 'Williams', '1993-06-10', 'emily@email.com', '9988776655'),
(5, 'Ray', 'Joy', '1997-04-18', 'ray@email.com', '5544332211'),
(6, 'Mark', 'Smith', '1994-09-30', 'mark@email.com', '6677889900'),
(7, 'Matthew', 'Ren', '1999-11-25', 'matthew@email.com', '4455667788'),
(8, 'Mothy', 'Fre', '1992-02-14', 'mothy@email.com', '1122334455'),
(9, 'Ethan', 'Ether', '1996-07-08', 'ethan@email.com', '8899776655'),
(10, 'Lara', 'Wilson', '1991-05-20', 'Lara@email.com', '9988776655')

insert into Courses(course_id, course_name, credits, teacher_id)
values
(2001, 'Introduction to Matlab', '3', 51),
(2002, 'Advanced C++', '4', 52),
(2003, 'English Literature', '3', 53),
(2004, 'History and Geography', '3', 54),
(2005, 'Economics', '4', 55),
(2006, 'Social Studies', '3', 56),
(2007, 'Environmental Science', '4', 51),
(2008, 'C++ Fundamentals', '3', 52),
(2009, 'App Development', '4', 53),
(2010, 'Web Development', '3', 54)

insert into Teacher (teacher_id, first_name, last_name, email)
values
(51, 'Christopher', 'Brown', 'christopher.brown@email.com'),
(52, 'Sarah', 'Davis', 'sarah.davis@email.com'),
(53, 'Jonathan', 'Taylor', 'jonathan.taylor@email.com'),
(54, 'Jennifer', 'Moore', 'jennifer.moore@email.com'),
(55, 'Brian', 'Wilson', 'brian.wilson@email.com'),
(56, 'Amanda', 'Miller', 'amanda.miller@email.com');

insert into Enrollments (enrollment_id, student_id, course_id, enrollment_date)
values
(801, 1, 2005, '2023-01-15'),
(802, 2, 2002, '2023-02-22'),
(803, 3, 2001, '2023-03-10'),
(804, 4, 2007, '2023-04-05'),
(805, 5, 2008, '2023-05-18'),
(806, 6, 2003, '2023-06-30'),
(807, 7, 2009, '2023-07-25'),
(808, 8, 2010, '2023-08-14'),
(809, 9, 2004, '2023-09-08'),
(810, 10, 2006, '2023-10-20')

insert into Payments(payment_id,student_id,amount,payment_date)
values
(1071, 1, 12500, '2023-01-05'),
(1072, 2, 11600, '2023-02-12'),
(1073, 3, 11500, '2023-03-20'),
(1074, 4, 13000, '2023-04-15'),
(1075, 5, 11600, '2023-05-28'),
(1076, 6, 15000, '2023-06-10'),
(1077, 7, 12500, '2023-07-15'),
(1078, 8, 11000, '2023-08-24'),
(1079, 9, 16000, '2023-09-18'),
(1080, 10, 12750, '2023-10-30')


--3 b) Write SQL queries for the following tasks:

 -- 1. Write an SQL query to insert a new student into the "Students" table with the following details:a. First Name: Johnb. Last Name: Doec. Date of Birth: 1995-08-15d. Email: john.doe@example.come. Phone Number: 1234567890

 insert into Students
 values
 (11,'John','Doe','1995-08-15','john.doe@example.com','1234567890')

-- 2. Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date.

insert into Enrollments
values
(811,11,2009,'2023-10-22')

--3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address.

update Teacher
set email = 'christopher@email.com'
where teacher_id = 51

--4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on student and course.

delete from Enrollments
where student_id = 11 and course_id = 2009

--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.

update Courses
set teacher_id = 52
where course_id = 2010

--6. Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity.

alter table Enrollments
drop constraint FK_Enrollments_Students;

alter table Enrollments
add constraint FK_Enrollments_Students
foreign key(student_id) references Students(student_id) on delete cascade

delete from Students
where student_id = 11

--7. Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount.

update Payments
set amount = 13500
where payment_id = 1074

--4. JOINS:

--1. Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID.

insert into Payments
values
(1081, 1, 12500, '2023-10-30')

select first_name,sum(amount) as 'total_payment'  from Students inner join Payments
on Students.student_id = Payments.student_id
group by first_name

--2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.

select course_name  as 'List of Courses',count(student_id) as 'Enrolled Students' from Courses inner join Enrollments
on Courses.course_id = Enrollments.course_id
group by course_name


--3. Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.

insert into Students
values
(12,'Harold','Das','1995-01-29','das@email.com','1234567890')

select first_name as 'Not enrolled' from Students left join Enrollments
on Students.student_id = Enrollments.student_id
where Enrollments.student_id is null

--4. Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.

select first_name,last_name,course_name from Enrollments inner join Courses
on Enrollments.course_id = Courses.course_id  inner join Students
on Enrollments.student_id = Students.student_id

--5. Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.

select first_name,course_name from Teacher inner join Courses
on Teacher.teacher_id = Courses.teacher_id
order by first_name

--6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables.

select first_name,course_name,enrollment_date from Enrollments inner join Students
on Enrollments.student_id = Students.student_id inner join Courses
on Enrollments.course_id = Courses.course_id

--7. Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records.

select first_name as 'Not paid Students' from Students left join Payments
on Students.student_id = Payments.student_id
where payment_id is null

--8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records.

insert into Courses
values
(2011, 'Game Development', '3', 56)

select course_name from Courses left join Enrollments
on Courses.course_id = Enrollments.course_id
where Enrollments.course_id is null

--9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with multiple enrollment records.

insert into Enrollments
values
(812,1,2010,'2023-10-22')

select b.student_id,count(b.student_id) as 'No of courses enrolled' from Enrollments as a inner join Enrollments as b
on a.enrollment_id = b.enrollment_id
group by b.student_id
having count(b.student_id) > 1

--10. Find  teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.

insert into Teacher
values
(57, 'Catherine', 'Tia', 'catherine@email.com')

select first_name as 'Not Assigned' from Teacher left join Courses
on Teacher.teacher_id = Courses.teacher_id
where Courses.teacher_id is null

--5. Aggregate Functions and Subqueries:

--1. Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this.

select Courses.course_id, avg(counts) as average from Courses inner join (select course_id, count(student_id) as counts from Enrollments group by course_id) E
on Courses.course_id = E.course_id
group by Courses.course_id

--2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount.

select Students.student_id,first_name,total_amount as Maximum from Students inner join (select student_id, sum(amount) as total_amount from Payments
group by student_id) P
on Students.student_id = P.student_id
group by Students.student_id,first_name,total_amount 
having total_amount = (select max(total_amount) as macs from Students inner join (select student_id, sum(amount) as total_amount from Payments
group by student_id) P
on Students.student_id = P.student_id)

--3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment count.

select Courses.course_id, course_name, counts as Enrolled from Courses inner join (select course_id, count(enrollment_id) as counts from Enrollments
group by course_id) E
on Courses.course_id = E.course_id
group by Courses.course_id, course_name,counts
having counts in (select max(counts) as Maximum from Courses inner join (select course_id, count(enrollment_id) as counts from Enrollments
group by course_id) E
on Courses.course_id = E.course_id)

--4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sumpayments for each teacher's courses.

select Teacher.teacher_id,first_name,sum(amounts) as total_amount from Teacher inner join (select distinct(Enrollments.course_id),Enrollments.student_id,amount as amounts,teacher_id from Enrollments inner join Payments
on Enrollments.student_id = Payments.student_id inner join Courses
on Enrollments.course_id = Courses.course_id) P
on Teacher.teacher_id = P.teacher_id 
group by Teacher.teacher_id,first_name

--5. Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses.

insert into Enrollments (enrollment_id, student_id, course_id, enrollment_date)
values
(813, 1, 2001, '2023-01-15'),
(814, 1, 2002, '2023-01-15'),
(815, 1, 2003, '2023-01-15'),
(816, 1, 2004, '2023-01-15'),
(817, 1, 2006, '2023-01-15'),
(818, 1, 2007, '2023-01-15'),
(819, 1, 2008, '2023-01-15'),
(820, 1, 2009, '2023-01-15'),
(821, 1, 2011, '2023-01-15')

select Students.student_id,first_name,courses from Students inner join (select student_id,count(student_id) as courses from Enrollments
group by student_id) E
on Students.student_id = E.student_id
where E.courses = 11 --(select count(course_id) from Courses)

--6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments.

select * from Teacher
where Teacher.teacher_id = (select Teacher.teacher_id from Teacher left join Courses
on Teacher.teacher_id = Courses.teacher_id
where Courses.teacher_id is null)

--7. Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth.

select avg(age) as 'average age of all students' from Students inner join (select student_id,DATEDIFF(year, date_of_birth,GETDATE()) as age from Students) S
on Students.student_id = S.student_id

--8. Identify courses with no enrollments. Use subqueries to find courses without enrollment records.

select * from Courses
where course_id = (select Courses.course_id from Enrollments right join Courses
on Enrollments.course_id = Courses.course_id
where Enrollments.course_id is null)

--9. Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments.

select first_name,course_id,course_name,total as total_payment from Students inner join (select Enrollments.student_id,Enrollments.course_id,course_name,sum(total_amount) as total from Enrollments inner join (select distinct(enrollment_id),Enrollments.student_id,Courses.course_id,amount as total_amount,course_name from Enrollments inner join Payments
on Enrollments.student_id = Payments.student_id inner join Courses
on Enrollments.course_id = Courses.course_id) P
on Enrollments.enrollment_id = P.enrollment_id
group by Enrollments.student_id,Enrollments.course_id,course_name) A
on Students.student_id = A.student_id

--10. Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one.

select Students.student_id,first_name,total_payments from Students inner join (select student_id,count(student_id) as total_payments from Payments
group by student_id) P
on Students.student_id = P.student_id
where total_payments > 1


--11. Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.

select Students.student_id,first_name,total_payments from Students inner join (select student_id,count(student_id) as total_payments from Payments
group by student_id) P
on Students.student_id = P.student_id

--12. Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.

select Courses.course_id,course_name,total_count from Courses inner join (select course_id,count(course_id) as total_count from Enrollments
group by course_id) E
on Courses.course_id = E.course_id

--13. Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average.

select Students.student_id,first_name,average from Students inner join (select student_id,avg(amount) as average from Payments
group by student_id) P
on Students.student_id = P.student_id

