/*------ SYSDBA 24/05/2019 14:28:43 --------*/

CREATE OR ALTER VIEW VW_TIPO_SUBTETO(
    CODIGO,
    DESCRICAO)
AS
Select '1' as Codigo, 'Executivo' as Descricao from rdb$database Union
Select '2' as Codigo, 'Judiciário' as Descricao from rdb$database Union
Select '3' as Codigo, 'Legislativo' as Descricao from rdb$database Union
Select '9' as Codigo, 'Todos os poderes' as Descricao from rdb$database
;



/*------ 24/05/2019 14:30:41 --------*/

GRANT ALL ON VW_TIPO_SUBTETO TO "GERASYS.TI" WITH GRANT OPTION;

/*------ 24/05/2019 14:30:41 --------*/

GRANT ALL ON VW_TIPO_SUBTETO TO PUBLIC;



/*------ 24/05/2019 14:57:03 --------*/

CREATE DOMAIN "BIGINT" AS
BIGINT;

/*------ 24/05/2019 14:57:03 --------*/

COMMENT ON DOMAIN "BIGINT" IS
'Inteiro Longo';

/*------ 24/05/2019 15:42:52 --------*/

CREATE GENERATOR GEN_ESOCIAL_PROTOCOLO_ID;

/*------ 24/05/2019 15:42:52 --------*/

CREATE TABLE ESOCIAL_RETORNO_PROTOCOLO (
    ID               "BIGINT" /* "BIGINT" = BIGINT */,
    NUMERO           "VARCHAR(30)" NOT NULL /* "VARCHAR(30)" = VARCHAR(30) */,
    INSCRICAO        "VARCHAR(20)" /* "VARCHAR(20)" = VARCHAR(20) */,
    DATA_HORA        "TIMESTAMP" /* "TIMESTAMP" = TIMESTAMP */,
    VERSAO           "VARCHAR(10)" /* "VARCHAR(10)" = VARCHAR(10) */,
    ARQUIVO_ENVIADO  BLOB_SUB_TYPE_0 /* BLOB_SUB_TYPE_0 = BLOB SUB_TYPE 0 SEGMENT SIZE 80 */,
    ARQUIVO_RETORNO  BLOB_SUB_TYPE_0 /* BLOB_SUB_TYPE_0 = BLOB SUB_TYPE 0 SEGMENT SIZE 80 */
);

/*------ 24/05/2019 15:42:52 --------*/

ALTER TABLE ESOCIAL_RETORNO_PROTOCOLO ADD CONSTRAINT UNQ_ESOCIAL_RETORNO_PROTOCOLO UNIQUE (ID);

/*------ 24/05/2019 15:42:52 --------*/

ALTER TABLE ESOCIAL_RETORNO_PROTOCOLO ADD CONSTRAINT PK_ESOCIAL_RETORNO_PROTOCOLO PRIMARY KEY (NUMERO);

/*------ 24/05/2019 15:42:52 --------*/

CREATE INDEX IDX_ESOCIAL_RETORNO_PROTOCOLO_1 ON ESOCIAL_RETORNO_PROTOCOLO (INSCRICAO);

/*------ 24/05/2019 15:42:52 --------*/

CREATE INDEX IDX_ESOCIAL_RETORNO_PROTOCOLO_2 ON ESOCIAL_RETORNO_PROTOCOLO (DATA_HORA);

/*------ 24/05/2019 15:42:52 --------*/

SET TERM ^ ;

CREATE OR ALTER TRIGGER TG_ESOCIAL_PROTOCOLO_ID FOR ESOCIAL_RETORNO_PROTOCOLO
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (coalesce(new.id, 0) < 1) then
    new.id = gen_id(GEN_ESOCIAL_PROTOCOLO_ID, 1);
end^

/*------ 24/05/2019 15:42:52 --------*/

SET TERM ; ^

COMMENT ON TABLE ESOCIAL_RETORNO_PROTOCOLO IS
'Tabela Retorno Protocolo eSocial
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Tabela responsavel por armazenar os dados do protocolo de envio/recebimento dos
eventos do eSocial: Arquivos enviados, numero do protocolo retorno, ETC.';

/*------ 24/05/2019 15:42:52 --------*/

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.ID IS
'ID';

