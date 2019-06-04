-- 1. Для заданного списка товаров получить названия всех категорий, в которых представлены
-- товары.
-- Выборка для нескольких товаров (пример: ids = (9, 14, 6, 7, 2) ).

SELECT DISTINCT id, name FROM categories 
LEFT JOIN product_to_categories ON product_to_categories.categ_id = categories.id 
WHERE product_to_categories.product_id IN(9, 14, 6, 7, 2)


-- 2. Для заданной категории получить список предложений всех товаров из этой категории.
-- Каждая категория может иметь несколько подкатегорий.
-- Пример:
-- Выбираю все товары из категории компьютеры (id = 2) и подкатегории (id =3 (ноутбуки),
-- id = 4 (планшеты), id = 5 (гибриды) ).


SELECT products.id, products.name FROM products
LEFT JOIN product_to_categories ON product_to_categories.product_id = products.id 
WHERE product_to_categories.categ_id = '4'
UNION
SELECT products.id, products.name FROM products
LEFT JOIN product_to_categories ON product_to_categories.product_id = products.id
WHERE product_to_categories.categ_id IN(SELECT id FROM categories WHERE parent_id = '5')

-- 3. Для заданного списка категорий получить количество уникальных товаров в каждой
-- категории.
-- Выборка для нескольких категорий (пример: ids = (2, 3, 4) ).

SELECT product_to_categories.categ_id, COUNT(product_to_categories.product_id) FROM product_to_categories
WHERE product_to_categories.categ_id IN('2','3','4') GROUP BY product_to_categories.categ_id

-- 4. Для заданного списка категорий получить количество единиц каждого товара который
-- входит в указанные категории.
-- Выборка для нескольких категорий (пример: ids = (3, 4, 5) ).

SELECT SUM(p_count) p_sum FROM (
		SELECT ptc.categ_id, COUNT(product_id) p_count FROM product_to_categories ptc
		WHERE ptc.categ_id IN('3','4','5') 
		AND ptc.product_id NOT IN (
			SELECT sub_ptc.product_id FROM product_to_categories sub_ptc
			WHERE sub_ptc.categ_id IN('3','4','5') AND sub_ptc.categ_id != ptc.categ_id
		)
		GROUP BY categ_id
	) t1