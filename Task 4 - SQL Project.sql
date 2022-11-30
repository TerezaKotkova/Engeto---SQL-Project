-- Task 4


-- Is there a year in which the year-on-year increase in food
-- prices was significantly higher than wage growth (greater than 10%)?

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
	



CREATE TABLE IF NOT EXISTS t_industry_percentage_price_diff AS
	SELECT 
		a.industry_branch AS industry_branch,
		a.YEAR AS year,
		a.avg_gross_wage AS avg_gross_wage,
		b.industry_branch AS industry_branch2,
		b.YEAR AS year2,
		b.avg_gross_wage AS avg_gross_wage2,
		round(((b.avg_gross_wage - a.avg_gross_wage) / a.avg_gross_wage) * 100, 2) AS percentage_gross_wage_diff
	FROM (
		SELECT 
			t1.industry_branch,
			t1.YEAR,
			t1.avg_gross_wage
		FROM t_tereza_kotkova_project_SQL_primary_final AS t1
		GROUP BY t1.industry_branch, t1.year
		) AS a JOIN (
		SELECT 
			t2.industry_branch,
			t2.YEAR,
			t2.avg_gross_wage
		FROM t_tereza_kotkova_project_SQL_primary_final AS t2
		GROUP BY t2.industry_branch, t2.YEAR
		) AS b 
		ON a.industry_branch = b.industry_branch AND a.YEAR = b.YEAR - 1
	ORDER BY percentage_gross_wage_diff;


	
SELECT * FROM t_price_percentage_difference
ORDER BY percentage_price_diff DESC;

SELECT * FROM t_industry_percentage_price_diff
ORDER BY percentage_gross_wage_diff DESC;

