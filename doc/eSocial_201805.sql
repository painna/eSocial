

/*------ GERASYS.TI 12/05/2018 12:38:37 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
U.CNPJ.
At line 5, column 40.

*/


/*------ GERASYS.TI 12/05/2018 12:42:32 --------*/

ALTER TABLE UNID_GESTORA
    ADD TIPO_OPERACAO ESOCIAL_OPERACAO;

COMMENT ON COLUMN UNID_GESTORA.TIPO_OPERACAO IS
'Operacao do registro no eSocial:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';




/*------ GERASYS.TI 12/05/2018 12:47:59 --------*/

ALTER TABLE UNID_GESTORA
    ADD CNAE_PREP "VARCHAR(10)";

COMMENT ON COLUMN UNID_GESTORA.CNAE_PREP IS
'eSocial - CNAE Prepoderante da Unidade Gestora para o evento S1005.';




/*------ GERASYS.TI 12/05/2018 13:46:26 --------*/

CREATE SEQUENCE GEN_ESOCIAL_EVENTO_S1005;




/*------ GERASYS.TI 12/05/2018 13:57:28 --------*/

ALTER TABLE CONFIG_ESOCIAL
    ADD DATA_IMPLANTACAO "DATE";

COMMENT ON COLUMN CONFIG_ESOCIAL.DATA_IMPLANTACAO IS
'Data de implatacao do eSocial';




/*------ GERASYS.TI 12/05/2018 14:12:03 --------*/

COMMENT ON COLUMN UNID_GESTORA.CNAE_PREP IS
'eSocial - CNAE Prepoderante da Unidade Gestora para o evento S1005.';




/*------ GERASYS.TI 12/05/2018 14:48:27 --------*/

CREATE DOMAIN ESOCIAL_ALIQUOTA_GILRAT AS
SMALLINT
DEFAULT 1
CHECK (value in (1, 2, 3));


/*------ GERASYS.TI 12/05/2018 14:49:50 --------*/

ALTER DOMAIN ESOCIAL_ALIQUOTA_GILRAT TO ESOCIAL_ALIQUOTA_RAT;

COMMENT ON DOMAIN ESOCIAL_ALIQUOTA_RAT IS 'Aliquota Gilrat para o eSocial';




/*------ GERASYS.TI 15/05/2018 10:17:40 --------*/

ALTER TABLE UNID_GESTORA
    ADD REGIME_PONTO "CHAR(1)" NOT NULL;

COMMENT ON COLUMN UNID_GESTORA.REGIME_PONTO IS
'eSocial - Regime dde Ponto (Jornada) da Unidade Gestora para o evento S1005.

0 - Nao utiliza
1 - Manual
2 - Mecanico
3 - Eletronico (portaria MTE 1.510/2009)
4 - Nao eletronico alternativo (art. 1o. da Portaria MTE 373/2011)
5 - Eletronico alternativo (art. 2o. da Portaria MTE 373/2011)
6 - Eletronico - outros';




/*------ GERASYS.TI 15/05/2018 10:17:51 --------*/

UPDATE UNID_GESTORA
SET REGIME_PONTO = '0';




/*------ GERASYS.TI 15/05/2018 10:31:20 --------*/

ALTER TABLE UNID_GESTORA
    ADD CONTRATA_PCD "CHAR(1)" NOT NULL;

COMMENT ON COLUMN UNID_GESTORA.CONTRATA_PCD IS
'eSocial - Tipo de contratacao de PCD (Pessoas com Deficiencia) da Unidade Gestora para o evento S1005.

0 - Dispensado de acordo com a lei
1 - Dispensado, mesmo que parcialmente, em virtude de processo judicial
2 - Com exigibilidade suspensa, mesmo que parcialmente em virtude de Termo de Compromisso firmado com o Ministerio do Trabalho
9 - Obrigado';




/*------ GERASYS.TI 15/05/2018 10:31:25 --------*/

UPDATE UNID_GESTORA
SET CONTRATA_PCD = '9';



/*------ GERASYS.TI 15/05/2018 11:32:07 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 68, column 1.
Select.

*/


/*------ GERASYS.TI 15/05/2018 12:54:32 --------*/

ALTER TABLE UNID_GESTORA
    ADD NRO_SIAFI "VARCHAR(8)";

COMMENT ON COLUMN UNID_GESTORA.NRO_SIAFI IS
'Preencher com o numero SIAFI (Sistema Integrado de Administracao Financeira), caso seja orgao publico usuario do sistema.

Pesquisar em: http://consulta.tesouro.fazenda.gov.br/ug_novosite/index_ug.asp';




/*------ GERASYS.TI 15/05/2018 13:00:23 --------*/

