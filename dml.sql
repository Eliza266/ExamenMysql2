
CREATE DATABASE miscompras;
USE miscompras;

CREATE TABLE clientes(
    idCliente VARCHAR(20),
    nombre  VARCHAR(40),
    apellidos VARCHAR(100),
    celular DECIMAL(10,0),
    direccion VARCHAR(80),
    correo VARCHAR(70),
    CONSTRAINT pk_idCliente PRIMARY KEY (idCliente)
);

CREATE TABLE categorias(
    idCategoria int,
    decripcion VARCHAR(45),
    estado TINYINT,
    CONSTRAINT pk_idCategoria PRIMARY KEY (idCategoria)
);

CREATE TABLE compras(
    idCompra int,
    idCliente VARCHAR(20),
    fecha DATE,
    medioPago CHAR(1),
    comentario VARCHAR(0),
    estado CHAR(1),
    CONSTRAINT pk_idCompra PRIMARY KEY (idCompra),
    CONSTRAINT fk_idCliente_clientes FOREIGN KEY (idCliente) REFERENCES clientes(idCliente)
);

CREATE TABLE productos(
    idProducto int,
    nombre VARCHAR(45),
    idCategoria int,
    codigoBarras VARCHAR(150),
    precioVenta DECIMAL(16,2),
    stock int,
    estado TINYINT,

    CONSTRAINT pk_idProducto PRIMARY KEY (idProducto),
    CONSTRAINT fk_idCategoria_categorias FOREIGN KEY (idCategoria) REFERENCES categorias(idCategoria)
);

CREATE TABLE compras_productos(
    idCompra  int,
    idProducto int,
    cantidad int,
    total DECIMAL(16,2),
    estado TINYINT,
    CONSTRAINT fk_idCompra_compras FOREIGN KEY (idCompra) REFERENCES compras(idCompra),
    CONSTRAINT fk_idProducto_Productos FOREIGN KEY (idProducto) REFERENCES productos(idProducto)
);

