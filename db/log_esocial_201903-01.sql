

/*------ 05/03/2019 11:45:53 --------*/

CREATE DOMAIN SIM_NAO AS
  CHAR(1)
  DEFAULT 'N'
  NOT NULL
  CHECK (Value in ('S', 'N'));

/*------ 05/03/2019 11:45:53 --------*/

CREATE DOMAIN ESOCIAL_ALIQUOTA_RAT AS
  SMALLINT
  DEFAULT 1
  CHECK (value in (1, 2, 3));

/*------ 05/03/2019 11:45:53 --------*/

CREATE DOMAIN ESOCIAL_DATA AS
  DATE;

/*------ 05/03/2019 11:45:53 --------*/

CREATE DOMAIN ESOCIAL_SMALLINT AS
  SMALLINT;

/*------ 05/03/2019 11:45:53 --------*/

CREATE DOMAIN ESOCIAL_TIPO_2 AS
  CHAR(1)
  DEFAULT '1'
  NOT NULL
  CHECK (value in ('1', '2'));

/*------ 05/03/2019 11:45:53 --------*/

CREATE DOMAIN ESOCIAL_TIPO_4 AS
  CHAR(10)
  DEFAULT '1'
  NOT NULL
  CHECK (value in ('1', '2', '3', '4'));

/*------ 05/03/2019 11:45:53 --------*/

CREATE DOMAIN ESOCIAL_OPERACAO AS
  CHAR(1)
  DEFAULT 'I'
  NOT NULL
  CHECK (value in ('I', 'A', 'E', 'P'));

/*------ 05/03/2019 11:45:54 --------*/

CREATE TABLE CONFIG_ESOCIAL (
  ID_CONFIG_ORGAO "INTEGER" NOT NULL,
  ID_UNID_GESTORA "INTEGER",
  CONTADOR_NOME "VARCHAR(50)",
  CONTADOR_CPF "VARCHAR(11)",
  CONTADOR_FONEFIXO "VARCHAR(10)",
  CONTADOR_FONECELULAR "VARCHAR(11)",
  CONTADOR_EMAIL "VARCHAR(60)",
  RESPONSAVEL_NOME "VARCHAR(50)",
  RESPONSAVEL_CPF "VARCHAR(11)",
  RESPONSAVEL_FONEFIXO "VARCHAR(10)",
  RESPONSAVEL_FONECELULAR "VARCHAR(11)",
  RESPONSAVEL_EMAIL "VARCHAR(60)",
  NAT_JURIDICA "CHAR(5)",
  NRO_SIAFI "VARCHAR(8)",
  SUBTETO_VENCTO_TIPO "CHAR(1)" DEFAULT '9' NOT NULL,
  SUBTETO_VENCTO_VALOR "NUMERIC(15,2)",
  POSSUI_RPPS "CHAR(1)" DEFAULT 'N' NOT NULL,
  POSSUI_TABELA_CARREIRA SIM_NAO NOT NULL,
  TIPO_OPERACAO ESOCIAL_OPERACAO NOT NULL,
  DATA_IMPLANTACAO "DATE");

/*------ 05/03/2019 11:45:54 --------*/

ALTER TABLE CONFIG_ESOCIAL ADD CONSTRAINT PK_CONFIG_ESOCIAL PRIMARY KEY (ID_CONFIG_ORGAO);

/*------ 05/03/2019 11:45:54 --------*/

ALTER TABLE CONFIG_ESOCIAL ADD CONSTRAINT FK_CONFIG_ESOCIAL_ORG FOREIGN KEY (ID_CONFIG_ORGAO) REFERENCES CONFIG_ORGAO(ID) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 05/03/2019 11:45:54 --------*/

ALTER TABLE CONFIG_ESOCIAL ADD CONSTRAINT FK_CONFIG_ESOCIAL_UNG FOREIGN KEY (ID_UNID_GESTORA) REFERENCES UNID_GESTORA(ID) ON DELETE CASCADE ON UPDATE CASCADE;


/*------ GERASYS.TI 05/03/2019 11:49:05 --------*/

ALTER TABLE CONFIG_ORGAO
    ADD ID_SERVID_FISCAL "INTEGER",
    ADD TIPO_OPERACAO ESOCIAL_OPERACAO;

