


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




/*------ GERASYS.TI 27/07/2018 09:55:58 --------*/

ALTER TABLE PESSOA_FISICA
    ADD ID_NATURAL_CIDADE "INTEGER";

COMMENT ON COLUMN PESSOA_FISICA.ID_NATURAL_CIDADE IS
'eSocial - Codigo do Municipio de nascimento conforme a tabela do IBGE.';

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
alter ID_NATURAL_CIDADE position 8;

alter table PESSOA_FISICA
alter NATURAL_UF position 9;

alter table PESSOA_FISICA
alter ID_NATURAL_PAIS position 10;

alter table PESSOA_FISICA
alter RG_NUM position 11;

alter table PESSOA_FISICA
alter RG_ORGAO_EMISSOR position 12;

alter table PESSOA_FISICA
alter RG_UF position 13;

alter table PESSOA_FISICA
alter RG_DT_EMISSAO position 14;

alter table PESSOA_FISICA
alter CPF position 15;

alter table PESSOA_FISICA
alter PIS_PASEP position 16;

alter table PESSOA_FISICA
alter CNH_NUM position 17;

alter table PESSOA_FISICA
alter CNH_DT_VENCTO position 18;

alter table PESSOA_FISICA
alter TIT_ELEITOR_NUM position 19;

alter table PESSOA_FISICA
alter TIT_ELEITOR_ZONA position 20;

alter table PESSOA_FISICA
alter TIT_ELEITOR_SECAO position 21;

alter table PESSOA_FISICA
alter RESERVISTA position 22;

alter table PESSOA_FISICA
alter ID_ESTADO_CIVIL position 23;

alter table PESSOA_FISICA
alter CONJUGE_NOME position 24;

alter table PESSOA_FISICA
alter CONJUGE_CPF position 25;

alter table PESSOA_FISICA
alter FILIACAO_PAI position 26;

alter table PESSOA_FISICA
alter FILIACAO_MAE position 27;

alter table PESSOA_FISICA
alter ENDER_LOGRAD position 28;

alter table PESSOA_FISICA
alter ENDER_NUM position 29;

alter table PESSOA_FISICA
alter ENDER_BAIRRO position 30;

alter table PESSOA_FISICA
alter ENDER_CIDADE position 31;

alter table PESSOA_FISICA
alter ENDER_CEP position 32;

alter table PESSOA_FISICA
alter ENDER_UF position 33;

alter table PESSOA_FISICA
alter TELEFONE position 34;

alter table PESSOA_FISICA
alter E_MAIL position 35;

alter table PESSOA_FISICA
alter FOTO position 36;

alter table PESSOA_FISICA
alter DESCR_ESTADO_CIVIL position 37;

alter table PESSOA_FISICA
alter CPF_FTDO position 38;

alter table PESSOA_FISICA
alter PIS_PASEP_FTDO position 39;

alter table PESSOA_FISICA
alter ENDER_COMPLEM position 40;

alter table PESSOA_FISICA
alter ANO_CHEGADA_BRASIL position 41;

alter table PESSOA_FISICA
alter ID_NACIONALIDADE position 42;

alter table PESSOA_FISICA
alter DESCR_NACIONALIDADE position 43;

alter table PESSOA_FISICA
alter CNH_CATEG position 44;

alter table PESSOA_FISICA
alter ID_ESCOLARIDADE position 45;

alter table PESSOA_FISICA
alter DESCR_ESCOLARIDADE position 46;

alter table PESSOA_FISICA
alter ANO_PRIM_EMPREGO position 47;




