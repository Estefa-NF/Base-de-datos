USE AdventureWorks2017;
GO



   --1. FUNCIÓN: Calcular el área de un círculo
   --Las funciones en T-SQL devuelven un valor calculado. En este ejemplo, calculamos el área de un círculo (? * r²).

CREATE FUNCTION dbo.CalcularAreaCirculo (@Radio FLOAT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @Area FLOAT;                     -- Variable para guardar el resultado
    SET @Area = PI() * @Radio * @Radio;      -- Fórmula del área del círculo
    RETURN @Area;                            -- Devolvemos el valor
END;
GO

-- Prueba de la función
SELECT dbo.CalcularAreaCirculo(5) AS Area;   -- Resultado esperado: ~78.54
GO




   -- 2. PROCEDIMIENTO ALMACENADO: Insertar empleado
  -- Los procedimientos almacenados ejecutan un conjunto de instrucciones.A diferencia de las funciones, no devuelven un valor directo.
   -- AdventureWorks no permite insertar en tablas del sistema, por eso usaremos una tabla temporal #Empleados solo para pruebas.
   
CREATE TABLE #Empleados (
    Nombre NVARCHAR(50),
    Edad INT,
    Departamento NVARCHAR(50)
);

CREATE PROCEDURE dbo.InsertarEmpleado
    @Nombre NVARCHAR(50),
    @Edad INT,
    @Departamento NVARCHAR(50)
AS
BEGIN
    INSERT INTO #Empleados (Nombre, Edad, Departamento)
    VALUES (@Nombre, @Edad, @Departamento);
END;
GO

EXEC dbo.InsertarEmpleado 'Juan Pérez', 30, 'Ventas';
EXEC dbo.InsertarEmpleado 'Ana Gómez', 25, 'Marketing';

SELECT * FROM #Empleados;
GO
