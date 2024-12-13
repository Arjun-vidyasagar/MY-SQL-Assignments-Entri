-- creating database
create database world;
Use world;

-- Create a table named Country with fields: Id Country_name Population Area

Create table Country(
ID int auto_increment primary key,
Country_Name varchar(50),
Population int,
Area int
);

Select * from Country;

-- Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name

Create table Persons (
ID int auto_increment primary key,
FName varchar(50),
LName varchar(50),
Population int,
Rating int,
Country_ID int,
Country_Name varchar(50),
foreign key (Country_ID) references Country(ID)
);

-- Insert data into Country Table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9833517),
(2, 'Canada', 37742154, 9984670),
(3, 'UK', 67886011, 243610),
(4, 'India', 1380004385, 3287263),
(5, 'Australia', 25499884, 7692024),
(6, 'Germany', 83783942, 357022),
(7, 'France', 65273511, 551695),
(8, 'Italy', 60461826, 301340),
(9, 'Japan', 126476461, 377975),
(10, 'South Korea', 51269185, 100210);

select * from Country;

-- Insert data into Persons Table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 331000000, 4.2, 1, 'USA'),
(2, 'Alice', 'Smith', 37742154, 3.8, 2, 'Canada'),
(3, 'Bob', 'Brown', 67886011, 4.5, 3, 'UK'),
(4, 'Raj', 'Kumar', 1380004385, 4.7, 4, 'India'),
(5, 'Emily', 'Davis', 25499884, 3.9, 5, 'Australia'),
(6, 'Liam', 'Wilson', 83783942, 4.0, 6, 'Germany'),
(7, 'Emma', 'Taylor', 65273511, 4.6, 7, 'France'),
(8, 'Mia', 'White', 60461826, 3.5, 8, 'Italy'),
(9, 'Noah', 'Walker', 126476461, 4.8, 9, 'Japan'),
(10, 'Olivia', 'Hall', 51269185, 4.1, 10, 'South Korea');

select * from Persons;

-- List the distinct country names from the Persons table

SELECT distinct COUNTRY_NAME FROM COUNTRY;

-- Select first names and last names from the Persons table with aliases

SELECT FNAME AS FIRST_NAME, LNAME AS LAST_NAME FROM PERSONS;

-- Find all persons with a rating greater than 4.0

SELECT concat(FNAME,' ', LNAME) AS FULL_NAME FROM PERSONS WHERE RATING>4.0 ;

-- Find countries with a population greater than 10 lakhs

SELECT COUNTRY_NAME FROM COUNTRY WHERE POPULATION > 1000000;

-- Find persons who are from 'USA' or have a rating greater than 4.5.

SELECT concat(FNAME,' ',LNAME) AS FULL_NAME, RATING
FROM PERSONS
WHERE COUNTRY_NAME = 'USA' OR RATING>'4.5';

-- Find all persons where the country name is NULL.

SELECT * FROM PERSONS WHERE COUNTRY_NAME IS NULL;

-- Find all persons from the countries 'USA', 'Canada', and 'UK'.

SELECT concat(FNAME,' ',LNAME) AS FULL_NAME FROM PERSONS WHERE COUNTRY_NAME IN ('USA', 'CANADA', 'UK');

-- Find all persons not from the countries 'India' and 'Australia'

SELECT * FROM PERSONS WHERE COUNTRY_NAME <> 'INDIA' AND COUNTRY_NAME <> 'AUSTRALIA';

-- Find all countries with a population between 5 lakhs and 20 lakhs. 

SELECT COUNTRY_NAME FROM COUNTRY WHERE POPULATION BETWEEN 500000 AND 1000000;

--  Find all countries whose names do not start with 'C'.

SELECT COUNTRY_NAME FROM COUNTRY WHERE COUNTRY_NAME NOT LIKE 'C%';

