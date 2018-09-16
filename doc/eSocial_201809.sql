

/*------ GERASYS.TI 15/09/2018 11:13:29 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 4, column 20.
(.

*/

/*------ GERASYS.TI 15/09/2018 12:15:33 --------*/

/*!!! Error occured !!!
Invalid data type, length, or value.
function RIGHT could not be matched.

*/

/*------ GERASYS.TI 15/09/2018 12:33:31 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
SR.ID_PESSOA_FISICA.
At line 26, column 44.

*/

/*------ GERASYS.TI 15/09/2018 17:47:53 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
S.ID_EST_FUNC.
At line 3, column 7.

*/

/*------ GERASYS.TI 15/09/2018 17:47:59 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
S.ID_ESTADO_FUNC.
At line 3, column 7.

*/

/*------ GERASYS.TI 15/09/2018 17:48:03 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
S.ID_ESTADO_FUNCIONAL.
At line 3, column 7.

*/


/*------ GERASYS.TI 16/09/2018 09:56:28 --------*/

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.ARQUIVO_ENVIADO IS
'Arquivo XML enviado (Colecao dos Eventos)';




/*------ GERASYS.TI 16/09/2018 10:43:31 --------*/

CREATE TABLE ESOCIAL_LOG_EVENTO (
    EVENTO "VARCHAR(10)" NOT NULL,
    OPERACAO ESOCIAL_OPERACAO NOT NULL,
    TABELA "VARCHAR(40)",
    ID "BIGINT" NOT NULL);

ALTER TABLE ESOCIAL_LOG_EVENTO
ADD CONSTRAINT PK_ESOCIAL_LOG_EVENTO
PRIMARY KEY (EVENTO,OPERACAO,ID);

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.EVENTO IS
'Evento';

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.OPERACAO IS
'Operacao do registro:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.TABELA IS
'Tabela principal de origem dos dados';

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.ID IS
'ID do registro na tabela principal de origem dos dados';




/*------ GERASYS.TI 16/09/2018 10:43:36 --------*/

alter table ESOCIAL_LOG_EVENTO
alter column EVENTO position 1;


/*------ GERASYS.TI 16/09/2018 10:43:36 --------*/

alter table ESOCIAL_LOG_EVENTO
alter column OPERACAO position 2;


/*------ GERASYS.TI 16/09/2018 10:43:36 --------*/

alter table ESOCIAL_LOG_EVENTO
alter column ID position 3;


/*------ GERASYS.TI 16/09/2018 10:43:36 --------*/

alter table ESOCIAL_LOG_EVENTO
alter column TABELA position 4;GRANT ALL ON ESOCIAL_LOG_EVENTO TO "PUBLIC";



/*------ GERASYS.TI 16/09/2018 10:44:09 --------*/

CREATE INDEX IDX_ESOCIAL_LOG_EVENTO_TAB
ON ESOCIAL_LOG_EVENTO (TABELA);




/*------ GERASYS.TI 16/09/2018 10:44:34 --------*/

CREATE INDEX IDX_ESOCIAL_LOG_EVENTO_ID
ON ESOCIAL_LOG_EVENTO (ID);




/*------ GERASYS.TI 16/09/2018 10:45:05 --------*/

CREATE INDEX IDX_ESOCIAL_LOG_EVENTO_TABID
ON ESOCIAL_LOG_EVENTO (TABELA,ID);




/*------ GERASYS.TI 16/09/2018 10:55:40 --------*/

ALTER TABLE ESOCIAL_LOG_EVENTO
    ADD PROTOCOLO_ENVIO "VARCHAR(30)" NOT NULL;

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.PROTOCOLO_ENVIO IS
'Numero do Protocolo de Envio de Evento';




/*------ GERASYS.TI 16/09/2018 10:56:10 --------*/

ALTER TABLE ESOCIAL_LOG_EVENTO
ADD CONSTRAINT FK_ESOCIAL_LOG_EVENTO_PROT
FOREIGN KEY (PROTOCOLO_ENVIO)
REFERENCES ESOCIAL_RETORNO_PROTOCOLO(NUMERO)
ON DELETE CASCADE;




/*------ GERASYS.TI 16/09/2018 10:58:01 --------*/

COMMENT ON TABLE ESOCIAL_RETORNO_PROTOCOLO IS 'Tabela Retorno Protocolo eSocial
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Tabela responsavel por armazenar os dados do protocolo de envio/recebimento dos
eventos do eSocial: Arquivos enviados, numero do protocolo retorno, ETC.';




/*------ GERASYS.TI 16/09/2018 11:00:09 --------*/

