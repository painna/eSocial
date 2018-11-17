create or alter procedure sp_esocial_log_evento (
    protocolo "VARCHAR(30)")
as
declare variable tabela "VARCHAR(40)";
declare variable campo "VARCHAR(40)";
declare variable id "VARCHAR(40)";
declare variable scriptupdate "VARCHAR(250)";
begin
  for
    Select
        lg.tabela
      , coalesce(lg.campo, 'ID')
      , cast(lg.id as "VARCHAR(40)")
    from ESOCIAL_LOG_EVENTO lg
    where lg.protocolo_envio = :protocolo
    Into
        tabela
      , campo
      , id
  do
  begin
    scriptUpdate = 'Update ' || :tabela || ' set TIPO_OPERACAO = ''P''  where ' || :campo || ' = ' || :id;
    execute statement :scriptUpdate;
  end 
end