SET TERM ^ ;

create or alter procedure SET_ESOCIAL_GERAR_EVENTOS (
    EVENTO "VARCHAR(10)" not null,
    COMPETENCIA "CHAR(6)" not null,
    OPERACAO ESOCIAL_OPERACAO not null,
    FLAG SIM_NAO,
    INFORMACAO "VARCHAR(250)")
as
begin
  if (not exists(
    Select
      g.evento
    from ESOCIAL_GERAR_EVENTOS g
    where g.evento = :evento
      and g.competencia = :competencia
  )) then
  begin
    /* 1. Inserir registro, caso nao exista */
    Insert Into ESOCIAL_GERAR_EVENTOS (
        evento
      , competencia
      , insercao
      , alteracao
      , exclusao
    ) values (
        :evento
      , :competencia
      , 'N'
      , 'N'
      , 'N'
    );
  end

  /* 2. Sinalizar a necessidade ou nao do evento de INSERCAO no eSocial */
  if (:operacao = 'I') then
  begin
    Update ESOCIAL_GERAR_EVENTOS Set
        insercao      = :flag
    where evento      = :evento
      and competencia = :competencia;
  end
  else
  /* 3. Sinalizar a necessidade ou nao do evento de ALTERACAO no eSocial */
  if (:operacao = 'A') then
  begin
    Update ESOCIAL_GERAR_EVENTOS Set
        alteracao     = :flag
    where evento      = :evento
      and competencia = :competencia;
  end
  else
  /* 4. Sinalizar a necessidade ou nao do evento de EXCLUSAO no eSocial */
  if (:operacao = 'E') then
  begin
    Update ESOCIAL_GERAR_EVENTOS Set
        exclusao      = :flag
    where evento      = :evento
      and competencia = :competencia;
  end

  /* 5. Adicionar LOG na tabela caso seja informado */
  if (coalesce(nullif(trim(:informacao), ''), '') != '') then
  begin
    Update ESOCIAL_GERAR_EVENTOS Set
        log_db        = log_db || ascii_char(13) || ascii_char(10) || trim(:informacao)
    where evento      = :evento
      and competencia = :competencia;
  end
end^

SET TERM ; ^

COMMENT ON PROCEDURE SET_ESOCIAL_GERAR_EVENTOS IS
'Procedure SET Gerar Eventos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   14/05/2021

Stored procedure responsavel por gravar os registros na tabela ESOCIAL_GERAR_EVENTOS
sobre a necessidade de se processar eventos eventos do eSocial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    14/05/2021 - IMR :
        + Criacao da store procedure na base de dados.';

/* Following GRANT statetements are generated automatically */

GRANT SELECT,INSERT,UPDATE ON ESOCIAL_GERAR_EVENTOS TO PROCEDURE SET_ESOCIAL_GERAR_EVENTOS;

/* Existing privileges on this procedure */

GRANT EXECUTE ON PROCEDURE SET_ESOCIAL_GERAR_EVENTOS TO "GERASYS.TI";
GRANT EXECUTE ON PROCEDURE SET_ESOCIAL_GERAR_EVENTOS TO "PUBLIC";
