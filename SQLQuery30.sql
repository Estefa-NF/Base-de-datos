INSERT INTO HumanResources.Employee
    (BusinessEntityID, NationalIDNumber, LoginID, JobTitle, BirthDate, MaritalStatus, Gender, HireDate)
VALUES
    (20778, '999999999', 'adventure-works\juanp', 'Developer', '1990-05-12', 'S', 'M', GETDATE());


DELETE FROM Sales.Customer
WHERE CustomerID = 30000;


UPDATE HumanResources.Employee
SET JobTitle = 'Senior Developer'
WHERE BusinessEntityID = 20778; 


SELECT *
FROM (
    SELECT TerritoryID, YEAR(OrderDate) AS Anio, TotalDue
    FROM Sales.SalesOrderHeader
) AS Fuente
PIVOT (
    SUM(TotalDue)
    FOR Anio IN ([2011], [2012], [2013], [2014])
) AS PivotTable;