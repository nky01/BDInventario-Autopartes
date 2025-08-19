# BDInventario Autopartes 💻🚘

Base de datos relacional para gestionar inventario, pedidos y facturas de una fábrica de autopartes. Simula procesos típicos de una empresa industrial y tecnológica: control de stock, compras a proveedores y ventas a clientes.

## 🗂️ Estructura de la base de datos
- **Clientes** → Datos de clientes 
- **Cuentas** → Límites y saldos de cuentas corrientes
- **Proveedores** → Información de proveedores
- **Categorías** → Clasificación de artículos (Frenos, Motor, Transmisión, Suspensión)
- **Artículos** → Productos con stock y precio
- **Pedidos** → Compras realizadas a proveedores
- **Detalle_Pedidos** → Detalle de artículos por pedido
- **Facturas** → Ventas a clientes
- **Detalle_Facturas** → Detalle de artículos por factura

## 💾 Scripts incluidos:
**01_create_database.sql** → Crea la base de datos y las tablas con sus relaciones <br>
**02_insert_data.sql** → Inserta datos de ejemplo en todas las tablas <br>
**03_queries_examples.sql** → Consultas de ejemplo y restricciones adicionales (ej. `GETDATE()` para fechas)

## 📊 Diagrama:
<img width="1291" height="420" alt="image" src="https://github.com/user-attachments/assets/ad80b099-8d11-4f4d-9247-f05b5a31fea2" />


## Tecnologías:
- SQL Server  
- T-SQL
- DRAW.io
