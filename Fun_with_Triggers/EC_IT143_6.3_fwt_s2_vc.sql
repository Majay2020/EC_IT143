-- =============================================
-- Script Name: EC_IT143_6.3_fwt_s2_vc.sql
-- Project: Fun with Triggers - Step 2: Research and Test Ad Hoc Solution
-- Description: Tests GETDATE() and SUSER_SNAME() to track modification metadata.
-- =============================================

SELECT 
    CustomerID,
    ContactName,
    GETDATE() AS CurrentDateTime,
    SUSER_SNAME() AS CurrentUserLogin
FROM dbo.t_w3_schools_customers;