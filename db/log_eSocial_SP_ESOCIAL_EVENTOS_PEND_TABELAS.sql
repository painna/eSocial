SET TERM ^ ;

create or alter procedure SP_ESOCIAL_EVENTOS_PEND_TABELAS
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
        where c.tipo_operacao != 'P'
        
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

COMMENT ON PROCEDURE SP_ESOCIAL_EVENTOS_PEND_TABELAS IS
'Procedure SP Gerar Eventos Pedentes (Eventos de Tabelas)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   07/07/2021

Stored procedure responsavel verificar a pendencia de envio dos eventos de tabela
no eSocial de acordo com os dados que ainda não foram enviados e assim sinalizar
ao sistema a necessidade de envio dos eventos de tabela 1000, 1005, 1010 e 1020.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    07/07/2021 - IMR :
        + Criacao da store procedure na base de dados.';

/* Following GRANT statetements are generated automatically */

GRANT EXECUTE ON PROCEDURE GET_ESOCIAL_COMPETENCIA_ATIVA TO PROCEDURE SP_ESOCIAL_EVENTOS_PEND_TABELAS;
GRANT SELECT ON CONFIG_ORGAO TO PROCEDURE SP_ESOCIAL_EVENTOS_PEND_TABELAS;
GRANT SELECT ON CONFIG_ESOCIAL TO PROCEDURE SP_ESOCIAL_EVENTOS_PEND_TABELAS;
GRANT SELECT ON UNID_GESTORA TO PROCEDURE SP_ESOCIAL_EVENTOS_PEND_TABELAS;
GRANT SELECT ON EVENTO TO PROCEDURE SP_ESOCIAL_EVENTOS_PEND_TABELAS;
GRANT EXECUTE ON PROCEDURE SET_ESOCIAL_GERAR_EVENTOS TO PROCEDURE SP_ESOCIAL_EVENTOS_PEND_TABELAS;

/* Existing privileges on this procedure */

GRANT EXECUTE ON PROCEDURE SP_ESOCIAL_EVENTOS_PEND_TABELAS TO "GERASYS.TI";
GRANT EXECUTE ON PROCEDURE SP_ESOCIAL_EVENTOS_PEND_TABELAS TO "PUBLIC";
