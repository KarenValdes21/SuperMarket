CREATE TABLE Producto (
   id SERIAL PRIMARY KEY,
   ProductoID VARCHAR(30),
   NombreProducto VARCHAR(255),
   idUsuarioCrea INT,
   idUsuarioModifica INT DEFAULT NULL,
   fechaCrea TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   fechaModifica TIMESTAMP DEFAULT NULL,
   estatus BOOLEAN DEFAULT TRUE
);
alter table producto
add column idSubcategoria int

CREATE TABLE Categoria (
   id SERIAL PRIMARY KEY,
   Categoria VARCHAR(255),
   idsubcategoria INT,
   idUsuarioCrea INT,
   idUsuarioModifica INT DEFAULT NULL,
   fechaCrea TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   fechaModifica TIMESTAMP DEFAULT NULL,
   estatus BOOLEAN DEFAULT TRUE
);

CREATE TABLE Subcategoria (
   id SERIAL PRIMARY KEY,
   Subcategoria VARCHAR(40),
   idUsuarioCrea INT,
   idUsuarioModifica INT DEFAULT NULL,
   fechaCrea TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   fechaModifica TIMESTAMP DEFAULT NULL,
   estatus BOOLEAN DEFAULT TRUE,
   idCategoria INT
);


CREATE TABLE Cliente (
   id SERIAL PRIMARY KEY,
   ClienteID VARCHAR(30),
   idUsuarioCrea INT,
   idUsuarioModifica INT DEFAULT NULL,
   fechaCrea TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   fechaModifica TIMESTAMP DEFAULT NULL,
   estatus BOOLEAN DEFAULT TRUE,
   idSegmento INT
);
alter table Cliente
add column idRegion Int

CREATE TABLE Segmento (
   id SERIAL PRIMARY KEY,
   Segmento VARCHAR(50),
   idUsuarioCrea INT,
   idUsuarioModifica INT DEFAULT NULL,
   fechaCrea TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   fechaModifica TIMESTAMP DEFAULT NULL,
   estatus BOOLEAN DEFAULT TRUE
);

CREATE TABLE Ciudad (
   id SERIAL PRIMARY KEY,
   Ciudad TEXT, -- Utilizo TEXT para permitir mayor longitud que VARCHAR(MAX)
   idUsuarioCrea INT,
   idUsuarioModifica INT DEFAULT NULL,
   fechaCrea TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   fechaModifica TIMESTAMP DEFAULT NULL,
   estatus BOOLEAN DEFAULT TRUE
);
ALTER TABLE Ciudad
ADD COLUMN idEstado INT;

ALTER TABLE Ciudad
ADD COLUMN idRegion INT;

CREATE TABLE Pais (
   id SERIAL PRIMARY KEY,
   Pais TEXT,
   idUsuarioCrea INT,
   idUsuarioModifica INT DEFAULT NULL,
   fechaCrea TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   fechaModifica TIMESTAMP DEFAULT NULL,
   estatus BOOLEAN DEFAULT TRUE
);

CREATE TABLE Estado (
   id SERIAL PRIMARY KEY,
   Estado TEXT,
   idUsuarioCrea INT,
   idUsuarioModifica INT DEFAULT NULL,
   fechaCrea TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   fechaModifica TIMESTAMP DEFAULT NULL,
   estatus BOOLEAN DEFAULT TRUE,
   idPais INT
);
CREATE TABLE Region (
   id SERIAL PRIMARY KEY,
   Region TEXT,
   idUsuarioCrea INT,
   idUsuarioModifica INT DEFAULT NULL,
   fechaCrea TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   fechaModifica TIMESTAMP DEFAULT NULL,
   estatus BOOLEAN DEFAULT TRUE
);
alter table Region
add idCiudad int

CREATE TABLE Pedido (
   id SERIAL PRIMARY KEY,
   PedidoID VARCHAR(30),
   OrdenFecha VARCHAR(30),
   EnvioFecha VARCHAR(30),
   ModoEnvio VARCHAR(30),
   Precio VARCHAR(30),
   Cantidad VARCHAR(30),
   Descuento VARCHAR(30),
   Ganancia VARCHAR(30),
   idUsuarioCrea INT,
   idCliente INT,
   idProducto INT,
   idUsuarioModifica INT DEFAULT NULL,
   fechaCrea TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   fechaModifica TIMESTAMP DEFAULT NULL,
   estatus BOOLEAN DEFAULT TRUE
);
CREATE TABLE Usuario (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    contraseña VARCHAR(50),
    estatus BOOLEAN DEFAULT TRUE
);


-- Relación entre Pedido y Cliente
ALTER TABLE Pedido
ADD CONSTRAINT fk_cliente
FOREIGN KEY (idCliente) 
REFERENCES Cliente(id);

-- Relación entre Pedido y Producto
ALTER TABLE Pedido
ADD CONSTRAINT fk_producto
FOREIGN KEY (idProducto) 
REFERENCES Producto(id);

-- Relación entre Estado y País
ALTER TABLE Estado
ADD CONSTRAINT fk_estado_pais
FOREIGN KEY (idPais) 
REFERENCES Pais(id);