/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column ID position 1;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column NOME position 2;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column APELIDO position 3;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column SEXO position 4;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column ID_RACA_COR position 5;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column DT_NASCIMENTO position 6;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column NATURAL_CIDADE position 7;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column ID_NATURAL_CIDADE position 8;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column NATURAL_UF position 9;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column ID_NATURAL_PAIS position 10;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column RG_NUM position 11;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column RG_ORGAO_EMISSOR position 12;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column RG_UF position 13;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column RG_DT_EMISSAO position 14;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column CPF position 15;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column PIS_PASEP position 16;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column CNH_NUM position 17;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column CNH_DT_VENCTO position 18;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column CNH_CATEG position 19;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column TIT_ELEITOR_NUM position 20;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column TIT_ELEITOR_ZONA position 21;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column TIT_ELEITOR_SECAO position 22;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column RESERVISTA position 23;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column ID_ESTADO_CIVIL position 24;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column CONJUGE_NOME position 25;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column CONJUGE_CPF position 26;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column FILIACAO_PAI position 27;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column FILIACAO_MAE position 28;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column ENDER_LOGRAD position 29;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column ENDER_NUM position 30;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column ENDER_BAIRRO position 31;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column ENDER_CIDADE position 32;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column ENDER_CEP position 33;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column ENDER_UF position 34;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column TELEFONE position 35;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column E_MAIL position 36;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column FOTO position 37;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column DESCR_ESTADO_CIVIL position 38;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column CPF_FTDO position 39;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column PIS_PASEP_FTDO position 40;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column ENDER_COMPLEM position 41;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column ANO_CHEGADA_BRASIL position 42;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column ID_NACIONALIDADE position 43;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column DESCR_NACIONALIDADE position 44;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column ID_ESCOLARIDADE position 45;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column DESCR_ESCOLARIDADE position 46;


/*------ GERASYS.TI 27/07/2018 10:24:45 --------*/

alter table PESSOA_FISICA
alter column ANO_PRIM_EMPREGO position 47;


/*------ GERASYS.TI 27/07/2018 10:47:41 --------*/

ALTER TABLE NACIONALIDADE
    ADD ID_ESOCIAL "CHAR(3)";

COMMENT ON COLUMN NACIONALIDADE.ID_ESOCIAL IS
'eSocial - Pais de Nascimento:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 06';




/*------ GERASYS.TI 27/07/2018 10:50:08 --------*/

ALTER TABLE PESSOA_FISICA DROP ID_NATURAL_PAIS;




/*------ GERASYS.TI 27/07/2018 10:57:42 --------*/

ALTER TABLE PESSOA_FISICA
    ADD CNH_DT_EMISSAO "DATE";

COMMENT ON COLUMN PESSOA_FISICA.CNH_DT_EMISSAO IS
'eSocial - Data de emissao da CNH';

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
alter ID_NATURAL_CIDADE position 8;

alter table PESSOA_FISICA
alter NATURAL_UF position 9;

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
alter CNH_DT_EMISSAO position 17;

alter table PESSOA_FISICA
alter CNH_DT_VENCTO position 18;

alter table PESSOA_FISICA
alter CNH_CATEG position 19;

alter table PESSOA_FISICA
alter TIT_ELEITOR_NUM position 20;

alter table PESSOA_FISICA
alter TIT_ELEITOR_ZONA position 21;

alter table PESSOA_FISICA
alter TIT_ELEITOR_SECAO position 22;

alter table PESSOA_FISICA
alter RESERVISTA position 23;

alter table PESSOA_FISICA
alter ID_ESTADO_CIVIL position 24;

alter table PESSOA_FISICA
alter CONJUGE_NOME position 25;

alter table PESSOA_FISICA
alter CONJUGE_CPF position 26;

alter table PESSOA_FISICA
alter FILIACAO_PAI position 27;

alter table PESSOA_FISICA
alter FILIACAO_MAE position 28;

alter table PESSOA_FISICA
alter ENDER_LOGRAD position 29;

alter table PESSOA_FISICA
alter ENDER_NUM position 30;

alter table PESSOA_FISICA
alter ENDER_BAIRRO position 31;

alter table PESSOA_FISICA
alter ENDER_CIDADE position 32;

alter table PESSOA_FISICA
alter ENDER_CEP position 33;

alter table PESSOA_FISICA
alter ENDER_UF position 34;

alter table PESSOA_FISICA
alter TELEFONE position 35;

alter table PESSOA_FISICA
alter E_MAIL position 36;

alter table PESSOA_FISICA
alter FOTO position 37;

alter table PESSOA_FISICA
alter DESCR_ESTADO_CIVIL position 38;

