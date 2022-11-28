-- Task 1:

-- Are the wages rising in all industries over the years, or are they descaling in some of them?


SELECT 
	a.industry_branch,
	round(a.year_2000,0) AS year_2000,
	round(b.year_2001,0) AS year_2001,
	round(b.year_2001 - a.year_2000,0) AS difference
 FROM (
	SELECT t1.industry_branch, t1.avg_gross_wage AS year_2000
	FROM t_tereza_kotkova_project_SQL_primary_final AS t1
	WHERE YEAR = '2000'
	) AS a JOIN (
	SELECT t2.industry_branch, t2.avg_gross_wage AS year_2001
	FROM t_tereza_kotkova_project_SQL_primary_final AS t2
	WHERE YEAR = '2001'
	) AS b
	ON a.industry_branch = b.industry_branch 
GROUP BY a.industry_branch
ORDER BY difference DESC;


SELECT 
	a.industry_branch,
	round(a.year_2009,0) AS year_2009,
	round(b.year_2010,0) AS year_2010,
	round(b.year_2010 - a.year_2009,0) AS difference
 FROM (
	SELECT t1.industry_branch, t1.avg_gross_wage AS year_2009
	FROM t_tereza_kotkova_project_SQL_primary_final AS t1
	WHERE YEAR = '2009'
	) AS a JOIN (
	SELECT t2.industry_branch, t2.avg_gross_wage AS year_2010
	FROM t_tereza_kotkova_project_SQL_primary_final AS t2
	WHERE YEAR = '2010'
	) AS b
	ON a.industry_branch = b.industry_branch 
GROUP BY a.industry_branch
ORDER BY difference DESC;



SELECT 
	a.industry_branch,
	round(a.year_2020,0) AS year_2020,
	round(b.year_2021,0) AS year_2021,
	round(b.year_2021 - a.year_2020,0) AS difference
 FROM (
	SELECT t1.industry_branch, t1.avg_gross_wage AS year_2020
	FROM t_tereza_kotkova_project_SQL_primary_final AS t1
	WHERE YEAR = '2020'
	) AS a JOIN (
	SELECT t2.industry_branch, t2.avg_gross_wage AS year_2021
	FROM t_tereza_kotkova_project_SQL_primary_final AS t2
	WHERE YEAR = '2021'
	) AS b
	ON a.industry_branch = b.industry_branch 
GROUP BY a.industry_branch
ORDER BY difference DESC;

