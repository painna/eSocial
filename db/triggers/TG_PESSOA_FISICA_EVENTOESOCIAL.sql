SET SQL DIALECT 3;


SET TERM ^ ;



CREATE OR ALTER TRIGGER TG_PESSOA_FISICA_EVENTOESOCIAL FOR PESSOA_FISICA
ACTIVE AFTER INSERT OR UPDATE POSITION 1
AS
  declare variable competencia "VARCHAR(6)";
begin
  Select first 1
    c.competencia
  from GET_ESOCIAL_COMPETENCIA_ATIVA c
  Into
    competencia;

  execute procedure SET_ESOCIAL_GERAR_EVENTOS('S2200'
    , :competencia
    , new.tipo_operacao
    , Case when new.tipo_operacao != 'P' then 'S' else 'N' end
    , 'Cadastro de Pessoa Fisica/Servidor'
  );
end
^


SET TERM ; ^

COMMENT ON TRIGGER TG_PESSOA_FISICA_EVENTOESOCIAL IS 
'Trigger Gerar Evento S2200 (eSocial - Cadastramento Inicial do Vínculo e Admissao/Ingresso de Trabalhador)

    Autor   :   Isaque M. Ribeiro
    Data    :   06/07/2021

Trigger responsavel por gerar a necessidade de processamento do evento "S2200" no
eSocial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    23/07/2021 - IMR :
        + Criacao da trigger na base de dados.';

