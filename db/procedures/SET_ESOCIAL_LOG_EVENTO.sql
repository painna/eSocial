SET TERM ^ ;

create or alter procedure SET_ESOCIAL_LOG_EVENTO (
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

COMMENT ON PROCEDURE SET_ESOCIAL_LOG_EVENTO IS
'Procedure SET Log Eventos x Protocolo

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

/* Following GRANT statetements are generated automatically */

GRANT SELECT ON ESOCIAL_RETORNO_PROTOCOLO TO PROCEDURE SET_ESOCIAL_LOG_EVENTO;
GRANT SELECT,INSERT ON ESOCIAL_LOG_EVENTO TO PROCEDURE SET_ESOCIAL_LOG_EVENTO;

/* Existing privileges on this procedure */

GRANT EXECUTE ON PROCEDURE SET_ESOCIAL_LOG_EVENTO TO "GERASYS.TI";
