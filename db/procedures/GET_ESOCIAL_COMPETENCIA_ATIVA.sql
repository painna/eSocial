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

COMMENT ON PROCEDURE GET_ESOCIAL_COMPETENCIA_ATIVA IS
'Procedure GET Competencia

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

/* Following GRANT statetements are generated automatically */

GRANT SELECT ON CTRL_PROCESS_GERAL TO PROCEDURE GET_ESOCIAL_COMPETENCIA_ATIVA;
GRANT SELECT ON ESOCIAL_GERAR_EVENTOS TO PROCEDURE GET_ESOCIAL_COMPETENCIA_ATIVA;

/* Existing privileges on this procedure */

GRANT EXECUTE ON PROCEDURE GET_ESOCIAL_COMPETENCIA_ATIVA TO "GERASYS.TI";
GRANT EXECUTE ON PROCEDURE GET_ESOCIAL_COMPETENCIA_ATIVA TO "PUBLIC";
