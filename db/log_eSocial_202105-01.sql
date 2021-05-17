

/*------ 14/05/2021 10:20:52 --------*/

COMMENT ON TABLE ESOCIAL_EVENTO IS
'Tabela Eventos eSocial
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   25/11/2018

Tabela responsavel por armazenar os parametros e/ou dados de processamento de cada
evento do eSocial em suas devidas competencias. Dados como prazo de processamento
e as datas em que ocorreram sao encontradas nessa tabela.';

/*------ 14/05/2021 10:20:52 --------*/

COMMENT ON COLUMN ESOCIAL_EVENTO.EVENTO IS
'Evento.';

/*------ 14/05/2021 10:20:52 --------*/

COMMENT ON COLUMN ESOCIAL_EVENTO.COMPETENCIA IS
'Competencia (Formato : YYYYMM).';

/*------ 14/05/2021 10:20:52 --------*/

COMMENT ON COLUMN ESOCIAL_EVENTO.PRAZO_ENVIO IS
'Prazo limite para envio do evento.';

/*------ 14/05/2021 10:20:52 --------*/

COMMENT ON COLUMN ESOCIAL_EVENTO.PROCESSADO IS
'Evento processado:
N - Nao
S - Sim';

/*------ 14/05/2021 10:20:52 --------*/

COMMENT ON COLUMN ESOCIAL_EVENTO.ENVIADO IS
'Evento enviado:
N - Nao
S - Sim';

/*------ 14/05/2021 10:21:54 --------*/

COMMENT ON COLUMN ESOCIAL_EVENTO.PROCESSO_DATA IS
'Data do processamento.';

/*------ 14/05/2021 10:21:54 --------*/

COMMENT ON COLUMN ESOCIAL_EVENTO.PROCESSO_USUARIO IS
'Usuario responsavel pelo processamento.';

/*------ 14/05/2021 10:21:54 --------*/

COMMENT ON COLUMN ESOCIAL_EVENTO.PROCESSO_VALIDO IS
'Processamento validado (Processo sem erros retornados pelo eSocial - REGRA_VALIDA_FECHAMENTO_FOPAG)
N - Nao
S - Sim';

/*------ 14/05/2021 10:21:54 --------*/

COMMENT ON COLUMN ESOCIAL_EVENTO.PROTOCOLO_ENVIO IS
'Numero do Protocolo de retorno.';

/*------ 14/05/2021 10:26:43 --------*/

COMMENT ON TABLE ESOCIAL_LOG_EVENTO IS
'Tabela LOG Eventos eSocial
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Tabela responsavel por armazenar os dados iniciais (Tabela, ID e Operacao) usados
para compor os eventos enviados para o eSocial, associando cada um deles os protocolo
de retorno.';

/*------ 14/05/2021 10:26:43 --------*/

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.EVENTO IS
'Evento';

/*------ 14/05/2021 10:26:43 --------*/

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.OPERACAO IS
'Operacao do registro:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';

/*------ 14/05/2021 10:26:43 --------*/

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.PROTOCOLO_ENVIO IS
'Numero do Protocolo de Envio de Evento';

/*------ 14/05/2021 10:26:43 --------*/

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.ID IS
'ID do registro na tabela principal de origem dos dados';

/*------ 14/05/2021 10:26:43 --------*/

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.TABELA IS
'Tabela principal de origem dos dados';

/*------ 14/05/2021 10:26:43 --------*/

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.CAMPO IS
'Campo da tabela principal de origem dos dados';

/*------ 14/05/2021 10:26:43 --------*/

COMMENT ON PROCEDURE SET_ESOCIAL_LOG_EVENTO IS
'Procedure SET Log Eventos x Protocolo

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Stored procedure responsavel por gravar os registros de associacao dos dados
de origem dos eventos e os protocolos de retorno.';

/*------ 14/05/2021 10:26:43 --------*/

COMMENT ON TABLE ESOCIAL_RETORNO_PROTOCOLO IS
'Tabela Retorno Protocolo eSocial
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Tabela responsavel por armazenar os dados do protocolo de envio/recebimento dos
eventos do eSocial: Arquivos enviados, numero do protocolo retorno, ETC.';

/*------ 14/05/2021 10:26:43 --------*/

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.ID IS
'ID';