alter table PESSOA_FISICA
alter CPF_FTDO position 39;

alter table PESSOA_FISICA
alter PIS_PASEP_FTDO position 40;

alter table PESSOA_FISICA
alter ENDER_COMPLEM position 41;

alter table PESSOA_FISICA
alter ANO_CHEGADA_BRASIL position 42;

alter table PESSOA_FISICA
alter ID_NACIONALIDADE position 43;

alter table PESSOA_FISICA
alter DESCR_NACIONALIDADE position 44;

alter table PESSOA_FISICA
alter ID_ESCOLARIDADE position 45;

alter table PESSOA_FISICA
alter DESCR_ESCOLARIDADE position 46;

alter table PESSOA_FISICA
alter ANO_PRIM_EMPREGO position 47;



/*------ GERASYS.TI 27/07/2018 11:03:40 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 4, column 36.
).

*/


/*------ GERASYS.TI 27/07/2018 11:08:42 --------*/

COMMENT ON COLUMN SERVIDOR.CONSELHO_REGISTRO IS
'eSocial - (OC - Orgao da Classe) - Registro/numero no conselho';




/*------ GERASYS.TI 27/07/2018 11:10:26 --------*/

ALTER TABLE SERVIDOR
    ADD CONSELHO_ORGAO "VARCHAR(10)",
    ADD CONSELHO_UF "CHAR(2)",
    ADD CONSELHO_DT_EMISSAO "DATE",
    ADD CONSELHO_DT_VALIDADE "DATE";

COMMENT ON COLUMN SERVIDOR.CONSELHO_ORGAO IS
'eSocial - (OC - Orgao da Classe) - Orgao do conselho';

COMMENT ON COLUMN SERVIDOR.CONSELHO_UF IS
'eSocial - (OC - Orgao da Classe) - UF dpo conselho';

COMMENT ON COLUMN SERVIDOR.CONSELHO_DT_EMISSAO IS
'eSocial - (OC - Orgao da Classe) - Data de emissao do registro';

COMMENT ON COLUMN SERVIDOR.CONSELHO_DT_VALIDADE IS
'eSocial - (OC - Orgao da Classe) - Data de validade do registro';

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
alter ID_SITUACAO_TCM position 10;

alter table SERVIDOR
alter ID_SUB_UNID_ORCAMENT position 11;

alter table SERVIDOR
alter ID_UNID_LOTACAO position 12;

alter table SERVIDOR
alter ID_DEPTO position 13;

alter table SERVIDOR
alter ID_CARGO_ORIGEM position 14;

alter table SERVIDOR
alter ID_CARGO_ATUAL position 15;

alter table SERVIDOR
alter REF_SALARIO position 16;

alter table SERVIDOR
alter VENCTO_BASE position 17;

alter table SERVIDOR
alter ID_ESCOLARIDADE position 18;

alter table SERVIDOR
alter FORMACAO position 19;

alter table SERVIDOR
alter CONSELHO_REGISTRO position 20;

alter table SERVIDOR
alter CONSELHO_ORGAO position 21;

alter table SERVIDOR
alter CONSELHO_UF position 22;

alter table SERVIDOR
alter CONSELHO_DT_EMISSAO position 23;

alter table SERVIDOR
alter CONSELHO_DT_VALIDADE position 24;

alter table SERVIDOR
alter CARGA_HOR_MENSAL position 25;

alter table SERVIDOR
alter QTD_DEPEND_IRRF position 26;

alter table SERVIDOR
alter CALC_VENCTO_BASE position 27;

alter table SERVIDOR
alter BLOQ_LANCTO_EVENTO_AUTO position 28;

alter table SERVIDOR
alter CALC_PREVID position 29;

alter table SERVIDOR
alter CALC_IRRF position 30;

alter table SERVIDOR
alter ID_EST_FUNCIONAL position 31;

alter table SERVIDOR
alter HORA_ENTRADA1 position 32;

alter table SERVIDOR
alter HORA_SAIDA1 position 33;

alter table SERVIDOR
alter HORA_ENTRADA2 position 34;

alter table SERVIDOR
alter HORA_SAIDA2 position 35;

