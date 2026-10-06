-- =============================================
-- Script Name: EC_IT143_6.3_fwf_s6_vc.sql
-- Project: Fun with Functions - Step 6: Compare UDF results to ad hoc query results
-- Description: View ad hoc logic and UDF output side by side.
-- =============================================

SELECT ContactName, 
       LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS AdHoc_FirstName,
       dbo.udf_GetFirstName(ContactName) AS UDF_FirstName
FROM dbo.t_w3_schools_customers;