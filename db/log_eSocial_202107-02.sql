/*------ 08/07/2021 20:22:10 --------*/

SET TERM ^ ;

create or alter procedure SP_ESOCIAL_EVENTOS_PEND_TABELAS
as
declare variable COMPETENCIA "CHAR(6)";
declare variable EVENTO "VARCHAR(10)";
declare variable OPERACAO ESOCIAL_OPERACAO;
declare variable FLAG SIM_NAO;
declare variable INFORMACAO "VARCHAR(250)";
begin
  Select
    g.competencia
  from GET_ESOCIAL_COMPETENCIA_ATIVA g
  Into
    competencia;

  for
    Select distinct
        x.evento
      , x.operacao
      , x.flag
      , x.informacao
    from (
        Select
            'S1000' as evento
          , c.tipo_operacao as operacao
          , 'S' as flag
          , 'Cadastro das configuracoes do orgao' as informacao
        from CONFIG_ORGAO c
          inner join CONFIG_ESOCIAL e on (e.ID_CONFIG_ORGAO = c.ID)
          inner join UNID_GESTORA   u on (u.ID = e.ID_UNID_GESTORA)
        where c.tipo_operacao != 'P'
        
        union
        
        Select
            'S1005' as evento
          , ug.tipo_operacao as operacao
          , 'S'             as flag
          , 'Cadastro das unidades de orgaos publicos' as informacao
        from UNID_GESTORA ug
        where ug.tipo_operacao != 'P'
        
        union
        
        Select
            'S1010' as evento
          , e.tipo_operacao as operacao
          , 'S'             as flag
          , 'Cadastro de Eventos/Rubricas' as informacao
        from EVENTO e
        where (coalesce(trim(e.nat_rubrica), '') != '')
          and (e.tipo_operacao != 'P')
        
        union
        
        Select
            'S1020' as evento
          , c.tipo_operacao as operacao
          , 'S'             as flag
          , 'Cadastro das lotacoes tributarias' as informacao
        from CONFIG_ORGAO c
          inner join CONFIG_ESOCIAL e on (e.id_config_orgao = c.id)
          inner join UNID_GESTORA   u on (u.id = e.id_unid_gestora and u.id = 1)
        where c.tipo_operacao != 'P'
    ) x
    Into
        evento
      , operacao
      , flag
      , informacao
  do
  begin
    execute procedure SET_ESOCIAL_GERAR_EVENTOS(
        :evento
      , :competencia
      , :operacao
      , :flag
      , :informacao
    );
  end
end^

/*------ 08/07/2021 20:22:11 --------*/

SET TERM ; ^

COMMENT ON PROCEDURE SP_ESOCIAL_EVENTOS_PEND_TABELAS IS
'Procedure SP Gerar Eventos Pedentes (Eventos de Tabelas)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   07/07/2021

Stored procedure responsavel verificar a pendencia de envio dos eventos de tabela
no eSocial de acordo com os dados que ainda não foram enviados e assim sinalizar
ao sistema a necessidade de envio dos eventos de tabela 1000, 1005, 1010 e 1020.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    07/07/2021 - IMR :
        + Criacao da store procedure na base de dados.';

/*------ 08/07/2021 20:22:11 --------*/

GRANT EXECUTE ON PROCEDURE GET_ESOCIAL_COMPETENCIA_ATIVA TO PROCEDURE SP_ESOCIAL_EVENTOS_PEND_TABELAS;

/*------ 08/07/2021 20:22:11 --------*/

GRANT SELECT ON CONFIG_ESOCIAL TO PROCEDURE SP_ESOCIAL_EVENTOS_PEND_TABELAS;

/*------ 08/07/2021 20:22:11 --------*/

GRANT EXECUTE ON PROCEDURE SET_ESOCIAL_GERAR_EVENTOS TO PROCEDURE SP_ESOCIAL_EVENTOS_PEND_TABELAS;

/*------ 08/07/2021 20:22:11 --------*/

GRANT EXECUTE ON PROCEDURE SP_ESOCIAL_EVENTOS_PEND_TABELAS TO "GERASYS.TI";

/*------ 08/07/2021 20:22:11 --------*/

GRANT EXECUTE ON PROCEDURE SP_ESOCIAL_EVENTOS_PEND_TABELAS TO "PUBLIC";


/*------ GERASYS.TI 08/07/2021 20:43:04 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESOCIAL_PENDENCIA (
    EVENTO "VARCHAR(10)",
    OPERACAO "CHAR(1)")
returns (
    PENDENCIAS "INTEGER")
as
begin
  pendencias = 0;
  operacao   = coalesce(:operacao, 'X');

  if (coalesce(:evento, '') = 'S1000') then
  begin
    Select
      count(c.id)
    from CONFIG_ORGAO c
      inner join CONFIG_ESOCIAL e on (e.ID_CONFIG_ORGAO = c.ID)
      inner join UNID_GESTORA   u on (u.ID = e.ID_UNID_GESTORA)
    where c.tipo_operacao = :operacao
    Into
      pendencias;
  end
  else
  if (coalesce(:evento, '') = 'S1005') then
  begin
    Select
      count(ug.id)
    from UNID_GESTORA ug
    where ug.tipo_operacao = :operacao
    Into
      pendencias;
  end
  else
  if (coalesce(:evento, '') = 'S1010') then
  begin
    Select
      count(e.id)
    from EVENTO e
    where e.tipo_operacao = :operacao
    Into
      pendencias;
  end
  else
  if (coalesce(:evento, '') = 'S1020') then
  begin
    Select
      count(c.id)
    from CONFIG_ORGAO c
      inner join CONFIG_ESOCIAL e on (e.id_config_orgao = c.id)
      inner join UNID_GESTORA   u on (u.id = e.id_unid_gestora and u.id = 1)
    where c.tipo_operacao = :operacao
    Into
      pendencias;
  end

  pendencias = coalesce(:pendencias, 0);
  suspend;
end^

SET TERM ; ^

COMMENT ON PROCEDURE GET_ESOCIAL_PENDENCIA IS 'Procedure GET Envios Pendentes (eSocial)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   08/07/2021

Stored procedure responsavel por processar retornar a quantidades de registros
pendetes de envio para o eSocial de acordo com o evento e o tipo de operacao
informado.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    08/07/2021 - IMR :
        + Criacao da store procedure na base de dados.';

GRANT EXECUTE ON PROCEDURE GET_ESOCIAL_PENDENCIA TO "PUBLIC";





/*------ GERASYS.TI 08/07/2021 21:04:01 --------*/

