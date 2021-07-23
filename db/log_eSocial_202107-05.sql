/*------ GERASYS.TI 15/07/2021 18:27:30 --------*/

ALTER TABLE CONFIG_ESOCIAL
    ADD ID_EVENTO "VARCHAR(40)";

COMMENT ON COLUMN CONFIG_ESOCIAL.ID_EVENTO IS
'eSocial - ID atual do registro no portal eSocial (Evento S1000)';




/*------ GERASYS.TI 15/07/2021 18:28:10 --------*/

CREATE INDEX IDX_CONFIG_ESOCIAL_IDEVENTO
ON CONFIG_ESOCIAL (ID_EVENTO);



/*------ 15/07/2021 18:29:15 --------*/

ALTER TABLE UNID_GESTORA
    ADD ID_EVENTO "VARCHAR(40)";

/*------ 15/07/2021 18:29:15 --------*/

COMMENT ON COLUMN UNID_GESTORA.ID_EVENTO IS
'eSocial - ID atual do registro no portal eSocial (Evento S1005)';

/*------ 15/07/2021 18:29:15 --------*/

CREATE INDEX IDX_UNID_GESTORA_IDEVENTO
ON UNID_GESTORA (ID_EVENTO);

/*------ 15/07/2021 18:31:18 --------*/

ALTER TABLE EVENTO
    ADD ID_EVENTO "VARCHAR(40)";

/*------ 15/07/2021 18:31:18 --------*/

COMMENT ON COLUMN EVENTO.ID_EVENTO IS
'eSocial - ID atual do registro no portal eSocial (Evento S1010)';

/*------ 15/07/2021 18:31:18 --------*/

CREATE INDEX IDX_EVENTO_IDEVENTO
ON EVENTO (ID_EVENTO);

/*------ 15/07/2021 18:32:01 --------*/

ALTER TABLE CONFIG_ORGAO
    ADD ID_EVENTO "VARCHAR(40)";

/*------ 15/07/2021 18:32:01 --------*/

COMMENT ON COLUMN CONFIG_ORGAO.ID_EVENTO IS
'eSocial - ID atual do registro no portal eSocial (Evento S1020)';

/*------ 15/07/2021 18:32:01 --------*/

CREATE INDEX IDX_CONFIG_ORGAO_IDEVENTO
ON CONFIG_ORGAO (ID_EVENTO);



/*------ GERASYS.TI 23/07/2021 15:56:09 --------*/

COMMENT ON PROCEDURE SET_ESOCIAL_LOG_EVENTO IS 'Procedure SET Log Eventos x Protocolo

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Stored procedure responsavel por gravar os registros de associacao dos dados
de origem dos eventos e os protocolos de retorno.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    23/07/2021 - IMR :
        * Adicao do parametro ID_EVENTO que corresponde a identificacao do registro
          gerado/processado em arquivo XML.

    16/09/2018 - IMR :
        + Criacao da store procedure na base de dados.';