alter table SERVIDOR
alter OBSERVACAO position 36;

alter table SERVIDOR
alter STATUS position 37;

alter table SERVIDOR
alter DESCR_SITUAC_TCM position 38;

alter table SERVIDOR
alter DESCR_SUB_UNID_ORCAM2 position 39;

alter table SERVIDOR
alter ID_UNID_GESTORA position 40;

alter table SERVIDOR
alter DESCR_UNID_LOTACAO position 41;

alter table SERVIDOR
alter DESCR_DEPTO position 42;

alter table SERVIDOR
alter DESCR_CARGO_ORIGEM position 43;

alter table SERVIDOR
alter DESCR_CARGO_ATUAL position 44;

alter table SERVIDOR
alter DESCR_ESCOLARIDADE position 45;

alter table SERVIDOR
alter DESCR_EST_FUNCIONAL position 46;

alter table SERVIDOR
alter DESCR_EFETIVO position 47;

alter table SERVIDOR
alter NOME_SERVIDOR position 48;

alter table SERVIDOR
alter TIPO_SAL position 49;

alter table SERVIDOR
alter FORMA_CALC_SAL position 50;

alter table SERVIDOR
alter BASE_CALC_HORA_AULA position 51;

alter table SERVIDOR
alter MOVIM_DEFINITIVA position 52;

alter table SERVIDOR
alter CPF_PF position 53;

alter table SERVIDOR
alter PIS_PASEP_PF position 54;

alter table SERVIDOR
alter DT_NASCIMENTO_PF position 55;

alter table SERVIDOR
alter ID_RACA_COR_PF position 56;

alter table SERVIDOR
alter DESCR_RACA_COR position 57;

alter table SERVIDOR
alter NAO_CALCULAR_ATS position 58;

alter table SERVIDOR
alter DT_ADMISSAO2 position 59;

alter table SERVIDOR
alter ID_SYS_ANTER position 60;

alter table SERVIDOR
alter ID_HORARIO position 61;

alter table SERVIDOR
alter CALC_SAL_CARGO_ORIGEM position 62;

alter table SERVIDOR
alter REF_SAL_INICIAL position 63;

alter table SERVIDOR
alter DT_BASE_CALC_ATS position 64;

alter table SERVIDOR
alter DESVIO_DE_FUNCAO position 65;

alter table SERVIDOR
alter CATEG_SEFIP position 66;

alter table SERVIDOR
alter OCORRENCIA_SEFIP position 67;

alter table SERVIDOR
alter CPF_FTDO position 68;

alter table SERVIDOR
alter PIS_PASEP_FTDO position 69;

alter table SERVIDOR
alter DESCR_HORARIO position 70;

alter table SERVIDOR
alter DESCR_SUB_UNID_ORCAMENT position 71;

alter table SERVIDOR
alter CONTRA_CHEQUE_WEB position 72;

alter table SERVIDOR
alter NAO_CALC_SAL_FAM position 73;




/*------ GERASYS.TI 27/07/2018 11:52:12 --------*/

ALTER TABLE PESSOA_FISICA
    ADD ID_ENDER_CIDADE "INTEGER";

COMMENT ON COLUMN PESSOA_FISICA.ID_ENDER_CIDADE IS
'eSocial - Codigo do Municipio de residencia conforme a tabela do IBGE.';

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
alter ID_NATURAL_CIDADE position 8;

alter table PESSOA_FISICA
alter NATURAL_UF position 9;

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
alter CNH_DT_EMISSAO position 17;

alter table PESSOA_FISICA
alter CNH_DT_VENCTO position 18;

alter table PESSOA_FISICA
alter CNH_CATEG position 19;

alter table PESSOA_FISICA
alter TIT_ELEITOR_NUM position 20;

alter table PESSOA_FISICA
alter TIT_ELEITOR_ZONA position 21;

alter table PESSOA_FISICA
alter TIT_ELEITOR_SECAO position 22;

alter table PESSOA_FISICA
alter RESERVISTA position 23;

alter table PESSOA_FISICA
alter ID_ESTADO_CIVIL position 24;