/*------ 24/05/2019 15:42:52 --------*/

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.NUMERO IS
'Numero do Protocolo';

/*------ 24/05/2019 15:42:52 --------*/

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.INSCRICAO IS
'Inscricao (CNPJ do Empregador)';

/*------ 24/05/2019 15:42:52 --------*/

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.DATA_HORA IS
'Data/hora de recepcao';

/*------ 24/05/2019 15:42:52 --------*/

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.VERSAO IS
'Versao';

/*------ 24/05/2019 15:42:52 --------*/

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.ARQUIVO_ENVIADO IS
'Arquivo XML enviado (Colecao dos Eventos)';

/*------ 24/05/2019 15:42:52 --------*/

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.ARQUIVO_RETORNO IS
'Arquivo de retorno';

/*------ 24/05/2019 15:42:52 --------*/

GRANT ALL ON ESOCIAL_RETORNO_PROTOCOLO TO "GERASYS.TI" WITH GRANT OPTION;

/*------ 24/05/2019 15:42:52 --------*/

GRANT ALL ON ESOCIAL_RETORNO_PROTOCOLO TO GERASYSTI WITH GRANT OPTION;

/*------ 24/05/2019 15:42:52 --------*/

GRANT ALL ON ESOCIAL_RETORNO_PROTOCOLO TO PUBLIC;

/*------ 24/05/2019 15:42:52 --------*/

GRANT ALL ON ESOCIAL_RETORNO_PROTOCOLO TO PUBLIC WITH GRANT OPTION;



/*------ 24/05/2019 15:49:15 --------*/

CREATE TABLE ESOCIAL_EVENTO (
    EVENTO            "VARCHAR(10)" NOT NULL /* "VARCHAR(10)" = VARCHAR(10) */,
    COMPETENCIA       "CHAR(6)" NOT NULL /* "CHAR(6)" = CHAR(6) */,
    PRAZO_ENVIO       "DATE" /* "DATE" = DATE */,
    PROCESSADO        SIM_NAO /* SIM_NAO = CHAR(1) DEFAULT 'N' NOT NULL CHECK (Value in ('S', 'N')) */,
    ENVIADO           SIM_NAO /* SIM_NAO = CHAR(1) DEFAULT 'N' NOT NULL CHECK (Value in ('S', 'N')) */,
    PROCESSO_DATA     "DATE" /* "DATE" = DATE */,
    PROCESSO_USUARIO  "VARCHAR(20)" /* "VARCHAR(20)" = VARCHAR(20) */,
    PROCESSO_VALIDO   SIM_NAO /* SIM_NAO = CHAR(1) DEFAULT 'N' NOT NULL CHECK (Value in ('S', 'N')) */,
    PROTOCOLO_ENVIO   "VARCHAR(30)" /* "VARCHAR(30)" = VARCHAR(30) */
);

/*------ 24/05/2019 15:49:15 --------*/

ALTER TABLE ESOCIAL_EVENTO ADD CONSTRAINT PK_ESOCIAL_EVENTO PRIMARY KEY (EVENTO, COMPETENCIA);

/*------ 24/05/2019 15:49:15 --------*/

ALTER TABLE ESOCIAL_EVENTO ADD CONSTRAINT FK_ESOCIAL_EVENTO_PROTOCOLO FOREIGN KEY (PROTOCOLO_ENVIO) REFERENCES ESOCIAL_RETORNO_PROTOCOLO (NUMERO);

/*------ 24/05/2019 15:49:15 --------*/

CREATE INDEX IDX_ESOCIAL_EVENTO_ENVIO ON ESOCIAL_EVENTO (ENVIADO);

/*------ 24/05/2019 15:49:15 --------*/

CREATE INDEX IDX_ESOCIAL_EVENTO_PROCESS ON ESOCIAL_EVENTO (PROCESSADO);

/*------ 24/05/2019 15:49:15 --------*/

CREATE INDEX IDX_ESOCIAL_EVENTO_VALIDO ON ESOCIAL_EVENTO (PROCESSO_VALIDO);

/*------ 24/05/2019 15:49:15 --------*/

COMMENT ON TABLE ESOCIAL_EVENTO IS
'Tabela Eventos eSocial
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   25/11/2018