ALTER TABLE ESOCIAL_EVENTO
    ADD LOTE "INTEGER" DEFAULT 1;

COMMENT ON COLUMN ESOCIAL_EVENTO.LOTE IS
'Sequencial do lote (controle interno)';

alter table ESOCIAL_EVENTO
alter EVENTO position 1;

alter table ESOCIAL_EVENTO
alter COMPETENCIA position 2;

alter table ESOCIAL_EVENTO
alter OPERACAO position 3;

alter table ESOCIAL_EVENTO
alter LOTE position 4;

alter table ESOCIAL_EVENTO
alter PRAZO_ENVIO position 5;

alter table ESOCIAL_EVENTO
alter PROCESSADO position 6;

alter table ESOCIAL_EVENTO
alter ENVIADO position 7;

alter table ESOCIAL_EVENTO
alter PROCESSO_DATA position 8;

alter table ESOCIAL_EVENTO
alter PROCESSO_USUARIO position 9;

alter table ESOCIAL_EVENTO
alter PROCESSO_VALIDO position 10;

alter table ESOCIAL_EVENTO
alter PROTOCOLO_ENVIO position 11;




/*------ GERASYS.TI 08/07/2021 21:05:51 --------*/

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

    08/07/2021 - IMR :
        + Criacao do campo LOTE que permitir a gravacao de mais de um registro de
          envio para a mesma COMPETENCIA, EVENTO, OPERACAO. Recurso necessario para
          os eventos S1005 e S1010.

    25/11/2018 - IMR :
        + Criacao da tabela na base de dados.

    14/05/2021 - IMR :
        + Criacao do campo OPERACAO para que este possa compor a chave primaria
          da tabela,  pois existem casos onde havera mais de um registro para o
          mesmo evento/competencia em operacoes diferentes.';




/*------ GERASYS.TI 08/07/2021 21:06:12 --------*/

update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = 1
where (RDB$FIELD_NAME = 'LOTE') and
(RDB$RELATION_NAME = 'ESOCIAL_EVENTO')
;




/*------ GERASYS.TI 08/07/2021 21:14:59 --------*/

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

    08/07/2021 - IMR :
        * Alteracao na regra de negocio para execucao da procedure.

    17/05/2021 - IMR :
        + Criacao da trigger na base de dados.';




/*------ GERASYS.TI 08/07/2021 21:16:31 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_esocial_evento_encessar for esocial_evento
active before update position 0
AS
begin
  --if ((old.processo_valido = 'N') and (new.processo_valido = 'S') and (new.protocolo_envio is not null)) then
  if ((new.processo_valido = 'S') and (new.protocolo_envio is not null)) then
    execute procedure SET_ESOCIAL_GERAR_EVENTOS(
        new.evento
      , new.competencia
      , new.operacao
      , 'N'
      , 'Evento ' || new.evento || ' gerado, processado e enviado com sucesso.'
    );
end^

SET TERM ; ^

/*------ GERASYS.TI 08/07/2021 21:27:35 --------*/

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
declare variable LOTE "INTEGER";
begin
  lote = 1;

  /* Tratar sequencia do lote de acordo com o evento */
  if ( (coalesce(:evento, '') = 'S1005') or (coalesce(:evento, '') = 'S1010') ) then
  begin
    Select
      max(e.lote)
    from ESOCIAL_EVENTO e
    where e.evento      = :evento
      and e.competencia = :competencia
      and e.operacao    = :operacao
      and e.processado  = 'S'
      and e.enviado     = 'S'
    Into
      lote;

    lote = coalesce(:lote, 0) + 1;
  end

  if (not exists(
    Select
      e.evento
    from ESOCIAL_EVENTO e
    where e.evento      = :evento
      and e.competencia = :competencia
      and e.operacao    = :operacao
      and e.lote        = :lote
  )) then
  begin
    Insert Into ESOCIAL_EVENTO (
        evento
      , competencia
      , operacao
      , lote
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
      , :lote
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
      and e.operacao    = :operacao
      and e.lote        = :lote;
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

    08/07/2021 - IMR :
        + Inclusao do campo LOTE.

    14/05/2021 - IMR :
        + Inclusao do campo OPERACAO.

    16/09/2018 - IMR :
        + Criacao da store procedure na base de dados.';




/*------ GERASYS.TI 08/07/2021 21:28:55 --------*/

ALTER TABLE ESOCIAL_EVENTO DROP CONSTRAINT PK_ESOCIAL_EVENTO;




/*------ GERASYS.TI 08/07/2021 21:29:09 --------*/

ALTER TABLE ESOCIAL_EVENTO
ADD CONSTRAINT PK_ESOCIAL_EVENTO
PRIMARY KEY (EVENTO,COMPETENCIA,OPERACAO,LOTE);

