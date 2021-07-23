SET SQL DIALECT 3;


SET TERM ^ ;



CREATE OR ALTER TRIGGER TG_ESOCIAL_CONFIG_ORGAO_EVENTO FOR CONFIG_ORGAO
ACTIVE AFTER INSERT OR UPDATE POSITION 1
AS
  declare variable competencia "VARCHAR(6)";
begin
  Select first 1
    c.competencia
  from GET_ESOCIAL_COMPETENCIA_ATIVA c
  Into
    competencia;

  execute procedure SET_ESOCIAL_GERAR_EVENTOS('S1000'
    , :competencia
    , new.tipo_operacao
    , Case when new.tipo_operacao != 'P' then 'S' else 'N' end
    , 'Cadastro das configuracoes do orgao'
  );
end
^


SET TERM ; ^

COMMENT ON TRIGGER TG_ESOCIAL_CONFIG_ORGAO_EVENTO IS 
'Trigger Gerar Evento S1000 (eSocial - Configuracao Orgao)

    Autor   :   Isaque M. Ribeiro
    Data    :   17/05/2021

Trigger responsavel por gerar a necessidade de processamento do evento "S1000" no
eSocial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    17/05/2021 - IMR :
        + Criacao da trigger na base de dados.';

