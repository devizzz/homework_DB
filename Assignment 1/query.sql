
-- Primer punto la imagen

-- Segundo punto
create tablespace coordinadora datafile
'coordinadora_datafile' size 3G;

--drop tablespace coordinadora INCLUDING CONTENTS AND DATAFILES;

--select * from dba_tablespaces;

-- validar como establecer este tablespace para ser usado en el sistema y el nombre del datafile
create undo tablespace coordinadora_undo datafile
'DATAFILE_UNDO' size 100M;

-- validar el nombre del datafile
create bigfile tablespace coordinadora_bigfile datafile
'DATAFILE_BIGFILE' size 4G;

-- alteramos la session esto es para SQL developer 18
alter session set "_ORACLE_SCRIPT"=true;

-- Tercer punto
-- Creamos el usuario amartinezg sin restricciones de espacio
create user amartinezg
identified by amartinezg
default tablespace coordinadora;

-- agregamos permisos de dba a amartinezg
GRANT DBA TO amartinezg;

-- Cuarto punto
CREATE PROFILE clerk LIMIT 
    PASSWORD_LIFE_TIME 40
    SESSIONS_PER_USER 1
    IDLE_TIME 15
    FAILED_LOGIN_ATTEMPTS 3;

CREATE PROFILE development LIMIT 
    PASSWORD_LIFE_TIME 100
    SESSIONS_PER_USER 2
    IDLE_TIME 30;
    
CREATE PROFILE operative LIMIT 
    PASSWORD_LIFE_TIME 30
    SESSIONS_PER_USER 1
    IDLE_TIME 5
    FAILED_LOGIN_ATTEMPTS 4
    PASSWORD_REUSE_MAX 3
    PASSWORD_REUSE_TIME 30;
    
-- Quinto punto
-- creamos y agregamos el usuario al perfil clerk y dams permiso para conectarse
create user david1
identified by david1
default tablespace coordinadora;
ALTER USER david1 profile clerk;
grant create session, connect to david1;

-- creamos y agregamos el usuario al perfil development y dams permiso para conectarse
create user david2
identified by david2
default tablespace coordinadora;
ALTER USER david2 profile development;
grant create session, connect to david2;

-- creamos y agregamos el usuario al perfil operative y dams permiso para conectarse
create user david3
identified by david3
default tablespace coordinadora;
ALTER USER david3 profile operative;
grant create session, connect to david3;

-- Bloqueamos el usuario david3 que es del perfil operative
ALTER USER david3 ACCOUNT LOCK;
