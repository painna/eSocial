


/*------ GERASYS.TI 13/07/2021 22:33:30 --------*/

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
      and e.nat_rubrica is not null
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

