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




CREATE OR REPLACE VIEW v_europe_info_for_secondary_table AS 
	SELECT 
		e.country,
		e.`year`,
		e.GDP,
		e.population,
		e.gini,
		c.continent 
	FROM economies AS e
	JOIN countries AS c 
		ON e.country  = c.country
	WHERE c.continent  = 'Europe'
		AND e.`year` BETWEEN '2006' AND '2021'
		AND e.population  IS NOT NULL
		AND e.GDP IS NOT NULL 
		AND gini IS NOT NULL
	ORDER BY e.country, e.year;
	
SELECT * FROM v_europe_info_for_secondary_table;

CREATE TABLE IF NOT EXISTS t_tereza_kotkova_project_SQL_secondary_final AS
	SELECT * FROM v_europe_info_for_secondary_table;

SELECT * FROM t_tereza_kotkova_project_SQL_secondary_final;


