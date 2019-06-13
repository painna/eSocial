/*------ GERASYS.TI 13/06/2019 10:47:09 --------*/

CREATE DOMAIN "VARCHAR(260)" AS
VARCHAR(260);

CREATE DOMAIN "VARCHAR(270)" AS
VARCHAR(270);

/*------ 13/06/2019 10:51:55 --------*/

CREATE TABLE ESOCIAL_CATEGORIA_TRAB (
    CODIGO     "CHAR(3)" NOT NULL,
    DESCRICAO  "VARCHAR(270)"
);

/*------ 13/06/2019 10:51:55 --------*/

ALTER TABLE ESOCIAL_CATEGORIA_TRAB ADD CONSTRAINT PK_ESOCIAL_CATEGORIA_TRAB PRIMARY KEY (CODIGO);

/*------ 13/06/2019 10:51:55 --------*/

GRANT ALL ON ESOCIAL_CATEGORIA_TRAB TO "GERASYS.TI" WITH GRANT OPTION;

/*------ 13/06/2019 10:51:55 --------*/

GRANT ALL ON ESOCIAL_CATEGORIA_TRAB TO GERASYSTI WITH GRANT OPTION;

/*------ 13/06/2019 10:51:55 --------*/

GRANT ALL ON ESOCIAL_CATEGORIA_TRAB TO PUBLIC WITH GRANT OPTION;

/*------ GERASYS.TI 13/06/2019 11:05:34 --------*/

ALTER TABLE SERVIDOR
    ADD ID_ENTID_SINDICAL "INTEGER",
    ADD CONSELHO_ORGAO "VARCHAR(10)",
    ADD CONSELHO_UF "CHAR(2)" DEFAULT 'PA',
    ADD CONSELHO_DT_EMISSAO "DATE",
    ADD CONSELHO_DT_VALIDADE "DATE",
    ADD TIPO_OPERACAO ESOCIAL_OPERACAO,
    ADD DATA_OPERACAO ESOCIAL_DATA,
    ADD CATEGORIA_TRAB "CHAR(3)";

COMMENT ON COLUMN SERVIDOR.ID_ENTID_SINDICAL IS
'eSocial - Entidade Sincical da Categoria';

COMMENT ON COLUMN SERVIDOR.CONSELHO_REGISTRO IS
'eSocial - (OC - Orgao da Classe) - Registro/numero no conselho';

COMMENT ON COLUMN SERVIDOR.CONSELHO_ORGAO IS
'eSocial - (OC - Orgao da Classe) - Orgao do conselho';

COMMENT ON COLUMN SERVIDOR.CONSELHO_UF IS
'eSocial - (OC - Orgao da Classe) - UF dpo conselho';

COMMENT ON COLUMN SERVIDOR.CONSELHO_DT_EMISSAO IS
'eSocial - (OC - Orgao da Classe) - Data de emissao do registro';

COMMENT ON COLUMN SERVIDOR.CONSELHO_DT_VALIDADE IS
'eSocial - (OC - Orgao da Classe) - Data de validade do registro';

COMMENT ON COLUMN SERVIDOR.TIPO_OPERACAO IS
'eSocial - Operacao do registro:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';

COMMENT ON COLUMN SERVIDOR.DATA_OPERACAO IS
'eSocial - Data da operacao de insercao ou edicao do registro';

COMMENT ON COLUMN SERVIDOR.CATEGORIA_TRAB IS
'eSocial - Categoria do Trabalhador:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 01';

alter table SERVIDOR
alter ID position 1;

alter table SERVIDOR
alter ID_PESSOA_FISICA position 2;

alter table SERVIDOR
alter MATRICULA position 3;

alter table SERVIDOR
alter EFETIVO position 4;

alter table SERVIDOR
alter DT_CONCURSO position 5;

alter table SERVIDOR
alter DT_ADMISSAO position 6;

alter table SERVIDOR
alter DT_READMISSAO position 7;

