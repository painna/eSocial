SET TERM ^ ;

create or alter procedure SET_ESOCIAL_EVENTO (
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

COMMENT ON PROCEDURE SET_ESOCIAL_EVENTO IS
'Procedure SET Eventos Gerados

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

/* Following GRANT statetements are generated automatically */

GRANT SELECT,INSERT,UPDATE ON ESOCIAL_EVENTO TO PROCEDURE SET_ESOCIAL_EVENTO;

/* Existing privileges on this procedure */

GRANT EXECUTE ON PROCEDURE SET_ESOCIAL_EVENTO TO "GERASYS.TI";
GRANT EXECUTE ON PROCEDURE SET_ESOCIAL_EVENTO TO "PUBLIC";