alter table PESSOA_FISICA
alter CONJUGE_NOME position 25;

alter table PESSOA_FISICA
alter CONJUGE_CPF position 26;

alter table PESSOA_FISICA
alter FILIACAO_PAI position 27;

alter table PESSOA_FISICA
alter FILIACAO_MAE position 28;

alter table PESSOA_FISICA
alter ENDER_LOGRAD position 29;

alter table PESSOA_FISICA
alter ENDER_NUM position 30;

alter table PESSOA_FISICA
alter ENDER_BAIRRO position 31;

alter table PESSOA_FISICA
alter ENDER_CIDADE position 32;

alter table PESSOA_FISICA
alter ID_ENDER_CIDADE position 33;

alter table PESSOA_FISICA
alter ENDER_CEP position 34;

alter table PESSOA_FISICA
alter ENDER_UF position 35;

alter table PESSOA_FISICA
alter TELEFONE position 36;

alter table PESSOA_FISICA
alter E_MAIL position 37;

alter table PESSOA_FISICA
alter FOTO position 38;

alter table PESSOA_FISICA
alter DESCR_ESTADO_CIVIL position 39;

alter table PESSOA_FISICA
alter CPF_FTDO position 40;

alter table PESSOA_FISICA
alter PIS_PASEP_FTDO position 41;

alter table PESSOA_FISICA
alter ENDER_COMPLEM position 42;

alter table PESSOA_FISICA
alter ANO_CHEGADA_BRASIL position 43;

alter table PESSOA_FISICA
alter ID_NACIONALIDADE position 44;

alter table PESSOA_FISICA
alter DESCR_NACIONALIDADE position 45;

alter table PESSOA_FISICA
alter ID_ESCOLARIDADE position 46;

alter table PESSOA_FISICA
alter DESCR_ESCOLARIDADE position 47;

alter table PESSOA_FISICA
alter ANO_PRIM_EMPREGO position 48;




/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column ID position 1;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column NOME position 2;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column APELIDO position 3;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column SEXO position 4;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column ID_RACA_COR position 5;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column DT_NASCIMENTO position 6;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column NATURAL_CIDADE position 7;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column ID_NATURAL_CIDADE position 8;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column NATURAL_UF position 9;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column RG_NUM position 10;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column RG_ORGAO_EMISSOR position 11;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column RG_UF position 12;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column RG_DT_EMISSAO position 13;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column CPF position 14;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column PIS_PASEP position 15;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column CNH_NUM position 16;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column CNH_DT_EMISSAO position 17;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column CNH_DT_VENCTO position 18;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column CNH_CATEG position 19;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column TIT_ELEITOR_NUM position 20;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column TIT_ELEITOR_ZONA position 21;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column TIT_ELEITOR_SECAO position 22;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column RESERVISTA position 23;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column ID_ESTADO_CIVIL position 24;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column CONJUGE_NOME position 25;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column CONJUGE_CPF position 26;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column FILIACAO_PAI position 27;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column FILIACAO_MAE position 28;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column ENDER_LOGRAD position 29;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column ENDER_NUM position 30;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column ENDER_COMPLEM position 31;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column ENDER_BAIRRO position 32;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column ENDER_CIDADE position 33;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column ID_ENDER_CIDADE position 34;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column ENDER_CEP position 35;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column ENDER_UF position 36;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column TELEFONE position 37;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column E_MAIL position 38;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column FOTO position 39;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column DESCR_ESTADO_CIVIL position 40;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column CPF_FTDO position 41;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column PIS_PASEP_FTDO position 42;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column ANO_CHEGADA_BRASIL position 43;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column ID_NACIONALIDADE position 44;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column DESCR_NACIONALIDADE position 45;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column ID_ESCOLARIDADE position 46;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column DESCR_ESCOLARIDADE position 47;


/*------ GERASYS.TI 27/07/2018 11:53:43 --------*/

alter table PESSOA_FISICA
alter column ANO_PRIM_EMPREGO position 48;


/*------ GERASYS.TI 27/07/2018 11:56:46 --------*/

