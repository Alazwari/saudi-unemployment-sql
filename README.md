# Saudi Unemployment Analysis (1999–2025) with SQL

An exploratory SQL analysis of official unemployment rates in Saudi Arabia by nationality and gender, examining how the labour market changed before and after the launch of **Saudi Vision 2030** in 2016.

![Saudi unemployment rate by gender, 1999–2025](images/saudi_unemployment_by_gender.png)

## Key findings

- **Saudi female unemployment fell from 34.5% in 2016 to 11.0% in 2025**, a drop of more than 23 percentage points (about two-thirds).
- **The gender gap narrowed sharply:** the difference between Saudi female and male unemployment shrank from **28.6 points (2016)** to **6.3 points (2025)**.
- **The improvement was sustained, not a one-off:** Saudi female unemployment fell by more than 2 points **every year from 2020 to 2025**, with the largest single-year drop in **2021 (−6.2 points)**. Before 2020, a drop of this size happened only once (2013).
- **Averages can hide trends:** the average Saudi female rate in Vision 2030 Phase 1 (2016–2020, **31.6%**) was *higher* than before the Vision (1999–2015, **26.7%**), because unemployment had been rising for years and peaked at **35.7% in 2012**. The decline became clear in Phase 2 (2021–2025, **16.2%**).
- Over 1999–2025, the average unemployment rate for Saudis (**10.7%**) was about **12 times** that of non-Saudis (**0.9%**).

## Data

| File | Description |
|---|---|
| `data/saudi_unemployment_1999_2025.csv` | Annual unemployment rate (%) by nationality (Saudis, Non-Saudis, Total) and gender (Male, Female, Total) — 243 rows |
| `data/vision_periods.csv` | Analysis periods: Pre-Vision 2030 (1999–2015), Phase 1 (2016–2020), Phase 2 (2021–2025) |

**Source:** General Authority for Statistics (GASTAT), published on the [KAPSARC Data Portal](https://datasource.kapsarc.org/explore/dataset/unemployment-rate-for-saudis-and-non-saudis-by-sex-1999-2015/) (Public Domain). Values are rounded to two decimals.

> **Note:** This is a long official time series, and survey methodology may have been revised over the period. Year-to-year comparisons across methodology changes should be read with care. The Vision 2030 periods are defined for this analysis only.

## SQL techniques used

| Level | Techniques |
|---|---|
| Basic | `SELECT`, `WHERE`, `AND`, `IN`, `ORDER BY`, `DESC`, `LIMIT` |
| Intermediate | `AVG`, `ROUND`, `GROUP BY`, conditional aggregation with `CASE WHEN`, `JOIN` with `BETWEEN` |
| Advanced | Window functions (`LAG() OVER`), Common Table Expressions (`WITH`) |

All queries are in [`queries.sql`](queries.sql).

## How to run

1. Open [sqliteonline.com](https://sqliteonline.com) (or any SQLite tool).
2. Run [`setup.sql`](setup.sql) to create and load the two tables.
3. Run the queries in [`queries.sql`](queries.sql).

## Author

**Dr. Ahood Alazwari** — Data Scientist & AI Consultant | PhD in Applied Statistics (RMIT University)
[LinkedIn](https://www.linkedin.com/in/dr-ahood-alazwari-4406a9182)
