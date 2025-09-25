SELECT p.FirstName, p.LastName, d.Name AS Departamento
FROM HumanResources.Employee e
INNER JOIN Person.Person p 
    ON e.BusinessEntityID = p.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory edh 
    ON e.BusinessEntityID = edh.BusinessEntityID
INNER JOIN HumanResources.Department d 
    ON edh.DepartmentID = d.DepartmentID
WHERE edh.EndDate IS NULL;


SELECT p.FirstName, p.LastName, jt.Name AS Puesto
FROM Person.Person p
LEFT JOIN HumanResources.Employee e 
    ON p.BusinessEntityID = e.BusinessEntityID
LEFT JOIN HumanResources.EmployeeDepartmentHistory edh 
    ON e.BusinessEntityID = edh.BusinessEntityID
LEFT JOIN HumanResources.JobTitle jt 
    ON e.JobTitle = jt.Name;


SELECT d.Name AS Departamento, p.FirstName, p.LastName
FROM HumanResources.Department d
RIGHT JOIN HumanResources.EmployeeDepartmentHistory edh 
    ON d.DepartmentID = edh.DepartmentID
RIGHT JOIN Person.Person p 
    ON edh.BusinessEntityID = p.BusinessEntityID;


SELECT p.FirstName, p.LastName, d.Name AS Departamento
FROM Person.Person p
FULL JOIN HumanResources.EmployeeDepartmentHistory edh 
    ON p.BusinessEntityID = edh.BusinessEntityID
FULL JOIN HumanResources.Department d 
    ON edh.DepartmentID = d.DepartmentID;


SELECT p.FirstName, p.LastName, d.Name AS Departamento
FROM Person.Person p
CROSS JOIN HumanResources.Department d;


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