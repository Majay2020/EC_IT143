-- =============================================
-- Script Name: EC_IT143_6.3_fwt_s3_vc.sql
-- Project: Fun with Triggers - Step 3: Create the Trigger
-- Description: Creates an AFTER UPDATE trigger to automatically log modification info.
-- =============================================

CREATE TRIGGER dbo.trg_customers_audit
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE c
    SET LastModifiedDate = GETDATE(),
        LastModifiedBy = SUSER_SNAME()
    FROM dbo.t_w3_schools_customers c
    INNER JOIN inserted i ON c.CustomerID = i.CustomerID;
END;
GO