Tabela responsavel por armazenar os parametros e/ou dados de processamento de cada
evento do eSocial em suas devidas competencias. Dados como prazo de processamento
e as datas em que ocorreram sao encontradas nessa tabela.';

/*------ 24/05/2019 15:49:15 --------*/

COMMENT ON COLUMN ESOCIAL_EVENTO.EVENTO IS
'Evento.';

/*------ 24/05/2019 15:49:15 --------*/

COMMENT ON COLUMN ESOCIAL_EVENTO.COMPETENCIA IS
'Competencia (Formato : YYYYMM).';

/*------ 24/05/2019 15:49:15 --------*/

COMMENT ON COLUMN ESOCIAL_EVENTO.PRAZO_ENVIO IS
'Prazo limite para envio do evento.';

/*------ 24/05/2019 15:49:15 --------*/

COMMENT ON COLUMN ESOCIAL_EVENTO.PROCESSADO IS
'Evento processado:
N - Nao
S - Sim';

/*------ 24/05/2019 15:49:15 --------*/

COMMENT ON COLUMN ESOCIAL_EVENTO.ENVIADO IS
'Evento enviado:
N - Nao
S - Sim';

/*------ 24/05/2019 15:49:15 --------*/

COMMENT ON COLUMN ESOCIAL_EVENTO.PROCESSO_DATA IS
'Data do processamento.';

/*------ 24/05/2019 15:49:15 --------*/

COMMENT ON COLUMN ESOCIAL_EVENTO.PROCESSO_USUARIO IS
'Usuario responsavel pelo processamento.';

/*------ 24/05/2019 15:49:15 --------*/

COMMENT ON COLUMN ESOCIAL_EVENTO.PROCESSO_VALIDO IS
'Processamento validado (Processo sem erros retornados pelo eSocial - REGRA_VALIDA_FECHAMENTO_FOPAG)
N - Nao
S - Sim';

/*------ 24/05/2019 15:49:15 --------*/

COMMENT ON COLUMN ESOCIAL_EVENTO.PROTOCOLO_ENVIO IS
'Numero do Protocolo de retorno.';

/*------ 24/05/2019 15:49:15 --------*/

GRANT ALL ON ESOCIAL_EVENTO TO "GERASYS.TI" WITH GRANT OPTION;

/*------ 24/05/2019 15:49:15 --------*/

GRANT ALL ON ESOCIAL_EVENTO TO GERASYSTI WITH GRANT OPTION;

/*------ 24/05/2019 15:49:15 --------*/

GRANT ALL ON ESOCIAL_EVENTO TO PUBLIC WITH GRANT OPTION;

/*------ 24/05/2019 15:50:54 --------*/

SET TERM ^ ;

create or alter procedure set_esocial_evento (
    evento "VARCHAR(10)",
    competencia "CHAR(6)",
    processo_data "DATE",
    processo_usuario "VARCHAR(20)",
    processado sim_nao,
    enviado sim_nao,
    valido sim_nao,
    protocolo "VARCHAR(30)")
as
begin
  if (not exists(
    Select
      e.evento
    from ESOCIAL_EVENTO e
    where e.evento      = :evento
      and e.competencia = :competencia
  )) then
  begin
    Insert Into ESOCIAL_EVENTO (
        evento
      , competencia
      , prazo_envio
      , protocolo_envio
      , processo_data
      , processo_usuario
      , processo_valido
      , processado
      , enviado
    ) values (
        :evento
      , :competencia
      , null
      , :protocolo
      , :processo_data
      , :processo_usuario
      , :valido
      , :processado
      , :enviado
    );
  end
  else
  begin
    Update ESOCIAL_EVENTO e Set
        e.processado       = :processado
      , e.enviado          = :enviado
      , e.protocolo_envio  = :protocolo
      , e.processo_valido  = :valido
      , e.processo_data    = :processo_data
      , e.processo_usuario = :processo_usuario
    where e.evento      = :evento
      and e.competencia = :competencia;
  end 
end^

/*------ 24/05/2019 15:50:54 --------*/

SET TERM ; ^

GRANT SELECT,INSERT,UPDATE ON ESOCIAL_EVENTO TO PROCEDURE SET_ESOCIAL_EVENTO;