alter table SERVIDOR
alter DOCTO_ADMISSAO position 8;

alter table SERVIDOR
alter ANO_PRIM_EMPREGO position 9;

alter table SERVIDOR
alter ID_ENTID_SINDICAL position 10;

alter table SERVIDOR
alter ID_SITUACAO_TCM position 11;

alter table SERVIDOR
alter ID_SUB_UNID_ORCAMENT position 12;

alter table SERVIDOR
alter ID_UNID_LOTACAO position 13;

alter table SERVIDOR
alter ID_DEPTO position 14;

alter table SERVIDOR
alter ID_CARGO_ORIGEM position 15;

alter table SERVIDOR
alter ID_CARGO_ATUAL position 16;

alter table SERVIDOR
alter REF_SALARIO position 17;

alter table SERVIDOR
alter VENCTO_BASE position 18;

alter table SERVIDOR
alter ID_ESCOLARIDADE position 19;

alter table SERVIDOR
alter FORMACAO position 20;

alter table SERVIDOR
alter CONSELHO_REGISTRO position 21;

alter table SERVIDOR
alter CONSELHO_ORGAO position 22;

alter table SERVIDOR
alter CONSELHO_UF position 23;

alter table SERVIDOR
alter CONSELHO_DT_EMISSAO position 24;

alter table SERVIDOR
alter CONSELHO_DT_VALIDADE position 25;

alter table SERVIDOR
alter CARGA_HOR_MENSAL position 26;

alter table SERVIDOR
alter QTD_DEPEND_IRRF position 27;

alter table SERVIDOR
alter CALC_VENCTO_BASE position 28;

alter table SERVIDOR
alter BLOQ_LANCTO_EVENTO_AUTO position 29;

alter table SERVIDOR
alter CALC_PREVID position 30;

alter table SERVIDOR
alter CALC_IRRF position 31;

alter table SERVIDOR
alter ID_EST_FUNCIONAL position 32;

alter table SERVIDOR
alter HORA_ENTRADA1 position 33;

alter table SERVIDOR
alter HORA_SAIDA1 position 34;

alter table SERVIDOR
alter HORA_ENTRADA2 position 35;

alter table SERVIDOR
alter HORA_SAIDA2 position 36;

alter table SERVIDOR
alter OBSERVACAO position 37;

alter table SERVIDOR
alter STATUS position 38;

alter table SERVIDOR
alter DESCR_SITUAC_TCM position 39;

alter table SERVIDOR
alter DESCR_SUB_UNID_ORCAMENT position 40;

alter table SERVIDOR
alter DESCR_SUB_UNID_ORCAM2 position 41;

alter table SERVIDOR
alter ID_UNID_GESTORA position 42;

alter table SERVIDOR
alter DESCR_UNID_LOTACAO position 43;

alter table SERVIDOR
alter DESCR_DEPTO position 44;

alter table SERVIDOR
alter DESCR_CARGO_ORIGEM position 45;

alter table SERVIDOR
alter DESCR_CARGO_ATUAL position 46;

alter table SERVIDOR
alter DESCR_ESCOLARIDADE position 47;

alter table SERVIDOR
alter DESCR_EST_FUNCIONAL position 48;

alter table SERVIDOR
alter NOME_SERVIDOR position 49;

alter table SERVIDOR
alter TIPO_SAL position 50;

alter table SERVIDOR
alter FORMA_CALC_SAL position 51;

alter table SERVIDOR
alter BASE_CALC_HORA_AULA position 52;

alter table SERVIDOR
alter MOVIM_DEFINITIVA position 53;

alter table SERVIDOR
alter CPF_PF position 54;

alter table SERVIDOR
alter PIS_PASEP_PF position 55;

alter table SERVIDOR
alter DT_NASCIMENTO_PF position 56;

alter table SERVIDOR
alter ID_RACA_COR_PF position 57;

alter table SERVIDOR
alter DESCR_RACA_COR position 58;