COMMENT ON COLUMN CONFIG_ORGAO.ID_SERVID_FISCAL IS
'eSocial - Servidor responsavel pela fiscalizacao do ambiente de trabalho/risco.';

COMMENT ON COLUMN CONFIG_ORGAO.TIPO_OPERACAO IS
'eSocial - Operacao do registro:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';

alter table CONFIG_ORGAO
alter ID position 1;

alter table CONFIG_ORGAO
alter RAZAO_SOCIAL position 2;

alter table CONFIG_ORGAO
alter SIGLA position 3;

alter table CONFIG_ORGAO
alter CNPJ position 4;

alter table CONFIG_ORGAO
alter TIPO_ORGAO position 5;

alter table CONFIG_ORGAO
alter ENDER_LOGRAD position 6;

alter table CONFIG_ORGAO
alter ENDER_NUM position 7;

alter table CONFIG_ORGAO
alter ENDER_BAIRRO position 8;

alter table CONFIG_ORGAO
alter ENDER_CIDADE position 9;

alter table CONFIG_ORGAO
alter ENDER_CEP position 10;

alter table CONFIG_ORGAO
alter ENDER_UF position 11;

alter table CONFIG_ORGAO
alter TELEFONE position 12;

alter table CONFIG_ORGAO
alter NOME_DIR_DRH position 13;

alter table CONFIG_ORGAO
alter COD_CNAE position 14;

alter table CONFIG_ORGAO
alter COD_FPAS position 15;

alter table CONFIG_ORGAO
alter COD_NATUREZA_JURIDICA position 16;

alter table CONFIG_ORGAO
alter COD_MUNICIPIO_RAIS position 17;

alter table CONFIG_ORGAO
alter COD_MUNICIPIO_TCM position 18;

alter table CONFIG_ORGAO
alter BRASAO position 19;

alter table CONFIG_ORGAO
alter LOGO_ADMIN position 20;

alter table CONFIG_ORGAO
alter VER_EXE position 21;

alter table CONFIG_ORGAO
alter DT_VER_EXE position 22;

alter table CONFIG_ORGAO
alter NOME_PASTA_ATUALIZA_EXE position 23;

alter table CONFIG_ORGAO
alter TIPO_CONTRA_CHEQUE position 24;

alter table CONFIG_ORGAO
alter DESCR_TIPO_ORGAO position 25;

alter table CONFIG_ORGAO
alter ID_SERVID_GESTOR position 26;

alter table CONFIG_ORGAO
alter NOME_SERVID_GESTOR position 27;

alter table CONFIG_ORGAO
alter ID_SERVID_FISCAL position 28;

alter table CONFIG_ORGAO
alter ANO_MES_TRAVA position 29;

alter table CONFIG_ORGAO
alter COD_CLI_RH_TRANSP position 30;

alter table CONFIG_ORGAO
alter COD_ORGAO_TCM position 31;

alter table CONFIG_ORGAO
alter COD_HASH_DRH_TRANSP position 32;

alter table CONFIG_ORGAO
alter E_MAIL position 33;

alter table CONFIG_ORGAO
alter PRAZO_LICENCA position 34;

alter table CONFIG_ORGAO
alter TIPO_OPERACAO position 35;




/*------ GERASYS.TI 05/03/2019 11:49:17 --------*/

UPDATE CONFIG_ORGAO
SET TIPO_OPERACAO = 'I';




/*------ GERASYS.TI 05/03/2019 11:58:25 --------*/

SET TERM ^ ;

CREATE trigger tg_config_orgao_esocial_oper for config_orgao
active before insert or update position 0
AS
begin
  if (inserting) then
    -- Inserir registro no eSocial
    new.tipo_operacao = 'I';
  else
  if (updating) then
  begin
    -- Atualizar registro no eSocial, caso sua insercao ou edicao anterior ja tenham sidos processados
    if (coalesce(old.tipo_operacao, 'P') = 'P') then
      new.tipo_operacao = 'A';
  end
end^

SET TERM ; ^



/*------ 05/03/2019 12:06:23 --------*/