/*------ 14/05/2021 10:26:43 --------*/

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.NUMERO IS
'Numero do Protocolo';

/*------ 14/05/2021 10:26:43 --------*/

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.INSCRICAO IS
'Inscricao (CNPJ do Empregador)';

/*------ 14/05/2021 10:26:43 --------*/

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.DATA_HORA IS
'Data/hora de recepcao';

/*------ 14/05/2021 10:26:43 --------*/

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.VERSAO IS
'Versao';

/*------ 14/05/2021 10:26:43 --------*/

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.ARQUIVO_ENVIADO IS
'Arquivo XML enviado (Colecao dos Eventos)';

/*------ 14/05/2021 10:26:43 --------*/

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.ARQUIVO_RETORNO IS
'Arquivo de retorno';

/*------ 14/05/2021 10:26:43 --------*/

COMMENT ON PROCEDURE SP_ESOCIAL_LOG_EVENTO IS
'Procedure SP Log Eventos x Protocolo (Processar)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Stored procedure responsavel por processar os LOGs de envio dos eventos, evitando
assim que determinados dados enviados/processados pelo eSocial sejam novamente
enviados.';

/*------ 14/05/2021 10:26:43 --------*/

COMMENT ON COLUMN CARGO_FUNCAO.TIPO_OPERACAO IS
'eSocial - Operacao do registro no eSocial:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';

/*------ 14/05/2021 10:26:44 --------*/

COMMENT ON COLUMN CARGO_FUNCAO.ACUMULA_CARGO IS
'eSocial - Acumula Cargo:
1 - Nao acumulavel
2 - Profissional de Saude
3 - Professor
4 - Tecnico/Cientista';

/*------ 14/05/2021 10:26:44 --------*/

COMMENT ON COLUMN CARGO_FUNCAO.CONTAGEM_ESPECIAL IS
'eSocial - Codigo correspondente a possibilidade de Contagem de tempo Especial:
1 - Nao
2 - Professor (Infantil, Fundamental e Medio)
3 - Professor de Ensino Superior, Magistrado, Membro de Ministerio Publico, Membro do Tribunal de Contas (com ingresso anterior a 16/12/1998 EC nro. 20/98)
4 - Atividade de Risco';

/*------ 14/05/2021 10:26:44 --------*/

COMMENT ON COLUMN CARGO_FUNCAO.DEDICACAO_EXCLUSIVA IS
'eSocial - Dedicao exclusiva:
S - Sim
N - Nao';


/*------ GERASYS.TI 14/05/2021 10:48:34 --------*/

CREATE TABLE ESOCIAL_GERAR_EVENTOS (
    EVENTO INTEGER NOT NULL,
    COMPETENCIA INTEGER NOT NULL,
    INSERCAO SIM_NAO,
    ALTERACAO SIM_NAO,
    EXCLUSAO SIM_NAO);

ALTER TABLE ESOCIAL_GERAR_EVENTOS
ADD CONSTRAINT PK_ESOCIAL_GERAR_EVENTOS
PRIMARY KEY (EVENTO,COMPETENCIA);

COMMENT ON COLUMN ESOCIAL_GERAR_EVENTOS.EVENTO IS
'Evento eSocial';

COMMENT ON COLUMN ESOCIAL_GERAR_EVENTOS.COMPETENCIA IS
'Competencia (Formato AAAAMM, onde: A = Ano e M = Mes).';

COMMENT ON COLUMN ESOCIAL_GERAR_EVENTOS.INSERCAO IS
'Insercao:
N - Nao
S - Sim';

COMMENT ON COLUMN ESOCIAL_GERAR_EVENTOS.ALTERACAO IS
'Alteracao:
N - Nao
S - Sim';

COMMENT ON COLUMN ESOCIAL_GERAR_EVENTOS.EXCLUSAO IS
'Exclusao:
N - Nao
S - Sim';




/*------ GERASYS.TI 14/05/2021 10:48:36 --------*/

COMMENT ON TABLE ESOCIAL_GERAR_EVENTOS IS 'Tabela de Controle para Geracao de Eventos do eSocial.

    Autor   :   Isaque M. Ribeiro
    Data    :   14/05/2021

