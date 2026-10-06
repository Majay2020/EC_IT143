-- =============================================
-- Script Name: EC_IT143_6.3_fwf_s3_vc.sql
-- Project: Fun with Functions - Step 3: Create an ad hoc SQL query
-- Description: Extract the first name from ContactName using LEFT and CHARINDEX.
-- =============================================

SELECT ContactName, 
       LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName
FROM dbo.t_w3_schools_customers;