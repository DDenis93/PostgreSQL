--CREATE DATABASE coffee_stop;
CREATE TABLE IF NOT EXISTS post
(
	id serial PRIMARY KEY NOT NULL,
	title varchar(50) NOT NULL,
	salary decimal(10,2) NOT NULL
);
CREATE TABLE IF NOT EXISTS employee
(
	id serial PRIMARY KEY NOT NULL,
	name varchar(50) NOT NULL,
	firstname varchar(50) NOT NULL,
	patronymic varchar(50) NOT NULL,
	telephone varchar(16) NOT NULL,
	date_birth date NOT NULL,
	post_ID integer NOT NULL REFERENCES post(id)
);


CREATE TABLE IF NOT EXISTS "order"
(
	id serial PRIMARY KEY NOT NULL,
	registration timestamp NOT NULL,
	price decimal(10,2) NOT NULL,
	status varchar(50) NOT NULL,
	ending timestamp NULL,
	emp_ID integer NOT NULL REFERENCES employee(id)
);

CREATE TABLE IF NOT EXISTS ingredients
(
	id serial PRIMARY KEY NOT NULL,
	title varchar(50) NOT NULL,
	price decimal(10,2) NOT NULL,
	description text NULL
);



CREATE TABLE IF NOT EXISTS coffee
(
	id serial PRIMARY KEY NOT NULL,
	title varchar(50) NOT NULL,
	price decimal(10,2) NOT NULL,
	volume integer NOT NULL,
	description text NULL,
	recept text NOT NULL
);


CREATE TABLE IF NOT EXISTS ingredients_coffee
(
	id serial PRIMARY KEY NOT NULL,
	ing_ID integer NOT NULL REFERENCES ingredients(id),
	cof_ID integer NOT NULL REFERENCES coffee(id),
	volume_ing integer NOT NULL,
	volume_type varchar(10) NOT NULL,
	
	UNIQUE(ing_ID,cof_ID)
);


CREATE TABLE IF NOT EXISTS position_order
(
	id serial PRIMARY KEY NOT NULL,
	cof_ID integer NOT NULL REFERENCES coffee(id),
	ord_ID integer NOT NULL REFERENCES "order"(id),
	count_cof integer NOT NULL,
	
	UNIQUE(ord_ID,cof_ID)
);

CREATE TABLE IF NOT EXISTS toppings
(
	id serial PRIMARY KEY NOT NULL,
	title varchar(50) NOT NULL,
	price decimal(10,2) NOT NULL,
	description text NULL
);


CREATE TABLE IF NOT EXISTS toppings_pos_order
(
	id serial PRIMARY KEY NOT NULL,
	top_ID integer NOT NULL REFERENCES toppings(id),
	pos_ord_ID integer NOT NULL REFERENCES position_order(id),
	
	UNIQUE(top_ID,pos_ord_ID)
);


INSERT INTO post (title, salary) VALUES
('Бариста',1),
('Менеджер',2),
('Руководитель',3);


INSERT INTO employee (name, firstname, patronymic, telephone, date_birth, post_id) VALUES
('Иванов1','Ивано1','Иван1','+7(900)000 00-01','1991/01/01',1),
('Иванов2','Ивано2','Иван2','+7(900)000 00-02','1992/02/02',2),
('Иванов3','Ивано3','Иван3','+7(900)000 00-03','1993/03/03',3);


INSERT INTO "order" (registration, price, status, ending, emp_id) VALUES
('1991-01-01 01:01:01',10,'ДА','1991-01-01 01:01:11',2),
('1992-02-02 02:02:02',20,'ДА','1992-02-02 02:02:22',2),
('1993-03-03 03:03:03',30,'НЕТ',NULL,2);


INSERT INTO ingredients (title, price, description) VALUES
('Молоко1',1,'Молоко11'),
('Молоко2',2,'Молоко22'),
('Молоко3',3,'Молоко33');


INSERT INTO coffee (title, price, volume, description, recept) VALUES
('Название1',1,1,'Описание1','рецепт1'),
('Название2',2,2,'Описание2','рецепт2'),
('Название3',3,3,'Описание3','рецепт3');


INSERT INTO ingredients_coffee (ing_id, cof_id, volume_ing, volume_type) VALUES
(1,1,1,'мл1'),
(2,2,2,'мл2'),
(3,3,3,'мл3');


INSERT INTO position_order (cof_id, ord_id, count_cof) VALUES
(1,1,1),
(2,2,2),
(3,3,3);


INSERT INTO toppings (title, price, description) VALUES
('Название1',1,'Название11'),
('Название2',2,'Название22'),
('Название3',3,'Название33');


INSERT INTO toppings_pos_order (top_id, pos_ord_id) VALUES
(1,1),
(2,2),
(3,3);


SELECT * FROM post;


SELECT * FROM employee;


SELECT * FROM "order";


SELECT * FROM ingredients;


SELECT * FROM coffee;


SELECT * FROM ingredients_coffee;


SELECT * FROM position_order;


SELECT * FROM toppings;


SELECT * FROM toppings_pos_order;


-- DROP TABLE toppings_pos_order;
-- DROP TABLE toppings;
-- DROP TABLE position_order;
-- DROP TABLE ingredients_coffee;
-- DROP TABLE coffee;
-- DROP TABLE ingredients;
-- DROP TABLE "order";
-- DROP TABLE employee;
--DROP TABLE post;








