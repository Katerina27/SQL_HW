CREATE DATABASE for_hw;
USE for_hw;
CREATE TABLE users (
	id int UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
	created_at timestamp,
	updated_at timestamp
	);
SELECT*FROM users;
INSERT INTO users VALUES (1, now(), now());

-- 2--
/*CREATE TABLE users_2 (
	id int UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
	created_at varchar(100),
	updated_at varchar(100)
	);
	
SELECT*FROM users_2;
INSERT INTO users_2 VALUES (1, '20.10.2017 8:10', '20.10.2017 8:10');
ALTER TABLE users_2 ADD created_at_new timestamp;
ALTER TABLE users_2 ADD updated_at_new timestamp;

SELECT date(created_at);
 */

-- 3--
CREATE TABLE storehouses_products (value int);
SELECT*FROM storehouses_products;
ALTER TABLE storehouses_products MODIFY COLUMN value int UNSIGNED NULL;
INSERT INTO storehouses_products (value) VALUES (0), (2500), (0), (30), (500), (1);
ALTER TABLE storehouses_products ADD empty_full enum('empty', 'full');
UPDATE storehouses_products SET empty_full = 'empty' WHERE value = 0;
UPDATE storehouses_products SET empty_full = 'full' WHERE value > 0;

SELECT*FROM storehouses_products ORDER BY empty_full DESC, value;



-- 4--

CREATE TABLE users_3 (
	id int UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
	birthday varchar(50)
	);
SELECT*FROM users_3;
truncate users_3;
INSERT INTO users_3 (birthday) VALUES ('15 january 1990'), ('17 february 1985'), ('12 march 1985'), ('11 april 2000'), ('05 may 1996'), ('07 june 1980'), ('20 jule 1999'), ('15 august 1987'), ('16 september 1975'), ('15 october 1979'), ('23 november 2002'), ('30 december 1998');
SELECT *FROM users_3 WHERE birthday RLIKE 'may|august';

-- 5--
--

-- 6--

CREATE TABLE users_4 (
	id int UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
	birthday datetime
	);
SELECT*FROM users_4;
INSERT INTO users_4 (birthday) VALUES ('1990-01-15'), ('1985-02-17'), ('1985-03-12'), ('2000-04-11'), ('1996-05-05'), ('1980-06-07'), ('1999-07-20'), ('1987-08-15'), ('1975-09-16'), ('1979-10-15'), ('2002-11-23'), ('1998-12-30');
SELECT id, floor(avg(timestampdiff(YEAR, birthday, now()))) AS age FROM users_4;

-- 7--

ALTER TABLE users_4 ADD day_of_week varchar(5);
DELETE FROM users_4 WHERE id>13;
UPDATE users_4 SET day_of_week = 'пт' WHERE id = 1 or id=  2 or id= 4 or id= 11; 
UPDATE users_4 SET day_of_week = 'ср' WHERE id = 3 or id =6;
UPDATE users_4 SET day_of_week = 'вс' WHERE id = 5 or id =9;
UPDATE users_4 SET day_of_week = 'пн' WHERE id = 7;
UPDATE users_4 SET day_of_week = 'вт' WHERE id = 8 or id =12;
UPDATE users_4 SET day_of_week = 'чт' WHERE id = 10 or id =13;

SELECT day_of_week, count(*) AS quantity FROM users_4 GROUP BY day_of_week;


-- 8--
/*
CREATE TABLE value (
	id int UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
	value tinyint
	);
SELECT*FROM value;
INSERT INTO value (value) VALUES (1), (2), (3), (4), (5);
*/




