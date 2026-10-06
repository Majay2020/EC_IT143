-- =============================================
-- Script Name: EC_IT143_6.3_fwt_s4_vc.sql
-- Project: Fun with Triggers - Step 4: Test the Trigger
-- Description: Updates a record to verify the audit trigger populates modification metadata.
-- =============================================

-- Step A: View data before the update
SELECT CustomerID, ContactName, LastModifiedDate, LastModifiedBy
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;

-- Step B: Perform an update on CustomerID = 1
UPDATE dbo.t_w3_schools_customers
SET ContactName = 'Maria Anders (Updated)'
WHERE CustomerID = 1;

-- Step C: View data after the update to verify trigger results
SELECT CustomerID, ContactName, LastModifiedDate, LastModifiedBy
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;