


/*------ GERASYS.TI 06/07/2018 19:01:05 --------*/

CREATE DOMAIN ESOCIAL_TIPO_2 AS
CHAR(1)
DEFAULT '1'
NOT NULL
CHECK (value in ('1', '2'));


/*------ GERASYS.TI 06/07/2018 19:09:00 --------*/

ALTER TABLE TAB_HORARIO
    ADD TIPO_OPERACAO ESOCIAL_OPERACAO,
    ADD PERMITE_FLEXIBILIDADE SIM_NAO,
    ADD TIPO_INTERVALO ESOCIAL_TIPO_2,
    ADD DURACAO_JORNADA "CHAR(4)",
    ADD DURACAO_INTERVALO "CHAR(4)",
    ADD INTERVALO_INICIO "CHAR(4)",
    ADD INTERVALO_FINAL "CHAR(4)";

COMMENT ON COLUMN TAB_HORARIO.TIPO_OPERACAO IS
'eSocial - Operacao do registro:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';

COMMENT ON COLUMN TAB_HORARIO.PERMITE_FLEXIBILIDADE IS
'eSocial - Permite flexibilidade:
N - Nao
S - Sim';

COMMENT ON COLUMN TAB_HORARIO.TIPO_INTERVALO IS
'eSocial - Tipo de intervalo:
1 - Intervalor me horario fixo
2 - Intervalor me horario variado';

COMMENT ON COLUMN TAB_HORARIO.DURACAO_JORNADA IS
'eSocial - Duracao da jornada em minutos';

COMMENT ON COLUMN TAB_HORARIO.DURACAO_INTERVALO IS
'eSocial - Duracao do intervalo em minutos';

COMMENT ON COLUMN TAB_HORARIO.INTERVALO_INICIO IS
'eSocial - Hora inicial do intervalo';

COMMENT ON COLUMN TAB_HORARIO.INTERVALO_FINAL IS
'eSocial - Hora final do intervalor';




/*------ GERASYS.TI 06/07/2018 19:12:00 --------*/

CREATE INDEX IDX_CARGO_FUNCAO_TIPO_OPER
ON CARGO_FUNCAO (TIPO_OPERACAO);




/*------ GERASYS.TI 06/07/2018 19:12:33 --------*/

CREATE INDEX IDX_TAB_HORARIO_TIPO_OPER
ON TAB_HORARIO (TIPO_INTERVALO);




/*------ GERASYS.TI 07/07/2018 16:00:21 --------*/

ALTER TABLE DEPTO
    ADD TIPO_OPERACAO ESOCIAL_OPERACAO;

COMMENT ON COLUMN DEPTO.TIPO_OPERACAO IS
'eSocial - Operacao do registro:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';




/*------ GERASYS.TI 07/07/2018 16:00:26 --------*/

UPDATE DEPTO
SET TIPO_OPERACAO = 'I';




/*------ GERASYS.TI 07/07/2018 16:00:44 --------*/

CREATE INDEX IDX_DEPTO_TIPO_OPER
ON DEPTO (TIPO_OPERACAO);




/*------ GERASYS.TI 07/07/2018 16:07:23 --------*/

CREATE TABLE ESOCIAL_FATOR_RISCO (
    CODIGO "CHAR(6)" NOT NULL,
    DESCRICAO "VARCHAR(150)");

ALTER TABLE ESOCIAL_FATOR_RISCO
ADD CONSTRAINT PK_ESOCIAL_FATOR_RISCO
PRIMARY KEY (CODIGO);

GRANT ALL ON ESOCIAL_FATOR_RISCO TO "PUBLIC";



/*------ GERASYS.TI 07/07/2018 16:13:09 --------*/

ALTER TABLE ESOCIAL_FATOR_RISCO
    ADD GRUPO "CHAR(6)";




/*------ GERASYS.TI 07/07/2018 16:13:22 --------*/

alter table ESOCIAL_FATOR_RISCO
alter column CODIGO position 1;