CREATE TABLE ESOCIAL_NATUREZA_JURIDICA (
  CODIGO "CHAR(5)" NOT NULL,
  DESCRICAO "VARCHAR(240)");

/*------ 05/03/2019 12:06:23 --------*/

ALTER TABLE ESOCIAL_NATUREZA_JURIDICA ADD CONSTRAINT PK_ESOCIAL_NATUREZA_JURIDICA PRIMARY KEY (CODIGO);

/* Privileges of users */
GRANT ALL ON CONFIG_ESOCIAL TO "GERASYS.TI" WITH GRANT OPTION;

/* Privileges of users */
GRANT ALL ON ESOCIAL_NATUREZA_JURIDICA TO "GERASYS.TI" WITH GRANT OPTION;




/*------ GERASYS.TI 05/03/2019 12:10:29 --------*/

ALTER TABLE UNID_GESTORA
    ADD TIPO_OPERACAO ESOCIAL_OPERACAO,
    ADD CNAE_PREP "VARCHAR(10)",
    ADD REGIME_PONTO "CHAR(1)",
    ADD CONTRATA_PCD "CHAR(1)",
    ADD NAT_JURIDICA "CHAR(5)",
    ADD NRO_SIAFI "VARCHAR(8)";

COMMENT ON COLUMN UNID_GESTORA.TIPO_OPERACAO IS
'eSocial - Operacao do registro:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';

COMMENT ON COLUMN UNID_GESTORA.CNAE_PREP IS
'eSocial - CNAE Prepoderante da Unidade Gestora para o evento S1005.';

COMMENT ON COLUMN UNID_GESTORA.REGIME_PONTO IS
'eSocial - Regime dde Ponto (Jornada) da Unidade Gestora para o evento S1005.

0 - Nao utiliza
1 - Manual
2 - Mecanico
3 - Eletronico (portaria MTE 1.510/2009)
4 - Nao eletronico alternativo (art. 1o. da Portaria MTE 373/2011)
5 - Eletronico alternativo (art. 2o. da Portaria MTE 373/2011)
6 - Eletronico - outros';

COMMENT ON COLUMN UNID_GESTORA.CONTRATA_PCD IS
'eSocial - Tipo de contratacao de PCD (Pessoas com Deficiencia) da Unidade Gestora para o evento S1005.

0 - Dispensado de acordo com a lei
1 - Dispensado, mesmo que parcialmente, em virtude de processo judicial
2 - Com exigibilidade suspensa, mesmo que parcialmente em virtude de Termo de Compromisso firmado com o Ministerio do Trabalho
9 - Obrigado';

COMMENT ON COLUMN UNID_GESTORA.NAT_JURIDICA IS
'eSocial - Natureza Juridica:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 21';

COMMENT ON COLUMN UNID_GESTORA.NRO_SIAFI IS
'eSocial - Preencher com o numero SIAFI (Sistema Integrado de Administracao Financeira), caso seja orgao publico usuario do sistema.

Pesquisar em: http://consulta.tesouro.fazenda.gov.br/ug_novosite/index_ug.asp';




/*------ GERASYS.TI 05/03/2019 12:10:36 --------*/

UPDATE UNID_GESTORA
SET TIPO_OPERACAO = 'I';



/*------ 05/03/2019 12:10:49 --------*/

ALTER TABLE UNID_GESTORA ADD CONSTRAINT FK_UNID_GESTORA_NATJUD FOREIGN KEY (NAT_JURIDICA) REFERENCES ESOCIAL_NATUREZA_JURIDICA(CODIGO);

/*------ GERASYS.TI 05/03/2019 12:43:29 --------*/

CREATE DOMAIN "VARCHAR(150)" AS
VARCHAR(150);



/*------ 05/03/2019 12:44:14 --------*/

CREATE TABLE ESOCIAL_NATUREZA_RUBRICA (
  CODIGO "CHAR(5)" NOT NULL,
  NOME "VARCHAR(150)",
  DESCRICAO BLOB_SUB_TYPE_0,
  DESCONTO "CHAR(1)" DEFAULT 'N');

/*------ 05/03/2019 12:44:14 --------*/

