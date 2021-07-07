/*------ GERASYS.TI 06/07/2021 16:40:00 --------*/


COMMENT ON PROCEDURE GET_ESOCIAL_COMPETENCIA_ATIVA IS 'Procedure GET Competencia

    Autor   :   Isaque Marinho Ribeiro
    Data    :   17/05/2021

Stored procedure responsavel retorno a competencia ativa para a geracao de eventos
no eSocial. Caso haja uma competencia aberta no REMUNERATUS, esta sera retornada,
caso contrario, uma competencia corrente sera retornada para o eSocial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    17/05/2021 - IMR :
        + Criacao da store procedure na base de dados.';



/*------ GERASYS.TI 06/07/2021 16:49:02 --------*/

SET TERM ^ ;

CREATE trigger tg_evento_eventoesocial for evento
active after insert or update position 1
AS
  declare variable competencia "VARCHAR(6)";
begin
  Select first 1
    c.competencia
  from GET_ESOCIAL_COMPETENCIA_ATIVA c
  Into
    competencia;

  execute procedure SET_ESOCIAL_GERAR_EVENTOS('S1010'
    , :competencia
    , new.tipo_operacao
    , Case when new.tipo_operacao != 'P' then 'S' else 'N' end
    , 'Cadastro de Eventos/Rubricas'
  );
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_EVENTO_EVENTOESOCIAL IS 'Trigger Gerar Evento S1010 (eSocial - Eventos/Rubricas)

    Autor   :   Isaque M. Ribeiro
    Data    :   06/07/2021

Trigger responsavel por gerar a necessidade de processamento do evento "S1010" no
eSocial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    06/07/2021 - IMR :
        + Criacao da trigger na base de dados.';




/*------ GERASYS.TI 06/07/2021 17:28:32 --------*/

SET TERM ^ ;

CREATE trigger tg_unid_gestora_eventoesocial for unid_gestora
active after insert or update position 1
AS
  declare variable competencia "VARCHAR(6)";
begin
  Select first 1
    c.competencia
  from GET_ESOCIAL_COMPETENCIA_ATIVA c
  Into
    competencia;

  execute procedure SET_ESOCIAL_GERAR_EVENTOS('S1005'
    , :competencia
    , new.tipo_operacao
    , Case when new.tipo_operacao != 'P' then 'S' else 'N' end
    , 'Cadastro das unidades de orgaos publicos'
  );
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_UNID_GESTORA_EVENTOESOCIAL IS 'Trigger Gerar Evento S1005 (eSocial - Unidades de Orgaos Publicos)

    Autor   :   Isaque M. Ribeiro
    Data    :   06/07/2021

Trigger responsavel por gerar a necessidade de processamento do evento "S1005" no
eSocial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    06/07/2021 - IMR :
        + Criacao da trigger na base de dados.';




/*------ GERASYS.TI 06/07/2021 17:46:02 --------*/

DROP TRIGGER TG_ESOCIAL_CONFIG_ORGAO_EVENTO;




/*------ GERASYS.TI 06/07/2021 17:49:28 --------*/

SET TERM ^ ;

CREATE trigger tg_config_orgao_eventoesocial for config_orgao
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

  execute procedure SET_ESOCIAL_GERAR_EVENTOS('S1020'
    , :competencia
    , new.tipo_operacao
    , Case when new.tipo_operacao != 'P' then 'S' else 'N' end
    , 'Cadastro das lotacoes tributarias'
  );
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_CONFIG_ORGAO_EVENTOESOCIAL IS 'Trigger Gerar Evento S1000 / S1020 (eSocial - Configuracao Orgao)

    Autor   :   Isaque M. Ribeiro
    Data    :   17/05/2021

Trigger responsavel por gerar a necessidade de processamento do evento "S1000" e
do evento "S1020" no
eSocial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    06/07/2021 - IMR :
        * Ajuste na trigger para contemplar o evento S1020.
    17/05/2021 - IMR :
        + Criacao da trigger na base de dados.';




/*------ GERASYS.TI 06/07/2021 19:42:02 --------*/

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

    06/07/2021 - IMR :
        * Ajuste na procedure para ler a tabela .
    17/05/2021 - IMR :
        + Criacao da store procedure na base de dados.';




/*------ GERASYS.TI 06/07/2021 19:42:23 --------*/

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

    06/07/2021 - IMR :
        * Ajuste na procedure para ler a tabela ESOCIAL_GERAR_EVENTOS.
    17/05/2021 - IMR :
        + Criacao da store procedure na base de dados.';




/*------ GERASYS.TI 06/07/2021 19:42:25 --------*/

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
  begin
    Select first 1
      e.competencia
    from ESOCIAL_GERAR_EVENTOS e
    where (e.insercao = 'S')
       or (e.alteracao = 'S')
       or (e.exclusao = 'S')
    order by
      e.competencia desc
    Into
      competencia;
  end

  if (coalesce(nullif(trim(:competencia), ''), '') = '') then
    competencia = extract(year from current_date) || right('00' || extract(month from current_date), 2);

  suspend;
end^

SET TERM ; ^



/*------ GERASYS.TI 07/07/2021 12:11:29 --------*/

execute block
as
  declare variable competencia "CHAR(6)";
  declare variable evento "VARCHAR(10)";
  declare variable operacao ESOCIAL_OPERACAO;
  declare variable flag SIM_NAO;
  declare variable informacao "VARCHAR(250)";
begin
  Select
    g.competencia
  from GET_ESOCIAL_COMPETENCIA_ATIVA g
  Into
    competencia;

  for
    Select distinct
      *
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
          left join TAB_ALIQ_FAP fp on (fp.id_unid_gestora = ug.id)
        where ug.tipo_operacao != 'P'
        
        union
        
        Select
            'S1010' as evento
          , e.tipo_operacao as operacao
          , 'S'             as flag
          , 'Cadastro de Eventos/Rubricas' as informacao
        from EVENTO e
          left join (
            Select
                l.id_evento
              , min(l.ano_mes) as ano_mes_min
              , max(l.ano_mes) as ano_mes_max
            from LANCTO_EVENTO_CALC l
            group by
                l.id_evento
          ) x on (x.id_evento = e.id)
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
    )
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
end;

/*------ GERASYS.TI 07/07/2021 12:11:32 --------*/

COMMIT WORK;



/*------ GERASYS.TI 07/07/2021 12:19:45 --------*/

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
          left join TAB_ALIQ_FAP fp on (fp.id_unid_gestora = ug.id)
        where ug.tipo_operacao != 'P'
        
        union
        
        Select
            'S1010' as evento
          , e.tipo_operacao as operacao
          , 'S'             as flag
          , 'Cadastro de Eventos/Rubricas' as informacao
        from EVENTO e
          left join (
            Select
                l.id_evento
              , min(l.ano_mes) as ano_mes_min
              , max(l.ano_mes) as ano_mes_max
            from LANCTO_EVENTO_CALC l
            group by
                l.id_evento
          ) x on (x.id_evento = e.id)
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

SET TERM ; ^

COMMENT ON PROCEDURE SP_ESOCIAL_EVENTOS_PEND_TABELAS IS 'Procedure SP Gerar Eventos Pedentes (Eventos de Tabelas)

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

GRANT EXECUTE ON PROCEDURE SP_ESOCIAL_EVENTOS_PEND_TABELAS TO "PUBLIC";
