CREATE TABLE Subscription_plan(
 plan_id INT PRIMARY KEY,
 plan_name varchar(100) UNIQUE,
 price INT, 
 duration INT, 
 features TEXT
);


CREATE TABLE vendor(
 vendor_id INT PRIMARY KEY,
 business_name VARCHAR(200),
 contact_person VARCHAR(200),
 email VARCHAR(200) UNIQUE, 
 phone_number VARCHAR(200) UNIQUE,
 business_address VARCHAR(200),
 plan_id INT REFERENCES Subscription_plan(plan_id)

);
CREATE TABLE product(
 product_id INT PRIMARY KEY,
 product_name VARCHAR(200),
 product_description TEXT,
 price INT, 
 stock_quantity INT,
 status_isactive BOOLEAN,
 vendor_id  INT REFERENCES vendor(vendor_id)
);
CREATE TABLE category(
 category_id INT PRIMARY KEY,
 category_name VARCHAR(200), 
 category_description TEXT
);
CREATE TABLE Productcategory(
 id INT,
 PRIMARY KEY(id,product_id,category_id),
 product_id  INT REFERENCES product( product_id),
 category_id  INT REFERENCES category (category_id)
);
CREATE TABLE customers(
 customer_id INT PRIMARY KEY,
 customer_name VARCHAR(200),
 customer_email VARCHAR(200),
 phone_number VARCHAR(30),
 address VARCHAR(200)
);
CREATE TABLE Orderlist(
 Order_id INT PRIMARY KEY,
 Order_date INT,
 total_amaount INT,
 order_status VARCHAR(100),
 product_id  INT REFERENCES product( product_id),
 customer_id INT REFERENCES  customers(customer_id)
);
CREATE TABLE Orderitem(
 id INT PRIMARY KEY,
 quantity INT,
 unit_price INT,
 subtotal INT,
 Order_id INT REFERENCES Orderlist (Order_id)
);

CREATE TABLE paymentmethod(
 payment_id INT,
 method VARCHAR(100),
 amount INT,
 payment_date INT,
 payment_status BOOLEAN,
 id INT REFERENCES Orderitem(id)
);
INSERT INTO Subscription_plan ( plan_id,plan_name, price, duration, features)VALUES
(1,'Basic', 0.00, 30, 'Basic product listing');
INSERT INTO vendor(vendor_id,business_name,contact_person,email,phone_number, business_address,plan_id)VALUES
( 1,'SmartTech Ltd.','Rahim Khan','rahim@smarttech.com','017XXXXXXXX','Dhaka,Bangladesh',1);
INSERT INTO product(product_id,product_name,product_description,price,stock_quantity,status_isactive,vendor_id)VALUES
(1,'Laptop','High performance laptop', 75000, 10, True,1);

INSERT into category(category_id,category_name,category_description) VALUES(1, 'Electronics', 'Electronics product');

INSERT into Productcategory(id,product_id,category_id) VALUES(1, 1, 1);

INSERT INTO customers(customer_id,customer_name,customer_email,phone_number,address) VALUES
(1,'Karim Uddin','karim@example.com','018XXXXXXXX','Barishal'),
(2,'Nadia Islam','oldcustomer@gmail.com','019XXXXXXX','Patuakhali');
INSERT INTO Orderlist(Order_id,Order_date, total_amaount,Order_status,product_id,customer_id)VALUES
(1,2026-10-01, 76200.00,'',1,1);
INSERT INTO paymentmethod(payment_id,method,amount,payment_date,payment_status)VALUES
(1, 'Card',76200.00, 2026-10-01 10:05, 'paid'),
(2, 'Bkash',2400.00,  2026-10-05 15:35, 'panding');

UPDATE product
SET stock_quantity=15
WHERE product_name='Laptop';

DELETE FROM customers
WHERE  customer_email = 'oldcustomer@gmail.com';




