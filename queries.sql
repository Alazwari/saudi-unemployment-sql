-- =====================================================================
-- Saudi Unemployment Analysis (1999–2025) — SQL queries
-- Author: Dr. Ahood Alazwari
-- Database: SQLite  |  Tables: unemployment, vision_periods
-- =====================================================================


-- Q1. Saudi female unemployment rate, all years (oldest to newest)
SELECT year, unemployment_rate
FROM unemployment
WHERE nationality = 'Saudis' AND gender = 'Female'
ORDER BY year;


-- Q2. Saudi female unemployment in 2016 (Vision 2030 launch) vs 2025
SELECT year, unemployment_rate
FROM unemployment
WHERE nationality = 'Saudis' AND gender = 'Female' AND year IN (2016, 2025)
ORDER BY year;


-- Q3. Year with the highest Saudi female unemployment
SELECT year, unemployment_rate
FROM unemployment
WHERE nationality = 'Saudis' AND gender = 'Female'
ORDER BY unemployment_rate DESC
LIMIT 1;


-- Q4. Average unemployment rate by nationality across all years
SELECT nationality, ROUND(AVG(unemployment_rate), 2) AS avg_rate
FROM unemployment
WHERE gender = 'Total'
GROUP BY nationality;


-- Q5. Saudi male vs female unemployment side by side, with the gender gap
SELECT year,
       MAX(CASE WHEN gender = 'Male'   THEN unemployment_rate END) AS male,
       MAX(CASE WHEN gender = 'Female' THEN unemployment_rate END) AS female,
       ROUND(
         MAX(CASE WHEN gender = 'Female' THEN unemployment_rate END)
         - MAX(CASE WHEN gender = 'Male' THEN unemployment_rate END)
       , 2) AS gap
FROM unemployment
WHERE nationality = 'Saudis'
GROUP BY year
ORDER BY year;


-- Q6. Average Saudi female unemployment in each Vision 2030 period (JOIN)
SELECT p.period_name,
       ROUND(AVG(u.unemployment_rate), 2) AS avg_rate
FROM unemployment u
JOIN vision_periods p
  ON u.year BETWEEN p.start_year AND p.end_year
WHERE u.nationality = 'Saudis' AND u.gender = 'Female'
GROUP BY p.period_name
ORDER BY p.start_year;


-- Q7. Year-over-year change in total Saudi unemployment (window function)
SELECT year,
       unemployment_rate,
       LAG(unemployment_rate) OVER (ORDER BY year) AS previous_year,
       ROUND(unemployment_rate - LAG(unemployment_rate) OVER (ORDER BY year), 2) AS change
FROM unemployment
WHERE nationality = 'Saudis' AND gender = 'Total'
ORDER BY year;


-- Q8. Years where Saudi female unemployment fell by more than 2 points (CTE)
WITH yearly AS (
    SELECT year,
           unemployment_rate,
           unemployment_rate - LAG(unemployment_rate) OVER (ORDER BY year) AS change
    FROM unemployment
    WHERE nationality = 'Saudis' AND gender = 'Female'
)
SELECT year, ROUND(change, 2) AS change
FROM yearly
WHERE change < -2
ORDER BY year;
