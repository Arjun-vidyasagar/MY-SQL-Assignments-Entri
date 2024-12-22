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

-- Inner Join:

SELECT c.Country_Name AS Country, p.Fname AS First_Name, p.Lname AS Last_Name
FROM Country c
INNER JOIN Persons p ON c.ID = p.Country_ID;

-- Left join

SELECT c.Country_Name AS Country, p.Fname AS First_Name, p.Lname AS Last_Name
FROM Country c
LEFT JOIN Persons p ON c.ID = p.Country_ID;

-- right join

SELECT C.Country_Name AS Country, P.Fname AS First_Name, P.Lname AS Last_Name
FROM Country C
RIGHT JOIN Persons P ON C.ID = P.Country_ID;

-- List all distinct country names from both the Country and Persons tables

SELECT DISTINCT Country_Name
FROM Country
UNION
SELECT DISTINCT Country_Name
FROM Persons;

-- List all country names from both the Country and Persons tables, including duplicates.

select Country_Name
From Country
union all
select Country_Name 
From Persons;

-- Round the ratings of all persons to the nearest integer in the Persons table.

SELECT Fname AS First_Name, Lname AS Last_Name, ROUND(Rating) AS Rounded_Rating
FROM Persons;