/*------ 24/05/2019 15:50:54 --------*/

GRANT EXECUTE ON PROCEDURE SET_ESOCIAL_EVENTO TO "GERASYS.TI";

/*------ 24/05/2019 15:50:54 --------*/

GRANT EXECUTE ON PROCEDURE SET_ESOCIAL_EVENTO TO GERASYSTI;

/*------ 24/05/2019 15:50:54 --------*/

GRANT EXECUTE ON PROCEDURE SET_ESOCIAL_EVENTO TO "PUBLIC";

/*------ 24/05/2019 15:50:54 --------*/

GRANT EXECUTE ON PROCEDURE SET_ESOCIAL_EVENTO TO SYSDBA;

/*------ 24/05/2019 15:53:20 --------*/

CREATE TABLE ESOCIAL_LOG_EVENTO (
    EVENTO           "VARCHAR(10)" NOT NULL /* "VARCHAR(10)" = VARCHAR(10) */,
    OPERACAO         ESOCIAL_OPERACAO NOT NULL /* ESOCIAL_OPERACAO = CHAR(1) DEFAULT 'I' NOT NULL CHECK (value in ('I', 'A', 'E', 'P')) */,
    PROTOCOLO_ENVIO  "VARCHAR(30)" NOT NULL /* "VARCHAR(30)" = VARCHAR(30) */,
    ID               "BIGINT" NOT NULL /* "BIGINT" = BIGINT */,
    TABELA           "VARCHAR(40)" /* "VARCHAR(40)" = VARCHAR(40) */,
    CAMPO            "VARCHAR(120)" /* "VARCHAR(120)" = VARCHAR(120) */,
    VALORES          "VARCHAR(100)" /* "VARCHAR(100)" = VARCHAR(100) */
);

/*------ 24/05/2019 15:53:20 --------*/

ALTER TABLE ESOCIAL_LOG_EVENTO ADD CONSTRAINT PK_ESOCIAL_LOG_EVENTO PRIMARY KEY (EVENTO, OPERACAO, ID, PROTOCOLO_ENVIO);

/*------ 24/05/2019 15:53:20 --------*/

ALTER TABLE ESOCIAL_LOG_EVENTO ADD CONSTRAINT FK_ESOCIAL_LOG_EVENTO_PROT FOREIGN KEY (PROTOCOLO_ENVIO) REFERENCES ESOCIAL_RETORNO_PROTOCOLO (NUMERO) ON DELETE CASCADE;

/*------ 24/05/2019 15:53:20 --------*/

CREATE INDEX IDX_ESOCIAL_LOG_EVENTO_ID ON ESOCIAL_LOG_EVENTO (ID);

/*------ 24/05/2019 15:53:20 --------*/

CREATE INDEX IDX_ESOCIAL_LOG_EVENTO_TAB ON ESOCIAL_LOG_EVENTO (TABELA);

/*------ 24/05/2019 15:53:20 --------*/

CREATE INDEX IDX_ESOCIAL_LOG_EVENTO_TABID ON ESOCIAL_LOG_EVENTO (TABELA, ID);

/*------ 24/05/2019 15:53:20 --------*/

COMMENT ON TABLE ESOCIAL_LOG_EVENTO IS
'Tabela LOG Eventos eSocial
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Tabela responsavel por armazenar os dados iniciais (Tabela, ID e Operacao) usados
para compor os eventos enviados para o eSocial, associando cada um deles os protocolo
de retorno.';

/*------ 24/05/2019 15:53:20 --------*/

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.EVENTO IS
'Evento';

/*------ 24/05/2019 15:53:20 --------*/

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.OPERACAO IS
'Operacao do registro:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';

/*------ 24/05/2019 15:53:20 --------*/

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.PROTOCOLO_ENVIO IS
'Numero do Protocolo de Envio de Evento';

/*------ 24/05/2019 15:53:20 --------*/

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.ID IS
'ID do registro na tabela principal de origem dos dados';

/*------ 24/05/2019 15:53:20 --------*/

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.TABELA IS
'Tabela principal de origem dos dados';

/*------ 24/05/2019 15:53:20 --------*/

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.CAMPO IS
'Campo da tabela principal de origem dos dados';

/*------ 24/05/2019 15:53:20 --------*/

