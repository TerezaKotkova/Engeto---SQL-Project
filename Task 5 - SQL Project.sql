/* Task 5

Does the level of GDP effect changes in wages and food prices? Or, 
if the GDP increases more significantly in one year, 
will this be reflected in food prices or wages in the same or the following year BY
a more significant increase?
Or, if the GDP increases more significantly in one year, will this be reflected IN
food prices or wages in the same or the following year by a more significant increase?

*/


CREATE OR REPLACE VIEW v_yearly_gdp AS
	SELECT 
		a.YEAR AS Year1,
		a.GDP AS GDP1,
		b.YEAR AS Year2,
		b.GDP AS GDP2,
		round(((b.GDP - a.GDP) / a.GDP) * 100, 2) AS percentage_GDP_diff
	FROM (
		SELECT 
			t1.YEAR,
			t1.GDP
		FROM t_tereza_kotkova_project_SQL_secondary_final AS t1
		WHERE country = 'Czech Republic'
		GROUP BY t1.year, t1.GDP
		) AS a JOIN (
		SELECT 
			t2.YEAR,
			t2.GDP
		FROM t_tereza_kotkova_project_SQL_secondary_final AS t2
		WHERE country = 'Czech Republic'
		GROUP BY t2.YEAR, t2.GDP
		) AS b 
		ON a.YEAR = b.YEAR - 1;
	
	
		
CREATE OR REPLACE VIEW v_year_food_prices_percentage AS
	SELECT 
		YEAR,
		year2,
		round(sum(percentage_price_diff)/count(percentage_price_diff),2) AS avg_percentage_food_prices
	FROM t_price_percentage_difference
	GROUP BY YEAR, year2
	ORDER BY year;
	

CREATE OR REPLACE VIEW v_year_wages_percentage AS
	SELECT 
		YEAR,
		year2,
		round(sum(percentage_gross_wage_diff)/count(percentage_gross_wage_diff),2) AS avg_percentage_wages
	FROM t_industry_percentage_price_diff
	GROUP BY year, year2
	ORDER BY year;
	

SELECT * FROM v_yearly_gdp;
SELECT * FROM v_year_food_prices_percentage;
SELECT * FROM v_year_wages_percentage;