CREATE TABLE Departamentos (
  Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  Codigo_departamento varchar(255) not null,
  Nombre varchar2(255)
);
ALTER TABLE Departamentos ADD PRIMARY KEY (Id) ENABLE;

CREATE TABLE Municipios (
  Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  Codigo_Municipio varchar(255) not null,
  Nombre varchar(255) not null,
  Id_departamento number,
  constraint fk_Id_departamento foreign key (Id_departamento) references Departamentos(Id)
);
ALTER TABLE Municipios ADD PRIMARY KEY (Id) ENABLE;

CREATE TABLE Cod_postales_por_municipios (
  Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  Zona_postal varchar2(255) not null,
  Codigo_postal varchar2(255) not null,
  Id_Municipio number not null,
  constraint fk_Id_Municipio foreign key (Id_Municipio) references Municipios (Id)
);
ALTER TABLE Cod_postales_por_municipios ADD PRIMARY KEY (Id) ENABLE;

CREATE TABLE Empleados (
  Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  Nombre varchar2(255) not null,
  Cedula varchar2(15) not null,
  Codigo_empleado varchar2(255),
  Direccion varchar2(255) not null,
  Telefono varchar2(13) not null,
  Jefe_inmediato number,
  Cargo varchar2(255) not null
);
ALTER TABLE Empleados ADD PRIMARY KEY (Id) ENABLE;
ALTER TABLE Empleados ADD CONSTRAINT fk_Id_Empleado FOREIGN KEY (Jefe_inmediato) REFERENCES Empleados(Id) ENABLE;

CREATE TABLE Centros_recibos (
  Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  Id_CodigoPostal number not null,
  Nombre varchar2(255),
  Direccion varchar2(255),
  telefono varchar2(13),
  Tipo_de_Centro varchar2(255),
  constraint fk_Id_Postal_CentroRecibo foreign key (Id_CodigoPostal) references Cod_postales_por_municipios (Id)
);
ALTER TABLE Centros_recibos ADD PRIMARY KEY (Id) ENABLE;

CREATE TABLE Empleados_por_Centros (
  Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  Id_Centro number not null,
  Id_empleado number not null,
  Encargado char(1) check (Encargado in ( 'Y', 'N' )),
  FechaRegistro date not null,
  Estado number check (Estado in ( 1, 0 )),
  constraint fk_Id_Empleado_Centros foreign key (Id_empleado) references Empleados (Id),
  constraint fk_Id_Centro foreign key (Id_Centro) references Centros_recibos (Id)
);
ALTER TABLE Empleados_por_Centros ADD PRIMARY KEY (Id) ENABLE;

CREATE TABLE Vehiculos (
  Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  Placa varchar2(6),
  Marca varchar2(255),
  Modelo varchar2(255),
  Linea varchar2(255),
  Tipo_combustible varchar2(255),
  kilometraje number,
  capacidad  varchar2(10) not null,
  Id_Centro_recibo number not null,
  constraint fk_Id_Centro_recibo_vehiculo foreign key (Id_Centro_recibo) references Centros_recibos (Id)
);
ALTER TABLE Vehiculos ADD PRIMARY KEY (Id) ENABLE;

CREATE TABLE Estados (
  Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  Nombre varchar2(255)
);
ALTER TABLE Estados ADD PRIMARY KEY (Id) ENABLE;

CREATE TABLE Mantenimientos (
  Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  Fecha date not null,
  Id_Vehiculo number not null,
  Id_Estado number not null,
  Id_Empleado number not null,
  Kilometraje number not null,
  constraint fk_Id_Estado foreign key (Id_Estado) references Estados (Id),
  constraint fk_Id_Vehiculo foreign key (Id_Vehiculo) references Vehiculos (Id),
  constraint fk_Id_Empleado_Mantenimientos foreign key (Id_Empleado) references Empleados (Id)
);
ALTER TABLE Mantenimientos ADD PRIMARY KEY (Id) ENABLE;

CREATE TABLE Servicios (
  Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  Nombre varchar2(255) not null
);
ALTER TABLE Servicios ADD PRIMARY KEY (Id) ENABLE;