GRANT ALL ON ESOCIAL_LOG_EVENTO TO "GERASYS.TI" WITH GRANT OPTION;

/*------ 24/05/2019 15:53:20 --------*/

GRANT ALL ON ESOCIAL_LOG_EVENTO TO GERASYSTI WITH GRANT OPTION;

/*------ 24/05/2019 15:53:20 --------*/

GRANT ALL ON ESOCIAL_LOG_EVENTO TO PUBLIC;

/*------ 24/05/2019 15:53:20 --------*/

GRANT ALL ON ESOCIAL_LOG_EVENTO TO PUBLIC WITH GRANT OPTION;

/*------ 24/05/2019 15:54:12 --------*/

SET TERM ^ ;

create or alter procedure set_esocial_log_evento (
    evento "VARCHAR(10)",
    tabela "VARCHAR(30)",
    campo "VARCHAR(120)",
    valores "VARCHAR(100)",
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
      ) values (
          :evento
        , :operacao
        , :id
        , :tabela
        , :campo
        , :valores
        , :protocolo
      );
    end
  end
end^

/*------ 24/05/2019 15:54:13 --------*/

SET TERM ; ^

COMMENT ON PROCEDURE SET_ESOCIAL_LOG_EVENTO IS
'Procedure SET Log Eventos x Protocolo

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Stored procedure responsavel por gravar os registros de associacao dos dados
de origem dos eventos e os protocolos de retorno.';

/*------ 24/05/2019 15:54:13 --------*/

GRANT SELECT ON ESOCIAL_RETORNO_PROTOCOLO TO PROCEDURE SET_ESOCIAL_LOG_EVENTO;

/*------ 24/05/2019 15:54:13 --------*/

GRANT SELECT,INSERT ON ESOCIAL_LOG_EVENTO TO PROCEDURE SET_ESOCIAL_LOG_EVENTO;

/*------ 24/05/2019 15:54:13 --------*/

GRANT EXECUTE ON PROCEDURE SET_ESOCIAL_LOG_EVENTO TO "GERASYS.TI";

/*------ 24/05/2019 15:54:13 --------*/

GRANT EXECUTE ON PROCEDURE SET_ESOCIAL_LOG_EVENTO TO "PUBLIC";


/*------ 24/05/2019 15:58:04 --------*/

CREATE DOMAIN "VARCHAR(250)" AS VARCHAR(250) CHARACTER SET WIN1252 COLLATE WIN1252;

/*------ 24/05/2019 15:59:01 --------*/

SET TERM ^ ;

create or alter procedure sp_esocial_log_evento (
    protocolo "VARCHAR(30)")
as
declare variable tabela "VARCHAR(40)";
declare variable campo "VARCHAR(120)";
declare variable valores "VARCHAR(100)";
declare variable id "VARCHAR(40)";
declare variable pos_campo integer;
declare variable pos_valor integer;
declare variable scriptupdate "VARCHAR(250)";
begin
  for
    Select
        lg.tabela
      , coalesce(lg.campo, 'ID')
      , coalesce(lg.valores, '')
      , cast(lg.id as "VARCHAR(40)")
    from ESOCIAL_LOG_EVENTO lg
    where lg.protocolo_envio = :protocolo
    Into
        tabela
      , campo
      , valores
      , id
  do
  begin
    if (position(';', :valores) = 0) then
    begin
      scriptUpdate = 'Update ' || :tabela || ' set TIPO_OPERACAO = ''P''  where ' || :campo || ' = ' || :id;
      execute statement :scriptUpdate;
    end
    else
    begin
      pos_campo = position(';', :campo);
      pos_valor = position(';', :valores);
      scriptUpdate = 'Update ' || :tabela || ' set TIPO_OPERACAO = ''P''  ' ||
        'where ' || substring(:campo from 1 for :pos_campo - 1)                   || ' = ' || substring(:valores from 1 for :pos_valor - 1) ||
        '  and ' || substring(:campo from :pos_campo + 1 for char_length(:campo)) || ' = ' || substring(:valores from :pos_valor + 1 for char_length(:valores));
      execute statement :scriptUpdate;
    end
  end 
end^

/*------ 24/05/2019 15:59:01 --------*/

SET TERM ; ^

