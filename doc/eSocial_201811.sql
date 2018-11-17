

/*------ SYSDBA 16/11/2018 19:14:09 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 5, column 1.
where.

*/

/*------ SYSDBA 16/11/2018 19:17:12 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 3, column 81.
00000000000.

*/

/*------ SYSDBA 16/11/2018 19:17:18 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
P.PIS_PASEP.
At line 3, column 62.

*/

/*------ SYSDBA 16/11/2018 19:27:27 --------*/

/*!!! Error occured !!!
An error was found in the application program input parameters for the SQL statement.
Dynamic SQL Error.
SQL error code = -804.
Function unknown.
COALESCEE.

*/


/*------ SYSDBA 16/11/2018 19:45:23 --------*/

CREATE TABLE ESOCIAL_CATEGORIA_TRAB (
    CODIGO "CHAR(3)" NOT NULL,
    DESCRICAO "VARCHAR(250)");

ALTER TABLE ESOCIAL_CATEGORIA_TRAB
ADD CONSTRAINT PK_ESOCIAL_CATEGORIA_TRAB
PRIMARY KEY (CODIGO);



/*------ 16/11/2018 19:51:55 --------*/

GRANT ALL ON ESOCIAL_CATEGORIA_TRAB TO "GERASYS.TI" WITH GRANT OPTION;

/*------ 16/11/2018 19:51:55 --------*/

GRANT ALL ON ESOCIAL_CATEGORIA_TRAB TO GERASYSTI WITH GRANT OPTION;

/*------ 16/11/2018 19:51:55 --------*/

GRANT ALL ON ESOCIAL_CATEGORIA_TRAB TO PUBLIC;

/*------ 16/11/2018 19:51:55 --------*/

GRANT ALL ON ESOCIAL_CATEGORIA_TRAB TO PUBLIC WITH GRANT OPTION;


/*------ SYSDBA 16/11/2018 19:55:28 --------*/

ALTER TABLE SERVIDOR
    ADD CATEGORIA_TRAB "CHAR(3)";

COMMENT ON COLUMN SERVIDOR.CATEGORIA_TRAB IS
'eSocial - Categoria do Trabalhador:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 01';




/*------ SYSDBA 16/11/2018 19:56:36 --------*/

ALTER TABLE SERVIDOR
ADD CONSTRAINT FK_SERVIDOR_CATTRAB
FOREIGN KEY (CATEGORIA_TRAB)
REFERENCES ESOCIAL_CATEGORIA_TRAB(CODIGO);




/*------ SYSDBA 16/11/2018 20:42:02 --------*/

ALTER TABLE ESOCIAL_LOG_EVENTO
    ADD CAMPO "VARCHAR(40)";

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.CAMPO IS
'Campo da tabela principal de origem dos dados';

alter table ESOCIAL_LOG_EVENTO
alter EVENTO position 1;

alter table ESOCIAL_LOG_EVENTO
alter OPERACAO position 2;

alter table ESOCIAL_LOG_EVENTO
alter ID position 3;

alter table ESOCIAL_LOG_EVENTO
alter TABELA position 4;

alter table ESOCIAL_LOG_EVENTO
alter CAMPO position 5;

alter table ESOCIAL_LOG_EVENTO
alter PROTOCOLO_ENVIO position 6;




