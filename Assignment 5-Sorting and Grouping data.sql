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

--  Write an SQL query to print the first three characters of Country_name from the Country table.

SELECT Id, Country_Name, LEFT(Country_name, 3) AS Country_Code  FROM Country;

-- Write an SQL query to concatenate first name and last name from Persons table.

Select Fname, Lname, concat(Fname,' ', Lname) as Full_Name from persons;

--  Write an SQL query to count the number of unique country names from Persons table.

Select count(distinct country_name) as Unique_Country_Name from persons;

-- Write a query to print the maximum population from the Country table.

select max(population) as Maximum_Population from country;

-- Write a query to print the minimum population from Persons table

select min(population) as Minimum_Population from persons;

--  Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table.

INSERT INTO Persons (FName, LName, Population, Rating, Country_ID, Country_name) 
VALUES ('Arjun',Null , 10000, 4.2, 1, 'USA'),
       ('Arun',Null , 20000, 4.3, 2, 'India');
       
Select * from persons;

select count(Lname) as Last_name_count from persons;
       
--  Write a query to find the number of rows in the Persons table.

select count(*) as total_rows from persons;


-- Write an SQL query to show the population of the Country table for the first 3 rows. 

select country_name, population  from country limit 3;

-- Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT)

select * from country order by rand() limit 3;

-- List all persons ordered by their rating in descending order.

select * from persons order by rating desc;

-- Find the total population for each country in the Persons table.

SELECT Country_name, SUM(Population) AS Total_Population 
FROM Persons 
GROUP BY Country_name;

-- Find countries in the Persons table with a total population greater than 50,000

select * from persons where population > 50000;

-- List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.

INSERT INTO Persons (Fname, Lname, Population, Rating, Country_Id, Country_Name)
VALUES
('John', 'Doe', 331000000, 4, 1, 'USA'),
('Alice', 'Smith', 37742154, 4, 2, 'Canada'),
('Bob', 'Brown', 67886011, 4, 3, 'UK'),
('Raj', 'Kumar', 1380004385, 4, 4, 'India'),
('Emily', 'Davis', 25499884, 4, 5, 'Australia'),
('Liam', 'Wilson', 83783942, 4, 6, 'Germany'),
('Emma', 'Taylor', 65273511, 4, 7, 'France'),
('Mia', 'White', 60461826, 4, 8, 'Italy'),
('Noah', 'Walker', 126476461, 5, 9, 'Japan'),
('Olivia', 'Hall', 51269185, 4, 10, 'South Korea'),
('Michael', 'Johnson', 331000000, 3.8, 1, 'USA'),
('Sophia', 'Williams', 1380004385, 4.2, 4, 'India'),
('James', 'Davis', 37742154, 3.9, 2, 'Canada');

select * from persons;


SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Avg_Rating 
FROM Persons 
GROUP BY Country_name 
HAVING COUNT(*) > 2
ORDER BY Avg_Rating ASC;