Tabela responsavel por sinalizar ao sistema quando se torna necessario a geracao
e envio de eventos ao eSocial dentro de cada competencia.
Todas as vezes que houve insercao, alteracao ou exclusao de dados no REMUNERATUS,
essa tabela sera alimenta com quais eventos precisarao ser gerandos dentro da
compotencia em que os dados foram informados.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    14/05/2021 - IMR :
        + Criacao da tabela na base de dados.';

GRANT ALL ON ESOCIAL_GERAR_EVENTOS TO "PUBLIC";



/*------ GERASYS.TI 14/05/2021 10:50:52 --------*/

CREATE DOMAIN DMN_TEXTO AS
BLOB SUB_TYPE 1 SEGMENT SIZE 80;COMMENT ON DOMAIN DMN_TEXTO IS 'Texto longo';




/*------ GERASYS.TI 14/05/2021 10:51:49 --------*/

ALTER TABLE ESOCIAL_GERAR_EVENTOS
    ADD LOG_DB DMN_TEXTO;

COMMENT ON COLUMN ESOCIAL_GERAR_EVENTOS.LOG_DB IS
'Log de processos internos na base.';




/*------ GERASYS.TI 14/05/2021 10:52:46 --------*/

CREATE INDEX IDX_ESOCIAL_GERAR_EVENTOS_DEL
ON ESOCIAL_GERAR_EVENTOS (EXCLUSAO);

CREATE INDEX IDX_ESOCIAL_GERAR_EVENTOS_UPD
ON ESOCIAL_GERAR_EVENTOS (ALTERACAO);

CREATE INDEX IDX_ESOCIAL_GERAR_EVENTOS_INS
ON ESOCIAL_GERAR_EVENTOS (INSERCAO);




/*------ GERASYS.TI 14/05/2021 11:04:19 --------*/

ALTER TABLE ESOCIAL_EVENTO
    ADD OPERACAO ESOCIAL_OPERACAO;

COMMENT ON COLUMN ESOCIAL_EVENTO.OPERACAO IS
'Operacao do evento:
I - Inclusao
A - Alteracao
E - Exclusao';

alter table ESOCIAL_EVENTO
alter EVENTO position 1;

alter table ESOCIAL_EVENTO
alter COMPETENCIA position 2;

alter table ESOCIAL_EVENTO
alter OPERACAO position 3;

alter table ESOCIAL_EVENTO
alter PRAZO_ENVIO position 4;

alter table ESOCIAL_EVENTO
alter PROCESSADO position 5;

alter table ESOCIAL_EVENTO
alter ENVIADO position 6;

alter table ESOCIAL_EVENTO
alter PROCESSO_DATA position 7;

alter table ESOCIAL_EVENTO
alter PROCESSO_USUARIO position 8;

alter table ESOCIAL_EVENTO
alter PROCESSO_VALIDO position 9;

alter table ESOCIAL_EVENTO
alter PROTOCOLO_ENVIO position 10;

/*------ 14/05/2021 11:09:55 --------*/

SET TERM ^ ;

