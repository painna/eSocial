SET SQL DIALECT 3;


SET TERM ^ ;



CREATE OR ALTER TRIGGER TG_PESSOA_FISICA_EVENTOESOCIAL FOR PESSOA_FISICA
ACTIVE AFTER UPDATE POSITION 1
AS
  declare variable competencia "VARCHAR(6)";
begin
  Select first 1
    c.competencia
  from GET_ESOCIAL_COMPETENCIA_ATIVA c
  Into
    competencia;

  if (new.tipo_operacao = 'A') then
    execute procedure SET_ESOCIAL_GERAR_EVENTOS('S2205'
      , :competencia
      , 'A'
      , 'S'
      , 'Alteracao de Dados Cadastrais do Servidor'
    );
end
^


SET TERM ; ^

COMMENT ON TRIGGER TG_PESSOA_FISICA_EVENTOESOCIAL IS 
'Trigger Gerar Evento S2205 (eSocial - Alteracao de Contrato de Trabalho/Relacao
Estatutaria)

    Autor   :   Isaque M. Ribeiro
    Data    :   29/07/2021

Trigger responsavel por gerar a necessidade de processamento do evento "S2205"
no eSocial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    29/07/2021 - IMR :
        + Criacao da trigger na base de dados.';

