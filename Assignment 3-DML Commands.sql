--  creating database Managers
create database managers;
Use managers;

-- creating table Managers

CREATE TABLE Managers (
    Manager_Id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    Age INT CHECK (Age >= 18 AND Age <= 65),
    Gender CHAR(1) CHECK (Gender IN ('M', 'F', 'O')),
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);

desc managers;

-- 1. Insert 10 rows.

INSERT INTO Managers (First_name, Last_Name, DOB, Age, Gender, Department, Salary) 
VALUES 
('Alice', 'Brown', '1985-06-15', 39, 'F', 'IT', 30000),
('Bob', 'Smith', '1990-09-10', 34, 'M', 'HR', 25000),
('Charlie', 'Davis', '1982-12-22', 42, 'M', 'Finance', 40000),
('Diana', 'Miller', '1995-03-18', 29, 'F', 'IT', 28000),
('Edward', 'Clark', '1978-11-05', 46, 'M', 'Operations', 35000),
('Fiona', 'Garcia', '1992-07-09', 32, 'F', 'Marketing', 22000),
('George', 'Hall', '1980-04-01', 44, 'M', 'IT', 27000),
('Hannah', 'Adams', '1988-01-14', 36, 'F', 'HR', 24000),
('Ian', 'Roberts', '1975-05-30', 49, 'M', 'Finance', 42000),
('Aaliya', 'Khan', '1984-08-23', 40, 'F', 'IT', 32000);

select * from managers;

-- Retrieve Name and Date of Birth of the Manager with Manager_Id = 1

select first_name, last_name, DOB
from managers
where Manager_ID=1;

-- Display the Annual Income of All Managers

Select first_name, Last_name, (Salary*12) as Annual_Income
from Managers;

-- display records of all managers except ‘Aaliya’

Select * from Managers
where First_name != 'Aaliya';

--  to display details of managers whose department is IT and earns more than 25000 per month

Select * from Managers
where Department = 'IT' and Salary > 25000;

-- to display details of managers whose salary is between 10000 and 35000.

Select * from managers
where Salary between 10000 and 35000;

Select * from managers
where Salary >= 10000 and Salary <= 35000;