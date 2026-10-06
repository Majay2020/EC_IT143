-- =============================================
-- Script Name: EC_IT143_6.3_fwf_s4_vc.sql
-- Project: Fun with Functions - Step 4: Research and test a solution
-- Description: Test string splitting and document research notes.
-- Research Source: Microsoft Docs (LEFT, CHARINDEX functions)
-- =============================================

-- Test finding the space index position
SELECT ContactName, 
       CHARINDEX(' ', ContactName + ' ') AS SpacePosition
FROM dbo.t_w3_schools_customers;