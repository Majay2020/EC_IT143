-- =============================================
-- Script Name: EC_IT143_6.3_fwt_s5_vc.sql
-- Project: Fun with Triggers - Step 5: Verify All Rows
-- Description: Reviews the full table to inspect audit tracking across records.
-- =============================================

SELECT CustomerID, ContactName, LastModifiedDate, LastModifiedBy
FROM dbo.t_w3_schools_customers;