ALTER TABLE ESOCIAL_NATUREZA_RUBRICA ADD CONSTRAINT PK_ESOCIAL_NATUREZA_RUBRICA PRIMARY KEY (CODIGO);

/*------ 05/03/2019 12:44:14 --------*/

GRANT ALL ON ESOCIAL_NATUREZA_RUBRICA TO "GERASYS.TI" WITH GRANT OPTION;


/*------ GERASYS.TI 05/03/2019 12:58:54 --------*/

SET TERM ^ ;

CREATE trigger tg_unid_gestora_esocial_oper for unid_gestora
active before insert or update position 0
AS
begin
  if (inserting) then
    -- Inserir registro no eSocial
    new.tipo_operacao = 'I';
  else
  if (updating) then
  begin
    -- Atualizar registro no eSocial, caso sua insercao ou edicao anterior ja tenham sidos processados
    if (coalesce(old.tipo_operacao, 'P') = 'P') then
      new.tipo_operacao = 'A';
  end
end^

SET TERM ; ^




/*------ GERASYS.TI 05/03/2019 13:08:30 --------*/

ALTER TABLE EVENTO
    ADD INCIDE_FGTS SIM_NAO DEFAULT 'N',
    ADD INCIDE_SIND SIM_NAO DEFAULT 'N',
    ADD TIPO_OPERACAO ESOCIAL_OPERACAO,
    ADD NAT_RUBRICA "CHAR(5)";

COMMENT ON COLUMN EVENTO.INCIDE_FGTS IS
'eSocial - Incidencia da rubrica para o FGTS:
N - Nao
S - Sim';

COMMENT ON COLUMN EVENTO.INCIDE_SIND IS
'eSocial - Incidencia da rubrica para Contribuicao Sindical Laboral:
N - Nao
S - Sim';

COMMENT ON COLUMN EVENTO.TIPO_OPERACAO IS
'eSocial - Operacao do registro no eSocial:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';

COMMENT ON COLUMN EVENTO.NAT_RUBRICA IS
'eSocial - Natureza da Rubrica da Folha de Pagamento:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 03';

alter table EVENTO
alter ID position 1;

alter table EVENTO
alter DESCRICAO position 2;

alter table EVENTO
alter CODIGO position 3;

alter table EVENTO
alter TIPO position 4;

alter table EVENTO
alter FORMA_CALC position 5;

alter table EVENTO
alter ID_CATEG position 6;

alter table EVENTO
alter ID_CATEG_TCM position 7;

alter table EVENTO
alter PERCENT_HORA_EXTRA position 8;

alter table EVENTO
alter HE_SOBRE_HORA_NORMAL position 9;

alter table EVENTO
alter TIPO_BASE_CALC position 10;

alter table EVENTO
alter INCIDE_SAL_FAMILIA position 11;

alter table EVENTO
alter INCIDE_ATS position 12;

alter table EVENTO
alter INCIDE_FERIAS position 13;

alter table EVENTO
alter INCIDE_DEC_TERC position 14;

alter table EVENTO
alter INCIDE_FALTA position 15;

alter table EVENTO
alter INCIDE_PREVID position 16;

alter table EVENTO
alter INCIDE_IRRF position 17;

alter table EVENTO
alter INCIDE_OUTRA_BC1 position 18;

alter table EVENTO
alter INCIDE_OUTRA_BC2 position 19;

alter table EVENTO
alter INCIDE_OUTRA_BC3 position 20;

alter table EVENTO
alter INCIDE_FGTS position 21;

alter table EVENTO
alter INCIDE_SIND position 22;

alter table EVENTO
alter VALOR_FIXO position 23;

alter table EVENTO
alter DIVISOR position 24;

alter table EVENTO
alter SUBDIVISOR position 25;

alter table EVENTO
alter MAX_X_VENCTO_BASE position 26;

alter table EVENTO
alter GERA_RAIS position 27;

alter table EVENTO
alter COPIA_MES_ANTERIOR position 28;

alter table EVENTO
alter PERMITIR_USUARIO_ALTER position 29;

alter table EVENTO
alter DESCR_CATEGORIA position 30;

alter table EVENTO
alter DESCR_CATEG_TCM position 31;

alter table EVENTO
alter DESCR_FORMA_CALC position 32;

