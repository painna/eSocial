


/*------ GERASYS.TI 15/07/2021 14:00:58 --------*/

COMMENT ON COLUMN CONFIG_ESOCIAL.DATA_IMPLANTACAO IS
'eSocial - Data de implantacao do na instituicao';




/*------ GERASYS.TI 15/07/2021 14:23:55 --------*/

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
    where e.tipo_operacao = :operacao
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




/*------ GERASYS.TI 15/07/2021 15:19:09 --------*/

ALTER TABLE ESOCIAL_LOG_EVENTO
    ADD ID_EVENTO "VARCHAR(40)";

COMMENT ON COLUMN ESOCIAL_LOG_EVENTO.ID_EVENTO IS
'ID do registro no Portal e-Social';




/*------ GERASYS.TI 15/07/2021 15:19:39 --------*/

CREATE INDEX IDX_ESOCIAL_LOG_EVENTO_IDEVENT
ON ESOCIAL_LOG_EVENTO (ID_EVENTO);




/*------ GERASYS.TI 15/07/2021 18:01:44 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_ESOCIAL_EVENTOS_PEND_TABELAS
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
        where e.tipo_operacao != 'P'
        
        union
        
        Select
            'S1005' as evento
          , ug.tipo_operacao as operacao
          , 'S'             as flag
          , 'Cadastro das unidades de orgaos publicos' as informacao
        from UNID_GESTORA ug
        where ug.tipo_operacao != 'P'
        
        union
        
        Select
            'S1010' as evento
          , e.tipo_operacao as operacao
          , 'S'             as flag
          , 'Cadastro de Eventos/Rubricas' as informacao
        from EVENTO e
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

