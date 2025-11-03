USE AdventureWorks2017;
GO 

SELECT p.FirstName, p.LastName
FROM Person.Person p
WHERE p.BusinessEntityID IN (
    SELECT SalesPersonID
    FROM Sales.SalesOrderHeader
    WHERE TotalDue > 1000
);

SELECT p.FirstName, p.LastName
FROM Person.Person p
WHERE EXISTS (
    SELECT 1
    FROM Sales.SalesOrderHeader s
    WHERE s.SalesPersonID = p.BusinessEntityID
);

SELECT SalesPersonID, AVG(TotalDue) AS PromedioVentas
FROM Sales.SalesOrderHeader
GROUP BY SalesPersonID
HAVING AVG(TotalDue) > (
    SELECT AVG(TotalDue)
    FROM Sales.SalesOrderHeader
);

SELECT SalesOrderID, TotalDue,
       (SELECT AVG(TotalDue) FROM Sales.SalesOrderHeader) AS PromedioGeneral
FROM Sales.SalesOrderHeader;

SELECT SalesOrderID,
       CONVERT(VARCHAR, TotalDue, 1) AS TotalConFormato
FROM Sales.SalesOrderHeader;

SELECT SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE MONTH(OrderDate) = (
    SELECT MONTH(OrderDate)
    FROM Sales.SalesOrderHeader
    WHERE SalesOrderID = 43659
);