ALTER TABLE UNID_GESTORA
    ADD NAT_JURIDICA "CHAR(5)";

COMMENT ON COLUMN UNID_GESTORA.NAT_JURIDICA IS
'eSocial - Natureza Juridica:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 21';

COMMENT ON COLUMN UNID_GESTORA.NRO_SIAFI IS
'eSocial - Preencher com o numero SIAFI (Sistema Integrado de Administracao Financeira), caso seja orgao publico usuario do sistema.

Pesquisar em: http://consulta.tesouro.fazenda.gov.br/ug_novosite/index_ug.asp';

alter table UNID_GESTORA
alter ID position 1;

alter table UNID_GESTORA
alter DESCRICAO position 2;

alter table UNID_GESTORA
alter RAZAO_SOCIAL position 3;

alter table UNID_GESTORA
alter COD_CONTABIL position 4;

alter table UNID_GESTORA
alter CNPJ position 5;

alter table UNID_GESTORA
alter ID_TIPO_UNID_GESTORA position 6;

alter table UNID_GESTORA
alter COD_ORGAO_TCM position 7;

alter table UNID_GESTORA
alter FORMA_CALC_RESCISAO position 8;

alter table UNID_GESTORA
alter TETO_VENCTO_BASE position 9;

alter table UNID_GESTORA
alter DESCR_TIPO_UNID_GESTORA position 10;

alter table UNID_GESTORA
alter DESCR_FORMA_CALC_RESCISAO position 11;

alter table UNID_GESTORA
alter CNPJ_FTDO position 12;

alter table UNID_GESTORA
alter CNPJ_PRINCIPAL position 13;

alter table UNID_GESTORA
alter NOME_GESTOR position 14;

alter table UNID_GESTORA
alter DESCR_CARGO_GESTOR position 15;

alter table UNID_GESTORA
alter ID_SERVID_GESTOR position 16;

alter table UNID_GESTORA
alter GESTOR_NOME position 17;

alter table UNID_GESTORA
alter GESTOR_ID_PF position 18;

alter table UNID_GESTORA
alter GESTOR_EST_CIVIL position 19;

alter table UNID_GESTORA
alter GESTOR_CPF position 20;

alter table UNID_GESTORA
alter GESTOR_RG position 21;

alter table UNID_GESTORA
alter GESTOR_ENDER_LOGRAD position 22;

alter table UNID_GESTORA
alter GESTOR_ENDER_NUM position 23;

alter table UNID_GESTORA
alter GESTOR_ENDER_BAIRRO position 24;

alter table UNID_GESTORA
alter GESTOR_ENDER_CEP position 25;

alter table UNID_GESTORA
alter GESTOR_ENDER_CIDADE position 26;

alter table UNID_GESTORA
alter GESTOR_ENDER_UF position 27;

alter table UNID_GESTORA
alter GESTOR_SEXO position 28;

alter table UNID_GESTORA
alter DADOS_NO_CCHEQUE position 29;

alter table UNID_GESTORA
alter CNPJ_DA_GPS position 30;

alter table UNID_GESTORA
alter CTRO_TEMP_LEI_DATA position 31;

alter table UNID_GESTORA
alter TIPO_OPERACAO position 32;

alter table UNID_GESTORA
alter CNAE_PREP position 33;

alter table UNID_GESTORA
alter REGIME_PONTO position 34;

alter table UNID_GESTORA
alter CONTRATA_PCD position 35;

alter table UNID_GESTORA
alter NAT_JURIDICA position 36;

alter table UNID_GESTORA
alter NRO_SIAFI position 37;




/*------ GERASYS.TI 15/05/2018 13:43:48 --------*/

COMMENT ON COLUMN EVENTO.TIPO_OPERACAO IS
'eSocial - Operacao do registro no eSocial:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';




/*------ GERASYS.TI 15/05/2018 13:43:54 --------*/

COMMENT ON COLUMN EVENTO.NAT_RUBRICA IS
'eSocial - Natureza da Rubrica da Folha de Pagamento:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 03';




/*------ GERASYS.TI 15/05/2018 14:10:48 --------*/

ALTER TABLE UNID_GESTORA
ADD CONSTRAINT FK_UNID_GESTORA_NATJUD
FOREIGN KEY (NAT_JURIDICA)
REFERENCES ESOCIAL_NATUREZA_JURIDICA(CODIGO);




/*------ GERASYS.TI 15/05/2018 14:11:27 --------*/

ALTER TABLE EVENTO
ADD CONSTRAINT FK_EVENTO_NATRUB
FOREIGN KEY (NAT_RUBRICA)
REFERENCES ESOCIAL_NATUREZA_RUBRICA(CODIGO);

