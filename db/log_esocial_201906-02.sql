/*------ 25/06/2019 23:03:42 --------*/

CREATE TABLE ESOCIAL_TIPO_DEPENDENTE (
    CODIGO     "CHAR(2)" NOT NULL,
    DESCRICAO  "VARCHAR(250)"
);

/*------ 25/06/2019 23:03:42 --------*/

ALTER TABLE ESOCIAL_TIPO_DEPENDENTE ADD CONSTRAINT PK_ESOCIAL_TIPO_DEPENDENTE PRIMARY KEY (CODIGO);

/*------ 25/06/2019 23:03:42 --------*/

COMMENT ON COLUMN ESOCIAL_TIPO_DEPENDENTE.CODIGO IS
'Codigo';

/*------ 25/06/2019 23:03:42 --------*/

COMMENT ON COLUMN ESOCIAL_TIPO_DEPENDENTE.DESCRICAO IS
'Descricao';

/*------ 25/06/2019 23:03:42 --------*/

GRANT ALL ON ESOCIAL_TIPO_DEPENDENTE TO "GERASYS.TI" WITH GRANT OPTION;

/*------ 25/06/2019 23:03:42 --------*/

GRANT ALL ON ESOCIAL_TIPO_DEPENDENTE TO GERASYSTI WITH GRANT OPTION;

/*------ 25/06/2019 23:03:42 --------*/

GRANT ALL ON ESOCIAL_TIPO_DEPENDENTE TO PUBLIC;

/*------ 25/06/2019 23:03:42 --------*/

GRANT ALL ON ESOCIAL_TIPO_DEPENDENTE TO PUBLIC WITH GRANT OPTION;


/*------ GERASYS.TI 25/06/2019 23:04:39 --------*/

ALTER TABLE PESSOA_FISICA_DEPENDENTE
    ADD ID_TIPO_DEPENDENTE "CHAR(2)";

COMMENT ON COLUMN PESSOA_FISICA_DEPENDENTE.ID_TIPO_DEPENDENTE IS
'eSocial - Tipo do Parentesco:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 07';

alter table PESSOA_FISICA_DEPENDENTE
alter ID position 1;

alter table PESSOA_FISICA_DEPENDENTE
alter ID_PESSOA position 2;

alter table PESSOA_FISICA_DEPENDENTE
alter NOME position 3;

alter table PESSOA_FISICA_DEPENDENTE
alter SEXO position 4;

alter table PESSOA_FISICA_DEPENDENTE
alter CPF position 5;

alter table PESSOA_FISICA_DEPENDENTE
alter PARENTESCO position 6;

alter table PESSOA_FISICA_DEPENDENTE
alter ID_TIPO_DEPENDENTE position 7;

alter table PESSOA_FISICA_DEPENDENTE
alter DT_NASCIMENTO position 8;

alter table PESSOA_FISICA_DEPENDENTE
alter NATURAL_CIDADE position 9;

alter table PESSOA_FISICA_DEPENDENTE
alter NATURAL_UF position 10;

alter table PESSOA_FISICA_DEPENDENTE
alter CARTORIO_NOME position 11;

alter table PESSOA_FISICA_DEPENDENTE
alter CARTORIO_CIDADE position 12;

alter table PESSOA_FISICA_DEPENDENTE
alter CARTORIO_UF position 13;

alter table PESSOA_FISICA_DEPENDENTE
alter REGISTRO_NUM position 14;

alter table PESSOA_FISICA_DEPENDENTE
alter REGISTRO_LIVRO position 15;

alter table PESSOA_FISICA_DEPENDENTE
alter REGISTRO_FOLHA position 16;

alter table PESSOA_FISICA_DEPENDENTE
alter DEFICIENTE position 17;

alter table PESSOA_FISICA_DEPENDENTE
alter ATIVO_SAL_FAMILIA position 18;

alter table PESSOA_FISICA_DEPENDENTE
alter ATIVO_IRRF position 19;

alter table PESSOA_FISICA_DEPENDENTE
alter PERC_P_ALIMENT position 20;

alter table PESSOA_FISICA_DEPENDENTE
alter VAL_P_ALIMENT position 21;

alter table PESSOA_FISICA_DEPENDENTE
alter DESCR_PARENTESCO position 22;

alter table PESSOA_FISICA_DEPENDENTE
alter CPF_FTDO position 23;

alter table PESSOA_FISICA_DEPENDENTE
alter ESTUDANTE position 24;

/*------ GERASYS.TI 25/06/2019 23:05:06 --------*/

