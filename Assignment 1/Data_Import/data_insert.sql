
-- insersion de datos

insert into Empleados(Nombre, Cedula, Codigo_empleado, Direccion, Telefono, Jefe_inmediato, Cargo) values('david alejandro cordoba', '1020453059', '001', 'cll luna calle sol', '3113605405', null, 'CEO');
insert into Empleados(Nombre, Cedula, Codigo_empleado, Direccion, Telefono, Jefe_inmediato, Cargo) values('juan esteban herrera', '1021433158', '002', 'cll luna calle sol', '3113605406', 1, 'CTO');
insert into Empleados(Nombre, Cedula, Codigo_empleado, Direccion, Telefono, Jefe_inmediato, Cargo) values('deisy johana quiroz', '1030154061', '003', 'cll luna calle sol', '3113605407', 1, 'CIO');
insert into Empleados(Nombre, Cedula, Codigo_empleado, Direccion, Telefono, Jefe_inmediato, Cargo) values('Manuel alvarez', '1030154067', '004', 'cll luna calle sol', '3113605408', 1, 'Mecanico');

insert into Centros_recibos(Id_CodigoPostal, Nombre, Direccion, telefono, Tipo_de_Centro) values(1015, 'Cede administrativa', 'cll luna calle sol', '5553245', 'terminales de carga');
insert into Centros_recibos(Id_CodigoPostal, Nombre, Direccion, telefono, Tipo_de_Centro) values(1015, 'Av. Ferrocarril', 'Cra. 57 No.49-91', '2314053', 'Convencional');
insert into Centros_recibos(Id_CodigoPostal, Nombre, Direccion, telefono, Tipo_de_Centro) values(1015, 'Palacio de Exposiciones', 'Calle 41 # 55 – 35', '2328814', 'Convencional');

insert into Empleados_por_Centros(Id_Centro, Id_empleado, Encargado, FechaRegistro, Estado) values(1, 1, 'Y', sysdate, 1);
insert into Empleados_por_Centros(Id_Centro, Id_empleado, Encargado, FechaRegistro, Estado) values(2, 2, 'Y', sysdate, 1);
insert into Empleados_por_Centros(Id_Centro, Id_empleado, Encargado, FechaRegistro, Estado) values(3, 3, 'Y', sysdate, 1);
insert into Empleados_por_Centros(Id_Centro, Id_empleado, Encargado, FechaRegistro, Estado) values(1, 4, 'N', sysdate, 1);

insert into Vehiculos(Placa, Marca, Modelo, Linea, Tipo_combustible, kilometraje, Id_Centro_recibo) values('WLI367', 'Hyundai', '2018', 'i10 grand', 'Gasolina', 22532, 1, '1TON');
insert into Vehiculos(Placa, Marca, Modelo, Linea, Tipo_combustible, kilometraje, Id_Centro_recibo) values('MOF948', 'VOLVO', '2019', 'V90', 'Disel', 15000, 2, '1TON');
insert into Vehiculos(Placa, Marca, Modelo, Linea, Tipo_combustible, kilometraje, Id_Centro_recibo) values('SAR617', 'Renault', '2019', 'KANGOO', 'Electrico', 5000, 3, '1TON');

insert into Estados(Nombre) values('Realizado');
insert into Estados(Nombre) values('Pendiente');
insert into Estados(Nombre) values('A recibir');
insert into Estados(Nombre) values('En terminal origen');
insert into Estados(Nombre) values('En transporte');
insert into Estados(Nombre) values('En terminal destino');
insert into Estados(Nombre) values('En reparto');
insert into Estados(Nombre) values('Entregada');

