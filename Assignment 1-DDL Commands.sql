-- Creating and using the databsae named "School"

Create database School;
Use School;

-- creating a Table named STUDENT

Create Table STUDENT (
Roll_no int auto_increment primary key,
First_Name varchar(25) not null,
Last_Name varchar(25) not null,
Marks int not null check (Marks between 0 and 100),
Grade char(1) not null check (Grade IN ('A','B','C','D','E','F')) 
);

desc STUDENT;
-- Inserting Values into the Table STUDENT
Insert into STUDENT ( Roll_no, First_Name, Last_Name, Marks, Grade) values
('1','Alice', 'Thomas', '89','A'),
('2', 'Alex', 'Simon', '92', 'A'),
('3', 'Bharath', 'Chandran', '99', 'A'),
('4', 'Mullankolli', 'Velayudhan', '100', 'A'),
('5', 'Salman', 'Khan', '62', 'C'),
('6', 'Aiswarya', 'Rai', '92', 'A'),
('7', 'Surya', 'SivaKumar', '95', 'A'),
('8', 'Karthi', 'SivaKumar', '32', 'F'),
('9', 'Vijay', 'Joseph', '82', 'B');

-- Displaying the Table

Select * from STUDENT;

-- Adding a column named Contact to the STUDENT table.

Alter table STUDENT
ADD Contact varchar(10) Unique;

-- Removing the Grade column from the Student table

Alter table STUDENT
Drop Grade;

-- Renaming the table to CLASSTEN.

rename table STUDENT to CLASS_TEN;

-- Displaying the new table CLASSTEN.

Select * from CLASS_TEN;

-- Deleting all rows from the table.

Truncate Table CLASS_TEN;

-- Removing the table from the database.

drop table CLASS_TEN;