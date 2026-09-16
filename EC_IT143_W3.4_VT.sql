/*****************************************************************************************************************
NAME:    EC_IT143_W3.4_VT.sql
SCRIPT:  AdventureWorks2022 - Create Answers Script
AUTHOR:  Veronica Thomas
DATE:    2026-09-16

DESCRIPTION:
This script contains 8 structured Transact-SQL queries answering questions gathered from peer posts and personal 
inquiries for the W3.4 AdventureWorks assignment.

RUNTIME ESTIMATE: ~00:00:02
*****************************************************************************************************************/

USE AdventureWorks2022;
GO

------------------------------------------------------------------------------------------------------------------
-- QUESTION 1 (Business User - Marginal Complexity)
-- Author: Self (Veronica Thomas)
-- Question: Which ten active employee records currently hold the job title of 'Buyer' within our organization?
------------------------------------------------------------------------------------------------------------------
SELECT TOP 10 
    e.BusinessEntityID,
    e.NationalIDNumber,
    e.LoginID,
    e.JobTitle,
    e.HireDate
FROM HumanResources.Employee AS e
WHERE e.JobTitle = 'Buyer';
------------------------------------------------------------------------------------------------------------------
-- QUESTION 2 (Business User - Marginal Complexity)
-- Author: Christopher Paul Rodriguez
-- Question: What is the highest list price in the Production.Product table?
------------------------------------------------------------------------------------------------------------------
SELECT MAX(p.ListPrice) AS HighestListPrice
FROM Production.Product AS p;


------------------------------------------------------------------------------------------------------------------
-- QUESTION 3 (Business User - Moderate Complexity)
-- Author: Self (Veronica Thomas)
-- Question: Our logistics department needs to evaluate shipping efficiency. What is the average total freight 
--           charge across all purchase orders placed with vendors during calendar year 2013?
------------------------------------------------------------------------------------------------------------------
SELECT AVG(poh.Freight) AS AverageFreightCost2013
FROM Purchasing.PurchaseOrderHeader AS poh
JOIN Purchasing.Vendor AS v 
  ON poh.VendorID = v.BusinessEntityID
WHERE poh.OrderDate >= '2013-01-01' 
  AND poh.OrderDate <= '2013-12-31';


------------------------------------------------------------------------------------------------------------------
-- QUESTION 4 (Business User - Moderate Complexity)
-- Author: Christopher Paul Rodriguez
-- Question: I need to review one territory. What is the sum of TotalDue for the Southwest territory using 
--           Sales.SalesTerritory and Sales.SalesOrderHeader?
------------------------------------------------------------------------------------------------------------------
SELECT 
    st.Name AS TerritoryName,
    SUM(soh.TotalDue) AS TotalSalesRevenue
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesTerritory AS st 
  ON soh.TerritoryID = st.TerritoryID
WHERE st.Name = 'Southwest'
GROUP BY st.Name;


------------------------------------------------------------------------------------------------------------------
-- QUESTION 5 (Business User - Increased Complexity)
-- Author: Christopher Paul Rodriguez
-- Question: Management is reviewing bicycle sales before planning next quarter's inventory. For the Bikes category, 
--           what is the total OrderQty sold? Use Production.ProductCategory, Production.ProductSubcategory, 
--           Production.Product, and Sales.SalesOrderDetail to calculate the answer.
------------------------------------------------------------------------------------------------------------------
SELECT 
    pc.Name AS CategoryName,
    SUM(sod.OrderQty) AS TotalOrderQuantity
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p 
  ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory AS ps 
  ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory AS pc 
  ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name = 'Bikes'
GROUP BY pc.Name;


------------------------------------------------------------------------------------------------------------------
-- QUESTION 6 (Business User - Increased Complexity)
-- Author: Self (Veronica Thomas)
-- Question: Leadership is auditing touring bike performance across North American territories for Q2 2013. 
--           We need a summary showing total order volume, overall revenue generated, and average unit price per color.
------------------------------------------------------------------------------------------------------------------
SELECT 
    p.Color,
    SUM(sod.OrderQty) AS TotalQuantitySold,
    SUM(sod.LineTotal) AS TotalRevenue,
    AVG(sod.UnitPrice) AS AverageUnitPrice
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesOrderDetail AS sod 
  ON soh.SalesOrderID = sod.SalesOrderID
JOIN Production.Product AS p 
  ON sod.ProductID = p.ProductID
JOIN Sales.SalesTerritory AS st 
  ON soh.TerritoryID = st.TerritoryID
WHERE st.[Group] = 'North America'
  AND p.Name LIKE '%Touring%'
  AND soh.OrderDate >= '2013-04-01' 
  AND soh.OrderDate <= '2013-06-30'
GROUP BY p.Color;


------------------------------------------------------------------------------------------------------------------
-- QUESTION 7 (Metadata Question)
-- Author: Self (Veronica Thomas)
-- Question: Which views defined within the Information Schema return a complete list of table names that 
--           contain a column named specifically as 'BusinessEntityID'?
------------------------------------------------------------------------------------------------------------------
SELECT 
    c.TABLE_SCHEMA,
    c.TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS AS c
WHERE c.COLUMN_NAME = 'BusinessEntityID';


------------------------------------------------------------------------------------------------------------------
-- QUESTION 8 (Metadata Question)
-- Author: Christopher Paul Rodriguez
-- Question: Using INFORMATION_SCHEMA.TABLES, how many base tables are in AdventureWorks2022 when views are 
--           excluded from the count?
------------------------------------------------------------------------------------------------------------------
SELECT COUNT(*) AS BaseTableCount
FROM INFORMATION_SCHEMA.TABLES AS t
WHERE t.TABLE_TYPE = 'BASE TABLE';