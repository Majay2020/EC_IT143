-- Step 7: Turn the ad hoc script into a stored procedure
-- File name: EC_IT143_W4.2_recent_grads_s7_vt.sql
-- =================================================================
CREATE OR ALTER PROCEDURE usp_load_t_recent_grads_petroleum_engineering
AS
BEGIN
    TRUNCATE TABLE dbo.t_recent_grads_petroleum_engineering;

    INSERT INTO dbo.t_recent_grads_petroleum_engineering (Major, Median)
    SELECT Major, Median
    FROM vw_recent_grads_petroleum_engineering;
END;
GO