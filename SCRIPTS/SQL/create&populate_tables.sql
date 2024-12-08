use sakila;

# dim_date table
DROP TABLE IF EXISTS dim_date;
CREATE TABLE dim_date AS
WITH RECURSIVE calendar AS (
    SELECT DATE('2005-01-01') AS date
    UNION ALL
    SELECT DATE_ADD(date, INTERVAL 1 DAY)
    FROM calendar
    WHERE date < '2006-12-31'
)
SELECT 
    DATE_FORMAT(date, '%Y%m%d') AS date_id,
    date,
    YEAR(date) AS year,
    MONTH(date) AS month,
    DAY(date) AS day,
    DAYOFWEEK(date) AS day_of_week,
    QUARTER(date) AS quarter
FROM calendar;

SHOW VARIABLES LIKE 'sql_generate_invisible_primary_key';
SET SESSION sql_generate_invisible_primary_key = OFF;

SHOW VARIABLES LIKE 'sql_generate_invisible_primary_key';
ALTER TABLE dim_date DROP PRIMARY KEY;
ALTER TABLE dim_date ADD PRIMARY KEY (date_id);


# dim_customer
DROP TABLE IF EXISTS dim_customer;
CREATE TABLE dim_customer (
    customer_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    active TINYINT(1),
    create_date DATETIME,
    PRIMARY KEY (customer_id)
);
INSERT INTO dim_customer (customer_id, first_name, last_name, email, active, create_date)
SELECT 
    customer_id,      
    first_name,
    last_name,
    email,
    active,
    create_date
FROM customer;

# dim_film
DROP TABLE IF EXISTS dim_film;
CREATE TABLE dim_film (
    film_id INT NOT NULL,
    title VARCHAR(255),
    description TEXT,
    release_year YEAR,
    language_id INT,
    rating VARCHAR(10),
    length INT,
    PRIMARY KEY (film_id)
);
INSERT INTO dim_film (film_id, title, description, release_year, language_id, rating, length)
SELECT 
    film_id,       
    title,
    description,
    release_year,
    language_id,
    rating,
    length
FROM film;

# dim_staff
DROP TABLE IF EXISTS dim_staff;
CREATE TABLE dim_staff (
    staff_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    active TINYINT(1),
    username VARCHAR(50),
    password VARCHAR(50),
    store_id INT,
    PRIMARY KEY (staff_id)
);
INSERT INTO dim_staff (staff_id, first_name, last_name, email, active, username, password, store_id)
SELECT 
    staff_id,         
    first_name,
    last_name,
    email,
    active,
    username,
    password,
    store_id
FROM staff;

# dim_inventory
DROP TABLE IF EXISTS dim_inventory;
CREATE TABLE dim_inventory (
    inventory_id INT NOT NULL,
    film_id INT NOT NULL,
    store_id INT NOT NULL,
    last_update TIMESTAMP NOT NULL,
    PRIMARY KEY (inventory_id)
);
INSERT INTO dim_inventory (inventory_id, film_id, store_id, last_update)
SELECT 
    inventory_id,
    film_id,
    store_id,
    last_update
FROM inventory;

# dim_payment
DROP TABLE IF EXISTS dim_payment;
CREATE TABLE dim_payment (
	payment_id INT NOT NULL,
    customer_id INT NOT NULL,
    staff_id INT NOT NULL,
    rental_id INT NOT NULL,
    amount DEC NOT NULL,
    payment_date DATETIME NOT NULL,
    last_update TIMESTAMP NOT NULL,
    PRIMARY KEY (payment_id)
);
INSERT INTO dim_payment (payment_id, customer_id, staff_id, rental_id, amount, payment_date, last_update)
SELECT
	payment_id,
    customer_id,
    staff_id,
    rental_id,
    amount,
    payment_date,
    last_update
FROM payment;

use sakila;
select * from dim_payment;

use sakila;
select * from dim_inventory;

use sakila;
select * from dim_customer;

use sakila; 
select * from dim_date;

use sakila;
select * from dim_film;

use sakila;
select * from dim_staff;
