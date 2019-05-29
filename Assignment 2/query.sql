
select * from CENTROS_RECIBOS order by ID;

select * from guias order by ID;

select * from ubicaciones_por_guias;

select * from estados_guias;

select * from clientes order by ID;

select * from vehiculos;

select * from Estados;

select * from Servicios order By ID;

select * from Mantenimientos;

select * from Plan_Mantenimientos;

select * from Clientes order by ID;


-- Vista punto 2
create or replace view plan_mantenimiento_detallado AS
    select p.Kilometraje, s.Nombre Item from Plan_Mantenimientos p
    inner join Servicios s on p.Id_Servicio = s.Id;
-- Ejecutamos la vista
select * from plan_mantenimiento_detallado where Kilometraje = 50000;

-- Punto 3
Create or replace procedure Programar_mantenimiento
(IdVehiculo in number)
IS
    Id_No_Valid EXCEPTION;
    kilometrajePlan number; kilometrajeVehiculo number; idEmpleado number; IdCentro number;
    IdMantenimiento number;
BEGIN
    -- validamos que el id vehiculo no sea menor o igual a cero
    IF IdVehiculo <= 0 THEN
        RAISE Id_No_Valid;
    END IF;    
    
    -- buscamos el kilometrake del mantenimiento mas proximo
    select a.kilometraje into kilometrajePlan from (select p.kilometraje from Vehiculos v, Plan_Mantenimientos p
    where p.kilometraje > v.kilometraje and v.id = IdVehiculo
    group by p.kilometraje
    order by p.kilometraje asc) a
    where ROWNUM <= 1;
    
    -- capturamos el kilometraje del vehiculo
    select kilometraje into kilometrajeVehiculo from Vehiculos where id = IdVehiculo;

    -- capturamos el centro de recibo
    select Id_Centro_Recibo into IdCentro from Vehiculos where id = IdVehiculo;
    
    -- validamos si el kilometraje del vehiculo le falta 200 km o menos para le proximo mantenimiento
    IF (kilometrajePlan - kilometrajeVehiculo) <= 200 THEN
        -- buscamos de forma aleatoria un empleado del cetro de recibo
        SELECT e.Id_Empleado into idEmpleado FROM ( SELECT Id_Empleado FROM  Empleados_por_Centros where Id_Centro = IdCentro ORDER BY DBMS_RANDOM.VALUE) e WHERE  rownum <= 1;
        -- insertamos el mantenimiento
        insert into Mantenimientos (FECHA, ID_VEHICULO, ID_ESTADO, ID_EMPLEADO, KILOMETRAJE, IDCENTRO) values (SYSDATE, IdVehiculo, 2, idEmpleado,kilometrajeVehiculo, IdCentro);
        -- Buscamos el id del mantenimiento insertado
        SELECT m.ID into IdMantenimiento FROM ( SELECT ID FROM  Mantenimientos ORDER BY ID desc) m WHERE  rownum <= 1;
        -- Insertamos los detalles
        insert into Detalles (ID_Servicio, Id_Mantenimiento, Id_Estado, Observaciones)
        select ID_Servicio, IdMantenimiento, 2, '' from Plan_Mantenimientos where kilometraje = kilometrajePlan;
        
        dbms_output.put_line('Se ha insertado');
    END IF;
    
EXCEPTION
    WHEN Id_No_Valid THEN
        dbms_output.put_line('Valor debe ser mayor a 0');
    WHEN no_data_found THEN 
        dbms_output.put_line('No se han encontrado resultados en alguna busqueda');
    WHEN others THEN
        dbms_output.put_line('Ha ocurrido un error.');
END Programar_mantenimiento;

begin
    Programar_mantenimiento (21);
end;

select * from vehiculos where id = 21;

update vehiculos set kilometraje = 19921 where id = 21;
select * from Mantenimientos;
select * from Detalles;
delete Mantenimientos;
delete detalles;




