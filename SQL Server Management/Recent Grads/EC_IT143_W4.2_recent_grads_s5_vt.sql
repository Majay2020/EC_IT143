-- Step 5: Turn the view into a table and refine structure

-- Drop the table if it already exists from a previous run
IF OBJECT_ID('dbo.t_recent_grads_petroleum_engineering', 'U') IS NOT NULL
    DROP TABLE dbo.t_recent_grads_petroleum_engineering;
GO

-- Create the table using SELECT INTO from our view
SELECT *
INTO dbo.t_recent_grads_petroleum_engineering
FROM vw_recent_grads_petroleum_engineering;
GO

-- Verify the new table data
SELECT * FROM dbo.t_recent_grads_petroleum_engineering;