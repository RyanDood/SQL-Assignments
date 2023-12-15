select * from Customers

alter table Customers
alter column phone varchar(15) not null

insert into Customers(customer_id,first_name,last_name,email,phone,address)
values
(3,'Daniel','Vijay','vijay@gmail.com','9721035100','Coimbatore-TamilNadu'),
(4,'Arul','Sethupathi','sethupathi@gmail.com','8794563210','Madurai-TamilNadu'),
(5,'Mahesh','Vincent','mahesh@gmail.com','1456987542','Vizag-Andhra'),
(6,'Arun','Mozhi','arun@gmail.com','4987564210','Tirunelveli-TamilNadu'),
(7,'Madurai','Muthu','muthu@gmail.com','7896542310','Salem-TamilNadu'),
(8,'Billy','Yash','yash@gmail.com','9721035100','Washington-USA'),
(9,'Dilli','Joy','dilli@gmail.com','6587942130','Patna -Bihar'),
(10,'Sunaina','Mary','mary@gmail.com','4752315648','Mumbai-Maharashtra')

select *  from Products

insert into Products(product_id,product_name,description,price)
values
(1,'Dove Shampoo','New Neem Flavour',80),
(2,'Baby Powder','Increased Protection',140),
(3,'Ink Pen','Fluid Ball',40),
(4,'Samsung S23 Ultra','High Definition Camera',24000),
(5,'Mac M5','High end laptop',1500000),
(6,'Fog Scent','New Flavour',160),
(7,'Tupperware','New Larger Sized Bottle',230)

select *  from Orders

insert into Orders(order_id,customer_id,order_date,total_amount)
values
(2,3,'2023-04-18',24000),
(3,7,'2023-04-24',160),
(4,1,'2023-05-11',230),
(5,5,'2023-05-29',1500000),
(6,9,'2023-06-13',80)

select *  from OrderDetails

insert into OrderDetails(order_detais_id,order_id,product_id,quantity) 
values
(1,1,3,1),
(2,2,4,1),
(3,3,6,1),
(4,4,7,1),
(5,5,5,1),
(6,6,1,1)

select *  from Inventory

insert into Inventory(inventory_id,product_id,quantity,last_stock_update)
values
(2,2,7,'2023-03-12'),
(3,3,40,'2023-03-20'),
(4,4,3,'2023-04-07'),
(5,5,1,'2023-04-12'),
(6,6,12,'2023-04-25'),
(7,7,11,'2023-05-11')

alter table Products
add constraint CK_price
check(price > 0)

alter table  Products
add constraint DF_category
default 1 for category

alter table Products
add constraint FK_Products_Category
foreign key(category) references Category(id)

--DML:

--1. Write an SQL query to retrieve the names and emails of all customers.:

select first_name,email from Customers

--2. Write an SQL query to list all orders with their order dates and corresponding customer names:

select order_id,order_date,first_name from Orders inner join Customers
on Orders.customer_id = Customers.customer_id

--Alternate
select Orders.customer_id,order_date,first_name from Orders,Customers
where Customers.customer_id = Orders.customer_id

--3. Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address:

insert into Customers(customer_id,first_name,last_name,email,phone,address) values(11,'Hema','Jude','hema@gmail.com','6578441203','WestBengal-Kolkata')

--4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%:

update Products
set price = price + (price * 10/100);

--5 Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter:

Declare @input int
set @input = 7
delete from OrderDetails where order_id = @input
delete from Orders where order_id = @input

--6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information:

insert into Orders(order_id,customer_id,order_date,total_amount) values(7,10,'2023-06-19',498)
insert into OrderDetails(order_detais_id,order_id,product_id,quantity) values(7,7,7,2)

--7. Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information:

Declare @user_input int
set @user_input = 1
update Customers
set email = 'dood@gmail.com',address = 'Trichy,TamilNadu'
where customer_id = @user_input

--8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table:

select order_id,price * quantity as total_cost from OrderDetails inner join Products
on OrderDetails.product_id = Products.product_id