/*------ GERASYS.TI 07/07/2018 16:13:22 --------*/

alter table ESOCIAL_FATOR_RISCO
alter column GRUPO position 2;


/*------ GERASYS.TI 07/07/2018 16:13:22 --------*/

alter table ESOCIAL_FATOR_RISCO
alter column DESCRICAO position 3;


/*------ GERASYS.TI 07/07/2018 16:13:53 --------*/

ALTER TABLE ESOCIAL_FATOR_RISCO
ADD CONSTRAINT FK_ESOCIAL_FATOR_RISCO_1
FOREIGN KEY (GRUPO)
REFERENCES ESOCIAL_FATOR_RISCO(CODIGO)
ON DELETE CASCADE;




/*------ GERASYS.TI 07/07/2018 16:17:23 --------*/

ALTER TABLE ESOCIAL_FATOR_RISCO DROP CONSTRAINT FK_ESOCIAL_FATOR_RISCO_1;




/*------ GERASYS.TI 07/07/2018 16:17:26 --------*/

ALTER TABLE ESOCIAL_FATOR_RISCO DROP CONSTRAINT PK_ESOCIAL_FATOR_RISCO;




/*------ GERASYS.TI 07/07/2018 16:17:52 --------*/

CREATE DOMAIN "CHAR(7)" AS
CHAR(7);


/*------ GERASYS.TI 07/07/2018 16:17:59 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'CHAR(7)'
where (RDB$FIELD_NAME = 'CODIGO') and
(RDB$RELATION_NAME = 'ESOCIAL_FATOR_RISCO')
;




/*------ GERASYS.TI 07/07/2018 16:18:05 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'CHAR(7)'
where (RDB$FIELD_NAME = 'GRUPO') and
(RDB$RELATION_NAME = 'ESOCIAL_FATOR_RISCO')
;




/*------ GERASYS.TI 07/07/2018 16:18:48 --------*/

ALTER TABLE ESOCIAL_FATOR_RISCO
ADD CONSTRAINT PK_ESOCIAL_FATOR_RISCO
PRIMARY KEY (CODIGO);




/*------ GERASYS.TI 07/07/2018 16:19:32 --------*/

ALTER TABLE ESOCIAL_FATOR_RISCO
ADD CONSTRAINT FK_ESOCIAL_FATOR_RISCO
FOREIGN KEY (GRUPO)
REFERENCES ESOCIAL_FATOR_RISCO(CODIGO)
ON DELETE SET NULL;




/*------ GERASYS.TI 07/07/2018 16:23:35 --------*/

CREATE TABLE DEPTO_FATOR_RISCO (
    ID_DEPTO "INTEGER" NOT NULL,
    ID_FATOR_RISCO "CHAR(7)" NOT NULL);

ALTER TABLE DEPTO_FATOR_RISCO
ADD CONSTRAINT PK_DEPTO_FATOR_RISCO
PRIMARY KEY (ID_DEPTO,ID_FATOR_RISCO);

GRANT ALL ON DEPTO_FATOR_RISCO TO "PUBLIC";



/*------ GERASYS.TI 07/07/2018 16:24:06 --------*/