-- Relación entre Ciudad y Estado
ALTER TABLE Ciudad
ADD CONSTRAINT fk_ciudad_estado
FOREIGN KEY (idEstado) 
REFERENCES Estado(id);

-- Relación entre Ciudad y Región
ALTER TABLE Ciudad
ADD CONSTRAINT fk_ciudad_region
FOREIGN KEY (idRegion) 
REFERENCES Region(id);

-- Eliminar la restricción de clave foránea en la tabla Ciudad
ALTER TABLE Ciudad
DROP CONSTRAINT fk_ciudad_region;

-- Agregar una nueva restricción de clave foránea en la tabla Region
ALTER TABLE Region
ADD CONSTRAINT fk_region_ciudad
FOREIGN KEY (idCiudad) 
REFERENCES Ciudad(id);


-- Relación entre Cliente y Región
ALTER TABLE Cliente
ADD CONSTRAINT fk_cliente_region
FOREIGN KEY (idRegion) 
REFERENCES Region(id);

-- Relación entre Producto y Subcategoria
ALTER TABLE Producto
ADD CONSTRAINT fk_subcategoria
FOREIGN KEY (idSubcategoria) 
REFERENCES Subcategoria(id);

-- Relación entre Subcategoria y Categoria
ALTER TABLE Subcategoria
ADD CONSTRAINT fk_categoria
FOREIGN KEY (idCategoria) 
REFERENCES Categoria(id);

-- Relación entre Cliente y Segmento
ALTER TABLE Cliente
ADD CONSTRAINT fk_segmento
FOREIGN KEY (idSegmento) 
REFERENCES Segmento(id);

-- Conectar la tabla Cliente con la tabla Usuario
ALTER TABLE Cliente
ADD CONSTRAINT FK_ClienteUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id);

ALTER TABLE Cliente
ADD CONSTRAINT FK_ClienteUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id);

-- Conectar la tabla Pedido con la tabla Usuario
ALTER TABLE Pedido
ADD CONSTRAINT FK_PedidoUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id);

ALTER TABLE Pedido
ADD CONSTRAINT FK_PedidoUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id);

-- Conectar la tabla Producto con la tabla Usuario
ALTER TABLE Producto
ADD CONSTRAINT FK_ProductoUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id);

ALTER TABLE Producto
ADD CONSTRAINT FK_ProductoUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id);

-- Conectar la tabla Categoria con la tabla Usuario
ALTER TABLE Categoria
ADD CONSTRAINT FK_CategoriaUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id);

ALTER TABLE Categoria
ADD CONSTRAINT FK_CategoriaUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id);

-- Conectar la tabla Subcategoria con la tabla Usuario
ALTER TABLE Subcategoria
ADD CONSTRAINT FK_SubcategoriaUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id);

ALTER TABLE Subcategoria
ADD CONSTRAINT FK_SubcategoriaUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id);

-- Conectar la tabla Segmento con la tabla Usuario
ALTER TABLE Segmento
ADD CONSTRAINT FK_SegmentoUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id);

ALTER TABLE Segmento
ADD CONSTRAINT FK_SegmentoUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id);

-- Conectar la tabla Pais con la tabla Usuario
ALTER TABLE Pais
ADD CONSTRAINT FK_PaisUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id);

ALTER TABLE Pais
ADD CONSTRAINT FK_PaisUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id);

-- Conectar la tabla Ciudad con la tabla Usuario
ALTER TABLE Ciudad
ADD CONSTRAINT FK_CiudadUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id);

ALTER TABLE Ciudad
ADD CONSTRAINT FK_CiudadUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id);

-- Conectar la tabla Estado con la tabla Usuario
ALTER TABLE Estado
ADD CONSTRAINT FK_EstadoUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id);

ALTER TABLE Estado
ADD CONSTRAINT FK_EstadoUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id);

-- Conectar la tabla Region con la tabla Usuario
ALTER TABLE Region
ADD CONSTRAINT FK_RegionUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id);

ALTER TABLE Region
ADD CONSTRAINT FK_RegionUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id);

-- Índice en la tabla Usuario
CREATE INDEX IX_Usuario ON Usuario(id);

-- Índice en la tabla Pedido
CREATE INDEX IX_Pedido ON Pedido(id);

-- Índice en la tabla Cliente
CREATE INDEX IX_Cliente ON Cliente(id);

-- Índice en la tabla Producto
CREATE INDEX IX_Producto ON Producto(id);

-- Índice en la tabla Categoria
CREATE INDEX IX_Categoria ON Categoria(id);

-- Índice en la tabla Subcategoria
CREATE INDEX IX_Subcategoria ON Subcategoria(id);

-- Índice en la tabla Segmento
CREATE INDEX IX_Segmento ON Segmento(id);

-- Índice en la tabla Region
CREATE INDEX IX_Region ON Region(id);

-- Índice en la tabla Ciudad
CREATE INDEX IX_Ciudad ON Ciudad(id);

-- Índice en la tabla Estado
CREATE INDEX IX_Estado ON Estado(id);

-- Índice en la tabla Pais
CREATE INDEX IX_Pais ON Pais(id);

INSERT INTO usuario (nombre, username, contraseña)
VALUES ('Admin', 'admin', crypt('admin', gen_salt('sha1')));

