SELECT * FROM post;
SELECT * FROM employee;
SELECT * FROM "order";
SELECT * FROM ingredients;
SELECT * FROM coffee;
SELECT * FROM ingredients_coffee;
SELECT * FROM position_order;
SELECT * FROM toppings;
SELECT * FROM toppings_pos_order;
--
UPDATE post
SET title = 'Сотрудник 1'
WHERE ID = 1
UPDATE post
SET title = 'Сотрудник 2'
WHERE ID = 2
UPDATE post
SET title = 'Сотрудник 3'
WHERE ID = 3
SELECT * FROM post;
-- 
UPDATE post
SET title = 'Бариста'
WHERE ID = 1
UPDATE post
SET title = 'Менеджер'
WHERE ID = 2
UPDATE post
SET title = 'Руководитель'
WHERE ID = 3
SELECT * FROM post;
-- 
UPDATE coffee
SET price = 10, description = 'Кофе с молоком'
WHERE title = 'Латте'
UPDATE coffee
SET price = 20, description = 'Кофе итальянский'
WHERE title = 'Капучино'
UPDATE coffee
SET price = 30, description = 'Кофе молотый'
WHERE title = 'Эспрессо'
SELECT * FROM coffee;
-- 
DELETE FROM ingredients_coffee
SELECT * FROM ingredients_coffee;
-- 
DELETE FROM toppings_pos_order WHERE pos_ord_id = 3
SELECT * FROM toppings_pos_order;
-- 
SELECT SUM(price)
FROM coffee
-- 
SELECT COUNT(*)
FROM coffee
-- 
SELECT AVG(price)
FROM coffee
-- 
SELECT MIN(price)
FROM coffee
-- 
SELECT MAX(price)
FROM coffee
-- 
SELECT price FROM coffee
ORDER BY price
SELECT * FROM coffee;
-- 
SELECT price FROM coffee
ORDER BY price DESC
SELECT * FROM coffee;
--
SELECT * FROM employee WHERE name = 'Иванов1'
--
SELECT * FROM employee LIMIT 2
--
SELECT * FROM employee OFFSET 2
-- 
SELECT * FROM coffee
WHERE price > 10
-- 
SELECT * FROM coffee
WHERE price < 20
-- 
SELECT * FROM coffee
WHERE price >= 25
-- 
SELECT * FROM coffee
WHERE price <= 20
-- 
SELECT * FROM employee
WHERE date_birth = '1991-01-01'
-- 
SELECT * FROM employee
WHERE date_birth <> '1991-02-02'
-- 
SELECT * FROM coffee
WHERE price < 15 AND ID > 0 
-- 
SELECT * FROM coffee
WHERE price < 15 OR price > 25 
--
SELECT * FROM coffee
WHERE title IN ('Капучино','Латте')
--
SELECT * FROM coffee
WHERE title NOT IN ('Капучино','Латте')
-- 
SELECT DISTINCT price FROM coffee
-- 
SELECT FROM employee
WHERE name LIKE 'Иванов1'
-- 
SELECT FROM employee
WHERE name SIMILAR TO '%Ивано%'
--
SELECT * FROM coffee INNER JOIN post
ON coffee.ID = post.ID
--
SELECT * FROM coffee RIGHT JOIN post
ON coffee.ID = post.ID
--
SELECT * FROM post LEFT JOIN employee
ON post.ID = employee.ID
--
SELECT SUM(price) AS AllPrice
FROM coffee
--
SELECT * FROM coffee
WHERE ID = (
	SELECT ID FROM ingredients WHERE title = 'Молоко3'
)
--
CREATE VIEW coffee_1 AS
SELECT coffee.title AS title_1,
	   employee.name AS name_1,
	   ingredients.description AS description_1
FROM coffee INNER JOIN employee ON coffee.ID = employee.ID
INNER JOIN ingredients ON coffee.ID = ingredients.ID

SELECT * FROM coffee_1
--
BEGIN TRANSACTION;
	UPDATE coffee
	SET price = 40
	WHERE title = 'Латте';
COMMIT TRANSACTION;

SELECT * FROM coffee