insert into Mantenimientos(Fecha, Id_Vehiculo, Id_Estado, Id_Empleado, Kilometraje) values(SYSDATE, 3, 2, 4, 5000);

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
insert into Servicios(Nombre) values('Estado de alternador y arranque');
insert into Servicios(Nombre) values('Desgaste de articulaciones y rotulas');
insert into Servicios(Nombre) values('estado del guardapolvos');
insert into Servicios(Nombre) values('Sistema de admisión, mangueras y tuberías');
insert into Servicios(Nombre) values('Revisión del nivel de los líquidos (Frenos, agua o refrigerante, aceite, líquido de motor, etc.');
insert into Servicios(Nombre) values('Realizar lavado del motor');
insert into Servicios(Nombre) values('Revisar tensión de freno de pie y de mano');
insert into Servicios(Nombre) values('Alineación, balanceo y rotación de las llantas para garantizar un desgaste parejo.');
insert into Servicios(Nombre) values('Inspección del sistema eléctrico.');
insert into Servicios(Nombre) values('Sustitución de las pastillas de frenos y de bandas traseras');
insert into Servicios(Nombre) values('Cambio de aceite de dirección, transmisión y caja de velocidades');
insert into Servicios(Nombre) values('Calibrar los frenos');
insert into Servicios(Nombre) values('Calibrar las llantas y rotarlas nuevamente');
insert into Servicios(Nombre) values('Engrasar los rodamientos de las llantas');
insert into Servicios(Nombre) values('mantenimiento y sondeo del radiador');
insert into Servicios(Nombre) values('sincronizar el motor de inyección o de carburador');
insert into Servicios(Nombre) values('Ajustar suspension');
insert into Servicios(Nombre) values('Alinear el vehículo');
insert into Servicios(Nombre) values('Sincronizar el motor');
insert into Servicios(Nombre) values('Cambiar las pastillas y el líquido de frenos, bujías de encendido, cables de alta y correas');
insert into Servicios(Nombre) values('Sustituir el líquido refrigerante, de radiador, aceite y su filtro.');
insert into Servicios(Nombre) values('Realizar peritaje especializado para prevención de fallas.');

-- 5000 kilometros
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (5000, 1);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (5000, 2);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (5000, 3);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (5000, 4);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (5000, 5);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (5000, 6);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (5000, 7);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (5000, 8);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (5000, 9);

-- 10000 kilometros
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (10000, 8);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (10000, 9);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (10000, 22);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (10000, 23);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (10000, 24);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (10000, 25);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (10000, 26);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (10000, 27);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (10000, 28);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (10000, 29);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (10000, 30);

-- 20000 kilometros
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (20000, 1);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (20000, 2);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (20000, 3);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (20000, 31);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (20000, 32);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (20000, 33);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (20000, 34);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (20000, 6);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (20000, 39);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (20000, 35);

-- 40000 kilometros
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (40000, 1);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (40000, 2);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (40000, 3);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (40000, 31);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (40000, 32);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (40000, 33);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (40000, 34);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (40000, 6);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (40000, 39);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (40000, 35);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (40000, 36);

-- 50000 kilometros
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (50000, 1);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (50000, 2);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (50000, 3);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (50000, 31);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (50000, 32);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (50000, 33);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (50000, 34);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (50000, 6);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (50000, 39);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (50000, 35);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (50000, 37);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (50000, 38);

-- 100000 kilometros
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (100000, 39);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (100000, 40);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (100000, 38);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (100000, 41);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (100000, 42);
insert into Plan_Mantenimientos(Kilometraje, Id_Servicio) values (100000, 43);

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

insert into Tipos_Servicios(Nombre) values('carga aérea');
insert into Tipos_Servicios(Nombre) values('mercancía');
insert into Tipos_Servicios(Nombre) values('mensajería');
insert into Tipos_Servicios(Nombre) values('firma de documentos');
insert into Tipos_Servicios(Nombre) values('radicación de documentos');

insert into Clientes(Nombre, Cedula, Telefono, Direccion) values('David Alejandro Cordoba', '1020453059', '5554578', 'cll luna calle sol');
insert into Clientes(Nombre, Cedula, Telefono, Direccion) values('Juan esteban herrera', '1020453057', '5554577', 'cll sol calle luna');

insert into Guias(Peso_real, Ancho, Alto, Largo, Peso_Volumen, Tipo_Servicio, Fecha, Observaciones, Cantidad, Flete_fijo, Flete_variables, Otras_variables, Valor_Servicio) 
values(15.3, 13.5, 18.3, 20.7, 2045.574, 1, SYSDATE, 'Empieza el proceso', 1, 12448.4, 25522.5, 22626.5, 52563.5);

insert into Estados_Guias(Id_Estados, Id_Guia) values(3, 1);

insert into Ubicaciones(Id_Postal, Id_Cliente) values(1015, 1);
insert into Ubicaciones(Id_Postal, Id_Cliente) values(2830, 2);

insert into Ubicaciones_por_Guias(Id_Ubicacion, Id_Guia, OrigenDestino) values(1, 1, 'D');
insert into Ubicaciones_por_Guias(Id_Ubicacion, Id_Guia, OrigenDestino) values(2, 1, 'O');

insert into Clientes_por_Guias(Id_Cliente, Id_Guia) values(1, 1);
insert into Clientes_por_Guias(Id_Cliente, Id_Guia) values(2, 1);