/*------ GERASYS.TI 23/07/2021 15:58:53 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_ESOCIAL_LOG_EVENTO (
    EVENTO "VARCHAR(10)",
    TABELA "VARCHAR(30)",
    CAMPO "VARCHAR(120)",
    VALORES "VARCHAR(100)",
    OPERACAO ESOCIAL_OPERACAO,
    ID "BIGINT",
    PROTOCOLO "VARCHAR(30)",
    ID_EVENTO "VARCHAR(40)")
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
        and lg.protocolo_envio = :protocolo
    )) then
    begin
      Insert Into ESOCIAL_LOG_EVENTO (
          evento
        , operacao
        , id
        , tabela
        , campo
        , valores
        , protocolo_envio
        , id_evento
      ) values (
          :evento
        , :operacao
        , :id
        , :tabela
        , :campo
        , :valores
        , :protocolo
        , :id_evento
      );
    end
  end
end^

SET TERM ; ^




/*------ GERASYS.TI 23/07/2021 16:16:53 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_ESOCIAL_LOG_EVENTO (
    PROTOCOLO "VARCHAR(30)")
as
declare variable TABELA "VARCHAR(40)";
declare variable CAMPO "VARCHAR(120)";
declare variable VALORES "VARCHAR(100)";
declare variable ID "VARCHAR(40)";
declare variable ID_EVENTO "VARCHAR(40)";
declare variable POS_CAMPO integer;
declare variable POS_VALOR integer;
declare variable SCRIPTUPDATE "VARCHAR(250)";
begin
  for
    Select
        lg.tabela
      , coalesce(lg.campo, 'ID')
      , coalesce(lg.valores, '')
      , cast(lg.id as "VARCHAR(40)")
      , trim(coalesce(lg.id_evento, ''))
    from ESOCIAL_LOG_EVENTO lg
    where lg.protocolo_envio = :protocolo
    Into
        tabela
      , campo
      , valores
      , id
      , id_evento
  do
  begin
    if (position(';', :valores) = 0) then
    begin
      scriptUpdate = 'Update ' || :tabela || ' set TIPO_OPERACAO = ''P'', ID_EVENTO = ''' || :id_evento || '''  where ' || :campo || ' = ' || :id;
      execute statement :scriptUpdate;
    end
    else
    begin
      pos_campo = position(';', :campo);
      pos_valor = position(';', :valores);
      scriptUpdate = 'Update ' || :tabela || ' set TIPO_OPERACAO = ''P'', ID_EVENTO = ''' || :id_evento || '''  ' ||
        'where ' || substring(:campo from 1 for :pos_campo - 1)                   || ' = ' || substring(:valores from 1 for :pos_valor - 1) ||
        '  and ' || substring(:campo from :pos_campo + 1 for char_length(:campo)) || ' = ' || substring(:valores from :pos_valor + 1 for char_length(:valores));
      execute statement :scriptUpdate;
    end
  end 
end^

SET TERM ; ^




/*------ GERASYS.TI 23/07/2021 16:18:14 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_ESOCIAL_LOG_EVENTO (
    PROTOCOLO "VARCHAR(30)")
as
declare variable TABELA "VARCHAR(40)";
declare variable CAMPO "VARCHAR(120)";
declare variable VALORES "VARCHAR(100)";
declare variable ID "VARCHAR(40)";
declare variable ID_EVENTO "VARCHAR(40)";
declare variable POS_CAMPO integer;
declare variable POS_VALOR integer;
declare variable SCRIPTUPDATE "VARCHAR(250)";
begin
  for
    Select
        lg.tabela
      , coalesce(lg.campo, 'ID')
      , coalesce(lg.valores, '')
      , cast(lg.id as "VARCHAR(40)")
      , trim(coalesce(lg.id_evento, ''))
    from ESOCIAL_LOG_EVENTO lg
    where lg.protocolo_envio = :protocolo
    Into
        tabela
      , campo
      , valores
      , id
      , id_evento
  do
  begin
    if (position(';', :valores) = 0) then
    begin
      scriptUpdate = 'Update ' || :tabela || ' set TIPO_OPERACAO = ''P'', ID_EVENTO = ''' || :id_evento || '''  where ' || :campo || ' = ' || :id;
      execute statement :scriptUpdate;
    end
    else
    begin
      pos_campo = position(';', :campo);
      pos_valor = position(';', :valores);
      scriptUpdate = 'Update ' || :tabela || ' set TIPO_OPERACAO = ''P'', ID_EVENTO = ''' || :id_evento || '''  ' ||
        'where ' || substring(:campo from 1 for :pos_campo - 1)                   || ' = ' || substring(:valores from 1 for :pos_valor - 1) ||
        '  and ' || substring(:campo from :pos_campo + 1 for char_length(:campo)) || ' = ' || substring(:valores from :pos_valor + 1 for char_length(:valores));
      execute statement :scriptUpdate;
    end
  end 
end^

SET TERM ; ^

COMMENT ON PROCEDURE SP_ESOCIAL_LOG_EVENTO IS 'Procedure SP Log Eventos x Protocolo (Processar)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Stored procedure responsavel por processar os LOGs de envio dos eventos, evitando
assim que determinados dados enviados/processados pelo eSocial sejam novamente
enviados.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    23/07/2021 - IMR :
        * Inclusao do campo ID_EVENTO no processamento de retorno dos eventos
          enviados ao e-Social.

    16/09/2018 - IMR :
        + Criacao da store procedure na base de dados.';

