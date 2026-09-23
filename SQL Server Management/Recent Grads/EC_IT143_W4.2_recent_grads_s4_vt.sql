-- Step 4: Create the view
CREATE OR ALTER VIEW vw_recent_grads_petroleum_engineering AS
SELECT Major
	, Median
FROM dbo.[recent-grads]
WHERE Major = 'Petroleum Engineering';
GO

-- Test the view
SELECT * 
FROM vw_recent_grads_petroleum_engineering;