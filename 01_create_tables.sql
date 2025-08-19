USE master
GO

-- Previamente, cree una carpeta llamada 'INVENTARIO_AUTOPARTES' en la direccion C:
CREATE DATABASE BDInventario ON
( NAME = InventarioAutopartes_dat,
  FILENAME = 'C:\INVENTARIO_AUTOPARTES\InventarioAutopartes.mdf'
)
GO

USE BDInventario
GO

CREATE TABLE Clientes (
DNI_Cliente VARCHAR(8) NOT NULL,
Nombre_Cliente VARCHAR(50) NULL,
Apellido_Cliente VARCHAR(50) NULL,
Telefono_Cliente VARCHAR(20) NOT NULL,
Direccion_Cliente VARCHAR(50) NULL,
CONSTRAINT PK_DNI_Cliente PRIMARY KEY(DNI_Cliente)
)
GO

CREATE TABLE Cuentas(
Codigo_Cuenta CHAR(5) NOT NULL,
DNI_Cliente_Cuenta VARCHAR(8) NOT NULL,
Limite_Cuenta MONEY NULL,
Saldo_Cuenta MONEY NULL,

CONSTRAINT PK_Codigo_Cuenta PRIMARY KEY(Codigo_Cuenta),
CONSTRAINT FK_DNI_Cliente_Cuenta FOREIGN KEY(DNI_Cliente_Cuenta) 
	REFERENCES Clientes(DNI_Cliente)
)
GO

CREATE TABLE Proveedores(
Codigo_Proveedor CHAR(5) NOT NULL,
Nombre_Proveedor VARCHAR(50) NOT NULL,
RazonSocial_Proveedor VARCHAR(50) NULL,
Direccion_Proveedor VARCHAR(50) NULL,
Ciudad_Proveedor VARCHAR(50) NULL,
Provincia_Proveedor VARCHAR(50) NULL,
CUIT_Proveedor VARCHAR(11) NULL,
Telefono_Proveedor VARCHAR(20) NULL,
Contacto_Proveedor VARCHAR(50) NULL,
Web_Proveedor VARCHAR(50) NULL,
Email_Proveedor VARCHAR(50) NULL,

CONSTRAINT PK_Codigo_Proveedor PRIMARY KEY (Codigo_Proveedor)
)
GO


CREATE TABLE Categorias(
Codigo_Categoria CHAR(5) NOT NULL,
Descripcion_Categoria TEXT NOT NULL,

CONSTRAINT PK_Codigo_Categoria PRIMARY KEY (Codigo_Categoria)
)
GO

CREATE TABLE Articulos(
Codigo_Articulo CHAR(5) NOT NULL,
Codigo_Proveedor_Articulo CHAR(5) NOT NULL,
Codigo_Categoria_Articulo CHAR(5) NOT NULL,
Descripcion_Articulo TEXT NULL,
Stock_Articulo INT NULL,
PrecioUnitario_Articulo MONEY NULL,

CONSTRAINT PK_Articulo PRIMARY KEY (Codigo_Articulo, Codigo_Proveedor_Articulo),
CONSTRAINT FK_Codigo_Proveedor_Articulo FOREIGN KEY (Codigo_Proveedor_Articulo) 
	REFERENCES Proveedores(Codigo_Proveedor),
CONSTRAINT FK_Codigo_Categoria_Articulo FOREIGN KEY (Codigo_Categoria_Articulo) 
	REFERENCES Categorias(Codigo_Categoria)
)
GO

CREATE TABLE Detalle_Facturas (
Codigo_DFactura CHAR(5) NOT NULL,
Codigo_Proveedor_DFactura CHAR(5) NOT NULL,
Codigo_Articulo_DFactura CHAR(5) NOT NULL,
Cantidad_DFactura INT NULL,
PrecioUnitario_DFactura MONEY NULL,

CONSTRAINT PK_DFactura PRIMARY KEY (Codigo_DFactura, Codigo_Proveedor_DFactura, Codigo_Articulo_DFactura),
CONSTRAINT FK_Codigo_Proveedor_DFactura FOREIGN KEY (Codigo_Proveedor_DFactura)
	REFERENCES Proveedores(Codigo_Proveedor),
CONSTRAINT FK_Codigo_Articulo_DFactura FOREIGN KEY (Codigo_Articulo_DFactura, Codigo_Proveedor_DFactura)
	REFERENCES Articulos(Codigo_Articulo, Codigo_Proveedor_Articulo)
)
GO

CREATE TABLE Facturas(
Codigo_Factura CHAR(5) NOT NULL,
Codigo_Cuenta_Factura CHAR(5) NOT NULL,
Fecha_Factura DATE NULL DEFAULT GETDATE(),
PrecioTotal_Factura MONEY NULL,

CONSTRAINT PK_Codigo_Factura PRIMARY KEY (Codigo_Factura),
CONSTRAINT FK_Codigo_Cuenta_Factura FOREIGN KEY (Codigo_Cuenta_Factura)
	REFERENCES Cuentas(Codigo_Cuenta)
)
GO

CREATE TABLE Pedidos(
Codigo_Pedido CHAR(5) NOT NULL,
Codigo_Proveedor_Pedido CHAR(5) NOT NULL,
Fecha_Pedido DATE NULL DEFAULT GETDATE(),
Estado_Pedido VARCHAR(20) NOT NULL DEFAULT 'Pendiente',
PrecioTotal_Pedido MONEY NULL,

CONSTRAINT PK_Codigo_Pedido PRIMARY KEY (Codigo_Pedido),
CONSTRAINT FK_Codigo_Proveedor_Pedido FOREIGN KEY (Codigo_Proveedor_Pedido)
	REFERENCES Proveedores(Codigo_Proveedor)
)
GO

CREATE TABLE Detalle_Pedidos (
Codigo_DPedido CHAR(5) NOT NULL,
Codigo_Proveedor_DPedido CHAR(5) NOT NULL,
Codigo_Articulo_DPedido CHAR(5) NOT NULL,
Cantidad_DPedido INT NULL,
PrecioUnitario_DPedido MONEY NULL,

CONSTRAINT PK_DPedido PRIMARY KEY (Codigo_DPedido, Codigo_Proveedor_DPedido, Codigo_Articulo_DPedido),
CONSTRAINT FK_Codigo_Proveedor_DPedido FOREIGN KEY (Codigo_Proveedor_DPedido)
	REFERENCES Proveedores(Codigo_Proveedor),
CONSTRAINT FK_Codigo_Articulo_DPedido FOREIGN KEY (Codigo_Articulo_DPedido, Codigo_Proveedor_DPedido)
	REFERENCES Articulos(Codigo_Articulo, Codigo_Proveedor_Articulo)
)
GO