-- Step 4: Create the view
CREATE OR ALTER VIEW vw_all_ages_petroleum_engineering AS
SELECT Major
	, Median
FROM dbo.[all-ages]
WHERE Major = 'Petroleum Engineering';
GO

-- Test the view
SELECT * 
FROM vw_all_ages_petroleum_engineering;