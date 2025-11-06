USE AdventureWorks2017;
GO


-- 1 SUBCONSULTA CON IN
-- Muestra los nombres de los empleados que han realizado
-- ventas mayores a 5000 dólares.

SELECT p.FirstName, p.LastName
FROM Person.Person p
WHERE p.BusinessEntityID IN (
    SELECT SalesPersonID
    FROM Sales.SalesOrderHeader
    WHERE TotalDue > 5000
);
-- La subconsulta busca los IDs de los vendedores con ventas mayores a 5000.
-- La consulta principal muestra sus nombres.




-- 2 SUBCONSULTA CON EXISTS
-- Muestra los empleados que realizaron al menos una venta.

SELECT p.FirstName, p.LastName
FROM Person.Person p
WHERE EXISTS (
    SELECT 1
    FROM Sales.SalesOrderHeader s
    WHERE s.SalesPersonID = p.BusinessEntityID
);
-- EXISTS devuelve TRUE si hay al menos una fila en la subconsulta.
-- No importa cuántos registros, solo que exista uno.




-- 3️ SUBCONSULTA EN HAVING
-- Muestra los vendedores cuyo promedio de ventas es mayor
-- que el promedio general de todos los vendedores.

SELECT SalesPersonID, AVG(TotalDue) AS PromedioVentas
FROM Sales.SalesOrderHeader
GROUP BY SalesPersonID
HAVING AVG(TotalDue) > (
    SELECT AVG(TotalDue)
    FROM Sales.SalesOrderHeader
);
-- La subconsulta calcula el promedio general de ventas.
-- Luego se muestran solo los vendedores que superan ese promedio.




-- 4️ SUBCONSULTA EN SELECT
-- Muestra cada pedido junto al promedio general de ventas.

SELECT SalesOrderID, TotalDue,
       (SELECT AVG(TotalDue)
        FROM Sales.SalesOrderHeader) AS PromedioGeneral
FROM Sales.SalesOrderHeader;

-- En cada fila se muestra el valor TotalDue y el promedio de todas las ventas.




-- 5️ SUBCONSULTA CON FUNCIONES DE FECHA
-- Muestra los pedidos realizados en el mismo mes que el pedido 43659.

SELECT SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE MONTH(OrderDate) = (
    SELECT MONTH(OrderDate)
    FROM Sales.SalesOrderHeader
    WHERE SalesOrderID = 43659
);

-- La subconsulta obtiene el mes del pedido 43659.
-- Luego, se comparan los meses de todos los pedidos con ese mismo valor.



