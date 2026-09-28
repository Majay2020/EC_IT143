-- =========================================================================
-- Author: Veronica Thomas
-- Create date: September 2026
-- Description: Script #2 - My Communities Analysis (Recent Grads & Comparisons)
-- =========================================================================

-- Question 1 (Author: Veronica Thomas): Do majors with high unemployment rates right after graduation experience lower long-term employment stability later in life?
SELECT 
    r.Major,
    r.Major_category,
    r.Unemployment_rate AS Recent_Unemployment,
    a.Unemployment_rate AS All_Ages_Unemployment
FROM dbo.[recent-grads] r
INNER JOIN dbo.[all-ages] a ON r.Major_code = a.Major_code
ORDER BY Recent_Unemployment DESC;

-- Question 2 (Author: Veronica Thomas): What are the top 10 majors with the highest total number of employed recent graduates?
SELECT TOP 10
    Major,
    Employed,
    Total
FROM dbo.[recent-grads]
ORDER BY Employed DESC;

-- Question 3 (Author: Veronica Thomas): Are undergraduate fields with high female employment percentages seeing lower median salaries?
SELECT TOP 10
    Major,
    ShareWomen,
    Median
FROM dbo.[recent-grads]
ORDER BY ShareWomen DESC;

-- Question 4 (Author: Student Peer): What are the lowest-earning majors for recent graduates compared to their long-term earnings?
SELECT TOP 5
    r.Major,
    r.Median AS Recent_Grad_Median,
    a.Median AS All_Ages_Median
FROM dbo.[recent-grads] r
INNER JOIN dbo.[all-ages] a ON r.Major_code = a.Major_code
ORDER BY Recent_Grad_Median ASC;