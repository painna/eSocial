SET TERM ^ ;

create or alter procedure GET_ESOCIAL_PENDENCIA (
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

COMMENT ON PROCEDURE GET_ESOCIAL_PENDENCIA IS
'Procedure GET Envios Pendentes (eSocial)

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

/* Following GRANT statetements are generated automatically */

GRANT SELECT ON CONFIG_ORGAO TO PROCEDURE GET_ESOCIAL_PENDENCIA;
GRANT SELECT ON CONFIG_ESOCIAL TO PROCEDURE GET_ESOCIAL_PENDENCIA;
GRANT SELECT ON UNID_GESTORA TO PROCEDURE GET_ESOCIAL_PENDENCIA;
GRANT SELECT ON EVENTO TO PROCEDURE GET_ESOCIAL_PENDENCIA;

/* Existing privileges on this procedure */

GRANT EXECUTE ON PROCEDURE GET_ESOCIAL_PENDENCIA TO "GERASYS.TI";
GRANT EXECUTE ON PROCEDURE GET_ESOCIAL_PENDENCIA TO "PUBLIC";
