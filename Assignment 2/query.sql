
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


-- Vista punto 2
create or replace view plan_mantenimiento_detallado AS
    select p.Kilometraje, s.Nombre Item from Plan_Mantenimientos p
    inner join Servicios s on p.Id_Servicio = s.Id;
-- Ejecutamos la vista
select * from plan_mantenimiento_detallado where Kilometraje = 5000;




