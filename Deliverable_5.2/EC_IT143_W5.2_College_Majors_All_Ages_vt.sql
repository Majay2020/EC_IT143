-- =========================================================================
-- Author: Veronica Thomas
-- Create date: September 2026
-- Description: Script #1 - My Communities Analysis (College Majors Dataset)
-- =========================================================================

-- Question 1 (Author: Veronica Thomas): Which engineering or business majors yield the highest long-term median earnings across all working age brackets?
SELECT TOP 10 Major, Major_category, Median
FROM dbo.[all-ages]
WHERE Major_category IN ('Engineering', 'Business')
ORDER BY Median DESC;

-- Question 2 (Author: Veronica Thomas): What is the baseline long-term unemployment rate for graduates with humanities degrees compared to technical degrees?
SELECT Major, Major_category, Unemployment_rate
FROM dbo.[all-ages]
WHERE Major_category IN ('Humanities & Liberal Arts', 'Engineering', 'Computers & Mathematics')
ORDER BY Unemployment_rate ASC;

-- Question 3 (Author: Veronica Thomas): What are the 25th and 75th percentile earnings thresholds for top-performing college majors over a full career lifespan?
SELECT TOP 10 Major, P25th, Median, P75th
FROM dbo.[all-ages]
ORDER BY P75th DESC;

-- Question 4 (Author: Student Peer): How do recent graduate median salaries compare directly to long-term career median earnings for the exact same field of study?
SELECT 
    r.Major,
    r.Median AS Recent_Graduate_Median,
    a.Median AS All_Ages_Median,
    (a.Median - r.Median) AS Salary_Growth
FROM dbo.[recent-grads] r
INNER JOIN dbo.[all-ages] a ON r.Major_code = a.Major_code
ORDER BY Salary_Growth DESC;