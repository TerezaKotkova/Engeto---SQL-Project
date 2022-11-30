-- Task 3

-- Which price in food category is increasing slowest (has the lowest year-on-year percentage increase?)

CREATE TABLE IF NOT EXISTS t_price_percentage_difference AS 
	SELECT 
		a.product_name AS name,
		a.YEAR AS year,
		a.weighted_average_food_price AS price,
		b.product_name AS name2,
		b.YEAR AS year2,
		b.weighted_average_food_price AS price2,
		round(((b.weighted_average_food_price - a.weighted_average_food_price) / a.weighted_average_food_price) * 100, 2) AS percentage_price_diff
	FROM (
		SELECT 
			t1.product_name,
			t1.YEAR,
			t1.weighted_average_food_price
		FROM t_tereza_kotkova_project_SQL_primary_final AS t1
		GROUP BY t1.product_name, t1.year
		) AS a JOIN (
		SELECT 
			t2.product_name,
			t2.YEAR,
			t2.weighted_average_food_price
		FROM t_tereza_kotkova_project_SQL_primary_final AS t2
		GROUP BY t2.product_name, t2.YEAR
		) AS b 
		ON a.product_name = b.product_name AND a.YEAR = b.YEAR - 1;
	
SELECT * FROM t_price_percentage_difference;


SELECT 
	name,
	price,
	YEAR,
	name2,
	price2,
	year2,
	percentage_price_diff 
FROM t_price_percentage_difference
WHERE percentage_price_diff IN(
	SELECT 
	MIN(percentage_price_diff)
	FROM t_price_percentage_difference);



SELECT 
	name,
	price,
	YEAR,
	name2,
	price2,
	year2,
	percentage_price_diff 
FROM t_price_percentage_difference
WHERE percentage_price_diff IN(
	SELECT 
	Max(percentage_price_diff)
	FROM t_price_percentage_difference);


SELECT 
	name,
	price,
	YEAR,
	name2,
	price2,
	year2,
	percentage_price_diff 
FROM t_price_percentage_difference
WHERE percentage_price_diff IN(
	SELECT 
	MIN(percentage_price_diff)
	FROM t_price_percentage_difference
	WHERE percentage_price_diff > '0');


SELECT 
	name,
	price,
	YEAR,
	name2,
	price2,
	year2,
	percentage_price_diff 
FROM t_price_percentage_difference
WHERE percentage_price_diff IN(
	SELECT 
	Max(percentage_price_diff)
	FROM t_price_percentage_difference
	WHERE percentage_price_diff < '0');
	


SELECT 
	name,
	sum(percentage_price_diff) AS total_percentage_diff
FROM t_price_percentage_difference
GROUP BY name
ORDER BY sum(percentage_price_diff);