alter table EVENTO
alter DESCR_BASE_CALC position 33;

alter table EVENTO
alter SEM_USO position 34;

alter table EVENTO
alter ID_SYS_ANTER position 35;

alter table EVENTO
alter CONT_COD_ITEM position 36;

alter table EVENTO
alter CONT_SUB_ELEMEN_DESP position 37;

alter table EVENTO
alter CONT_CONTA_CORRENTE position 38;

alter table EVENTO
alter BC_MARGEM_CONSIG position 39;

alter table EVENTO
alter VAL_BC_FIXA position 40;

alter table EVENTO
alter NATUREZA position 41;

alter table EVENTO
alter REMUNERAC position 42;

alter table EVENTO
alter LEGALIDADE position 43;

alter table EVENTO
alter INCIDE_PREVID_MUN position 44;

alter table EVENTO
alter QTDE_PADRAO position 45;

alter table EVENTO
alter PROPORC_CH position 46;

alter table EVENTO
alter TIPO_OPERACAO position 47;

alter table EVENTO
alter NAT_RUBRICA position 48;




/*------ GERASYS.TI 05/03/2019 13:08:37 --------*/

UPDATE EVENTO
SET TIPO_OPERACAO = 'I';



/*------ 05/03/2019 13:09:40 --------*/

ALTER TABLE EVENTO ADD CONSTRAINT FK_EVENTO_NATRUB FOREIGN KEY (NAT_RUBRICA) REFERENCES ESOCIAL_NATUREZA_RUBRICA(CODIGO);

/*------ 05/03/2019 13:09:40 --------*/

CREATE INDEX IDX_EVENTO_NATUREZA_RUBRICA ON EVENTO(NAT_RUBRICA);

/*------ 05/03/2019 13:09:40 --------*/

CREATE INDEX IDX_EVENTO_TIPO_OPERACAO ON EVENTO(TIPO_OPERACAO);


/*------ GERASYS.TI 05/03/2019 13:17:42 --------*/

SET TERM ^ ;

CREATE trigger tg_evento_esocial_oper for evento
active before insert or update position 0
AS
begin
  if (inserting) then
    -- Inserir registro no eSocial
    new.tipo_operacao = 'I';
  else
  if (updating) then
  begin
    -- Atualizar registro no eSocial, caso sua insercao ou edicao anterior ja tenham sidos processados
    if (coalesce(old.tipo_operacao, 'P') = 'P') then
      new.tipo_operacao = 'A';
  end
end^

SET TERM ; ^



/*------ 24/05/2019 14:31:06 --------*/

CREATE OR ALTER VIEW VW_TIPO_SUBTETO(
    CODIGO,
    DESCRICAO)
AS
Select '1' as Codigo, 'Executivo' as Descricao from rdb$database Union
Select '2' as Codigo, 'Judiciário' as Descricao from rdb$database Union
Select '3' as Codigo, 'Legislativo' as Descricao from rdb$database Union
Select '9' as Codigo, 'Todos os poderes' as Descricao from rdb$database;

/*------ 24/05/2019 14:31:06 --------*/

GRANT ALL ON VW_TIPO_SUBTETO TO "GERASYS.TI" WITH GRANT OPTION;

/*------ 24/05/2019 14:31:06 --------*/

GRANT ALL ON VW_TIPO_SUBTETO TO PUBLIC;

/*------ 24/05/2019 14:36:50 --------*/

CREATE OR ALTER VIEW VW_TIPO_SUBTETO(
    CODIGO,
    DESCRICAO)
AS
Select '1' as Codigo, 'Executivo' as Descricao from rdb$database Union
Select '2' as Codigo, 'Judiciário' as Descricao from rdb$database Union
Select '3' as Codigo, 'Legislativo' as Descricao from rdb$database Union
Select '9' as Codigo, 'Todos os poderes' as Descricao from rdb$database;

/*------ 24/05/2019 14:36:50 --------*/

GRANT ALL ON VW_TIPO_SUBTETO TO "GERASYS.TI" WITH GRANT OPTION;

/*------ 24/05/2019 14:36:50 --------*/

GRANT ALL ON VW_TIPO_SUBTETO TO PUBLIC;