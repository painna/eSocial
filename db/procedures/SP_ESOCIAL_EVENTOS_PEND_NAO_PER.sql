SET TERM ^ ;

create or alter procedure SP_ESOCIAL_EVENTOS_PEND_NAO_PER
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
            Case s.tipo_operacao
              when 'I' then 'S2200'
              when 'A' then 'S2206'
            end as evento
          , s.tipo_operacao as operacao
          , 'S' as flag
          , Case s.tipo_operacao
              when 'I' then 'Cadastro de Pessoa Fisica/Servidor'
              when 'A' then 'Alteracao de Contrato de Trabalho/Relacao Estatutaria'
            end as informacao
        from SERVIDOR s
          inner join PESSOA_FISICA p on (p.id = s.id_pessoa_fisica)
        where s.tipo_operacao != 'P'
        group by s.tipo_operacao

        union

        Select
            'S2205' as evento
          , p.tipo_operacao as operacao
          , 'S' as flag
          , 'Alteracao de Dados Cadastrais do Trabalhador' as informacao
        from PESSOA_FISICA p
          inner join SERVIDOR s on (s.id_pessoa_fisica = p.id)
        where p.tipo_operacao = 'A'
        group by p.tipo_operacao
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

COMMENT ON PROCEDURE SP_ESOCIAL_EVENTOS_PEND_NAO_PER IS
'Procedure SP Gerar Eventos Nao Periodicos (Eventos de Cadastros)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   29/07/2021

Stored procedure responsavel verificar a pendencia de envio dos eventos nao periodicos
no eSocial de acordo com os dados que ainda nao foram enviados e assim sinalizar
ao sistema a necessidade de envio dos eventos 2200, 2205 e 2206.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    07/07/2021 - IMR :
        + Criacao da store procedure na base de dados.';

/* Following GRANT statetements are generated automatically */

GRANT EXECUTE ON PROCEDURE GET_ESOCIAL_COMPETENCIA_ATIVA TO PROCEDURE SP_ESOCIAL_EVENTOS_PEND_NAO_PER;
GRANT SELECT ON SERVIDOR TO PROCEDURE SP_ESOCIAL_EVENTOS_PEND_NAO_PER;
GRANT SELECT ON PESSOA_FISICA TO PROCEDURE SP_ESOCIAL_EVENTOS_PEND_NAO_PER;
GRANT EXECUTE ON PROCEDURE SET_ESOCIAL_GERAR_EVENTOS TO PROCEDURE SP_ESOCIAL_EVENTOS_PEND_NAO_PER;

/* Existing privileges on this procedure */

GRANT EXECUTE ON PROCEDURE SP_ESOCIAL_EVENTOS_PEND_NAO_PER TO "GERASYS.TI";
