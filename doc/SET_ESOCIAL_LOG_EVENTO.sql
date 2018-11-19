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
end