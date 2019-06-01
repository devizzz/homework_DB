
-- Vista punto 2 ===============================================================================================================================================================================
create or replace view plan_mantenimiento_detallado AS
    select p.Kilometraje, s.Nombre Item from Plan_Mantenimientos p
    inner join Servicios s on p.Id_Servicio = s.Id;
-- Ejecutamos la vista
select * from plan_mantenimiento_detallado where Kilometraje = 50000;

-- Punto 3 =========================================================================================================================================================
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
    where p.kilometraje > v.kilometraje and v.id = 21
    group by p.kilometraje
    order by p.kilometraje asc) a
    where ROWNUM <= 1;
    dbms_output.put_line('lleo al sp valor: ' || IdVehiculo );
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
        dbms_output.put_line('Ha ocurrido un error: ' || SQLERRM);
END Programar_mantenimiento;

-- Corremos el sp
begin
    Programar_mantenimiento (21);
end;

-- Punto 4 ======================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_Vehiculos
    FOR UPDATE ON Vehiculos
    COMPOUND TRIGGER

    id NUMBER;

-- Se lanzará después de cada fila actualizada
AFTER EACH ROW IS
    BEGIN
        dbms_output.put_line('Se realizó la actualización');
        id := :new.id;
    END AFTER EACH ROW;
-- Se lanzará después de la sentencia
AFTER STATEMENT IS
    BEGIN
        dbms_output.put_line('Entro');
        Programar_mantenimiento (id);
    END AFTER STATEMENT;
END TR_Vehiculos;
-- validamos que funcione
select * from vehiculos where id = 21;
update vehiculos set kilometraje = 4850 where id = 21;
select * from Mantenimientos;
select * from Detalles;
delete detalles;
delete Mantenimientos;

-- PUNTO 5 ==================================================================================================================================
CREATE OR REPLACE PROCEDURE recalcular_tarifas
IS
BEGIN
    -- Borramos toda la tabla
    DELETE COTIZADOR_PRECIOS;
    -- Restablecemos el valo autonumerico de la tabla
    EXECUTE IMMEDIATE 'ALTER TABLE COTIZADOR_PRECIOS MODIFY(ID GENERATED AS IDENTITY (START WITH 1))';
    -- Insertamos los datos de cada centro de recibo por cada codigo postal
    FOR i in (select * from Centros_recibos) LOOP
        INSERT INTO COTIZADOR_PRECIOS (CENTRO_RECIBO_ID, DESTINO_ID, PRECIO_KILO)
        SELECT i.Id, Id, dbms_random.value(400,1500) from Cod_postales_por_municipios;
    END LOOP;
END recalcular_tarifas;
-- Probamos el SP recalcular_tarifas
begin
    recalcular_tarifas();
end;
SELECT * FROM COTIZADOR_PRECIOS ORDER BY ID;
-- Probamos el valor aletorio
begin
    dbms_output.put_line('este es el valor. ' || dbms_random.value(400,1500));
end;

-- Punto 6 =====================================================================================================================================
create or replace view precios AS
    select cp.*, m.Nombre Nombre_Destino from (select cp.centro_recibo_id, m.Nombre origen, cp.destino_id destino, cp.precio_kilo  from COTIZADOR_PRECIOS cp
    inner join centros_recibos cr on cp.centro_recibo_id = cr.Id
    inner join Cod_postales_por_municipios cpm on cr.id_codigopostal = cpm.Id
    inner join Municipios m on cpm.id_municipio = m.Id) cp
    inner join Cod_postales_por_municipios cpm on cp.destino = cpm.Id
    inner join Municipios m on cpm.id_municipio = m.Id;
-- Ejecutamos la vista
select * from precios where Origen = 'BARRANQUILLA';

-- Punto 7 ==============================================================================================================================
CREATE OR REPLACE PROCEDURE calcular_peso_volumetrico
IS
BEGIN
    update guias set Peso_Volumen = Ancho * Alto * Largo * 400;
END calcular_peso_volumetrico;

