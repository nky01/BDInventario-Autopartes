USE BDInventario
GO

-- Artículos con stock bajo
SELECT Descripcion_Articulo, Stock_Articulo
FROM Articulos
WHERE Stock_Articulo < 30;

-- Total facturado por cliente
SELECT C.Nombre_Cliente, SUM(F.PrecioTotal_Factura) AS TotalGastado
FROM Facturas F
INNER JOIN Cuentas CU ON F.Codigo_Cuenta_Factura = CU.Codigo_Cuenta
INNER JOIN Clientes C ON CU.DNI_Cliente_Cuenta = C.DNI_Cliente
GROUP BY C.Nombre_Cliente;

-- Pedidos pendientes
SELECT P.Codigo_Pedido, PR.Nombre_Proveedor, P.Fecha_Pedido
FROM Pedidos P
INNER JOIN Proveedores PR ON P.Codigo_Proveedor_Pedido = PR.Codigo_Proveedor
WHERE P.Estado_Pedido = 'Completado';