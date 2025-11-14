
USE AdventureWorks2017;
GO

-- Eliminamos la tabla si ya existe
IF OBJECT_ID('dbo.Cuentas', 'U') IS NOT NULL
    DROP TABLE dbo.Cuentas;
GO

-- Creamos una tabla de prueba para simular transacciones bancarias
CREATE TABLE dbo.Cuentas (
    ID INT PRIMARY KEY,
    Titular NVARCHAR(100),
    Saldo DECIMAL(10,2)
);

-- Insertamos datos iniciales
INSERT INTO dbo.Cuentas (ID, Titular, Saldo)
VALUES (1, 'Juan Pérez', 1000.00),
       (2, 'Ana Gómez', 500.00);
GO

SELECT * FROM dbo.Cuentas;   -- Comprobamos los datos iniciales
GO