COMMENT ON TABLE ESOCIAL_LOG_EVENTO IS 'Tabela LOG Eventos eSocial
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Tabela responsavel por armazenar os dados iniciais (Tabela, ID e Operacao) usados
para compor os eventos enviados para o eSocial, associando cada um deles os protocolo
de retorno.';




/*------ GERASYS.TI 16/09/2018 12:00:09 --------*/

SET TERM ^ ;

create or alter procedure SET_ESOCIAL_LOG_EVENTO (
    EVENTO "VARCHAR(10)",
    TABELA "VARCHAR(30)",
    OPERACAO ESOCIAL_OPERACAO,
    ID "BIGINT",
    PROTOCOLO "VARCHAR(30)")
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
        , protocolo_envio
      ) values (
          :evento
        , :operacao
        , :id
        , :tabela
        , :protocolo
      );
    end
  end
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_ESOCIAL_LOG_EVENTO TO "PUBLIC";



/*------ GERASYS.TI 16/09/2018 12:02:28 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_ESOCIAL_LOG_EVENTO (
    EVENTO "VARCHAR(10)",
    TABELA "VARCHAR(30)",
    OPERACAO ESOCIAL_OPERACAO,
    ID "BIGINT",
    PROTOCOLO "VARCHAR(30)")
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
        , protocolo_envio
      ) values (
          :evento
        , :operacao
        , :id
        , :tabela
        , :protocolo
      );
    end
  end
end^

SET TERM ; ^

COMMENT ON PROCEDURE SET_ESOCIAL_LOG_EVENTO IS 'Procedure SET Log Eventos x Protocolo

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Stored procedure responsavel por gravar os registros de associacao dos dados
de origem dos eventos e os protocolos de retorno.';



/*------ GERASYS.TI 16/09/2018 12:29:22 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 23, column 95.
;.

*/


/*------ GERASYS.TI 16/09/2018 13:08:18 --------*/

SET TERM ^ ;

create or alter procedure SP_ESOCIAL_LOG_EVENTO (
  protocolo "VARCHAR(30)"
)
as
  declare variable tabela   "VARCHAR(40)";
  declare variable id       "VARCHAR(40)";
  declare variable operacao "CHAR(1)";
  declare variable scriptUpdate "VARCHAR(250)";
begin
  for
    Select
        lg.tabela
      , cast(lg.id as "VARCHAR(40)")
      , lg.operacao
    from ESOCIAL_LOG_EVENTO lg
    where lg.protocolo_envio = :protocolo
    Into
        tabela
      , id
      , operacao
  do
  begin
    scriptUpdate = 'Update ' || :tabela || ' set TIPO_OPERACAO = ''P''  where ID = ' || :id;
    execute statement :scriptUpdate;
  end 
end ^

SET TERM ; ^




/*------ GERASYS.TI 16/09/2018 13:08:38 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_ESOCIAL_LOG_EVENTO (
    PROTOCOLO "VARCHAR(30)")
as
declare variable TABELA "VARCHAR(40)";
declare variable ID "VARCHAR(40)";
declare variable SCRIPTUPDATE "VARCHAR(250)";
begin
  for
    Select
        lg.tabela
      , cast(lg.id as "VARCHAR(40)")
    from ESOCIAL_LOG_EVENTO lg
    where lg.protocolo_envio = :protocolo
    Into
        tabela
      , id
  do
  begin
    scriptUpdate = 'Update ' || :tabela || ' set TIPO_OPERACAO = ''P''  where ID = ' || :id;
    execute statement :scriptUpdate;
  end 
end ^

SET TERM ; ^




/*------ GERASYS.TI 16/09/2018 13:11:17 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_ESOCIAL_LOG_EVENTO (
    PROTOCOLO "VARCHAR(30)")
as
declare variable TABELA "VARCHAR(40)";
declare variable ID "VARCHAR(40)";
declare variable SCRIPTUPDATE "VARCHAR(250)";
begin
  for
    Select
        lg.tabela
      , cast(lg.id as "VARCHAR(40)")
    from ESOCIAL_LOG_EVENTO lg
    where lg.protocolo_envio = :protocolo
    Into
        tabela
      , id
  do
  begin
    scriptUpdate = 'Update ' || :tabela || ' set TIPO_OPERACAO = ''P''  where ID = ' || :id;
    execute statement :scriptUpdate;
  end 
end ^

SET TERM ; ^

COMMENT ON PROCEDURE SP_ESOCIAL_LOG_EVENTO IS 'Procedure SP Log Eventos x Protocolo (Processar)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Stored procedure responsavel por processar os LOGs de envio dos eventos, evitando
assim que determinados dados enviados/processados pelo eSocial sejam novamente
enviados.';

GRANT EXECUTE ON PROCEDURE SP_ESOCIAL_LOG_EVENTO TO "PUBLIC";