/*------ SYSDBA 16/11/2018 20:45:59 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure set_esocial_log_evento (
    evento "VARCHAR(10)",
    tabela "VARCHAR(30)",
    campo "VARCHAR(30)",
    operacao esocial_operacao,
    id "BIGINT",
    protocolo "VARCHAR(30)")
as
begin
  if (exists(
    Select
      pr.id
    from ESOCIAL_RETORNO_PROTOCOLO pr
    where pr.numero = :protocolo
  )) then
  begin
    if (not exists(
      Select
        lg.tabela
      from ESOCIAL_LOG_EVENTO lg
      where lg.evento   = :evento
        and lg.operacao = :operacao
        and lg.id       = :id
    )) then
    begin
      Insert Into ESOCIAL_LOG_EVENTO (
          evento
        , operacao
        , id
        , tabela
        , campo
        , protocolo_envio
      ) values (
          :evento
        , :operacao
        , :id
        , :tabela
        , :campo
        , :protocolo
      );
    end
  end
end^

SET TERM ; ^




/*------ SYSDBA 16/11/2018 21:09:31 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure sp_esocial_log_evento (
    protocolo "VARCHAR(30)")
as
declare variable tabela "VARCHAR(40)";
declare variable campo "VARCHAR(40)";
declare variable id "VARCHAR(40)";
declare variable scriptupdate "VARCHAR(250)";
begin
  for
    Select
        lg.tabela
      , coalesce(lg.campo, 'ID')
      , cast(lg.id as "VARCHAR(40)")
    from ESOCIAL_LOG_EVENTO lg
    where lg.protocolo_envio = :protocolo
    Into
        tabela
      , campo
      , id
  do
  begin
    scriptUpdate = 'Update ' || :tabela || ' set TIPO_OPERACAO = ''P''  where ' || :campo || ' = ' || :id;
    execute statement :scriptUpdate;
  end 
end^

SET TERM ; ^



/*------ SYSDBA 16/11/2018 22:02:06 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 5, column 70.
and.

*/


/*------ SYSDBA 17/11/2018 19:02:47 --------*/

ALTER TABLE INICIALIZA_MES_SERVIDOR
    ADD TIPO_OPERACAO ESOCIAL_OPERACAO;

COMMENT ON COLUMN INICIALIZA_MES_SERVIDOR.TIPO_OPERACAO IS
'eSocial - Operacao do registro:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';




/*------ SYSDBA 17/11/2018 19:02:58 --------*/

UPDATE INICIALIZA_MES_SERVIDOR
SET TIPO_OPERACAO = 'I';




/*------ SYSDBA 17/11/2018 19:15:30 --------*/

ALTER TABLE ESOCIAL_LOG_EVENTO ALTER COLUMN CAMPO TYPE "VARCHAR(120)";




/*------ SYSDBA 17/11/2018 19:15:53 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure set_esocial_log_evento (
    evento "VARCHAR(10)",
    tabela "VARCHAR(30)",
    campo "VARCHAR(120)",
    operacao esocial_operacao,
    id "BIGINT",
    protocolo "VARCHAR(30)")
as
begin
  if (exists(
    Select
      pr.id
    from ESOCIAL_RETORNO_PROTOCOLO pr
    where pr.numero = :protocolo
  )) then
  begin
    if (not exists(
      Select
        lg.tabela
      from ESOCIAL_LOG_EVENTO lg
      where lg.evento   = :evento
        and lg.operacao = :operacao
        and lg.id       = :id
    )) then
    begin
      Insert Into ESOCIAL_LOG_EVENTO (
          evento
        , operacao
        , id
        , tabela
        , campo
        , protocolo_envio
      ) values (
          :evento
        , :operacao
        , :id
        , :tabela
        , :campo
        , :protocolo
      );
    end
  end
end^

SET TERM ; ^




/*------ SYSDBA 17/11/2018 19:16:17 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure sp_esocial_log_evento (
    protocolo "VARCHAR(30)")
as
declare variable tabela "VARCHAR(40)";
declare variable campo "VARCHAR(120)";
declare variable id "VARCHAR(40)";
declare variable scriptupdate "VARCHAR(250)";
begin
  for
    Select
        lg.tabela
      , coalesce(lg.campo, 'ID')
      , cast(lg.id as "VARCHAR(40)")
    from ESOCIAL_LOG_EVENTO lg
    where lg.protocolo_envio = :protocolo
    Into
        tabela
      , campo
      , id
  do
  begin
    scriptUpdate = 'Update ' || :tabela || ' set TIPO_OPERACAO = ''P''  where ' || :campo || ' = ' || :id;
    execute statement :scriptUpdate;
  end 
end^

SET TERM ; ^

