SET TERM ^ ;

create or alter procedure SP_ESOCIAL_LOG_EVENTO (
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

COMMENT ON PROCEDURE SP_ESOCIAL_LOG_EVENTO IS
'Procedure SP Log Eventos x Protocolo (Processar)

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

/* Following GRANT statetements are generated automatically */

GRANT SELECT ON ESOCIAL_LOG_EVENTO TO PROCEDURE SP_ESOCIAL_LOG_EVENTO;

/* Existing privileges on this procedure */

GRANT EXECUTE ON PROCEDURE SP_ESOCIAL_LOG_EVENTO TO "GERASYS.TI";
GRANT EXECUTE ON PROCEDURE SP_ESOCIAL_LOG_EVENTO TO "PUBLIC";
