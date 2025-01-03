CREATE DATABASE library;
USE library;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
    );
    
    CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3), 
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);


CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO Branch (Branch_no, Branch_address)
VALUES
(101, 'Downtown Office'),
(102, 'Uptown Branch'),
(103, 'Suburban Branch');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(1, 'John Doe', 'Manager', 75000.00, 101),
(2, 'Jane Smith', 'Assistant Manager', 55000.00, 102),
(3, 'Michael Brown', 'Clerk', 35000.00, 101),
(4, 'Emily Davis', 'HR', 40000.00, 103),
(5, 'Robert Wilson', 'Supervisor', 60000.00, 102),
(6, 'Laura Adams', 'Accountant', 52000.00, 103),
(7, 'David Clark', 'Technician', 48000.00, 101);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
(101, 'To Kill a Mockingbird', 'Fiction', 150.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
(102, '1984', 'Dystopian', 120.00, 'no', 'George Orwell', 'Secker & Warburg'),
(103, 'The Great Gatsby', 'Classic', 100.00, 'yes', 'F. Scott Fitzgerald', 'Charles Scribner\'s Sons'),
(104, 'Moby Dick', 'Adventure', 130.00, 'no', 'Herman Melville', 'Harper & Brothers'),
(105, 'A Brief History of Time', 'History', 200.00, 'yes', 'Stephen Hawking', 'Bantam Books'),
(106, 'Sapiens: A Brief History of Humankind', 'History', 250.00, 'yes', 'Yuval Noah Harari', 'Harvill Secker'),
(107, 'Pride and Prejudice', 'Romance', 90.00, 'yes', 'Jane Austen', 'T. Egerton');

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(1, 'Alice Green', '123 Elm Street', '2024-01-15'),
(2, 'Bob White', '456 Oak Avenue', '2024-02-20'),
(3, 'Charlie Black', '789 Pine Lane', '2024-03-10'),
(4, 'Diana King', '321 Maple Drive', '2021-12-25'),
(5, 'Edward Collins', '654 Birch Boulevard', '2023-01-05'),
(6, 'Fiona Hall', '987 Cedar Road', '2022-07-20'),
(7, 'George Baker', '159 Spruce Way', '2021-11-11');

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1, 1, 'To Kill a Mockingbird', '2023-06-01', 101),
(2, 2, '1984', '2024-04-05', 102),
(3, 3, 'The Great Gatsby', '2023-06-15', 103),
(4, 6, 'A Brief History of Time', '2023-06-20', 105),
(5, 7, 'Sapiens: A Brief History of Humankind', '2024-03-12', 106),
(6, 5, 'Pride and Prejudice', '2024-02-28', 107),
(7, 4, 'Moby Dick', '2024-04-01', 104);

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(1, 1, 'To Kill a Mockingbird', '2024-04-15', 101),
(2, 2, '1984', '2024-04-20', 102),
(3, 3, 'The Great Gatsby', '2023-06-30', 103),
(4, 4, 'Moby Dick', '2024-04-25', 104),
(5, 5, 'Pride and Prejudice', '2024-03-15', 107),
(6, 6, 'A Brief History of Time', '2023-07-05', 105),
(7, 7, 'Sapiens: A Brief History of Humankind', '2024-03-20', 106);

-- 1. Retrieve the book title, category, and rental price of all available books

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary.

SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.

SELECT b.Book_title, c.Customer_name
FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

-- 4. Display the total count of books in each category.

SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
  AND Customer_Id NOT IN (
      SELECT Issued_cust 
      FROM IssueStatus
  );
  
  -- 7. Display the branch numbers and the total count of employees in each branch.
  
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.

SELECT c.Customer_name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE i.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- 9. Retrieve book titles from the book table containing "history".

SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

-- 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.

SELECT Branch_no, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses.

SELECT e.Emp_name AS Employee_Name, b.Branch_address AS Branch_Address
FROM Branch b
JOIN Employee e ON b.Manager_Id = e.Emp_Id;

-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25.

SELECT c.Customer_name, b.Rental_Price
FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE b.Rental_Price > 25;