COMMENT ON PROCEDURE SP_ESOCIAL_LOG_EVENTO IS
'Procedure SP Log Eventos x Protocolo (Processar)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Stored procedure responsavel por processar os LOGs de envio dos eventos, evitando
assim que determinados dados enviados/processados pelo eSocial sejam novamente
enviados.';

/*------ 24/05/2019 15:59:01 --------*/

GRANT SELECT ON ESOCIAL_LOG_EVENTO TO PROCEDURE SP_ESOCIAL_LOG_EVENTO;

/*------ 24/05/2019 15:59:01 --------*/

GRANT EXECUTE ON PROCEDURE SP_ESOCIAL_LOG_EVENTO TO "GERASYS.TI";

/*------ 24/05/2019 15:59:01 --------*/

GRANT EXECUTE ON PROCEDURE SP_ESOCIAL_LOG_EVENTO TO "PUBLIC";

/*------ 24/05/2019 17:55:44 --------*/

SET TERM ^ ;

CREATE trigger tg_config_orgao_esocial_oper for config_orgao
active before insert or update position 0
AS
begin
  if (inserting) then
    -- Inserir registro no eSocial
    new.tipo_operacao = 'I';
  else
  if (updating) then
  begin
    -- Atualizar registro no eSocial, caso sua insercao ou edicao anterior ja tenham sidos processados
    if (coalesce(old.tipo_operacao, 'P') = 'P') then
      new.tipo_operacao = 'A';
  end
end^

/*------ 24/05/2019 17:55:44 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE trigger tg_unid_gestora_esocial_oper for unid_gestora
active before insert or update position 0
AS
begin
  if (inserting) then
    -- Inserir registro no eSocial
    new.tipo_operacao = 'I';
  else
  if (updating) then
  begin
    -- Atualizar registro no eSocial, caso sua insercao ou edicao anterior ja tenham sidos processados
    if (coalesce(old.tipo_operacao, 'P') = 'P') then
      new.tipo_operacao = 'A';
  end
end^

/*------ 24/05/2019 17:55:44 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE trigger tg_evento_esocial_oper for evento
active before insert or update position 0
AS
begin
  if (inserting) then
    -- Inserir registro no eSocial
    new.tipo_operacao = 'I';
  else
  if (updating) then
  begin
    -- Atualizar registro no eSocial, caso sua insercao ou edicao anterior ja tenham sidos processados
    if (coalesce(old.tipo_operacao, 'P') = 'P') then
      new.tipo_operacao = 'A';
  end
end^

/*------ 24/05/2019 17:55:44 --------*/

SET TERM ; ^


/*------ GERASYS.TI 24/05/2019 18:32:06 --------*/

ALTER TABLE CARGO_FUNCAO
    ADD TIPO_OPERACAO ESOCIAL_OPERACAO,
    ADD ACUMULA_CARGO ESOCIAL_TIPO_4,
    ADD CONTAGEM_ESPECIAL ESOCIAL_TIPO_4,
    ADD DEDICACAO_EXCLUSIVA SIM_NAO;

COMMENT ON COLUMN CARGO_FUNCAO.TIPO_OPERACAO IS
'eSocial - Operacao do registro no eSocial:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';

COMMENT ON COLUMN CARGO_FUNCAO.ACUMULA_CARGO IS
'eSocial - Acumula Cargo:
1 - Nao acumulavel
2 - Profissional de Saude
3 - Professor
4 - Tecnico/Cientista';

COMMENT ON COLUMN CARGO_FUNCAO.CONTAGEM_ESPECIAL IS
'eSocial - Codigo correspondente a possibilidade de Contagem de tempo Especial:
1 - Nao
2 - Professor (Infantil, Fundamental e Medio)
3 - Professor de Ensino Superior, Magistrado, Membro de Ministerio Publico, Membro do Tribunal de Contas (com ingresso anterior a 16/12/1998 EC nro. 20/98)
4 - Atividade de Risco';

COMMENT ON COLUMN CARGO_FUNCAO.DEDICACAO_EXCLUSIVA IS
'eSocial - Dedicao exclusiva:
S - Sim
N - Nao';




/*------ GERASYS.TI 24/05/2019 18:32:57 --------*/

