USE AdventureWorks2017;
GO

SELECT TOP 5 
    p.FirstName, 
    p.LastName, 
    c.CustomerID
FROM Person.Person p
CROSS JOIN Sales.Customer c;

SELECT TOP 10 
    p.FirstName, 
    p.LastName, 
    c.CustomerID
FROM Person.Person p
INNER JOIN Sales.Customer c
    ON p.BusinessEntityID = c.PersonID;

    SELECT TOP 10 
    p.FirstName, 
    p.LastName, 
    c.CustomerID
FROM Person.Person p
LEFT JOIN Sales.Customer c
    ON p.BusinessEntityID = c.PersonID;

    SELECT TOP 10 
    p.FirstName, 
    p.LastName, 
    c.CustomerID
FROM Person.Person p
RIGHT JOIN Sales.Customer c
    ON p.BusinessEntityID = c.PersonID; 

SELECT TOP 5 *
FROM Sales.SpecialOfferProduct;

SELECT 
    p.Name AS Producto,
    s.Description AS Oferta,
    s.DiscountPct AS Descuento
FROM Sales.SpecialOfferProduct sop
INNER JOIN Production.Product p
    ON sop.ProductID = p.ProductID
INNER JOIN Sales.SpecialOffer s
    ON sop.SpecialOfferID = s.SpecialOfferID;

    CREATE TABLE Profesores (
    ProfesorID INT IDENTITY PRIMARY KEY,
    Nombre NVARCHAR(100)
);

CREATE TABLE Cursos (
    CursoID INT IDENTITY PRIMARY KEY,
    Titulo NVARCHAR(100)
);

CREATE TABLE ProfesoresCursos (
    ProfesorID INT,
    CursoID INT,
    PRIMARY KEY (ProfesorID, CursoID),
    FOREIGN KEY (ProfesorID) REFERENCES Profesores(ProfesorID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);

SELECT 
    pr.Nombre AS Profesor,
    cu.Titulo AS Curso
FROM ProfesoresCursos pc
JOIN Profesores pr ON pc.ProfesorID = pr.ProfesorID
JOIN Cursos cu ON pc.CursoID = cu.CursoID;
