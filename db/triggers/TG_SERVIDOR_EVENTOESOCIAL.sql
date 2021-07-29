SET SQL DIALECT 3;


SET TERM ^ ;



CREATE OR ALTER TRIGGER TG_SERVIDOR_EVENTOESOCIAL FOR SERVIDOR
ACTIVE AFTER INSERT OR UPDATE POSITION 1
AS
  declare variable competencia "VARCHAR(6)";
begin
  Select first 1
    c.competencia
  from GET_ESOCIAL_COMPETENCIA_ATIVA c
  Into
    competencia;

  if (new.tipo_operacao = 'I') then
    execute procedure SET_ESOCIAL_GERAR_EVENTOS('S2200'
      , :competencia
      , 'I'
      , 'S'
      , 'Cadastro de Pessoa Fisica/Servidor'
    );
  else
  if (new.tipo_operacao = 'A') then
    execute procedure SET_ESOCIAL_GERAR_EVENTOS('S2206'
      , :competencia
      , 'A'
      , 'S'
      , 'Alteracao de Contrato de Trabalho/ Relacao Estatutaria'
    );
end
^


SET TERM ; ^

COMMENT ON TRIGGER TG_SERVIDOR_EVENTOESOCIAL IS 
'Trigger Gerar Evento S2200 e S2206 (eSocial - Cadastramento Inicial do Vínculo e
Admissao/Ingresso de Trabalhador, Alteracao de Contrato de Trabalho/ Relacao
Estatutaria)

    Autor   :   Isaque M. Ribeiro
    Data    :   06/07/2021

Trigger responsavel por gerar a necessidade de processamento dos eventos "S2200"
e "S2206" no eSocial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    29/07/2021 - IMR :
        * Inclusao do evento S2206.
    23/07/2021 - IMR :
        + Criacao da trigger na base de dados.';

