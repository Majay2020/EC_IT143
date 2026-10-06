-- =============================================
-- Script Name: EC_IT143_6.3_fwf_s5_vc.sql
-- Project: Fun with Functions - Step 5: Create a user-defined scalar function
-- Description: Creates a scalar function to extract the first name from a contact name string.
-- =============================================

CREATE FUNCTION dbo.udf_GetFirstName (@ContactName VARCHAR(100))
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @FirstName VARCHAR(50);
    SET @FirstName = LEFT(@ContactName, CHARINDEX(' ', @ContactName + ' ') - 1);
    RETURN @FirstName;
END;
GO

-- Test the newly created function
SELECT dbo.udf_GetFirstName('Maria Anders') AS TestResult;