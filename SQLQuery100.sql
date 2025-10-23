USE AdventureWorks2017;
GO

-- SUM(): Suma total de los montos de las órdenes
SELECT SUM(TotalDue) AS TotalVentas
FROM Sales.SalesOrderHeader;

-- COUNT(): Número total de órdenes registradas
SELECT COUNT(*) AS TotalOrdenes
FROM Sales.SalesOrderHeader;

-- COUNT(columna): Cuenta los clientes con número de cuenta (no nulos)
SELECT COUNT(AccountNumber) AS ClientesConCuenta
FROM Sales.Customer;

-- AVG(): Promedio del subtotal de las órdenes
SELECT AVG(SubTotal) AS PromedioSubtotal
FROM Sales.SalesOrderHeader;

-- MAX(): Venta más alta
SELECT MAX(TotalDue) AS VentaMasAlta
FROM Sales.SalesOrderHeader;

-- MIN(): Venta más baja
SELECT MIN(TotalDue) AS VentaMasBaja
FROM Sales.SalesOrderHeader;

-- GROUP BY: Agrupar por vendedor
SELECT SalesPersonID,
       SUM(TotalDue) AS TotalVentas,
       AVG(TotalDue) AS PromedioVentas,
       COUNT(*) AS NumeroDeOrdenes
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL
GROUP BY SalesPersonID;

-- HAVING: Mostrar vendedores con total de ventas mayor a 2 millones
SELECT SalesPersonID, SUM(TotalDue) AS TotalVentas
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL
GROUP BY SalesPersonID
HAVING SUM(TotalDue) > 2000000;
