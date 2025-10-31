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