CREATE TABLE Plan_Mantenimientos(
    Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    Kilometraje number not null,
    Id_Servicio number not null,
    constraint fk_Id_Servicio_Plan_Mantenimientos foreign key (Id_Servicio) references Servicios (Id)
);
ALTER TABLE Plan_Mantenimientos ADD PRIMARY KEY (Id) ENABLE;

CREATE TABLE Detalles (
  Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  Id_Servicio number not null,
  Id_Mantenimiento number not null,
  Id_Estado number not null,
  Observaciones varchar2(255),
  constraint fk_Id_Servicio foreign key (Id_Servicio) references Servicios (Id),
  constraint fk_Id_Mantenimiento foreign key (Id_Mantenimiento) references Mantenimientos (Id),
  constraint fk_Id_Estado_Detalle foreign key (Id_Estado) references Estados (Id)
);
ALTER TABLE Detalles ADD PRIMARY KEY (Id) ENABLE;

--CREATE TABLE Tipos_Servicios (
--  Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
--  Nombre varchar2(255) not null
--);
--ALTER TABLE Tipos_Servicios ADD PRIMARY KEY (Id) ENABLE;

CREATE TABLE Clientes (
  Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  Nombre varchar2(255) not null,
  Cedula varchar2(15) not null,
  Telefono varchar2(13) not null,
  Direccion varchar2(100) not null
);
ALTER TABLE Clientes ADD PRIMARY KEY (Id) ENABLE;

CREATE TABLE Guias (
  Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  Peso_real double precision not null,
  Ancho double precision,
  Alto double precision,
  Largo double precision,
  Peso_Volumen double precision,
  Tipo_Servicio varchar(255) not null,
  Fecha date not null,
  Observaciones varchar2(255),
  Cantidad number not null,
  Flete_fijo decimal,
  Flete_variables decimal,
  Otras_variables decimal,
  Valor_Servicio decimal,
  Id_Cliente int not null,
  constraint fk_Id_Cliente foreign key (Id_Cliente) references Clientes (Id)
);
ALTER TABLE Guias ADD PRIMARY KEY (Id) ENABLE;
ALTER TABLE Guias ADD CONSTRAINT check_Tipo_Servicio
  CHECK (Tipo_Servicio IN ('carga aerea', 'mercancia', 'mensajeria', 'firma de documentos', 'radicacion de documentos'));

CREATE TABLE Estados_Guias (
  Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  Id_Estados number not null,
  Id_Guia number not null,
  constraint fk_Id_Estados foreign key (Id_Estados) references Estados (Id),
  constraint fk_Id_guia foreign key (Id_Guia) references Guias (Id)
);
ALTER TABLE Estados_Guias ADD PRIMARY KEY (Id) ENABLE;

--CREATE TABLE Ubicaciones (
--  Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
--  Id_Postal number not null,
--  Id_Cliente number not null,
--  constraint fk_Id_Postal foreign key (Id_Postal) references Cod_postales_por_municipios (Id),
--  constraint fk_Id_Cliente foreign key (Id_Cliente) references Clientes (Id)
--);
--ALTER TABLE Ubicaciones ADD PRIMARY KEY (Id) ENABLE;

CREATE TABLE Ubicaciones_por_Guias (
  Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  Id_Ubicacion number not null,
  Id_Guia number not null,
  OrigenDestino char(1) check (OrigenDestino in ( 'O', 'D' )),
  constraint fk_Id_Ubicacion foreign key (Id_Ubicacion) references Cod_postales_por_municipios (Id),
  constraint fk_Id_Guia1 foreign key (Id_Guia) references Guias (Id)
);
ALTER TABLE Ubicaciones_por_Guias ADD PRIMARY KEY (Id) ENABLE;

--CREATE TABLE Clientes_por_Guias (
--  Id number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
--  Id_Cliente number not null,
--  Id_Guia number not null,
--  constraint fk_Id_Guias_ClientesGuias foreign key (Id_Guia) references Guias (Id),
--  constraint fk_Id_Clientes_ClientesGuias foreign key (Id_Cliente) references Clientes (Id)
--);
--ALTER TABLE Clientes_por_Guias ADD PRIMARY KEY (Id) ENABLE;

