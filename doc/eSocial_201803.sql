


/*------ GERASYS.TI 01/03/2018 15:52:07 --------*/

CREATE SEQUENCE GEN_ESOCIAL_EVENTO_S1000;




/*------ GERASYS.TI 01/03/2018 18:32:43 --------*/

CREATE TABLE CONFIG_ESOCIAL (
    ID_CONFIG_ORGAO "INTEGER" NOT NULL,
    ID_UNID_GESTORA "INTEGER",
    CONTADOR_NOME "VARCHAR(50)",
    CONTADOR_CPF "VARCHAR(11)",
    CONTADOR_FONEFIXO "VARCHAR(10)",
    CONTADOR_FONECELULAR "VARCHAR(11)",
    CONTADOR_EMAIL "VARCHAR(60)",
    NAT_JURIDICA "CHAR(5)",
    NRO_SIAFI "VARCHAR(8)",
    SUBTETO_VENCTO_TIPO "CHAR(1)",
    SUBTETO_VENCTO_VALOR "NUMERIC(15,2)",
    POSSUI_RPPS "CHAR(1)" DEFAULT 'N' NOT NULL);

ALTER TABLE CONFIG_ESOCIAL
ADD CONSTRAINT PK_CONFIG_ESOCIAL
PRIMARY KEY (ID_CONFIG_ORGAO);

COMMENT ON COLUMN CONFIG_ESOCIAL.NAT_JURIDICA IS
'Natureza Juridica:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 21';

COMMENT ON COLUMN CONFIG_ESOCIAL.NRO_SIAFI IS
'Preencher com o numero SIAFI (Sistema Integrado de Administracao Financeira), caso seja orgao publico usuario do sistema.';

COMMENT ON COLUMN CONFIG_ESOCIAL.SUBTETO_VENCTO_TIPO IS
'Tipo do Subteto:
1 - Executivo
2 - Judiciario
3 - Legislativo
9 - Todos os poderes';

COMMENT ON COLUMN CONFIG_ESOCIAL.POSSUI_RPPS IS
'Informar se o entindade publica possui Regime Proprio de Previdencia Social - RPPS:
N - Nao
S - Sim';




/*------ GERASYS.TI 01/03/2018 18:33:04 --------*/

ALTER TABLE CONFIG_ESOCIAL ALTER COLUMN SUBTETO_VENCTO_TIPO
SET DEFAULT '9'
;




/*------ GERASYS.TI 01/03/2018 18:33:10 --------*/

update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = 1
where (RDB$FIELD_NAME = 'SUBTETO_VENCTO_TIPO') and
(RDB$RELATION_NAME = 'CONFIG_ESOCIAL')
;




/*------ GERASYS.TI 01/03/2018 18:34:20 --------*/

ALTER TABLE CONFIG_ESOCIAL
ADD CONSTRAINT FK_CONFIG_ESOCIAL_ORG
FOREIGN KEY (ID_CONFIG_ORGAO)
REFERENCES CONFIG_ORGAO(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE CONFIG_ESOCIAL
ADD CONSTRAINT FK_CONFIG_ESOCIAL_UNG
FOREIGN KEY (ID_UNID_GESTORA)
REFERENCES UNID_GESTORA(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;

GRANT ALL ON CONFIG_ESOCIAL TO "PUBLIC";



/*------ GERASYS.TI 02/03/2018 12:00:11 --------*/

COMMENT ON COLUMN CONFIG_ESOCIAL.NRO_SIAFI IS
'Preencher com o numero SIAFI (Sistema Integrado de Administracao Financeira), caso seja orgao publico usuario do sistema.

Pesquisar em: http://consulta.tesouro.fazenda.gov.br/ug_novosite/index_ug.asp';




/*------ GERASYS.TI 02/03/2018 12:04:09 --------*/

ALTER SEQUENCE GEN_ESOCIAL_EVENTO_S1000 RESTART WITH 0;




/*------ GERASYS.TI 02/03/2018 15:15:09 --------*/

CREATE TABLE ESOCIAL_NATUREZA_JURIDICA (
    CODIGO "CHAR(5)" NOT NULL,
    DESCRICAO "VARCHAR(240)");

ALTER TABLE ESOCIAL_NATUREZA_JURIDICA
ADD CONSTRAINT PK_ESOCIAL_NATUREZA_JURIDICA
PRIMARY KEY (CODIGO);

GRANT ALL ON ESOCIAL_NATUREZA_JURIDICA TO "PUBLIC";

INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('101-5', 'Órgão Público do Poder Executivo Federal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('102-3', 'Órgão Público do Poder Executivo Estadual ou do Distrito Federal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('103-1', 'Órgão Público do Poder Executivo Municipal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('104-0', 'Órgão Público do Poder Legislativo Federal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('105-8', 'Órgão Público do Poder Legislativo Estadual ou do Distrito Federal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('106-6', 'Órgão Público do Poder Legislativo Municipal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('107-4', 'Órgão Público do Poder Judiciário Federal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('108-2', 'Órgão Público do Poder Judiciário Estadual');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('110-4', 'Autarquia Federal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('111-2', 'Autarquia Estadual ou do Distrito Federal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('112-0', 'Autarquia Municipal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('113-9', 'Fundação Pública de Direito Público Federal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('114-7', 'Fundação Pública de Direito Público Estadual ou do Distrito Federal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('115-5', 'Fundação Pública de Direito Público Municipal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('116-3', 'Órgão Público Autônomo Federal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('117-1', 'Órgão Público Autônomo Estadual ou do Distrito Federal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('118-0', 'Órgão Público Autônomo Municipal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('119-8', 'Comissão Polinacional');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('120-1', 'Fundo Público');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('121-0', 'Consórcio Público de Direito Público (Associação Pública)');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('122-8', 'Consórcio Público de Direito Privado');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('123-6', 'Estado ou Distrito Federal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('124-4', 'Município');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('125-2', 'Fundação Pública de Direito Privado Federal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('126-0', 'Fundação Pública de Direito Privado Estadual ou do Distrito Federal');
INSERT INTO ESOCIAL_NATUREZA_JURIDICA VALUES ('127-9', 'Fundação Pública de Direito Privado Municipal');

COMMIT WORK;



/*------ GERASYS.TI 02/03/2018 15:41:37 --------*/

create view vw_tipo_subteto (codigo, descricao)
as
Select '1' as Codigo, 'Executivo' as Descricao from rdb$database Union
Select '2' as Codigo, 'Judici�rio' as Descricao from rdb$database Union
Select '3' as Codigo, 'Legislativo' as Descricao from rdb$database Union
Select '9' as Codigo, 'Todos os poderes' as Descricao from rdb$database
;

GRANT ALL ON VW_TIPO_SUBTETO TO "PUBLIC";
