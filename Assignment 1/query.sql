
create tablespace coordinadora datafile
'coordinadora_datafile' size 1G;

-- validar como establecer este tablespace para ser usado en el sistema y el nombre del datafile
--create undo tablespace coordinadora datafile
--'DATAFILE_UNDO' size 100M;

-- validar el nombre del datafile
create bigfile tablespace coordinadorabigfile datafile
'DATAFILE_BIGFILE' size 4G;

-- alteramos la session
alter session set "_ORACLE_SCRIPT"=true;

-- Creamos el usuario amartinezg
create user amartinezg
identified by amartinezg
default tablespace coordinadora;

-- agregamos permisos de dba a amartinezg
GRANT DBA TO amartinezg;

--preguntar si se agrega PASSWORD_GRACE_TIME o no
CREATE PROFILE clerk LIMIT 
    PASSWORD_LIFE_TIME 40
    SESSIONS_PER_USER 1
    IDLE_TIME 15
    FAILED_LOGIN_ATTEMPTS 3;

-- validar si FAILED_LOGIN_ATTEMPTS en 0 hace que no tenga ningun intento fallido por session
CREATE PROFILE development LIMIT 
    PASSWORD_LIFE_TIME 100
    SESSIONS_PER_USER 2
    IDLE_TIME 30
    FAILED_LOGIN_ATTEMPTS 0;
    
CREATE PROFILE operative LIMIT 
    PASSWORD_LIFE_TIME 30
    SESSIONS_PER_USER 1
    IDLE_TIME 5
    FAILED_LOGIN_ATTEMPTS 4
    PASSWORD_REUSE_MAX 3
    PASSWORD_REUSE_TIME 30;