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


