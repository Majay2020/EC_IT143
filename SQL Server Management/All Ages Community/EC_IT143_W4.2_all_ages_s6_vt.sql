-- Step 6: Load the table from the view using TRUNCATE and INSERT
TRUNCATE TABLE dbo.t_all_ages_petroleum_engineering;
GO

INSERT INTO dbo.t_all_ages_petroleum_engineering (Major, Median)
SELECT Major, Median
FROM vw_all_ages_petroleum_engineering;
GO

-- Verify Step 6 load
SELECT * FROM dbo.t_all_ages_petroleum_engineering;
GO

-- =================================================================
-- Step 7: Turn the ad hoc script into a stored procedure
-- =================================================================
CREATE OR ALTER PROCEDURE usp_load_t_all_ages_petroleum_engineering
AS
BEGIN
    TRUNCATE TABLE dbo.t_all_ages_petroleum_engineering;

    INSERT INTO dbo.t_all_ages_petroleum_engineering (Major, Median)
    SELECT Major, Median
    FROM vw_all_ages_petroleum_engineering;
END;
GO

-- =================================================================
-- Step 8: Call the stored procedure
-- =================================================================
EXEC usp_load_t_all_ages_petroleum_engineering;
GO

-- Verify final results
SELECT * FROM dbo.t_all_ages_petroleum_engineering;