ALTER TABLE PESSOA_FISICA_DEPENDENTE
ADD CONSTRAINT FK_PESSOA_FISICA_DEPENDENTE_TP
FOREIGN KEY (ID_TIPO_DEPENDENTE)
REFERENCES ESOCIAL_TIPO_DEPENDENTE(CODIGO);

/*------ GERASYS.TI 25/06/2019 23:07:19 --------*/

ALTER TABLE SERVIDOR_DEPENDENTE
    ADD ID_TIPO_DEPENDENTE "CHAR(2)";

COMMENT ON COLUMN SERVIDOR_DEPENDENTE.ID_TIPO_DEPENDENTE IS
'eSocial - Tipo do Parentesco:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 07';

alter table SERVIDOR_DEPENDENTE
alter ID position 1;

alter table SERVIDOR_DEPENDENTE
alter ID_SERVIDOR position 2;

alter table SERVIDOR_DEPENDENTE
alter NOME position 3;

alter table SERVIDOR_DEPENDENTE
alter SEXO position 4;

alter table SERVIDOR_DEPENDENTE
alter PARENTESCO position 5;

alter table SERVIDOR_DEPENDENTE
alter ID_TIPO_DEPENDENTE position 6;

alter table SERVIDOR_DEPENDENTE
alter DT_NASCIMENTO position 7;

alter table SERVIDOR_DEPENDENTE
alter NATURAL_CIDADE position 8;

alter table SERVIDOR_DEPENDENTE
alter NATURAL_UF position 9;

alter table SERVIDOR_DEPENDENTE
alter CARTORIO_NOME position 10;

alter table SERVIDOR_DEPENDENTE
alter CARTORIO_CIDADE position 11;

alter table SERVIDOR_DEPENDENTE
alter CARTORIO_UF position 12;

alter table SERVIDOR_DEPENDENTE
alter REGISTRO_NUM position 13;

alter table SERVIDOR_DEPENDENTE
alter REGISTRO_LIVRO position 14;

alter table SERVIDOR_DEPENDENTE
alter REGISTRO_FOLHA position 15;

alter table SERVIDOR_DEPENDENTE
alter DEFICIENTE position 16;

alter table SERVIDOR_DEPENDENTE
alter ATIVO_SAL_FAMILIA position 17;

alter table SERVIDOR_DEPENDENTE
alter ATIVO_IRRF position 18;

alter table SERVIDOR_DEPENDENTE
alter PERCENT_PENSAO_ALIMENT position 19;

alter table SERVIDOR_DEPENDENTE
alter VALOR_PENSAO_ALIMENT position 20;

alter table SERVIDOR_DEPENDENTE
alter DESCR_PARENTESCO position 21;

/*------ GERASYS.TI 25/06/2019 23:07:44 --------*/

ALTER TABLE SERVIDOR_DEPENDENTE
ADD CONSTRAINT FK_SERVIDOR_DEPENDENTE_TP
FOREIGN KEY (ID_TIPO_DEPENDENTE)
REFERENCES ESOCIAL_TIPO_DEPENDENTE(CODIGO);




/*------ GERASYS.TI 25/06/2019 23:16:09 --------*/

SET TERM ^ ;

CREATE trigger tg_servidor_dependente_esocial for servidor_dependente
active after insert or update position 0
AS
  declare variable tipo_operacao ESOCIAL_OPERACAO;
begin
  Select
    s.tipo_operacao
  from SERVIDOR s
  where (s.id = new.id_servidor)
  Into
    tipo_operacao;

  if (coalesce(tipo_operacao, 'P') = 'P') then
  begin
    Update SERVIDOR s Set
        s.tipo_operacao = 'A'
      , s.data_operacao = current_date
    where (s.id = new.id_servidor);
  end 
end^

SET TERM ; ^




/*------ GERASYS.TI 25/06/2019 23:18:11 --------*/

SET TERM ^ ;

CREATE trigger tg_pessoa_fisica_depend_esocial for pessoa_fisica_dependente
active after insert or update position 0
AS
  declare variable tipo_operacao ESOCIAL_OPERACAO;
begin
  Select
    p.tipo_operacao
  from PESSOA_FISICA p
  where (p.id = new.id_pessoa)
  Into
    tipo_operacao;

  if (coalesce(tipo_operacao, 'P') = 'P') then
  begin
    Update PESSOA_FISICA p Set
        p.tipo_operacao = 'A'
      , p.data_operacao = current_date
    where (p.id = new.id_pessoa);
  end 
end^

SET TERM ; ^

