USE BDInventario
GO

INSERT INTO Clientes (DNI_Cliente, Nombre_Cliente, Apellido_Cliente, Telefono_Cliente, Direccion_Cliente)
VALUES 
('12345678','Juan','Pérez','01112345678','Calle Falsa 123'),
('87654321','María','Gómez','01187654321','Av. Siempre Viva 742'),
('11223344','Carlos','Rodríguez','01111223344','Calle Industria 50');

INSERT INTO Cuentas (Codigo_Cuenta, DNI_Cliente_Cuenta, Limite_Cuenta, Saldo_Cuenta)
VALUES 
('C001','12345678',100000,50000),
('C002','87654321',50000,15000),
('C003','11223344',75000,30000);

INSERT INTO Proveedores 
(Codigo_Proveedor, Nombre_Proveedor, RazonSocial_Proveedor, Direccion_Proveedor, Ciudad_Proveedor, Provincia_Proveedor, CUIT_Proveedor, Telefono_Proveedor, Contacto_Proveedor, Web_Proveedor, Email_Proveedor)
VALUES
('P001','Autopartes Rossi','Autopartes Rossi S.A.','Calle Motor 100','Buenos Aires','Buenos Aires','20304050607','01122334455','Rossi Juan','www.autopartesrossi.com','ventas@autopartesrossi.com'),
('P002','Motores del Sur','Motores del Sur S.R.L.','Av. Motor 200','Rosario','Santa Fe','20987654321','03412345678','Gómez Ana','www.motoresdelsur.com','contacto@motoresdelsur.com');

INSERT INTO Categorias (Codigo_Categoria, Descripcion_Categoria)
VALUES
('CAT01','Frenos'),
('CAT02','Motor'),
('CAT03','Transmisión'),
('CAT04','Suspensión');

INSERT INTO Articulos (Codigo_Articulo, Codigo_Proveedor_Articulo, Codigo_Categoria_Articulo, Descripcion_Articulo, Stock_Articulo, PrecioUnitario_Articulo)
VALUES
('A001','P001','CAT01','Pastilla de freno delantera','100',1200),
('A002','P001','CAT01','Disco de freno trasero','50',2500),
('A003','P002','CAT02','Bomba de aceite motor','30',8000),
('A004','P002','CAT02','Filtro de aceite motor','200',500),
('A005','P001','CAT03','Kit de embrague','20',15000),
('A006','P001','CAT04','Amortiguador delantero','40',7000);

INSERT INTO Pedidos (Codigo_Pedido, Codigo_Proveedor_Pedido, Fecha_Pedido, Estado_Pedido, PrecioTotal_Pedido)
VALUES
('PED01','P001','20250819','Pendiente',50000),
('PED02','P002','20250820','Completado',15000);

INSERT INTO Facturas (Codigo_Factura, Codigo_Cuenta_Factura, Fecha_Factura, PrecioTotal_Factura)
VALUES
('F001','C001','20250819',24400),
('F002','C002','20250820',15500);

INSERT INTO Detalle_Pedidos (Codigo_DPedido, Codigo_Proveedor_DPedido, Codigo_Articulo_DPedido, Cantidad_DPedido, PrecioUnitario_DPedido)
VALUES
('DP01','P001','A001',20,1200),
('DP02','P001','A002',10,2500),
('DP03','P002','A003',5,8000),
('DP04','P002','A004',50,500);


INSERT INTO Detalle_Facturas (Codigo_DFactura, Codigo_Proveedor_DFactura, Codigo_Articulo_DFactura, Cantidad_DFactura, PrecioUnitario_DFactura)
VALUES
('DF01','P001','A001',10,1200),
('DF02','P001','A002',5,2500),
('DF03','P002','A004',30,500);