-- ==========================================
-- W6.4 Performance Analysis Assignment
-- ==========================================

-- Clean up existing indexes if re-running script
DROP INDEX IF EXISTS IX_Person_Address_City ON [Person].[Address];
DROP INDEX IF EXISTS IX_Sales_SalesOrderDetail_CarrierTrackingNumber ON [Sales].[SalesOrderDetail];
GO

-- Query 1: Unindexed search on Person.Address
SELECT AddressID, AddressLine1, City, StateProvinceID, PostalCode
FROM Person.Address
WHERE City = 'Bothell';

-- Create Index 1
CREATE NONCLUSTERED INDEX IX_Person_Address_City
ON [Person].[Address] ([City]);
GO

-- Query 2: Unindexed search on Sales.SalesOrderDetail
SELECT SalesOrderID, SalesOrderDetailID, CarrierTrackingNumber, OrderQty, ProductID, UnitPrice
FROM Sales.SalesOrderDetail
WHERE CarrierTrackingNumber = '4911-403C-98';

-- Create Index 2
CREATE NONCLUSTERED INDEX IX_Sales_SalesOrderDetail_CarrierTrackingNumber
ON [Sales].[SalesOrderDetail] ([CarrierTrackingNumber]);
GO