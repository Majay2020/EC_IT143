-- Step 8: Call the stored procedure
-- File name: EC_IT143_W4.2_recent_grads_s8_vt.sql
-- =================================================================
EXEC usp_load_t_recent_grads_petroleum_engineering;
GO

-- Verify final results
SELECT * FROM dbo.t_recent_grads_petroleum_engineering;