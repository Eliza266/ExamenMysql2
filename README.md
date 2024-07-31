#  CONSULTAS BASICAS 

### Consultar todos los productos y sus categorías
```sql
SELECT p.idProducto, 
p.nombre, 
p.idCategoria, 
p.codigoBarras, 
p.precioVenta, 
p.stock, 
p.estado
FROM productos p
INNER JOIN categorias c ON p.idCategoria = c.idCategoria; 
```
### Consultar todas las compras y los clientes que las realizaron
```sql
SELECT c.idCompra, 
c.fecha, 
c.medioPago, 
c.comentario, 
c.idCliente, cl.nombre 
FROM compras c
INNER JOIN clientes cl ON  c.idCliente = cl.idCliente;
```
### Consultar los productos comprados en una compra específica
```sql
SELECT 
    cp.idCompra,
    p.idProducto,
    p.nombre,
    cp.cantidad,
    cp.total,
    cp.estado
FROM 
    compras_productos cp
JOIN 
    productos p ON cp.idProducto = p.idProducto
WHERE 
    cp.idCompra = 1; 

```
### Agregar un nuevo producto
```sql
INSERT INTO productos (idProducto, nombre, idCategoria, codigoBarras, precioVenta, stock, estado) VALUES
(5, 'Leche', 3, 'SKDFHadsSS454', 60, 10, 5);

```
### Actualizar el stock de un producto
```sql
UPDATE productos SET stock = 15 WHERE idProducto = 2;

```
### Consultar todas las compras de un cliente específico
```sql
SELECT 
c.idCompra,
c.idCliente,
cl.nombre,
c.fecha,
c.comentario,
c.estado
FROM compras c
INNER JOIN clientes cl ON c.idCliente = cl.idCliente
WHERE c.idCliente = 'C002';
```
### Consultar todos los clientes y sus correos electrónicos
```sql
SELECT idCliente, nombre, apellidos, correo
FROM clientes;
```
### Consultar la cantidad total de productos comprados en cada compra
```sql
SELECT 
    cp.idCompra,
    SUM(cp.cantidad) AS totalProductosComprados
FROM 
    compras_productos cp
GROUP BY 
    cp.idCompra;

```
### Consultar las compras realizadas en un rango de fechas
```sql
SELECT 
    c.idCompra,
    c.idCliente,
    c.fecha,
    c.medioPago,
    c.comentario,
    c.estado
FROM 
    compras c
WHERE 
    c.fecha BETWEEN '2024-01-01' AND '2024-12-31';  


```

# Consultas usando funciones agregadas
### Contar la cantidad de productos por categoría
```sql
SELECT COUNT(p.idProducto) as cantidadProducto, c.idCategoria, c.descripcion
FROM productos p
INNER JOIN categorias c ON p.idCategoria = c.idCategoria
GROUP BY c.idCategoria;
```
### Calcular el precio total de ventas por cada cliente
```sql
SELECT 
    c.idCliente,
    SUM(cp.cantidad * p.precioVenta) AS totalVentas
FROM 
    compras c
JOIN 
    compras_productos cp ON c.idCompra = cp.idCompra
JOIN 
    productos p ON cp.idProducto = p.idProducto
GROUP BY 
    c.idCliente;

```
### Calcular el precio promedio de los productos por categoría
```sql
SELECT AVG(p.precioVenta) as promedioPrecios, c.idCategoria, c.descripcion
FROM productos p
INNER JOIN categorias c ON p.idCategoria = c.idCategoria
GROUP BY c.idCategoria;
```
### Encontrar la fecha de la primera y última compra registrada
```sql
SELECT MIN(fecha) AS primera_compra, 
MAX(fecha) AS ultima_compra 
FROM compras;
```
### Calcular el total de ingresos por ventas
```sql
SELECT SUM(total) AS total_Ingresos FROM compras_productos;
```
### Contar la cantidad de compras realizadas por cada medio de pago
```sql
SELECT COUNT(idCompra) As cantidadCompra, 
medioPago 
FROM compras
GROUP BY medioPago;
```
### Calcular el total de productos vendidos por cada producto
```sql
SELECT SUM(c.cantidad) AS total_productos_vendidos, 
p.nombre
FROM compras_productos c
INNER JOIN productos p ON c.idProducto = p.idProducto
GROUP BY p.idProducto;
```
### Obtener el promedio de cantidad de productos comprados por compra
```sql
SELECT AVG(cantidad) AS promedio, 
idCompra
FROM compras_productos
GROUP BY idCompra;
```
### Encontrar los productos con el stock más bajo
```sql
SELECT
	MIN(cantidad_stock) AS stock_minimo
FROM productos;

```
### Calcular el total de productos comprados y el total gastado por cliente
```sql
SELECT 
    c.idCliente,
    SUM(cp.cantidad) AS totalProductosComprados,
    SUM(cp.cantidad * p.precioVenta) AS totalGastado
FROM 
    compras c
JOIN 
    compras_productos cp ON c.idCompra = cp.idCompra
JOIN 
    productos p ON cp.idProducto = p.idProducto
GROUP BY 
    c.idCliente;

```

# Consultas usando join

