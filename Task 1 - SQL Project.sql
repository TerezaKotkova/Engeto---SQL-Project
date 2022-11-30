-- Task 1:

-- Are the wages rising in all industries over the years, or are they descaling in some of them?

SELECT 
	a.industry_branch AS industry_branch,
	a.YEAR AS year,
	a.avg_gross_wage AS avg_gross_wage,
	b.industry_branch AS industry_branch2,
	b.YEAR AS year2,
	b.avg_gross_wage AS avg_gross_wage2,
	round(b.avg_gross_wage - a.avg_gross_wage,0) AS diff_gross_wages
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
ORDER BY a.industry_branch,a.YEAR, diff_gross_wages;


SELECT 
	a.industry_branch AS industry_branch,
	a.YEAR AS year,
	a.avg_gross_wage AS avg_gross_wage,
	b.industry_branch AS industry_branch2,
	b.YEAR AS year2,
	b.avg_gross_wage AS avg_gross_wage2,
	round(b.avg_gross_wage - a.avg_gross_wage,0) AS diff_gross_wages
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
ORDER BY diff_gross_wages;


CREATE OR REPLACE VIEW v_percentage_price_difference AS 
SELECT 
	a.industry_branch AS industry_branch,
	a.YEAR AS year,
	a.avg_gross_wage AS avg_gross_wage,
	b.industry_branch AS industry_branch2,
	b.YEAR AS year2,
	b.avg_gross_wage AS avg_gross_wage2,
	round((b.avg_gross_wage - a.avg_gross_wage),0) AS diff_gross_wages_in_kc,
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


SELECT 
	industry_branch,
	count(industry_branch)
FROM v_percentage_price_difference
WHERE percentage_gross_wage_diff < 0
GROUP BY industry_branch;


SELECT 
	industry_branch,
	count(industry_branch) AS count_industry_branch
FROM v_percentage_price_difference
WHERE percentage_gross_wage_diff > 0
GROUP BY industry_branch
ORDER BY count_industry_branch DESC;

