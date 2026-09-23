-- Step 6: Load the table from the view using TRUNCATE and INSERT
TRUNCATE TABLE dbo.t_recent_grads_petroleum_engineering;
GO

INSERT INTO dbo.t_recent_grads_petroleum_engineering (Major, Median)
SELECT Major, Median
FROM vw_recent_grads_petroleum_engineering;
GO

-- Verify the reloaded table data
SELECT * FROM dbo.t_recent_grads_petroleum_engineering;