create or alter procedure set_esocial_evento (
    evento "VARCHAR(10)",
    competencia "CHAR(6)",
    operacao "CHAR(1)",
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
      and e.operacao    = :operacao
  )) then
  begin
    Insert Into ESOCIAL_EVENTO (
        evento
      , competencia
      , operacao
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
      , :operacao
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
      and e.competencia = :competencia
      and e.operacao    = :operacao;
  end 
end^

/*------ 14/05/2021 11:09:55 --------*/

SET TERM ; ^



/*------ GERASYS.TI 14/05/2021 11:15:49 --------*/

COMMENT ON TABLE ESOCIAL_EVENTO IS 'Tabela Eventos eSocial
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   25/11/2018

Tabela responsavel por armazenar os parametros e/ou dados de processamento de cada
evento do eSocial em suas devidas competencias. Dados como prazo de processamento
e as datas em que ocorreram sao encontradas nessa tabela.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    25/11/2018 - IMR :
        + Criacao da tabela na base de dados.

    14/05/2021 - IMR :
        + Criacao do campo OPERACAO para que este possa compor a chave primaria
          da tabela,  pois existem casos onde havera mais de um registro para o
          mesmo evento/competencia em operacoes diferentes.';




/*------ GERASYS.TI 14/05/2021 11:16:41 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_ESOCIAL_EVENTO (
    EVENTO "VARCHAR(10)",
    COMPETENCIA "CHAR(6)",
    OPERACAO "CHAR(1)",
    PROCESSO_DATA "DATE",
    PROCESSO_USUARIO "VARCHAR(20)",
    PROCESSADO SIM_NAO,
    ENVIADO SIM_NAO,
    VALIDO SIM_NAO,
    PROTOCOLO "VARCHAR(30)")
as
begin
  if (not exists(
    Select
      e.evento
    from ESOCIAL_EVENTO e
    where e.evento      = :evento
      and e.competencia = :competencia
      and e.operacao    = :operacao
  )) then
  begin
    Insert Into ESOCIAL_EVENTO (
        evento
      , competencia
      , operacao
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
      , :operacao
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
      and e.competencia = :competencia
      and e.operacao    = :operacao;
  end 
end^

SET TERM ; ^

COMMENT ON PROCEDURE SET_ESOCIAL_EVENTO IS 'Procedure SET Eventos Gerados

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Stored procedure responsavel por gravar os registros dos eventos gerados pelo
sistema na tabela ESOCIAL_EVENTO.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    16/09/2018 - IMR :
        + Criacao da tabela na base de dados.

    14/05/2021 - IMR :
        + Inclusao do campo OPERACAO.';




/*------ GERASYS.TI 14/05/2021 11:17:05 --------*/

ALTER TABLE ESOCIAL_EVENTO DROP CONSTRAINT PK_ESOCIAL_EVENTO;

ALTER TABLE ESOCIAL_EVENTO
ADD CONSTRAINT PK_ESOCIAL_EVENTO
PRIMARY KEY (EVENTO,COMPETENCIA,OPERACAO)
USING INDEX PK_ESOCIAL_EVENTO;




/*------ GERASYS.TI 14/05/2021 11:35:10 --------*/

ALTER TABLE ESOCIAL_GERAR_EVENTOS DROP CONSTRAINT PK_ESOCIAL_GERAR_EVENTOS;




/*------ GERASYS.TI 14/05/2021 11:35:41 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'VARCHAR(10)'
where (RDB$FIELD_NAME = 'EVENTO') and
(RDB$RELATION_NAME = 'ESOCIAL_GERAR_EVENTOS')
;




/*------ GERASYS.TI 14/05/2021 11:35:59 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'CHAR(6)'
where (RDB$FIELD_NAME = 'COMPETENCIA') and
(RDB$RELATION_NAME = 'ESOCIAL_GERAR_EVENTOS')
;




/*------ GERASYS.TI 14/05/2021 11:36:11 --------*/

ALTER TABLE ESOCIAL_GERAR_EVENTOS
ADD CONSTRAINT PK_ESOCIAL_GERAR_EVENTOS
PRIMARY KEY (EVENTO,COMPETENCIA);




/*------ GERASYS.TI 14/05/2021 12:02:16 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_ESOCIAL_EVENTO (
    EVENTO "VARCHAR(10)",
    COMPETENCIA "CHAR(6)",
    OPERACAO "CHAR(1)",
    PROCESSO_DATA "DATE",
    PROCESSO_USUARIO "VARCHAR(20)",
    PROCESSADO SIM_NAO,
    ENVIADO SIM_NAO,
    VALIDO SIM_NAO,
    PROTOCOLO "VARCHAR(30)")
as
begin
  if (not exists(
    Select
      e.evento
    from ESOCIAL_EVENTO e
    where e.evento      = :evento
      and e.competencia = :competencia
      and e.operacao    = :operacao
  )) then
  begin
    Insert Into ESOCIAL_EVENTO (
        evento
      , competencia
      , operacao
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
      , :operacao
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
      and e.competencia = :competencia
      and e.operacao    = :operacao;
  end 
end^

SET TERM ; ^

COMMENT ON PROCEDURE SET_ESOCIAL_EVENTO IS 'Procedure SET Eventos Gerados

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Stored procedure responsavel por gravar os registros dos eventos gerados pelo
sistema na tabela ESOCIAL_EVENTO.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    16/09/2018 - IMR :
        + Criacao da store procedure na base de dados.

    14/05/2021 - IMR :
        + Inclusao do campo OPERACAO.';




/*------ GERASYS.TI 14/05/2021 12:02:40 --------*/

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

    16/09/2018 - IMR :
        + Criacao da store procedure na base de dados.';




/*------ GERASYS.TI 14/05/2021 12:10:23 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure set_esocial_log_evento (
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

SET TERM ; ^


/*------ GERASYS.TI 14/05/2021 12:15:43 --------*/

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

    16/09/2018 - IMR :
        + Criacao da store procedure na base de dados.';




/*------ GERASYS.TI 14/05/2021 12:15:54 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_ESOCIAL_LOG_EVENTO (
    PROTOCOLO "VARCHAR(30)")
as
declare variable TABELA "VARCHAR(40)";
declare variable CAMPO "VARCHAR(120)";
declare variable VALORES "VARCHAR(100)";
declare variable ID "VARCHAR(40)";
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

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SP_ESOCIAL_LOG_EVENTO TO "PUBLIC";



/*------ GERASYS.TI 14/05/2021 12:16:27 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_ESOCIAL_LOG_EVENTO (
    PROTOCOLO "VARCHAR(30)")
as
declare variable TABELA "VARCHAR(40)";
declare variable CAMPO "VARCHAR(120)";
declare variable VALORES "VARCHAR(100)";
declare variable ID "VARCHAR(40)";
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

SET TERM ; ^




/*------ GERASYS.TI 17/05/2021 12:54:04 --------*/

COMMENT ON COLUMN CONFIG_ESOCIAL.TIPO_OPERACAO IS
'eSocial - Operacao do registro:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';




/*------ GERASYS.TI 17/05/2021 13:39:47 --------*/

SET TERM ^ ;

create or alter procedure GET_ESOCIAL_COMPETENCIA_ATIVA
returns (
    COMPETENCIA "VARCHAR(6)")
as
begin
  Select first 1
    c.ano_mes
  from CTRL_PROCESS_GERAL c
  where c.ano_mes      > '202100'
    and c.parcela      = '0'
    and c.inicializado = 'S'
    and c.encerrado    = 'N'
  order by
    c.ano_mes desc
  Into
    competencia;

  if (coalesce(nullif(trim(:competencia), ''), '') = '') then
    competencia = extract(year from current_date) || right('00' || extract(month from current_date), 2);

  suspend;
end^

SET TERM ; ^

COMMENT ON PROCEDURE GET_ESOCIAL_COMPETENCIA_ATIVA IS 'Procedure GET Competencia

    Autor   :   Isaque Marinho Ribeiro
    Data    :   17/05/2021

Stored procedure responsavel retorno a competencia ativa para a geracao de eventos
no eSocial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    17/05/2021 - IMR :
        + Criacao da store procedure na base de dados.';

GRANT EXECUTE ON PROCEDURE GET_ESOCIAL_COMPETENCIA_ATIVA TO "PUBLIC";

/*------ GERASYS.TI 17/05/2021 13:50:26 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_ESOCIAL_GERAR_EVENTOS (
    EVENTO "VARCHAR(10)" not null,
    COMPETENCIA "CHAR(6)" not null,
    OPERACAO ESOCIAL_OPERACAO not null,
    FLAG SIM_NAO,
    INFORMACAO "VARCHAR(250)")
as
begin
  if (not exists(
    Select
      g.evento
    from ESOCIAL_GERAR_EVENTOS g
    where g.evento = :evento
      and g.competencia = :competencia
  )) then
  begin
    /* 1. Inserir registro, caso nao exista */
    Insert Into ESOCIAL_GERAR_EVENTOS (
        evento
      , competencia
      , insercao
      , alteracao
      , exclusao
    ) values (
        :evento
      , :competencia
      , 'N'
      , 'N'
      , 'N'
    );
  end

  /* 2. Sinalizar a necessidade ou nao do evento de INSERCAO no eSocial */
  if (:operacao = 'I') then
  begin
    Update ESOCIAL_GERAR_EVENTOS Set
        insercao      = :flag
    where evento      = :evento
      and competencia = :competencia;
  end
  else
  /* 3. Sinalizar a necessidade ou nao do evento de ALTERACAO no eSocial */
  if (:operacao = 'A') then
  begin
    Update ESOCIAL_GERAR_EVENTOS Set
        alteracao     = :flag
    where evento      = :evento
      and competencia = :competencia;
  end
  else
  /* 4. Sinalizar a necessidade ou nao do evento de EXCLUSAO no eSocial */
  if (:operacao = 'E') then
  begin
    Update ESOCIAL_GERAR_EVENTOS Set
        exclusao      = :flag
    where evento      = :evento
      and competencia = :competencia;
  end

  /* 5. Adicionar LOG na tabela caso seja informado */
  if (coalesce(nullif(trim(:informacao), ''), '') != '') then
  begin
    Update ESOCIAL_GERAR_EVENTOS Set
        log_db        = log_db || ascii_char(13) || ascii_char(10) || trim(:informacao)
    where evento      = :evento
      and competencia = :competencia;
  end
end^

SET TERM ; ^


COMMENT ON PROCEDURE SET_ESOCIAL_GERAR_EVENTOS IS 'Procedure SET Gerar Eventos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   14/05/2021

Stored procedure responsavel por gravar os registros na tabela ESOCIAL_GERAR_EVENTOS
sobre a necessidade de se processar eventos eventos do eSocial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    14/05/2021 - IMR :
        + Criacao da store procedure na base de dados.';

GRANT EXECUTE ON PROCEDURE SET_ESOCIAL_GERAR_EVENTOS TO "PUBLIC";


/*------ GERASYS.TI 17/05/2021 13:55:18 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_config_orgao_eventoesocial for config_orgao
active after insert or update position 1
AS
  declare variable competencia "VARCHAR(6)";
begin
  Select first 1
    c.competencia
  from GET_ESOCIAL_COMPETENCIA_ATIVA c
  Into
    competencia;

  execute procedure SET_ESOCIAL_GERAR_EVENTOS('S1000'
    , :competencia
    , new.tipo_operacao
    , Case when new.tipo_operacao != 'P' then 'S' else 'N' end
    , 'Cadastro das configuracoes do orgao'
  );
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_CONFIG_ORGAO_EVENTOESOCIAL IS 'Trigger Gerar Evento S1000 (eSocial - Configuracao Orgao)

    Autor   :   Isaque M. Ribeiro
    Data    :   17/05/2021

Trigger responsavel por gerar a necessidade de processamento do evento "S1000" no
eSocial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    17/05/2021 - IMR :
        + Criacao da trigger na base de dados.';




/*------ GERASYS.TI 17/05/2021 14:46:42 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESOCIAL_COMPETENCIA_ATIVA
returns (
    COMPETENCIA "VARCHAR(6)")
as
begin
  Select first 1
    c.ano_mes
  from CTRL_PROCESS_GERAL c
  where (substring(c.ano_mes from 5 for 2) between '01' and '12')
    and c.parcela      = '0'
    and c.inicializado = 'S'
    and c.encerrado    = 'N'
  order by
    c.ano_mes desc
  Into
    competencia;

  if (coalesce(nullif(trim(:competencia), ''), '') = '') then
    competencia = extract(year from current_date) || right('00' || extract(month from current_date), 2);

  suspend;
end^

SET TERM ; ^

/*------ GERASYS.TI 17/05/2021 14:49:14 --------*/

CREATE OR ALTER VIEW vw_esocial_competencia (competencia, ano, mes, descricao, encerrado, origem)
as
Select
    tmp.competencia
  , substring(tmp.competencia from 1 for 4) as ano
  , substring(tmp.competencia from 5 for 2) as mes
  , Case substring(tmp.competencia from 5 for 2)
      when '01' then 'JANEIRO'
      when '02' then 'FEVEREIRO'
      when '03' then 'MARCO'
      when '04' then 'ABRIL'
      when '05' then 'MAIO'
      when '06' then 'JUNHO'
      when '07' then 'JULHO'
      when '08' then 'AGOSTO'
      when '09' then 'SETEMBRO'
      when '10' then 'OUTUBRO'
      when '11' then 'NOVEMBRO'
      when '12' then 'DEZEMBRO'
    end as descricao
  , tmp.encerrado
  , tmp.origem
from (
  Select
      e.competencia
    , Case when (e.insercao = 'S') or (e.alteracao = 'S') or (e.exclusao = 'S')
        then 'N'
        else 'S'
      end as encerrado
    , 1 as origem -- eSocial
  from ESOCIAL_GERAR_EVENTOS e
    
  union
    
  Select
      c.ano_mes   as competencia
    , c.encerrado as encerrado
    , 0 as origem -- Reuneratus
  from CTRL_PROCESS_GERAL c
  where (c.ano_mes > '202100')
    and (substring(c.ano_mes from 5 for 2) between '01' and '12')
) tmp
order by
  tmp.competencia desc
;

GRANT ALL ON VW_ESOCIAL_COMPETENCIA TO "PUBLIC";

/*------ GERASYS.TI 17/05/2021 14:50:20 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESOCIAL_COMPETENCIA_ATIVA
returns (
    COMPETENCIA "VARCHAR(6)")
as
begin
  Select first 1
    c.ano_mes
  from CTRL_PROCESS_GERAL c
  where c.ano_mes      > '202100'
    and (substring(c.ano_mes from 5 for 2) between '01' and '12')
    and c.parcela      = '0'
    and c.inicializado = 'S'
    and c.encerrado    = 'N'
  order by
    c.ano_mes desc
  Into
    competencia;

  if (coalesce(nullif(trim(:competencia), ''), '') = '') then
    competencia = extract(year from current_date) || right('00' || extract(month from current_date), 2);

  suspend;
end^

SET TERM ; ^




/*------ GERASYS.TI 17/05/2021 15:20:58 --------*/

SET TERM ^ ;

CREATE trigger tg_esocial_evento_encessar for esocial_evento
active before update position 0
AS
begin
  if ((old.processo_valido = 'N') and (new.processo_valido = 'S') and (new.protocolo_envio is not null)) then
    execute procedure SET_ESOCIAL_GERAR_EVENTOS(
        new.evento
      , new.competencia
      , new.operacao
      , 'N'
      , 'Evento ' || new.evento || ' gerado, processado e enviado com sucesso.'
    );
end^

SET TERM ; ^




/*------ GERASYS.TI 17/05/2021 15:23:46 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_esocial_evento_encessar for esocial_evento
active before update position 0
AS
begin
  if ((old.processo_valido = 'N') and (new.processo_valido = 'S') and (new.protocolo_envio is not null)) then
    execute procedure SET_ESOCIAL_GERAR_EVENTOS(
        new.evento
      , new.competencia
      , new.operacao
      , 'N'
      , 'Evento ' || new.evento || ' gerado, processado e enviado com sucesso.'
    );
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_ESOCIAL_EVENTO_ENCESSAR IS 'Trigger Finalizar Eventos (eSocial)

    Autor   :   Isaque M. Ribeiro
    Data    :   17/05/2021

Trigger responsavel por sinalizar que os eventos do eSocial foram gerados, processados
e encerrados/finalizados com sucesso.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    17/05/2021 - IMR :
        + Criacao da trigger na base de dados.';




/*------ GERASYS.TI 17/05/2021 15:24:17 --------*/

DROP TRIGGER TG_CONFIG_ORGAO_EVENTOESOCIAL;

SET TERM ^ ;

CREATE OR ALTER trigger tg_esocial_config_orgao_evento for config_orgao
active after insert or update position 1
AS
  declare variable competencia "VARCHAR(6)";
begin
  Select first 1
    c.competencia
  from GET_ESOCIAL_COMPETENCIA_ATIVA c
  Into
    competencia;

  execute procedure SET_ESOCIAL_GERAR_EVENTOS('S1000'
    , :competencia
    , new.tipo_operacao
    , Case when new.tipo_operacao != 'P' then 'S' else 'N' end
    , 'Cadastro das configuracoes do orgao'
  );
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_ESOCIAL_CONFIG_ORGAO_EVENTO IS 'Trigger Gerar Evento S1000 (eSocial - Configuracao Orgao)

    Autor   :   Isaque M. Ribeiro
    Data    :   17/05/2021

Trigger responsavel por gerar a necessidade de processamento do evento "S1000" no
eSocial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    17/05/2021 - IMR :
        + Criacao da trigger na base de dados.';



/*------ GERASYS.TI 17/05/2021 15:30:18 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 2, column 1.
from.

*/