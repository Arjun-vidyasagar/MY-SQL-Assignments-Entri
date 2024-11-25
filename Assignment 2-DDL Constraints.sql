-- -- Creating a Database named 'Sales'
create database Sales;
Use Sales;

-- Creating a table named 'Orders' in the Sales Database

create table Orders (
Order_Id int auto_increment primary key,
Customer_name varchar(25) not null,
Product_Category varchar(50) not null,
Ordered_item varchar(10) not null,
Contact_No varchar(10) unique not null
);

-- Adding a new column named “order_quantity” to the orders table

Alter table Orders
Add column Order_quantity int not null;

--  Renaming the orders table to the sales_orders 

Rename table Orders to Sales_Orders;

--  Inserting 10 rows into the sales_orders table.

Insert into Sales_Orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, Order_quantity) Values 
('001','Alice', 'Electronics', 'Smartphone', 8798956430,2),
('002','Sahadevan', 'Clothing', 'Jacket', 9876543210, 2),
('003','Suraj', 'Books', 'Novel', 1122334455, 3),
('004','Rose', 'Electronics', 'Laptop', 2233445566, 1),
('005','Thamanah', 'Groceries', 'Rice Bag', 3344556677, 5),
('006','Ganesh', 'Clothing', 'T-shirt', 4455667788, 4),
('007','George', 'Furniture', 'Chair', 5566778899, 2),
('008','Arjun', 'Groceries', 'Milk', 6677889900, 6),
('009','Indrajith', 'Books', 'Textbook', 7788990011, 2),
('010','Shine', 'Electronics', 'Headphones', 8899001122, 1);

Select * from Sales_Orders;

-- Retrieve customer_name and Ordered_Item from the sales_orders table

SELECT Customer_name, Ordered_item FROM sales_orders;

-- Use the UPDATE command to change the name of the product for any row

UPDATE Sales_orders
SET Ordered_item = 'Jeans'
WHERE Order_Id = 6;

-- Deleting the sales_orders table from the database.

drop table sales_orders;
