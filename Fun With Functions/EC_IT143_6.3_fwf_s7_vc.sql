-- =============================================
-- Script Name: EC_IT143_6.3_fwf_s7_vc.sql
-- Project: Fun with Functions - Step 7: Perform a "0 results expected" test
-- Description: Uses a CTE to check for any discrepancies between ad hoc query and UDF.
-- =============================================

WITH CTE AS (
    SELECT ContactName, 
           LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS AdHoc_FirstName,
           dbo.udf_GetFirstName(ContactName) AS UDF_FirstName
    FROM dbo.t_w3_schools_customers
)
SELECT * 
FROM CTE 
WHERE AdHoc_FirstName <> UDF_FirstName; -- Should return 0 rows