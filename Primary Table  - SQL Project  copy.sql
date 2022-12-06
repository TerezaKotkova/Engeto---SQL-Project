SELECT *
FROM czechia_payroll;

SELECT *
FROM czechia_payroll_unit;

SELECT *
FROM czechia_payroll_value_type;

SELECT *
FROM czechia_payroll_calculation;

SELECT *
FROM czechia_price;

SELECT *
FROM czechia_price_category;



SELECT 	
	count(value)
FROM czechia_payroll;


SELECT 	
	count(value)
FROM czechia_payroll
WHERE value IS NOT NULL;


SELECT 	
	count(value)
FROM czechia_payroll
WHERE value IS NOT NULL
	AND value_type_code = '5958'
	AND calculation_code  = '100';


SELECT 	
	count(value)
FROM czechia_payroll
WHERE value_type_code = '5958'
	AND calculation_code  = '100';

	
SELECT 	
	count(value)
FROM czechia_payroll
WHERE value IS NOT NULL
	AND value_type_code = '5958'
	AND calculation_code  = '200';


SELECT 	
	count(value)
FROM czechia_payroll
WHERE value_type_code = '5958'
	AND calculation_code  = '200';



CREATE OR REPLACE VIEW v_czechia_pay_FTE AS 
	SELECT
		cp.value AS quarterly_avg_gross_wage,
		cp.payroll_year AS year,
		cpib.name AS industry_branch
	FROM czechia_payroll AS cp
	LEFT JOIN czechia_payroll_industry_branch AS cpib
		ON cp.industry_branch_code = cpib.code 
	WHERE 
		cp.value_type_code = '5958' 
		AND cp.calculation_code = '200'
	ORDER BY cp.payroll_year;
	
SELECT * FROM v_czechia_pay_FTE;
 

CREATE OR REPLACE VIEW v_czechia_food_price AS
 	SELECT
 		YEAR(cp.date_from) AS year,
 		round(avg(cp.value),2) AS avg_food_price,
 		cpc.name AS product_name,
 		cpc.price_value,
		cpc.price_unit
 	FROM czechia_price AS cp
 	LEFT JOIN czechia_price_category AS cpc
 		ON cp.category_code = cpc.code
 	GROUP BY cp.date_from, cpc.name, cpc.price_value, cpc.price_unit;

SELECT * FROM v_czechia_food_price;



CREATE OR REPLACE VIEW v_cz_yearly_weighted_average_food_price AS 
	SELECT 
	year,
	round(sum(avg_food_price)/count(avg_food_price),2) AS weighted_average_food_price,
	product_name,
	price_value,
	price_unit
FROM v_czechia_food_price 
GROUP BY YEAR, product_name, price_value, price_unit;


SELECT * FROM v_cz_yearly_weighted_average_food_price;



CREATE OR REPLACE VIEW v_cz_average_yearly_pay_fte AS 
	SELECT
		avg(quarterly_avg_gross_wage),
		YEAR,
		industry_branch 
	FROM v_czechia_pay_fte
	GROUP BY YEAR, industry_branch;

SELECT * FROM v_cz_average_yearly_pay_fte;



CREATE TABLE IF NOT EXISTS t_tereza_kotkova_project_SQL_primary_final AS 
	SELECT 
		fte.`avg(quarterly_avg_gross_wage)` AS avg_gross_wage,
		fte.`YEAR`,
		fte.industry_branch,
		fp.weighted_average_food_price,
		fp.product_name,
		fp.price_value,
		fp.price_unit 
	FROM v_cz_average_yearly_pay_fte AS fte
	LEFT JOIN v_cz_yearly_weighted_average_food_price AS fp
	ON fte.`YEAR` = fp.`year`;
	
SELECT * FROM t_tereza_kotkova_project_SQL_primary_final;