alter table SERVIDOR
alter DESCR_EFETIVO position 59;

alter table SERVIDOR
alter NAO_CALCULAR_ATS position 60;

alter table SERVIDOR
alter DT_ADMISSAO2 position 61;

alter table SERVIDOR
alter ID_SYS_ANTER position 62;

alter table SERVIDOR
alter ID_HORARIO position 63;

alter table SERVIDOR
alter CALC_SAL_CARGO_ORIGEM position 64;

alter table SERVIDOR
alter DESCR_HORARIO position 65;

alter table SERVIDOR
alter REF_SAL_INICIAL position 66;

alter table SERVIDOR
alter DT_BASE_CALC_ATS position 67;

alter table SERVIDOR
alter DESVIO_DE_FUNCAO position 68;

alter table SERVIDOR
alter CATEG_SEFIP position 69;

alter table SERVIDOR
alter OCORRENCIA_SEFIP position 70;

alter table SERVIDOR
alter CPF_FTDO position 71;

alter table SERVIDOR
alter PIS_PASEP_FTDO position 72;

alter table SERVIDOR
alter CONTRA_CHEQUE_WEB position 73;

alter table SERVIDOR
alter NAO_CALC_SAL_FAM position 74;

alter table SERVIDOR
alter GRUPO_C_CHEQUE position 75;

alter table SERVIDOR
alter PARENT_INST_PENSAO position 76;

alter table SERVIDOR
alter ID_INST_PENSAO position 77;

alter table SERVIDOR
alter TIPO_OPERACAO position 78;

alter table SERVIDOR
alter DATA_OPERACAO position 79;

alter table SERVIDOR
alter CATEGORIA_TRAB position 80;

/*------ GERASYS.TI 13/06/2019 11:05:45 --------*/

UPDATE SERVIDOR
SET TIPO_OPERACAO = 'I';

/*------ GERASYS.TI 13/06/2019 11:06:59 --------*/

ALTER TABLE SERVIDOR
ADD CONSTRAINT FK_SERVIDOR_SINDICATO
FOREIGN KEY (ID_ENTID_SINDICAL)
REFERENCES ENTID_SINDICAL(ID);

ALTER TABLE SERVIDOR
ADD CONSTRAINT FK_SERVIDOR_CATEGORIA
FOREIGN KEY (CATEGORIA_TRAB)
REFERENCES ESOCIAL_CATEGORIA_TRAB(CODIGO);

/*------ GERASYS.TI 13/06/2019 11:11:21 --------*/

Update SERVIDOR s Set
  s.data_operacao = s.dt_admissao
where s.dt_admissao is not null
  and s.data_operacao is null
;

/*------ GERASYS.TI 13/06/2019 11:11:26 --------*/

COMMIT WORK;

/*------ 13/06/2019 11:17:10 --------*/

CREATE trigger tg_servidor_esocial_oper for servidor
active before insert or update position 0
AS
begin
  if (inserting) then
    -- Inserir registro no eSocial
    new.tipo_operacao = 'I';
    if (new.data_operacao is null) then
      new.data_operacao = current_date;
  else
  if (updating) then
  begin
    -- Atualizar registro no eSocial, caso sua insercao ou edicao anterior ja tenham sidos processados
    if (coalesce(old.tipo_operacao, 'P') = 'P') then
      new.tipo_operacao = 'A';
    if ((old.data_operacao is null) and (new.data_operacao is null)) then
      new.data_operacao = current_date;
  end
end;

/*------ GERASYS.TI 13/06/2019 11:27:10 --------*/

COMMENT ON DOMAIN ESOCIAL_SMALLINT IS 'eSocial - Inteiro de baixo valor';

/*------ GERASYS.TI 13/06/2019 11:28:18 --------*/

ALTER TABLE TAB_RACA_COR
    ADD ID_ESOCIAL ESOCIAL_SMALLINT DEFAULT 6;

