CREATE TABLE "Departamento" (
  "Id" numeric(9,0) primary key,
  "Codigo_departamento" numeric(9,0) not null,
  "Nombre" varchar2(250)
);

CREATE TABLE "Ciudad" (
  "Id" numeric(9,0) primary key not null,
  "Nombre" varchar(250),
  "Id_departamento" numeric(9,0),
  constraint fk_Id_departamento foreign key ("Id_departamento") references "Departamento"("Id")
);

CREATE TABLE "Codigo_postal" (
  "Id" numeric(9,0) primary key,  
  "Zona_postal" varchar2(250),
  "Codigo_postal" numeric(*,0)
);

CREATE TABLE "Cod_postal_por_ciudad" (
  "Id" numeric(9,0) primary key,
  "Id_Ciudad" numeric(9,0),
  "Id_Codigo_postal" numeric(9,0),
  constraint fk_Id_Ciudad foreign key ("Id_Ciudad") references "Ciudad" ("Id"),
  constraint fk_Id_Codigo_Postal foreign key ("Id_Codigo_postal") references "Codigo_postal"("Id")
);

CREATE TABLE "Empleados" (
  "Id" numeric(*,0) primary key,
  "Nombre" varchar2(250) not null,
  "Cedula" numeric(*,0) not null,
  "Codigo_empleado" numeric(9,0),
  "Direccion" varchar2(250) not null,
  "telefono" varchar2(250) not null,
  "Jefe_inmediato" varchar2(250) not null,
  "Cargo" varchar2(250) not null
);

CREATE TABLE "Centro_recibo" (
  "Id" numeric(9,0) primary key,  
  "Id_Ciudad" numeric(9,0),
  "Id_Empleado" numeric(*,0),
  "Nombre" varchar2(250),
  "Direccion" varchar2(250),
  "telefono" varchar2(250),
  "Tipo_de_Centro" varchar2(250),
  constraint fk_Id_Ciudad1 foreign key ("Id_Ciudad") references "Ciudad" ("Id"),
  constraint fk_Id_Empleado foreign key ("Id_Empleado") references "Empleados" ("Id")
);

CREATE TABLE "Empleado_por_Centro" (
  "Id" numeric(9,0) primary key,
  "Id_Centro" numeric(9,0),
  "Id_empleado" numeric(9,0),
  "Encargado" varchar2(250),
  constraint fk_Id_Empleado1 foreign key ("Id_empleado") references "Empleados" ("Id"),
  constraint fk_Id_Centro foreign key ("Id_Centro") references "Centro_recibo" ("Id")
);

CREATE TABLE "Vehiculos" (
  "Id" numeric(9,0) primary key,
  "Placa" varchar2(250),
  "Marca" varchar2(250),
  "Modelo" varchar2(250),
  "Linea" varchar2(250),
  "Tipo_combustible" varchar2(250),
  "kilometraje" varchar2(250),
  "Id_Centro_recibo" numeric(9,0),
  constraint fk_Id_Centro_recibo foreign key ("Id_Centro_recibo") references "Centro_recibo" ("Id")
);

CREATE TABLE "Mantenimientos" (
  "Id" numeric(9,0) primary key,
  "Fecha" date,
  "Id_Estado" numeric(9,0),
  "Id_Empleado" numeric(*,0),
  "Kilometraje" varchar2(250),
  constraint fk_Id_Estado foreign key ("Id_Estado") references "Estados" ("Id"),
  constraint fk_Id_Empleado2 foreign key ("Id_Empleado") references "Empleados" ("Id")
);

CREATE TABLE "Servicios" (
  "Id" numeric(9,0) primary key,
  "Nombre" varchar2(250)
);

CREATE TABLE "Estados" (
  "Id" numeric(9,0) primary key,
  "Nombre" varchar2(250)
);

CREATE TABLE "Detalles" (
  "Id" numeric(9,0) primary key,
  "Id_Servicio" numeric(9,0),
  "Id_Mantenimiento" numeric(9,0),
  "Id_Estado" numeric(9,0),
  "Observaciones" varchar2(250),
  constraint fk_Id_Servicio foreign key ("Id_Servicio") references "Servicios" ("Id"),
  constraint fk_Id_Mantenimiento foreign key ("Id_Mantenimiento") references "Mantenimientos" ("Id"),
  constraint fk_Id_Estado1 foreign key ("Id_Estado") references "Estados" ("Id")
);

CREATE TABLE "Tipo_Servicio" (
  "Id" numeric(9,0) primary key,
  "Nombre" varchar2(250)
);

CREATE TABLE "Clientes" (
  "Id" numeric(*,0) primary key,
  "Nombre" varchar2(250) not null,
  "Cedula" numeric(*,0),
  "Telefono" varchar2(250) not null,
  "Direccion" varchar2(250) not null
);

CREATE TABLE "Guia" (
  "Id" numeric(9,0) primary key,
  "Peso_ideal" varchar2(250),
  "Ancho" varchar2(250),
  "Alto" varchar2(250),
  "Largo" varchar2(250),
  "Peso_Volumen" varchar2(250),
  "Id_Tipo_Servicio" numeric(9,0),
  "Fecha" date,
  "Observaciones" varchar2(250),
  "Cantidad" varchar2(250),
  "Flete_fijo" varchar2(250),
  "Flete_variables" varchar2(250),
  "Otras_variables" varchar2(250),
  "Valor_Servicio" varchar2(250),
  constraint fk_Id_Tipo_Servicio foreign key ("Id_Tipo_Servicio") references "Servicios" ("Id")
);

CREATE TABLE "Estados_Guia" (
  "Id" numeric(9,0) primary key,
  "Id_Estados" numeric(9,0),
  "Id_Guia" numeric(9,0),
  constraint fk_Id_Estados foreign key ("Id_Estados") references "Estados" ("Id"),
  constraint fk_Id_guia foreign key ("Id_Guia") references "Guia" ("Id")
);

CREATE TABLE "Ubicaciones" (
  "Id" numeric(9,0) primary key,
  "Id_Postal" numeric(9,0),
  "Id_Cliente" numeric(9,0),
  constraint fk_Id_Postal foreign key ("Id_Postal") references "Cod_postal_por_ciudad" ("Id"),
  constraint fk_Id_Cliente foreign key ("Id_Cliente") references "Clientes" ("Id")
);

CREATE TABLE "Ubicaciones_por_Guia" (
  "Id" numeric(9,0) primary key,
  "Id_Ubicacion" numeric(9,0),
  "Id_Guia" numeric(9,0),
  "Origen_o_Destino" varchar2(250),
  constraint fk_Id_Ubicacion foreign key ("Id_Ubicacion") references "Ubicaciones" ("Id"),
  constraint fk_Id_Guia1 foreign key ("Id_Guia") references "Guia" ("Id")
);

CREATE TABLE "Cliente_por_Guia" (
  "Id" numeric(9,0) primary key,
  "Id_Cliente" numeric(9,0),
  "Id_Guia" numeric(9,0),
  constraint fk_Id_Guia2 foreign key ("Id_Guia") references "Guia" ("Id"),
  constraint fk_Id_Cliente1 foreign key ("Id_Cliente") references "Clientes" ("Id")
);