CREATE TABLE ESOCIAL_TIPO_LOGRADOURO (
    CODIGO "VARCHAR(5)" NOT NULL,
    DESCRICAO "VARCHAR(30)");

ALTER TABLE ESOCIAL_TIPO_LOGRADOURO
ADD CONSTRAINT PK_ESOCIAL_TIPO_LOGRADOURO
PRIMARY KEY (CODIGO);

GRANT ALL ON ESOCIAL_TIPO_LOGRADOURO TO "PUBLIC";



/*------ GERASYS.TI 27/07/2018 12:14:16 --------*/

ALTER TABLE PESSOA_FISICA
    ADD ENDER_TIPO "VARCHAR(5)";

COMMENT ON COLUMN PESSOA_FISICA.ENDER_TIPO IS
'eSocial - Tipo do Logradouro:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 20';

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
alter ID_NATURAL_CIDADE position 8;

alter table PESSOA_FISICA
alter NATURAL_UF position 9;

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
alter CNH_DT_EMISSAO position 17;

alter table PESSOA_FISICA
alter CNH_DT_VENCTO position 18;

alter table PESSOA_FISICA
alter CNH_CATEG position 19;

alter table PESSOA_FISICA
alter TIT_ELEITOR_NUM position 20;

alter table PESSOA_FISICA
alter TIT_ELEITOR_ZONA position 21;

alter table PESSOA_FISICA
alter TIT_ELEITOR_SECAO position 22;

alter table PESSOA_FISICA
alter RESERVISTA position 23;

alter table PESSOA_FISICA
alter ID_ESTADO_CIVIL position 24;

alter table PESSOA_FISICA
alter CONJUGE_NOME position 25;

alter table PESSOA_FISICA
alter CONJUGE_CPF position 26;

alter table PESSOA_FISICA
alter FILIACAO_PAI position 27;

alter table PESSOA_FISICA
alter FILIACAO_MAE position 28;

alter table PESSOA_FISICA
alter ENDER_TIPO position 29;

alter table PESSOA_FISICA
alter ENDER_LOGRAD position 30;

alter table PESSOA_FISICA
alter ENDER_NUM position 31;

alter table PESSOA_FISICA
alter ENDER_COMPLEM position 32;

alter table PESSOA_FISICA
alter ENDER_BAIRRO position 33;

alter table PESSOA_FISICA
alter ENDER_CIDADE position 34;

alter table PESSOA_FISICA
alter ID_ENDER_CIDADE position 35;

alter table PESSOA_FISICA
alter ENDER_CEP position 36;

alter table PESSOA_FISICA
alter ENDER_UF position 37;

alter table PESSOA_FISICA
alter TELEFONE position 38;

alter table PESSOA_FISICA
alter E_MAIL position 39;

alter table PESSOA_FISICA
alter FOTO position 40;

alter table PESSOA_FISICA
alter DESCR_ESTADO_CIVIL position 41;

alter table PESSOA_FISICA
alter CPF_FTDO position 42;

alter table PESSOA_FISICA
alter PIS_PASEP_FTDO position 43;

alter table PESSOA_FISICA
alter ANO_CHEGADA_BRASIL position 44;

alter table PESSOA_FISICA
alter ID_NACIONALIDADE position 45;

alter table PESSOA_FISICA
alter DESCR_NACIONALIDADE position 46;

alter table PESSOA_FISICA
alter ID_ESCOLARIDADE position 47;

alter table PESSOA_FISICA
alter DESCR_ESCOLARIDADE position 48;

alter table PESSOA_FISICA
alter ANO_PRIM_EMPREGO position 49;




/*------ GERASYS.TI 27/07/2018 12:14:30 --------*/

ALTER TABLE PESSOA_FISICA ALTER COLUMN ENDER_TIPO
SET DEFAULT 'IND'
;




/*------ GERASYS.TI 27/07/2018 12:14:55 --------*/

ALTER TABLE PESSOA_FISICA
ADD CONSTRAINT FK_PESSOA_FISICA_3
FOREIGN KEY (ENDER_TIPO)
REFERENCES ESOCIAL_TIPO_LOGRADOURO(CODIGO);

