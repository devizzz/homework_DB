
-- insersion de datos

insert into Empleados(Nombre, Cedula, Codigo_empleado, Direccion, Telefono, Jefe_inmediato, Cargo) values('david alejandro cordoba', '1020453059', '001', 'cll luna calle sol', '3113605405', null, 'CEO');
insert into Empleados(Nombre, Cedula, Codigo_empleado, Direccion, Telefono, Jefe_inmediato, Cargo) values('juan esteban herrera', '1021433158', '002', 'cll luna calle sol', '3113605406', 1, 'CTO');
insert into Empleados(Nombre, Cedula, Codigo_empleado, Direccion, Telefono, Jefe_inmediato, Cargo) values('deisy johana quiroz', '1030154061', '003', 'cll luna calle sol', '3113605407', 1, 'CIO');
insert into Empleados(Nombre, Cedula, Codigo_empleado, Direccion, Telefono, Jefe_inmediato, Cargo) values('Manuel alvarez', '1030154067', '004', 'cll luna calle sol', '3113605408', 1, 'Mecanico');

insert into Centros_recibos(Id_CodigoPostal, Nombre, Direccion, telefono, Tipo_de_Centro) values(1015, 'Cede administrativa', 'cll luna calle sol', '5553245', 'terminales de carga');
insert into Centros_recibos(Id_CodigoPostal, Nombre, Direccion, telefono, Tipo_de_Centro) values(1015, 'Av. Ferrocarril', 'Cra. 57 No.49-91', '2314053', 'Convencional');
insert into Centros_recibos(Id_CodigoPostal, Nombre, Direccion, telefono, Tipo_de_Centro) values(1015, 'Palacio de Exposiciones', 'Calle 41 # 55 – 35', '2328814', 'Convencional');

insert into Empleados_por_Centros(Id_Centro, Id_empleado, Encargado, FechaRegistro, Estado) values(1, 1, 'Y', SYSDATE, 1);
insert into Empleados_por_Centros(Id_Centro, Id_empleado, Encargado, FechaRegistro, Estado) values(2, 2, 'Y', SYSDATE, 1);
insert into Empleados_por_Centros(Id_Centro, Id_empleado, Encargado, FechaRegistro, Estado) values(3, 3, 'Y', SYSDATE, 1);
insert into Empleados_por_Centros(Id_Centro, Id_empleado, Encargado, FechaRegistro, Estado) values(1, 4, 'N', SYSDATE, 1);

insert into Vehiculos(Placa, Marca, Modelo, Linea, Tipo_combustible, kilometraje, Id_Centro_recibo, capacidad) values('WLI367', 'Hyundai', '2018', 'i10 grand', 'Gasolina', 22532, 1, '1TON');
insert into Vehiculos(Placa, Marca, Modelo, Linea, Tipo_combustible, kilometraje, Id_Centro_recibo, capacidad) values('MOF948', 'VOLVO', '2019', 'V90', 'Disel', 15000, 2, '1TON');
insert into Vehiculos(Placa, Marca, Modelo, Linea, Tipo_combustible, kilometraje, Id_Centro_recibo, capacidad) values('SAR617', 'Renault', '2019', 'KANGOO', 'Electrico', 5000, 3, '1TON');

insert into Estados(Nombre) values('Realizado');
insert into Estados(Nombre) values('Pendiente');
insert into Estados(Nombre) values('A recibir');
insert into Estados(Nombre) values('En terminal origen');
insert into Estados(Nombre) values('En transporte');
insert into Estados(Nombre) values('En terminal destino');
insert into Estados(Nombre) values('En reparto');
insert into Estados(Nombre) values('Entregada');

insert into Mantenimientos(Fecha, Id_Vehiculo, Id_Estado, Id_Empleado, Kilometraje) values(SYSDATE, 6, 2, 4, 5000);

insert into Servicios(Nombre) values('Cambiar el aceite');
insert into Servicios(Nombre) values('Cambiar filtro de aceite');
insert into Servicios(Nombre) values('Cambiar filtro de aire');
insert into Servicios(Nombre) values('Revisar aire de llantas');
insert into Servicios(Nombre) values('Revisar banda de rodamiento');
insert into Servicios(Nombre) values('Revision de tensión de guayas');
insert into Servicios(Nombre) values('Revisar correa de motor');
insert into Servicios(Nombre) values('Verificar luces');
insert into Servicios(Nombre) values('Verificar tablero');
insert into Servicios(Nombre) values('Verificar liquido de frenos');
insert into Servicios(Nombre) values('Verificar carga de bateria');

insert into Detalles(Id_Servicio, Id_Mantenimiento, Id_Estado, Observaciones) values(1, 1, 1, 'Se realiza cambio de aceite');
insert into Detalles(Id_Servicio, Id_Mantenimiento, Id_Estado, Observaciones) values(2, 1, 1, 'Se realiza cambio filtro de aceite');
insert into Detalles(Id_Servicio, Id_Mantenimiento, Id_Estado, Observaciones) values(3, 1, 1, 'Se realiza cambio filtro de aire');
insert into Detalles(Id_Servicio, Id_Mantenimiento, Id_Estado, Observaciones) values(4, 1, 2, '');
insert into Detalles(Id_Servicio, Id_Mantenimiento, Id_Estado, Observaciones) values(5, 1, 2, '');
insert into Detalles(Id_Servicio, Id_Mantenimiento, Id_Estado, Observaciones) values(6, 1, 2, '');
insert into Detalles(Id_Servicio, Id_Mantenimiento, Id_Estado, Observaciones) values(7, 1, 2, '');
insert into Detalles(Id_Servicio, Id_Mantenimiento, Id_Estado, Observaciones) values(8, 1, 2, '');
insert into Detalles(Id_Servicio, Id_Mantenimiento, Id_Estado, Observaciones) values(9, 1, 2, '');
insert into Detalles(Id_Servicio, Id_Mantenimiento, Id_Estado, Observaciones) values(10, 1, 2, '');
insert into Detalles(Id_Servicio, Id_Mantenimiento, Id_Estado, Observaciones) values(11, 1, 2, '');
insert into Detalles(Id_Servicio, Id_Mantenimiento, Id_Estado, Observaciones) values(10, 1, 2, '');

insert into Clientes(Nombre, Cedula, Telefono, Direccion) values('David Alejandro Cordoba', '1020453059', '5554578', 'cll luna calle sol');
insert into Clientes(Nombre, Cedula, Telefono, Direccion) values('Juan esteban herrera', '1020453057', '5554577', 'cll sol calle luna');

insert into Guias(Peso_real, Ancho, Alto, Largo, Peso_Volumen, Tipo_Servicio, Fecha, Observaciones, Cantidad, Flete_fijo, Flete_variables, Otras_variables, Valor_Servicio, Id_Cliente) 
values(15.3, 13.5, 18.3, 20.7, 2045.574, 'carga aérea', SYSDATE, 'Empieza el proceso', 1, 12448.4, 25522.5, 22626.5, 52563.5, 1);

insert into Estados_Guias(Id_Estados, Id_Guia) values(3, 1);

insert into Ubicaciones_por_Guias(Id_Ubicacion, Id_Guia, OrigenDestino) values(1, 1, 'D');
insert into Ubicaciones_por_Guias(Id_Ubicacion, Id_Guia, OrigenDestino) values(2, 1, 'O');
