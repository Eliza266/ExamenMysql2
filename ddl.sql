


INSERT INTO clientes( idCliente, nombre, apellidos, celular, direccion,correo) VALUES
('C001','JUAN', 'perez', 31565464,'asjskdjh','sdskdj@hola.com'),
('C002','pedro', 'peredz', 31565464,'asjdfdfdjh','sdskdj@hola.com'),
('C003','luis', 'perezs', 3156564,'asjskdjh','sdskdj@hola.com');


INSERT INTO categorias(idCategoria, decripcion, estado) VALUES
('C1','categoria c1', 1),
('C2','categoria c2', 2),
('C3','categoria c3', 3);

INSERT INTO compras(idCompra, idCliente, fecha, medioPago, comentario, estado) VALUES
(1, 'C001', '2024-05-20', 'E', 'JHSKJHKJSHKCHDKSCHKS', 2),
(2, 'C002', '2024-06-21', 'J', 'JHSKJHKJSHKCHDKSCHKS', 3),
(3, 'C003', '2024-06-12', 'A', 'JHSKJHKJSHKCHDKSCHKS', 1),
(4, 'C001', '2024-07-08', 'T', 'JHSKJHKJSHKCHDKSCHKS', 1);



INSERT INTO productos (idProducto,nombre ,idCategoria ,codigoBarras ,precioVenta, stock,estado )
(1, 'pan', 'C1', 'SKDFHSS454', 20, 10, 1),
(2, 'Queso', 'C2', 'SKDFHSS454', 30, 10, 1),
(3, 'arroz', 'C1', 'SKDFHSS454', 25, 10, 1),
(4, 'azucar', 'C3', 'SKDFHSS454', 10, 10, 1);

INSERT INTO compras_productos( idCompra, idProducto, cantidad, total, estado) VALUES
(1, 2, 5, 150, 1),
(1, 3, 2, 50, 2),
(2, 4 , 1, 10, 1),
(4, 1, 1, 20, 1 );