-- Punto 8 ==============================================================================================================================
create or replace function ReturnDecimal(peso_real IN number, peso_volumen IN number, centro_recibo_origen IN number, ciudad_destino IN VARCHAR2)
return DECIMAL IS Value_Return DECIMAL := 0;
Mayor number;
Municipio_Origen varchar2(50);
Precio_Kilo number;
-- Exceptions
peso_real_No_Valid EXCEPTION;
peso_volumen_No_Valid EXCEPTION;
centro_recibo_origen_No_Valid EXCEPTION;
ciudad_destino_No_Valid EXCEPTION;
begin
    -- Validamos que el Preso_Real se mayor a cero
    IF peso_real <= 0 THEN
        RAISE peso_real_No_Valid;
    END IF;  
    
    -- Validamos que el peso_volumen se mayor a cero
    IF peso_volumen <= 0 THEN
        RAISE peso_volumen_No_Valid;
    END IF;  
    
    -- Validamos que el centro_recibo_origen se mayor a cero
    IF centro_recibo_origen <= 0 THEN
        RAISE centro_recibo_origen_No_Valid;
    END IF; 
    
    -- Validamos que el ciudad_destino no sea vacío
    IF ciudad_destino = '' THEN
        RAISE ciudad_destino_No_Valid;
    END IF;  

    Mayor := peso_real;
    IF peso_volumen > mayor THEN
        Mayor := peso_volumen;
    END IF;
    
    -- Buscamos el nombre del municipio origen
    SELECT m.Nombre into Municipio_Origen FROM centros_recibos c
    INNER JOIN Cod_postales_por_municipios cp on c.id_codigopostal = cp.Id
    INNER JOIN Municipios m on cp.Id_Municipio = m.Id
    WHERE c.Id = centro_recibo_origen;
    
    DBMS_OUTPUT.PUT_LINE('Municipio origen: ' || Municipio_Origen);
    
    select p.precio_kilo into Precio_Kilo from precios p where p.Origen = Municipio_Origen and p.Nombre_Destino = ciudad_destino and centro_recibo_id = centro_recibo_origen and ROWNUM = 1;
   
    -- multiplicamos el precio por el peso que es la variable mayor
    Value_Return := Precio_Kilo * Mayor;
    
    RETURN Value_Return;
    
EXCEPTION
    WHEN peso_real_No_Valid THEN
        dbms_output.put_line('Peso real debe ser mayor a 0');
    WHEN peso_volumen_No_Valid THEN 
        dbms_output.put_line('peso volumen debe ser mayor a 0');
    WHEN centro_recibo_origen_No_Valid THEN 
        dbms_output.put_line('el centro de recibo origen debe ser mayor a 0');
    WHEN ciudad_destino_No_Valid THEN 
        dbms_output.put_line('la ciudad destino no debe ir en blanco.');
    WHEN no_data_found THEN 
        dbms_output.put_line('No se han encontrado resultados en alguna busqueda');
    WHEN others THEN
        dbms_output.put_line('Ha ocurrido un error: ' || SQLERRM);
END ReturnDecimal;

declare
resultado decimal := 0;
begin
    resultado := ReturnDecimal(315, 122464000, 79, 'CORINTO');
    DBMS_OUTPUT.PUT_LINE('El valor es: ' || resultado);
end;

-- Punto 9 ============================================================================================================================
CREATE OR REPLACE PROCEDURE calcular_fletes
IS
    Municipio_Destino varchar2(50);
BEGIN
    -- realizamos un loop donde recorremos todas las guias donde el valor_servicio sea cero
    for i in (select Id, Peso_real, Peso_Volumen, id_centro_origen, destino from guias where Valor_servicio = 0) loop
        -- buscamos el nombre del municipio del destino y lo llevamos a la variable municipio_destino
        select m.Nombre into Municipio_Destino from Cod_postales_por_municipios cpm
        inner join Municipios m on cpm.Id_Municipio = m.id
        where cpm.id = i.destino;
        
        -- seteamos el valor que retorna la vista ReturnDecimal al valor servicio
        DBMS_OUTPUT.PUT_LINE('i.Peso_real, i.Peso_Volumen, i.id_centro_origen, Municipio_Destino: ' || i.Peso_real || ' ' || i.Peso_Volumen || ' ' || i.id_centro_origen || ' ' || Municipio_Destino);
        update guias set Valor_servicio = ReturnDecimal(i.Peso_real, i.Peso_Volumen, i.id_centro_origen, Municipio_Destino)
        where id = i.id;
    end loop;
END calcular_fletes;

update guias set Valor_servicio = 0 where Id <= 10;
select Valor_servicio, otras_variables from guias order by id;
select * from guias order by id;
begin
    calcular_fletes();
end;

drop table Estados_Guias;
drop table Guias;

begin
    for i in (select id from guias) loop
        update guias set Id_Centro_Origen = (select id from (select id from Centros_recibos order by dbms_random.VALUE) where ROWNUM = 1)
        where id = i.id;
    end loop;
end;
--select * from precios p where p.Origen = 'CALI' and p.Nombre_Destino = 'CORINTO' and centro_recibo_id = 79; 