UPDATE CARGO_FUNCAO
SET TIPO_OPERACAO = 'I',
    ACUMULA_CARGO = 1,
    CONTAGEM_ESPECIAL = 1,
    DEDICACAO_EXCLUSIVA = 'N';




/*------ SYSDBA 24/05/2019 18:34:26 --------*/

SET TERM ^ ;

CREATE trigger tg_cargo_funcao_esocial_oper for cargo_funcao
active before insert or update position 0
AS
begin
  if (inserting) then
    -- Inserir registro no eSocial
    new.tipo_operacao = 'I';
  else
  if (updating) then
  begin
    -- Atualizar registro no eSocial, caso sua insercao ou edicao anterior ja tenham sidos processados
    if (coalesce(old.tipo_operacao, 'P') = 'P') then
      new.tipo_operacao = 'A';
  end
end^

SET TERM ; ^



/*------ SYSDBA 13/06/2019 10:53:57 --------*/

CREATE DOMAIN "VARCHAR(260)" AS
VARCHAR(260);

CREATE DOMAIN "VARCHAR(270)" AS
VARCHAR(270);




/*------ SYSDBA 13/06/2019 10:54:11 --------*/

ALTER TABLE ESOCIAL_CATEGORIA_TRAB ALTER COLUMN DESCRICAO TYPE "VARCHAR(270)";




/*------ SYSDBA 13/06/2019 11:16:57 --------*/

SET TERM ^ ;

CREATE trigger tg_servidor_esocial_oper for servidor
active before insert or update position 0
AS
begin
  if (inserting) then
    -- Inserir registro no eSocial
    new.tipo_operacao = 'I';
    if (new.data_operacao is null) then
      new.data_operacao = current_date;
  else
  if (updating) then
  begin
    -- Atualizar registro no eSocial, caso sua insercao ou edicao anterior ja tenham sidos processados
    if (coalesce(old.tipo_operacao, 'P') = 'P') then
      new.tipo_operacao = 'A';
    if ((old.data_operacao is null) and (new.data_operacao is null)) then
      new.data_operacao = current_date;
  end
end^

SET TERM ; ^




/*------ SYSDBA 13/06/2019 11:23:42 --------*/

COMMENT ON COLUMN TAB_RACA_COR.ID_ESOCIAL IS
'eSocial - Identificacao da Raça e cor do trabalhador:
1 - Branca
2 - Preta
3 - Parda
4 - Amarela
5 - Indígena';




/*------ SYSDBA 13/06/2019 11:24:42 --------*/

COMMENT ON COLUMN TAB_RACA_COR.ID_ESOCIAL IS
'eSocial - Identificacao da Raça e cor do trabalhador:
1 - Branca
2 - Preta
3 - Parda
4 - Amarela
5 - Indígena
6 - Não informado';




/*------ SYSDBA 13/06/2019 11:33:23 --------*/

COMMENT ON COLUMN ESTADO_CIVIL.ID_ESOCIAL IS
'eSocial - Identificacao do Estado civil do trabalhador, conforme opções abaixo:
1 - Solteiro
2 - Casado
3 - Divorciado
4 - Separado
5 - Viúvo';




/*------ SYSDBA 13/06/2019 11:45:07 --------*/

COMMENT ON COLUMN ESCOLARIDADE.ID_ESOCIAL IS
'eSocial - Identificacao do Grau de instrução do trabalhador, conforme opções abaixo:
01 - Analfabeto, inclusive o que, embora tenha recebido instrução, não se alfabetizou
02 - Até o 5º ano incompleto do Ensino Fundamental (antiga 4ª série) ou que se tenha alfabetizado sem ter frequentado escola regular
03 - 5º ano completo do Ensino Fundamental
04 - Do 6º ao 9º ano do Ensino Fundamental incompleto (antiga 5ª a 8ª série)
05 - Ensino Fundamental Completo
06 - Ensino Médio incompleto
07 - Ensino Médio completo
08 - Educação Superior incompleta
09 - Educação Superior completa
10 - Pós-Graduação completa
11 - Mestrado completo
12 - Doutorado completo';




/*------ SYSDBA 13/06/2019 12:00:11 --------*/

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_MENTAL IS
'eSocial - Deficiencia Mental:
N - Nao
S - Sim';

