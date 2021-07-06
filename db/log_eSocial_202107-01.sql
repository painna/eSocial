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

