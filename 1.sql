--CREATE DATABASE book_store;
CREATE TABLE IF NOT EXISTS post
(
	id serial NOT NULL PRIMARY KEY,
	title varchar(50) NOT NULL,
	salsry numeric(10,2) NOT NULL
);

--DROP TABLE post;

ALTER TABLE post
ADD description text NOT NULL;

ALTER TABLE post
DROP COLUMN description;

ALTER TABLE post
DROP COLUMN description;

ALTER TABLE post
ALTER COLUMN description TYPE varchar(100)

ALTER TABLE post
RENAME COLUMN work_desc TO description;

ALTER TABLE work_post
RENAME TO post;

ALTER TABLE post
ADD description text NULL;

ALTER TABLE post
ALTER COLUMN description SET NOT NULL;

ALTER TABLE post
ALTER COLUMN description DROP NOT NULL;

INSERT INTO post
VALUES
(1,'Менеджер',60000.00,'Руководит командой и процессом');

SELECT * FROM post;

DELETE FROM post;

INSERT INTO post (title, description, salsry)
VALUES
('Продавец', 'Стоит на кассе и пробивает продукты', 50000.00);

INSERT INTO post (title,salary,description)
VALUES
('Кладовщик',55000.00,'Переносит товар со склада на полки и разгружает поставки'),
('Директор',70000.00,'Решает проблемы и руководит магазином');

UPDATE post
SET description = 'Здесь должно быть описание';

UPDATE post
SET salary = 65500
WHERE title = 'Кладовщик';

UPDATE post
SET description = 'Решает проблемы и руководит магазином'
WHERE id = 4;

SELECT * FROM post;

UPDATE post
SET description = 'Руководит командой и процессом',
	salary = 62000
WHERE id = 1;

SELECT * FROM post
WHERE id = 9;

SELECT * FROM post
WHERE salary > 55000;

SELECT * FROM post
WHERE salary <= 65000;

SELECT * FROM post
WHERE salary <> 62000;

SELECT * FROM post
WHERE title <> 'Директор';

SELECT * FROM post
WHERE description IS NOT NULL;

SELECT * FROM post
WHERE description IS NULL;

UPDATE post
SET description = NULL
WHERE id = 5;

SELECT * FROM post;

SELECT * FROM post
WHERE salary > 55000 OR description IS NOT NULL;

SELECT * FROM post
WHERE id = 4 OR salary > 67000;

SELECT * FROM post
WHERE (id = 1 AND description IS NOT NULL) OR salary <= 50000;

CREATE TABLE IF NOT EXESTS employee
(
	id serial NOT NULL PRIMARY KEY,
	firstname varchar(50) NOT NULL,
	name varchar(50) NOT NULL,
	patronymic varchar(50) NOT NULL,
	datebirth date NOT NULL,
	telephone varchar(18) NOT NULL,
	--post_id integer NOT NULL REFERENCES post(id)
	
	post_id integer NOT NULL,
	FOREIGN KEY (post_id) REFERENCES post(id) 
)

