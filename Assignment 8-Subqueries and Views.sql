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

select * from persons;

--  Find the number of persons in each country. 

SELECT Country_Name, COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_Name;

-- Find the number of persons in each country sorted from high to low

SELECT Country_Name, COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_Name
Order by Number_of_Persons desc;

-- Find out an average rating for Persons in respective countries if the average is greater than 3.0

Select Country_Name, avg(rating) as Average_rating
from persons
group by country_name
having Average_rating >3;

-- Find the countries with the same rating as the USA (Using Subqueries):
select  country_name
from persons
where rating = (select avg(rating) from persons where country_name ='USA');

-- Select all countries whose population is greater than the average population of all nations:

select country_name, population
from persons
where population > (select avg(population) from persons);

-- Create Database and Customer Table:

create database product;
Use Product;

CREATE TABLE Customer (
    Customer_Id INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone_No VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_Code VARCHAR(10),
    Country VARCHAR(50)
);

INSERT INTO Customer (First_Name, Last_Name, Email, Phone_No, Address, City, State, Zip_Code, Country)
VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm Street', 'Los Angeles', 'California', '90001', 'USA'),
('Jane', 'Smith', 'jane.smith@example.com', '2345678901', '456 Maple Avenue', 'San Francisco', 'California', '94101', 'USA'),
('Robert', 'Brown', 'robert.brown@example.com', '3456789012', '789 Oak Lane', 'Seattle', 'Washington', '98101', 'USA'),
('Emily', 'Davis', 'emily.davis@example.com', '4567890123', '101 Pine Road', 'Portland', 'Oregon', '97201', 'USA'),
('Michael', 'Johnson', 'michael.johnson@example.com', '5678901234', '202 Birch Boulevard', 'Chicago', 'Illinois', '60601', 'USA'),
('Sarah', 'Wilson', 'sarah.wilson@example.com', '6789012345', '303 Cedar Street', 'Houston', 'Texas', '77001', 'USA'),
('David', 'Martinez', 'david.martinez@example.com', '7890123456', '404 Spruce Avenue', 'Phoenix', 'Arizona', '85001', 'USA'),
('Sophia', 'Lopez', 'sophia.lopez@example.com', '8901234567', '505 Palm Court', 'Miami', 'Florida', '33101', 'USA'),
('James', 'Taylor', 'james.taylor@example.com', '9012345678', '606 Willow Drive', 'Denver', 'Colorado', '80201', 'USA'),
('Olivia', 'Anderson', 'olivia.anderson@example.com', '0123456789', '707 Fir Street', 'Boston', 'Massachusetts', '02101', 'USA');

-- Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. 

create view customer_info as 
select concat(First_Name,' ', Last_Name) as Full_Name, email
from customer;

select * from customer_info;

-- Create a view named US_Customers that displays customers located in the US:

create view us_customers as
select concat(First_Name,' ', Last_Name) as Full_Name
from customer
where country ='USA';

select * from us_customers;

-- Create another view named Customer_details with columns Full Name, Email, Phone Number, and State:

create view Customer_Details as
select concat(First_Name,' ', Last_Name) as Full_Name, email, Phone_No, state from customer;

select * from Customer_details;

-- Update phone numbers of customers who live in California for the Customer_details view:

UPDATE Customer
SET Phone_No = '123-456-7890'
WHERE State = 'California';

-- Count the number of customers in each state and show only states with more than 5 customers:

SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

-- Write a query that will return the number of customers in each state, based on the State column in the Customer_details view:

SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer_details
GROUP BY State;

-- Write a query that returns all the columns from the Customer_details view, sorted by the State column in ascending order:

select * from customer_details
order by state asc;




