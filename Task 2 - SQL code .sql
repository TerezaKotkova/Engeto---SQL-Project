/*  Task 2

How many litres of milk and how many kilograms of bread can be bought 
the first and last comparable periods in the available price and wage data.

 */ 
 
-- milk buyability in 2006 and 2018 

SELECT 
	a.product_name,
	a.monthly_buyability_in_l_2006,
	b.monthly_buyability_in_l_2018
FROM(
	SELECT 
		product_name,
		round(sum(avg_gross_wage)/COUNT(avg_gross_wage)/weighted_average_food_price,0) AS monthly_buyability_in_l_2006
	FROM t_tereza_kotkova_project_SQL_primary_final
	WHERE product_name  IN ('Mléko polotučné pasterované')
		AND YEAR = '2006'
		AND industry_branch IS NOT NULL
	) AS a JOIN (
	SELECT 
		product_name,
		round(sum(avg_gross_wage)/COUNT(avg_gross_wage)/weighted_average_food_price,0) AS monthly_buyability_in_l_2018
	FROM t_tereza_kotkova_project_SQL_primary_final
	WHERE product_name  IN ('Mléko polotučné pasterované')
		AND YEAR = '2018'
		AND industry_branch IS NOT NULL
	) AS b 
	ON a.product_name = b.product_name;




-- bread buyability in 2006 and 2018 

SELECT 
	a.product_name,
	a.monthly_buyability_in_kg_2006,
	b.monthly_buyability_in_kg_2018
FROM(
	SELECT 
		product_name,
		round(sum(avg_gross_wage)/COUNT(avg_gross_wage)/weighted_average_food_price,0) AS monthly_buyability_in_kg_2006
	FROM t_tereza_kotkova_project_SQL_primary_final
	WHERE product_name  IN ('Chléb konzumní kmínový')
		AND YEAR = '2006'
		AND industry_branch IS NOT NULL
	) AS a JOIN (
	SELECT 
		product_name,
		round(sum(avg_gross_wage)/COUNT(avg_gross_wage)/weighted_average_food_price,0) AS monthly_buyability_in_kg_2018
	FROM t_tereza_kotkova_project_SQL_primary_final
	WHERE product_name  IN ('Chléb konzumní kmínový')
		AND YEAR = '2018'
		AND industry_branch IS NOT NULL
	) AS b 
	ON a.product_name = b.product_name;