update Orders
set total_amount = (select price * quantity as total_cost from OrderDetails inner join Products
on OrderDetails.product_id = Products.product_id
where Orders.order_id = OrderDetails.order_id)

--OR
select order_id,price * quantity as 'total' from Products,OrderDetails
where Products.product_id = OrderDetails.product_id

update Orders
set total_amount = (select price * quantity as 'total' from Products,OrderDetails
where Products.product_id = OrderDetails.product_id 
and OrderDetails.order_id = Orders.order_id)

--9 Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter:

insert into Orders(order_id,customer_id,order_date,total_amount) values(8,11,'2023-06-20',88)
insert into Orders(order_id,customer_id,order_date,total_amount) values(9,11,'2023-06-21',44)
insert into OrderDetails(order_detais_id,order_id,product_id,quantity) values(8,8,1,1)
insert into OrderDetails(order_detais_id,order_id,product_id,quantity) values(9,9,3,1)

Declare @delete_user_input int
Declare @user_order_no int
set @delete_user_input = 11
delete from OrderDetails where order_id in (select order_id from Orders
where customer_id = @delete_user_input)
delete from Orders where customer_id = @delete_user_input

--10 Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details:

insert into Products(product_id,product_name,description,price) values(8,'HP Mouse','Best Gaming Mouse',850)

--11 Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status:

alter table Orders
add status varchar(15) null

Declare @user_input_status varchar(15)
set @user_input_status = 'Delivered'
Declare @order_id int
set @order_id = 8
update Orders
set status = @user_input_status
where order_id= @order_id

--12 Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table:

alter table Customers
add no_of_orders int null

select customer_id,count(customer_id) as total_orders from Orders
group by customer_id

update Customers
set no_of_orders = (select count(customer_id) as total_orders from Orders
where Orders.customer_id = Customers.customer_id
group by customer_id)



--AGGREGATE FUNCTIONS:

--1. Write an SQL query to find out which customers have not placed any orders:

select Customers.customer_id,first_name from Orders right join Customers
on Orders.customer_id = Customers.customer_id
where order_id is null

--2. Write an SQL query to find the total number of products available for sale:

select count(*) as 'total_available_products' from Products

--3. Write an SQL query to calculate the total revenue generated by TechShop

select sum(total_amount) from Orders

--4. Write an SQL query to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter:

select * from OrderDetails inner join Products
on OrderDetails.product_id = Products.product_id

declare @cat int
set @cat = 1
select category,avg(quantity) as avg_quantity_ordered from OrderDetails inner join Products
on OrderDetails.product_id = Products.product_id
group by category

--5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter:

Declare @customer_user_id int
set @customer_user_id = 11
select sum(total_amount) as total_revenue from Orders
where customer_id = @customer_user_id

--6. Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed:

select Customers.customer_id,first_name,total_orders from Customers inner join (select customer_id,count(customer_id) as total_orders from Orders
group by customer_id) O
on Customers.customer_id = O.customer_id 
where total_orders = (select max(total_orders) from Customers inner join (select customer_id,count(customer_id) as total_orders from Orders
group by customer_id) O
on Customers.customer_id = O.customer_id)

--OR
select first_name,no_of_orders from Customers
where no_of_orders = (select max(no_of_orders) from Customers)

--7. Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders

select id,category_name,total_quantity_ordered from Category inner join (select category,sum(quantity) as total_quantity_ordered from OrderDetails inner join Products
on OrderDetails.product_id = Products.product_id
group by category) P
on Category.id = P.category
where total_quantity_ordered = (select max(total_quantity_ordered) from Category inner join (select category,sum(quantity) as total_quantity_ordered from OrderDetails inner join Products
on OrderDetails.product_id = Products.product_id
group by category) P
on Category.id = P.category)

--8. Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending

declare @cat_input int
set @cat_input = 3
select first_name,category,total_spent from OrderDetails inner join Orders
on OrderDetails.order_id = Orders.order_id inner join Products
on OrderDetails.product_id = Products.product_id inner join Customers
on Orders.customer_id = Customers.customer_id inner join (select Orders.customer_id,sum(total_amount) as total_spent from OrderDetails inner join Orders
on OrderDetails.order_id = Orders.order_id inner join Products
on OrderDetails.product_id = Products.product_id inner join Customers
on Orders.customer_id = Customers.customer_id
where category = @cat_input
group by Orders.customer_id) A
on Orders.customer_id = A.customer_id
where total_spent = (select max(total_spent) from OrderDetails inner join Orders
on OrderDetails.order_id = Orders.order_id inner join Products
on OrderDetails.product_id = Products.product_id inner join (select Orders.customer_id,sum(total_amount) as total_spent from OrderDetails inner join Orders
on OrderDetails.order_id = Orders.order_id inner join Products
on OrderDetails.product_id = Products.product_id inner join Customers
on Orders.customer_id = Customers.customer_id
where category = @cat_input
group by Orders.customer_id) A
on Orders.customer_id = A.customer_id)

--9. Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers.

select avg(total_amount) as 'avg_order_revenue' from Orders

--10. Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count

select customer_id,count(customer_id) as total_orders_placed from Orders
group by customer_id

--OR
select first_name, no_of_orders from Customers






--JOINS:

--1. Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order

select Orders.order_id,order_date,Orders.customer_id,first_name from Orders inner join Customers
on Customers.customer_id = Orders.customer_id

--2. Write an SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue

select id,category_name,product_name,total_revenue from Category inner join (select Products.product_id,product_name,category, sum(total) as total_revenue from Products inner join (select OrderDetails.product_id,price * quantity as total from OrderDetails inner join Products
on OrderDetails.product_id = Products.product_id) P
on Products.product_id = P.product_id
group by Products.product_id,product_name,category) C
on Category.id = C.category
where id = 3

--3. Write an SQL query to list all customers who have made at least one purchase. Include their names and contact information

select Customers.customer_id,first_name,phone from Customers inner join (select customer_id from Orders group by customer_id) O
on Customers.customer_id = O.customer_id

--OR

select first_name,phone from Customers 
where no_of_orders is not null

--4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered

declare @category_input int
set @category_input = 3
select product_name,total_ordered from Products inner join (select product_id,sum(quantity) as total_ordered from OrderDetails
group by product_id) D
on Products.product_id = D.product_id
where total_ordered = (select max(total_ordered) as Max from Products inner join (select product_id,sum(quantity) as total_ordered from OrderDetails
group by product_id) D
on Products.product_id = D.product_id
where category = @category_input
group by category) and category = @category_input

--5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.

select product_name,category_name from Products inner join Category
on Products.category = Category.id
where id = 3

--6. Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value

select Customers.customer_id,first_name, avg(total_amount) as 'avg_order_value' from Orders right join Customers
on Customers.customer_id = Orders.customer_id
group by Customers.customer_id,first_name

--7. Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue

select order_id,first_name,total_amount as 'total_revenue' from Orders left join Customers
on Orders.customer_id = Customers.customer_id
where total_amount = (select max(price) from Products right join OrderDetails
on OrderDetails.product_id = Products.product_id)

--8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered

select Products.product_name,Products.product_id, sum(quantity) as 'total_quantity_order' from Products left join OrderDetails
on OrderDetails.product_id = Products.product_id
where category = 3
group by Products.product_id,Products.product_name

--9. Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter

declare @product_name varchar(50)
set @product_name = 'Ink Pen'
select first_name,product_name from OrderDetails inner join Products
on OrderDetails.product_id = Products.product_id inner join Orders
on OrderDetails.order_id = Orders.order_id inner join Customers
on Orders.customer_id = Customers.customer_id
where product_name =  @product_name

--10. Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameterss

declare @start_date varchar(50)
set @start_date = '2023-06-18'
declare @end_date varchar(50)
set @end_date = '2023-11-29'
select sum(amount) as 'total_revenue' from Orders inner join (select order_date, total_amount as amount from Orders
where order_date between @start_date and @end_date) O
on Orders.order_date = O.order_date
where Orders.order_date between @start_date and @end_date 