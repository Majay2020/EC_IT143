-- Step 5: Turn the view into a table and refine structure

-- Drop the table if it already exists from a previous run
IF OBJECT_ID('dbo.t_all_ages_petroleum_engineering', 'U') IS NOT NULL
    DROP TABLE dbo.t_all_ages_petroleum_engineering;
GO

-- Create the table using SELECT INTO from our view
SELECT *
INTO dbo.t_all_ages_petroleum_engineering
FROM vw_all_ages_petroleum_engineering;
GO

-- Alter column to NOT NULL so we can add a primary key constraint
ALTER TABLE dbo.t_all_ages_petroleum_engineering
ALTER COLUMN Major VARCHAR(255) NOT NULL;
GO

-- Add the primary key constraint
ALTER TABLE dbo.t_all_ages_petroleum_engineering
ADD CONSTRAINT PK_t_all_ages_petroleum_engineering PRIMARY KEY (Major);
GO

-- Verify table data and definition
SELECT * FROM dbo.t_all_ages_petroleum_engineering;