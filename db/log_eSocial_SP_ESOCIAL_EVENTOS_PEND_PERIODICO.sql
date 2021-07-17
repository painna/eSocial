create or alter procedure SP_ESOCIAL_EVENTOS_PEND_PERIODICO
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
        /*
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
        */
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
end