ALTER TABLE DEPTO_FATOR_RISCO
ADD CONSTRAINT FK_DEPTO_FATOR_RISCO_DP
FOREIGN KEY (ID_DEPTO)
REFERENCES DEPTO(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE DEPTO_FATOR_RISCO
ADD CONSTRAINT FK_DEPTO_FATOR_RISCO_FR
FOREIGN KEY (ID_FATOR_RISCO)
REFERENCES ESOCIAL_FATOR_RISCO(CODIGO)
ON DELETE CASCADE
ON UPDATE CASCADE;




/*------ GERASYS.TI 07/07/2018 16:43:40 --------*/

ALTER TABLE DEPTO
    ADD LOCAL_TIPO ESOCIAL_TIPO_2;

COMMENT ON COLUMN DEPTO.LOCAL_TIPO IS
'eSocial - Tipo de localizacao do departamento (ambiente de trabalho):
1 - Estabelecimento do Empregador
2 - Estabelecimento Tercerizado';




/*------ GERASYS.TI 07/07/2018 16:43:44 --------*/

UPDATE DEPTO
SET LOCAL_TIPO = '1';




/*------ GERASYS.TI 07/07/2018 19:20:32 --------*/

CREATE TABLE ESOCIAL_RETORNO_PROTOCOLO (
    NUMERO "VARCHAR(30)" NOT NULL,
    INSCRICAO "VARCHAR(20)",
    DATA_HORA "TIMESTAMP",
    VERSAO "VARCHAR(10)",
    ARQUIVO_ENVIADO BLOB_SUB_TYPE_0,
    ARQUIVO_RETORNO BLOB_SUB_TYPE_0);

ALTER TABLE ESOCIAL_RETORNO_PROTOCOLO
ADD CONSTRAINT PK_ESOCIAL_RETORNO_PROTOCOLO
PRIMARY KEY (NUMERO);

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.NUMERO IS
'Numero do Protocolo';

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.INSCRICAO IS
'Inscricao (CNPJ do Empregador)';

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.DATA_HORA IS
'Data/hora de recepcao';

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.VERSAO IS
'Versao';

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.ARQUIVO_ENVIADO IS
'Arquivo XML enviado';

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.ARQUIVO_RETORNO IS
'Arquivo de retorno';




/*------ GERASYS.TI 07/07/2018 19:21:21 --------*/

CREATE INDEX IDX_ESOCIAL_RETORNO_PROTOCOLO_2
ON ESOCIAL_RETORNO_PROTOCOLO (DATA_HORA);

CREATE INDEX IDX_ESOCIAL_RETORNO_PROTOCOLO_1
ON ESOCIAL_RETORNO_PROTOCOLO (INSCRICAO);

GRANT ALL ON ESOCIAL_RETORNO_PROTOCOLO TO "PUBLIC";



/*------ GERASYS.TI 07/07/2018 19:22:16 --------*/

CREATE DOMAIN "BIGINT" AS
BIGINT;


/*------ GERASYS.TI 07/07/2018 19:22:30 --------*/

COMMENT ON DOMAIN "BIGINT" IS 'Inteiro Longo';




/*------ GERASYS.TI 07/07/2018 19:23:04 --------*/

ALTER TABLE ESOCIAL_RETORNO_PROTOCOLO
    ADD ID "BIGINT";

COMMENT ON COLUMN ESOCIAL_RETORNO_PROTOCOLO.ID IS
'ID';




/*------ GERASYS.TI 07/07/2018 19:23:11 --------*/

alter table ESOCIAL_RETORNO_PROTOCOLO
alter column ID position 1;


/*------ GERASYS.TI 07/07/2018 19:23:11 --------*/

alter table ESOCIAL_RETORNO_PROTOCOLO
alter column NUMERO position 2;


/*------ GERASYS.TI 07/07/2018 19:23:11 --------*/

alter table ESOCIAL_RETORNO_PROTOCOLO
alter column INSCRICAO position 3;


/*------ GERASYS.TI 07/07/2018 19:23:11 --------*/

alter table ESOCIAL_RETORNO_PROTOCOLO
alter column DATA_HORA position 4;


/*------ GERASYS.TI 07/07/2018 19:23:11 --------*/

alter table ESOCIAL_RETORNO_PROTOCOLO
alter column VERSAO position 5;


/*------ GERASYS.TI 07/07/2018 19:23:11 --------*/

alter table ESOCIAL_RETORNO_PROTOCOLO
alter column ARQUIVO_ENVIADO position 6;


/*------ GERASYS.TI 07/07/2018 19:23:11 --------*/

alter table ESOCIAL_RETORNO_PROTOCOLO
alter column ARQUIVO_RETORNO position 7;


/*------ GERASYS.TI 07/07/2018 19:24:47 --------*/

CREATE SEQUENCE GEN_ESOCIAL_PROTOCOLO_ID;

SET TERM ^ ;

create trigger TG_ESOCIAL_PROTOCOLO_ID for ESOCIAL_RETORNO_PROTOCOLO
active before insert position 0
as
begin
  if (coalesce(new.id, 0) < 1) then
    new.id = gen_id(GEN_ESOCIAL_PROTOCOLO_ID, 1);
end^

SET TERM ; ^




/*------ GERASYS.TI 07/07/2018 19:25:15 --------*/

ALTER TABLE ESOCIAL_RETORNO_PROTOCOLO
ADD CONSTRAINT UNQ_ESOCIAL_RETORNO_PROTOCOLO
UNIQUE (ID);




/*------ GERASYS.TI 26/07/2018 18:24:38 --------*/

CREATE DOMAIN ESOCIAL_SMALLINT AS
SMALLINT;COMMENT ON DOMAIN ESOCIAL_SMALLINT IS 'eSocial - Inteiro de baixo valor';




/*------ GERASYS.TI 26/07/2018 18:25:39 --------*/

ALTER TABLE TAB_RACA_COR
    ADD ID_ESOCIAL ESOCIAL_SMALLINT;

COMMENT ON COLUMN TAB_RACA_COR.ID_ESOCIAL IS
'eSocial - Inteiro de baixo valor';




/*------ GERASYS.TI 26/07/2018 18:39:48 --------*/

COMMENT ON COLUMN TAB_RACA_COR.ID_ESOCIAL IS
'eSocial - Identificacao no eSocial';




/*------ GERASYS.TI 26/07/2018 18:39:54 --------*/

COMMENT ON COLUMN TAB_RACA_COR.ID_ESOCIAL IS
'eSocial - Identificacao';




/*------ GERASYS.TI 26/07/2018 18:40:06 --------*/

ALTER TABLE ESTADO_CIVIL
    ADD ID_ESOCIAL ESOCIAL_SMALLINT;

COMMENT ON COLUMN ESTADO_CIVIL.ID_ESOCIAL IS
'eSocial - Identificacao';




/*------ GERASYS.TI 26/07/2018 18:46:51 --------*/

ALTER TABLE ESCOLARIDADE
    ADD ID_ESOCIAL "CHAR(2)";

COMMENT ON COLUMN ESCOLARIDADE.ID_ESOCIAL IS
'eSocial - Identificacao';



/*------ GERASYS.TI 26/07/2018 19:16:49 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 4, column 41.
,.

*/

/*------ GERASYS.TI 26/07/2018 19:20:54 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 5, column 11.
(.

*/

/*------ GERASYS.TI 26/07/2018 19:20:57 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 7, column 65.
=.

*/

/*------ GERASYS.TI 26/07/2018 19:21:07 --------*/

/*!!! Error occured !!!
An error was found in the application program input parameters for the SQL statement.
Dynamic SQL Error.
SQL error code = -804.
Function unknown.
LEN.

*/

/*------ GERASYS.TI 26/07/2018 19:21:26 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 5, column 11.
(.

*/

/*------ GERASYS.TI 26/07/2018 19:24:47 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Invalid command.
no column name specified for column number 3 in derived table <unnamed>.

*/

/*------ GERASYS.TI 26/07/2018 19:30:36 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
P.NATURAL_UF.
At line 4, column 24.

*/

/*------ GERASYS.TI 26/07/2018 19:37:13 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 2, column 1.
from.

*/


/*------ GERASYS.TI 26/07/2018 20:03:53 --------*/

CREATE TABLE ESOCIAL_PAIS (
    CODIGO "CHAR(3)" NOT NULL,
    DESCRICAO "VARCHAR(100)");

ALTER TABLE ESOCIAL_PAIS
ADD CONSTRAINT PK_ESOCIAL_PAIS
PRIMARY KEY (CODIGO);

GRANT ALL ON ESOCIAL_PAIS TO "PUBLIC";



/*------ GERASYS.TI 26/07/2018 20:08:11 --------*/

ALTER TABLE PESSOA_FISICA
    ADD ID_NATURAL_PAIS "CHAR(3)";

COMMENT ON COLUMN PESSOA_FISICA.ID_NATURAL_PAIS IS
'eSocial - Pais de Nascimento:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 06';

alter table PESSOA_FISICA
alter ID position 1;

alter table PESSOA_FISICA
alter NOME position 2;

alter table PESSOA_FISICA
alter APELIDO position 3;

alter table PESSOA_FISICA
alter SEXO position 4;

alter table PESSOA_FISICA
alter ID_RACA_COR position 5;

alter table PESSOA_FISICA
alter DT_NASCIMENTO position 6;

alter table PESSOA_FISICA
alter NATURAL_CIDADE position 7;

alter table PESSOA_FISICA
alter NATURAL_UF position 8;

alter table PESSOA_FISICA
alter ID_NATURAL_PAIS position 9;

alter table PESSOA_FISICA
alter RG_NUM position 10;

alter table PESSOA_FISICA
alter RG_ORGAO_EMISSOR position 11;

alter table PESSOA_FISICA
alter RG_UF position 12;

alter table PESSOA_FISICA
alter RG_DT_EMISSAO position 13;

alter table PESSOA_FISICA
alter CPF position 14;

alter table PESSOA_FISICA
alter PIS_PASEP position 15;

alter table PESSOA_FISICA
alter CNH_NUM position 16;

alter table PESSOA_FISICA
alter CNH_DT_VENCTO position 17;

alter table PESSOA_FISICA
alter TIT_ELEITOR_NUM position 18;

alter table PESSOA_FISICA
alter TIT_ELEITOR_ZONA position 19;

alter table PESSOA_FISICA
alter TIT_ELEITOR_SECAO position 20;

alter table PESSOA_FISICA
alter RESERVISTA position 21;

alter table PESSOA_FISICA
alter ID_ESTADO_CIVIL position 22;

alter table PESSOA_FISICA
alter CONJUGE_NOME position 23;

alter table PESSOA_FISICA
alter CONJUGE_CPF position 24;

alter table PESSOA_FISICA
alter FILIACAO_PAI position 25;

alter table PESSOA_FISICA
alter FILIACAO_MAE position 26;

alter table PESSOA_FISICA
alter ENDER_LOGRAD position 27;

alter table PESSOA_FISICA
alter ENDER_NUM position 28;

alter table PESSOA_FISICA
alter ENDER_BAIRRO position 29;

alter table PESSOA_FISICA
alter ENDER_CIDADE position 30;

alter table PESSOA_FISICA
alter ENDER_CEP position 31;

alter table PESSOA_FISICA
alter ENDER_UF position 32;

alter table PESSOA_FISICA
alter TELEFONE position 33;

alter table PESSOA_FISICA
alter E_MAIL position 34;

alter table PESSOA_FISICA
alter FOTO position 35;

alter table PESSOA_FISICA
alter DESCR_ESTADO_CIVIL position 36;

alter table PESSOA_FISICA
alter CPF_FTDO position 37;

alter table PESSOA_FISICA
alter PIS_PASEP_FTDO position 38;

alter table PESSOA_FISICA
alter ENDER_COMPLEM position 39;

alter table PESSOA_FISICA
alter ANO_CHEGADA_BRASIL position 40;

alter table PESSOA_FISICA
alter ID_NACIONALIDADE position 41;

alter table PESSOA_FISICA
alter DESCR_NACIONALIDADE position 42;

alter table PESSOA_FISICA
alter CNH_CATEG position 43;

alter table PESSOA_FISICA
alter ID_ESCOLARIDADE position 44;

alter table PESSOA_FISICA
alter DESCR_ESCOLARIDADE position 45;

alter table PESSOA_FISICA
alter ANO_PRIM_EMPREGO position 46;

