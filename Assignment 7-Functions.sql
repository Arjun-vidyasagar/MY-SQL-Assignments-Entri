-- creating database
create database world;
Use world;

-- Create a table named Country with fields: Id Country_name Population Area 

Create table Country (
ID int auto_increment primary key,
Country_Name varchar(50),
Population int,
Area int
);

-- Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name 

create table Persons (
Id int auto_increment primary key,
Fname varchar(50),
Lname varchar(50),
Population int,
Rating int,
Country_Id int,
Country_Name varchar(50),
foreign key (Country_Id) references Country(Id)
);

-- Insert 10 rows into both tables

INSERT INTO Country (Id, Country_Name, Population, Area) VALUES
(1, 'USA', 331000000, 9833517),
(2, 'Canada', 37742154, 9984670),
(3, 'UK', 67886011, 243610),
(4, 'India', 1380004385, 3287263),
(5, 'Australia', 25499884, 7692024),
(6, 'New Zealand', 4822233, 268021),
(7, 'Iceland', 341243, 103000),
(8, 'Maldives', 52150, 298),
(9, 'Vatican City', 800, 0.44),
(10, 'Monaco', 39242, 2);

INSERT INTO Persons (Id, FName, LName, Population, Rating, Country_Id, Country_Name) VALUES
(1, 'John', 'Doe', 331000000, 4.2, 1, 'USA'),
(2, 'Alice', 'Smith', 37742154, 3.8, 2, 'Canada'),
(3, 'Bob', 'Brown', 67886011, 4.5, 3, 'UK'),
(4, 'Raj', 'Kumar', 1380004385, 4.7, 4, 'India'),
(5, 'Emily', 'Davis', 25499884, 3.9, 5, 'Australia'),
(6, 'Liam', 'Wilson', 4822233, 4.0, 6, 'New Zealand'),
(7, 'Emma', 'Taylor', 341243, 4.6, 7, 'Iceland'),
(8, 'Mia', 'White', 52150, 3.5, 8, 'Maldives'),
(9, 'Noah', 'Walker', 39242, 4.8, 9, 'Vatican City'),
(10, 'Olivia', 'Hall', 39242, 4.1, 10, 'Monaco');

-- Add a new column called DOB in Persons table with data type as Date.

alter table persons
add DOB date;

desc persons;

INSERT INTO Persons (FName, LName, Population, Rating, Country_Id, Country_Name, DOB)
VALUES 
('Sophia', 'Johnson', 331000000, 4.5, 1, 'USA', '1992-04-18'),
('James', 'Brown', 1380004385, 4.3, 4, 'India', '1985-09-25'),
('Emily', 'Taylor', 37742154, 3.8, 2, 'Canada', '1997-12-05');

UPDATE Persons SET DOB = '1985-01-15' WHERE Id = 1;
UPDATE Persons SET DOB = '1990-05-20' WHERE Id = 2;
UPDATE Persons SET DOB = '1978-09-12' WHERE Id = 3;
UPDATE Persons SET DOB = '1995-03-25' WHERE Id = 4;
UPDATE Persons SET DOB = '1988-11-07' WHERE Id = 5;
UPDATE Persons SET DOB = '2000-06-30' WHERE Id = 6;
UPDATE Persons SET DOB = '1993-12-14' WHERE Id = 7;
UPDATE Persons SET DOB = '1984-07-19' WHERE Id = 8;
UPDATE Persons SET DOB = '1970-08-05' WHERE Id = 9;
UPDATE Persons SET DOB = '2002-10-10' WHERE Id = 10;
UPDATE Persons SET DOB = '1985-02-10' WHERE Id = 11;
UPDATE Persons SET DOB = '1991-04-15' WHERE Id = 12;
UPDATE Persons SET DOB = '1980-06-18' WHERE Id = 13;
UPDATE Persons SET DOB = '1996-09-22' WHERE Id = 14;
UPDATE Persons SET DOB = '1987-11-30' WHERE Id = 15;
UPDATE Persons SET DOB = '2001-03-25' WHERE Id = 16;
UPDATE Persons SET DOB = '1994-12-01' WHERE Id = 17;
UPDATE Persons SET DOB = '1983-08-05' WHERE Id = 18;
UPDATE Persons SET DOB = '1972-07-10' WHERE Id = 19;
UPDATE Persons SET DOB = '2003-10-14' WHERE Id = 20;
UPDATE Persons SET DOB = '1986-01-05' WHERE Id = 21;
UPDATE Persons SET DOB = '1992-05-12' WHERE Id = 22;
UPDATE Persons SET DOB = '1981-03-17' WHERE Id = 23;
UPDATE Persons SET DOB = '1997-08-20' WHERE Id = 24;
UPDATE Persons SET DOB = '1989-10-25' WHERE Id = 25;

select * from persons;


--  Write a user-defined function to calculate age using DOB. 

DELIMITER $$

CREATE FUNCTION CalculateAge(dob DATE) 
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
    RETURN YEAR(CURDATE()) - YEAR(dob);
END $$

DELIMITER ;

-- Write a select query to fetch the Age of all persons using the function that has been created.

select concat(fname,' ', Lname) as Full_Name, DOB, CalculateAge(dob) as Age from persons;

-- Find the length of each country name in the Country table.

select country_name, length(country_name) as countrynamelength from country;

-- Extract the first three characters of each country's name in the Country table.

SELECT Country_Name, LEFT(Country_Name, 3) AS First_Three_Chars
FROM Country;

-- Convert all country names to uppercase and lowercase in the Country table.

SELECT Country_Name, UPPER(Country_Name) AS Uppercase_Name,  LOWER(Country_Name) AS Lowercase_Name
FROM Country;