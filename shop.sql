CREATE DATABASE onlineshopping;
-- DROP database onlineshopping;


USE onlineshopping;

CREATE TABLE cust_address
(
    pincode INT PRIMARY KEY,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL
);

CREATE TABLE customers
(
    customer_id INT PRIMARY KEY,
	customer_name VARCHAR(50) NOT NULL,
	contact_no VARCHAR(20) NOT NULL,
    customer_password varchar(10),
    customer_email varchar(50), 
    address varchar(200),
    FOREIGN KEY (address) REFERENCES cust_address(pincode)
);

CREATE TABLE products
(
    product_id INT PRIMARY KEY,
    product_details varchar(50),
    product_price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE payments
(
    payment_id INT PRIMARY KEY,
    payment_date DATE NOT NULL,
    payment_amount INT  NOT NULL,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    payment_id int,
    customer_id INT,
    FOREIGN KEY (payment_id) REFERENCES payments(payment_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE admin
(
    admin_id INT PRIMARY KEY ,
    admin_name VARCHAR(50) NOT NULL,
    admin_role VARCHAR(50),
    admin_password varchar(20)
);

CREATE TABLE shopping_website
(
    website_id INT PRIMARY KEY,
    website_url VARCHAR(60) NOT NULL,
    website_name VARCHAR(20),
    customer_care VARCHAR(10) NOT NULL,
    admin_id int,
    foreign key (admin_id) references admin(admin_id),
	product_id int,
	foreign key (product_id) references products(product_id)
);

INSERT INTO addresses (pincode, city, state)
VALUES
(10001, 'New York', 'NY'),
(20002, 'Los Angeles', 'CA'),
(30003, 'Chicago', 'IL'),
(40004, 'Houston', 'TX'),
(50005, 'Miami', 'FL'),
(60006, 'San Francisco', 'CA'),
(70007, 'Seattle', 'WA'),
(80008, 'Boston', 'MA');

INSERT INTO customers (customer_id, customer_name, contact_no, customer_password, address)
VALUES
(1, 'John Doe', '123-456-7890', 'pass123', 10001),
(2, 'Alice Smith', '987-654-3210', 'p@ssw0rd', 20002),
(3, 'Bob Johnson', '555-123-4567', 'secure123', 30003),
(4, 'Emma Davis', '333-222-1111', 'password1', 40004),
(5, 'Mike Wilson', '777-888-9999', 'letmein', 50005),
(6, 'Linda Brown', '111-222-3333', 'p@ssw0rd', 60006),
(7, 'Mark Harris', '999-888-7777', '123456', 70007),
(8, 'Sarah Jackson', '444-555-6666', 'sarah123', 80008);


INSERT INTO products (product_id, product_details, product_price)
VALUES
(1, 'Laptop', 800.00),
(2, 'Smartphone', 500.00),
(3, 'Tablet', 300.00),
(4, 'Desktop PC', 1000.00),
(5, 'Headphones', 50.00),
(6, 'Camera', 400.00),
(7, 'Printer', 150.00),
(8, 'Router', 75.00);


INSERT INTO payments (payment_id, payment_date, payment_amount, product_id)
VALUES
(1, '2023-11-05', 800, 1),
(2, '2023-11-06', 500, 2),
(3, '2023-11-07', 300, 3),
(4, '2023-11-08', 1000, 4),
(5, '2023-11-09', 50, 5),
(6, '2023-11-10', 400, 6),
(7, '2023-11-11', 150, 7),
(8, '2023-11-12', 75, 8);

INSERT INTO orders (order_id, payment_id, customer_id)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8);

INSERT INTO admin (admin_id, admin_name, admin_role, admin_password)
VALUES
(1, 'SuperAdmin', 'Super Administrator', 'admin123'),
(2, 'Manager1', 'Manager', 'manager456'),
(3, 'Assistant1', 'Assistant', 'assistant789'),
(4, 'Admin4', 'Administrator', 'admin456'),
(5, 'Manager2', 'Manager', 'manager789'),
(6, 'Admin5', 'Administrator', 'admin567'),
(7, 'Assistant2', 'Assistant', 'assistant123'),
(8, 'Admin6', 'Administrator', 'admin890');

INSERT INTO shopping_website (website_id, website_url, website_name, contact_no, admin_id, product_id)
VALUES
(1, 'example.com', 'Example Store', '9876543210', 1, 1),
(2, 'shopnow.com', 'ShopNow', '1234567890', 2, 2),
(3, 'gadgetmart.com', 'Gadget Mart', '5555555555', 3, 3),
(4, 'techdeals.com', 'Tech Deals', '9998887777', 4, 4),
(5, 'electronicsrus.com', 'Electronics R Us', '4444444444', 5, 5),
(6, 'cameraworld.com', 'Camera World', '1112223333', 6, 6),
(7, 'printershop.com', 'Printer Shop', '7777777777', 7, 7),
(8, 'networkstore.com', 'Network Store', '6666666666', 8, 8);

SELECT pro.product_details, SUM(pm.payment_amount) AS total_payment
FROM products pro
JOIN payments pm ON pro.product_id = pm.product_id
WHERE pro.product_id = 4
GROUP BY pro.product_details;

SELECT o.order_id, p.product_details, p.product_price
FROM orders o
JOIN payments pm ON o.payment_id = pm.payment_id
JOIN products p ON pm.product_id = p.product_id
WHERE o.customer_id = 3;

SELECT admin_name, admin_role
FROM admin;

SELECT product_details, product_price
FROM products;
