-- Step 7: Turn the ad hoc script into a stored procedure
CREATE OR ALTER PROCEDURE usp_load_t_all_ages_petroleum_engineering
AS
BEGIN
    TRUNCATE TABLE dbo.t_all_ages_petroleum_engineering;

    INSERT INTO dbo.t_all_ages_petroleum_engineering (Major, Median)
    SELECT Major, Median
    FROM vw_all_ages_petroleum_engineering;
END;
GO