COMMENT ON COLUMN TAB_RACA_COR.ID_ESOCIAL IS
'eSocial - Identificacao da Raça e cor do trabalhador:
1 - Branca
2 - Preta
3 - Parda
4 - Amarela
5 - Indígena
6 - Não informado';

/*------ GERASYS.TI 13/06/2019 11:37:06 --------*/

ALTER TABLE ESTADO_CIVIL
    ADD ID_ESOCIAL ESOCIAL_SMALLINT;

COMMENT ON COLUMN ESTADO_CIVIL.ID_ESOCIAL IS
'eSocial - Identificacao do Estado civil do trabalhador, conforme opções abaixo:
1 - Solteiro
2 - Casado
3 - Divorciado
4 - Separado
5 - Viúvo';

/*------ GERASYS.TI 13/06/2019 11:47:21 --------*/

ALTER TABLE ESCOLARIDADE
    ADD ID_ESOCIAL "CHAR(2)";

COMMENT ON COLUMN ESCOLARIDADE.ID_ESOCIAL IS
'eSocial - Identificacao do Grau de instrução do trabalhador, conforme opções abaixo:
01 - Analfabeto, inclusive o que, embora tenha recebido instrução, não se alfabetizou
02 - Até o 5º ano incompleto do Ensino Fundamental (antiga 4ª série) ou que se tenha alfabetizado sem ter frequentado escola regular
03 - 5º ano completo do Ensino Fundamental
04 - Do 6º ao 9º ano do Ensino Fundamental incompleto (antiga 5ª a 8ª série)
05 - Ensino Fundamental Completo
06 - Ensino Médio incompleto
07 - Ensino Médio completo
08 - Educação Superior incompleta
09 - Educação Superior completa
10 - Pós-Graduação completa
11 - Mestrado completo
12 - Doutorado completo';

/*------ GERASYS.TI 13/06/2019 11:54:19 --------*/

ALTER TABLE NACIONALIDADE
    ADD ID_ESOCIAL "CHAR(3)";

COMMENT ON COLUMN NACIONALIDADE.ID_ESOCIAL IS
'eSocial - Pais de Nascimento:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 06';

/*------ 13/06/2019 12:06:59 --------*/

CREATE TABLE ESOCIAL_TIPO_LOGRADOURO (
    CODIGO     "VARCHAR(5)" NOT NULL,
    DESCRICAO  "VARCHAR(30)"
);

/*------ 13/06/2019 12:06:59 --------*/

ALTER TABLE ESOCIAL_TIPO_LOGRADOURO
ADD CONSTRAINT PK_ESOCIAL_TIPO_LOGRADOURO
PRIMARY KEY (CODIGO);

/*------ 13/06/2019 12:06:59 --------*/

GRANT ALL ON ESOCIAL_TIPO_LOGRADOURO TO "GERASYS.TI" WITH GRANT OPTION;

/*------ 13/06/2019 12:06:59 --------*/

GRANT ALL ON ESOCIAL_TIPO_LOGRADOURO TO GERASYSTI WITH GRANT OPTION;

/*------ 13/06/2019 12:06:59 --------*/

GRANT ALL ON ESOCIAL_TIPO_LOGRADOURO TO PUBLIC;

/*------ 13/06/2019 12:06:59 --------*/

GRANT ALL ON ESOCIAL_TIPO_LOGRADOURO TO PUBLIC WITH GRANT OPTION;



/*------ GERASYS.TI 13/06/2019 12:12:06 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
P.ENDER_TIPO.
At line 60, column 9.

*/


/*------ GERASYS.TI 13/06/2019 12:13:07 --------*/

ALTER TABLE PESSOA_FISICA
    ADD ID_NATURAL_CIDADE "INTEGER";

COMMENT ON COLUMN PESSOA_FISICA.ID_NATURAL_CIDADE IS
'eSocial - Codigo do Municipio de nascimento conforme a tabela do IBGE.';

