# Assignment 1-DDL Commands
This assignment involves creating and manipulating a database named School to demonstrate various DDL commands in SQL. A table named STUDENT was created with fields Roll_No, First_Name, Last_Name, Marks, and Grade, incorporating constraints for data integrity. Sample data was inserted, and the SELECT command was used to display records. The table was altered by adding a Contact column and removing the Grade column. It was then renamed to CLASSTEN, and all rows were deleted using the TRUNCATE command while retaining the table structure. Finally, the table was permanently removed using the DROP command, showcasing the complete lifecycle of table management in SQL.

# Assignment 2-DDL Constraints
This assignment involves creating and managing a database named "Sales", starting with the creation of a table named Orders that includes fields for Order_Id, Customer_name, Product_Category, Ordered_item, and Contact_No, with appropriate constraints like Primary Key, Unique, and Not Null. The table was then modified by adding a new column order_quantity, renaming it to sales_orders, and inserting 10 rows of sample data. Various SQL operations were performed, such as retrieving specific columns (Customer_name and Ordered_item), updating a product name based on Order_Id, and finally deleting the sales_orders table. 

# Assignment 3-DML Commands
This assignment involves creating a table named Managers with fields including Manager_Id, First_Name, Last_Name, DOB, Age (with a CHECK constraint), Gender, Department, and Salary (NOT NULL). The assignment demonstrates key SQL operations such as table creation, inserting 10 rows, and performing various queries. These include retrieving the name and date of birth of a manager with Manager_Id 1, calculating the annual income of all managers, displaying records excluding a specific manager named 'Aaliya', filtering managers from the IT department earning above 25,000 per month, and selecting managers with salaries between 10,000 and 35,000.

# Assignment 4-Querying Data
This assignemnt involves fundamental operations for database management and querying. CREATE DATABASE and CREATE TABLE are used to define the database structure, including tables, fields, and constraints like PRIMARY KEY and FOREIGN KEY. INSERT INTO is employed to populate the tables with sample data. Data retrieval is achieved through SELECT, with enhancements like DISTINCT for unique results, WHERE for filtering, BETWEEN for range-based conditions, and IN or NOT IN for set-based queries. Functions like CONCAT and aliases simplify and format query outputs, while comparison operators (=, <>, >, <) and wildcard-based filters (LIKE, NOT LIKE) allow for precise data extraction.

# Assignment 5-Sorting and Grouping data
This assignment involves creating a world database with two tables: Country (fields: ID, Country_Name, Population, Area) and Persons (fields: ID, Fname, Lname, Population, Rating, Country_Id, Country_Name). After creating the tables, 10 rows of data were inserted into both. The assignment includes SQL queries to perform basic operations like selecting parts of data (e.g., first three characters of Country_Name), concatenating names, counting unique countries, and finding maximum and minimum populations. It also includes grouping and sorting data, such as counting persons per country and finding average ratings. 

# Assignment 6-Joins and Union
This assignment involves creating a database named world with two tables: Country and Persons. The Country table stores details about various countries, including their population and area, while the Persons table contains information about individuals, including their name, associated country, and ratings. After inserting sample data into both tables, SQL queries are used to perform various operations, such as joining the tables with inner, left, and right joins, extracting distinct and duplicate country names, and rounding ratings in the Persons table.

# Assignment 7-Functions
This assignment involves creating and managing a database called world, which contains two tables: Country and Persons. The Country table includes information such as the country ID, name, population, and area, while the Persons table stores details about individuals, including their ID, first and last names, population, rating, and a foreign key reference to the Country table. The assignment covers various SQL operations, including creating both tables, inserting data, and adding a new column for the Date of Birth (DOB) in the Persons table. Additionally, a user-defined function is created to calculate the age of individuals based on their DOB, and queries are executed to find the length of each country name, extract the first three characters of country names, and convert country names to uppercase and lowercase.

# Assignment 8-Subqueries and Views
This assignment involves creating and manipulating a database named world containing two tables, Country and Persons, and another database named product with a Customer table. In the world database, we create and populate the Country and Persons tables, linking them via foreign keys. Queries are executed to analyze data, including counting persons by country, calculating average ratings for countries, and identifying countries based on population and rating criteria. Subqueries and aggregations are used to extract insights such as average populations and countries matching specific conditions. In the product database, the Customer table is created to manage customer details, with views created for simplified data representation. These include customer_info for customer names and emails, us_customers for US-based customers, and customer_details for detailed information. Queries are performed to count customers by state, update phone numbers for specific conditions, and sort data. 

# Assignment 9-Stored Procedures
This assignment involves the creation and management of a Company database with a Worker table, covering essential SQL operations and stored procedures. The Worker table stores employee details like Worker_Id, FirstName, LastName, Salary, JoiningDate, and Department, with sample records inserted for demonstration. Various stored procedures are implemented, including adding a new worker (addworker), retrieving a worker's salary (getworkersalary), updating a worker's department (UpdateWorkerDepartment), counting workers in a department (CountWorkersInDepartment), and calculating the average salary in a department (AvgSalaryInDepartment). 