### Consultar todos los productos con sus categorías 
```sql
SELECT p.idProducto, 
    p.nombre, 
    p.idCategoria, 
    c.descripcion,
    c.estado,
    p.codigoBarras, 
    p.precioVenta, 
    p.stock, 
    p.estado
FROM productos p
INNER JOIN categorias c ON c.idCategoria = p.idCategoria;
```
### Consultar todas las compras y los clientes que las realizaron
```sql
SELECT 
    c.idCompra, 
    c.idCliente,
    cl.nombre,
    cl.apellidos,
    c.fecha, 
    c.medioPago, 
    c.comentario, 
    c.estado
FROM compras c
INNER JOIN clientes cl ON cl.idCliente = c.idCliente;
```
### Consultar los productos comprados en cada compra
```sql
SELECT 
    c.idCompra, 
    c.idProducto, 
    p.nombre, 
    p.idCategoria, 
    p.codigoBarras, 
    p.precioVenta, 
    p.stock, 
    p.estado,
    c.cantidad, 
    c.total, 
    c.estado
FROM compras_productos c
INNER JOIN productos p ON p.idProducto = c.idProducto;
```
### Consultar las compras realizadas por un cliente específico
```sql
SELECT 
    c.idCompra, 
    c.idCliente,
    cl.nombre,
    cl.apellidos,
    c.fecha, 
    c.medioPago, 
    c.comentario, 
    c.estado
FROM compras c
INNER JOIN clientes cl ON cl.idCliente = c.idCliente
WHERE cl.idCliente = 'C002';
```
### Consultar el total gastado por cada cliente
```sql
SELECT 
    cl.idCliente, 
    cl.nombre, 
    SUM(cp.cantidad * p.precioVenta) AS total_compras
FROM 
    clientes cl
INNER JOIN 
    compras c ON c.idCliente = cl.idCliente
INNER JOIN 
    compras_productos cp ON cp.idCompra = c.idCompra
INNER JOIN 
    productos p ON cp.idProducto = p.idProducto
GROUP BY 
    cl.idCliente, cl.nombre;

```
### Consultar el stock disponible de productos y su categoría
```sql
SELECT P.idProducto, 
    P.nombre, 
    P.idCategoria, 
    c.descripcion, 
    P.stock
FROM productos P
INNER JOIN categorias c ON c.idCategoria = P.idCategoria;
```
### Consultar los detalles de compras junto con la información del cliente y el producto
```sql
SELECT 
    c.idCompra, 
    c.idCliente, 
    cl.nombre, 
    cl.apellidos,
    c.fecha, 
    c.medioPago,
    p.nombre, 
    p.idCategoria, 
    p.codigoBarras, 
    p.precioVenta,
    cp.cantidad,
    cp.total
FROM compras_productos cp
INNER JOIN compras c ON cp.idCompra = c.idCompra
INNER JOIN clientes cl ON c.idCliente = cl.idCliente
INNER JOIN productos p ON cp.idProducto = p.idProducto;


```
### Consultar los productos que han sido comprados por más de una cantidad específica
```sql
SELECT 
    p.idProducto, 
    p.nombre, 
    p.idCategoria, 
    p.codigoBarras, 
    p.precioVenta, 
    p.stock, 
    p.estado
FROM productos p
INNER JOIN compras_productos cp ON p.idProducto = cp.idProducto
WHERE cp.cantidad = 1;

```
### Consultar la cantidad total de productos vendidos por categoría
```sql
SELECT SUM(cp.cantidad) AS cantidad_productos_vendidos , 
    c.idCategoria, 
    c.descripcion
FROM 
    compras_productos cp
INNER JOIN productos p ON cp.idProducto = p.idProducto
INNER JOIN categorias c ON p.idCategoria = c.idCategoria
GROUP BY c.idCategoria;
```
### Consultar los clientes que han realizado compras en un rango de fechas específico
```sql
SELECT 
    cl.idCliente,
    cl.nombre,
    cl.apellidos,
    cl.correo
FROM clientes cl
INNER JOIN compras c ON c.idCliente = cl.idCliente
WHERE c.fecha BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY  cl.idCliente, cl.nombre, cl.apellidos, cl.correo;

```
### Consultar el total gastado por cada cliente junto con la cantidad total de productos comprados
```sql


```
### Consultar los productos que nunca han sido comprados
```sql
SELECT 
    p.idProducto,
    p.nombre,
    p.codigoBarras,
    p.precioVenta
FROM 
    productos p
LEFT JOIN 
    compras_productos cp ON p.idProducto = cp.idProducto
WHERE 
    cp.idProducto IS NULL;

```
### Consultar los clientes que han realizado más de una compra y el total gastado por ellos
```sql
```
### Consultar los productos más vendidos por categoría
```sql
```
### Consultar las compras realizadas por clientes de una ciudad específica y el total gastado
```sql
```
### Consultar los proveedores que han suministrado productos y la cantidad total suministrada
```sql
```



Subconsultas
Consultar los productos que tienen un precio de venta superior al precio promedio de todos
los productos
Consultar los clientes que han gastado más del promedio general en sus compras
Consultar las categorías que tienen más de 5 productos
Consultar los productos más vendidos (top 5) por categoría
Consultar los clientes que han realizado compras en los últimos 30 días
Consultar las compras y sus productos para un cliente específico, mostrando solo las
compras más recientes
Consultar las categorías que tienen productos con un stock por debajo del promedio general
Consultar los productos que han sido comprados por todos los clientes
Consultar las compras que tienen más productos que el promedio de productos por compra
Consultar los productos que se han vendido menos de la cantidad promedio de productos
vendidos