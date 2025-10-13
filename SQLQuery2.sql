USE AdventureWorks2017;
GO

CREATE PROCEDURE ProcesarPedido
    @SalesOrderID INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- 1. Actualizar el estado del pedido
        UPDATE Sales.SalesOrderHeader
        SET Status = 5 -- 'Shipped' o procesado
        WHERE SalesOrderID = @SalesOrderID;

        -- 2. Registrar el cambio en una tabla de auditoría (si existe)
        INSERT INTO dbo.AuditoriaPedidos (SalesOrderID, FechaCambio, Accion)
        VALUES (@SalesOrderID, GETDATE(), 'Pedido procesado correctamente');

        -- 3. Confirmar los cambios
        COMMIT TRANSACTION;
        PRINT 'Transacción completada correctamente.';
    END TRY
    BEGIN CATCH
        -- Si hay error, deshacer los cambios
        ROLLBACK TRANSACTION;
        PRINT 'Error detectado. Transacción revertida.';
        THROW; -- vuelve a lanzar el error para revisión
    END CATCH
END;
GO