SELECT * 
FROM economies;

SELECT *
FROM countries;




SELECT 
	count(country) 
FROM economies;

SELECT 
	count(country),
	population 
FROM economies
WHERE population IS NOT NULL;


SELECT 
	count(country)
FROM economies
WHERE gdp IS NOT NULL;

SELECT 
	count(country)
FROM economies
WHERE gini IS NULL;

SELECT 
	count(country)
FROM economies
WHERE `year`  IS NULL;


SELECT count(country)
FROM countries
WHERE continent IS NULL;