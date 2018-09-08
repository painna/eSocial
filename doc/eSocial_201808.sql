


/*------ GERASYS.TI 10/08/2018 12:57:20 --------*/

ALTER TABLE PESSOA_FISICA
    ADD DEFICIENTE_FISICO SIM_NAO,
    ADD DEFICIENTE_VISUAL SIM_NAO,
    ADD DEFICIENTE_AUDITIVO SIM_NAO,
    ADD DEFICIENTE_MENTAL SIM_NAO,
    ADD DEFICIENTE_INTELECTUAL SIM_NAO,
    ADD DEFICIENTE_READAPTADO SIM_NAO,
    ADD DEFIFIENTE_COTA SIM_NAO,
    ADD DEFICIENTE_OBS "VARCHAR(250)";

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_FISICO IS
'eSocial - Deficiente Fisico:
N - Nao
S - Sim';

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_VISUAL IS
'eSocial - Deficiente Visual:
N - Nao
S - Sim';

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_AUDITIVO IS
'eSocial - Deficiente Auditivo:
N - Nao
S - Sim';

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_INTELECTUAL IS
'eSocial - Deficiente Mental:
N - Nao
S - Sim';

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_READAPTADO IS
'eSocial - Deficiente Reabilitado:
N - Nao
S - Sim

Readaptado: O servidor esta investido em cargo de atribuicoes e responsabilidades
compativeis com a limitacao que tenha sofrido em sua capacidade fisica ou mental
verificada em inspecao medica.';

COMMENT ON COLUMN PESSOA_FISICA.DEFIFIENTE_COTA IS
'eSocial - Deficiente com uso de Cota:
N - Nao
S - Sim';

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_OBS IS
'eSocial - Deficiente (Observacoes)';




/*------ GERASYS.TI 10/08/2018 12:57:46 --------*/

UPDATE PESSOA_FISICA
SET DEFICIENTE_FISICO = 'N',
    DEFICIENTE_VISUAL = 'N',
    DEFICIENTE_AUDITIVO = 'N',
    DEFICIENTE_MENTAL = 'N',
    DEFICIENTE_INTELECTUAL = 'N',
    DEFICIENTE_READAPTADO = 'N',
    DEFIFIENTE_COTA = 'N';



/*------ GERASYS.TI 10/08/2018 13:16:18 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
PESSOA_FISICA_DEPENDENTE.PARENTESCO.
At line 3, column 40.

*/


/*------ GERASYS.TI 10/08/2018 13:25:29 --------*/

CREATE TABLE ESOCIAL_TIPO_DEPENDENTE (
    CODIGO "CHAR(2)" NOT NULL,
    DESCRICAO "VARCHAR(250)");

ALTER TABLE ESOCIAL_TIPO_DEPENDENTE
ADD CONSTRAINT PK_ESOCIAL_TIPO_DEPENDENTE
PRIMARY KEY (CODIGO);

COMMENT ON COLUMN ESOCIAL_TIPO_DEPENDENTE.CODIGO IS
'Codigo';

COMMENT ON COLUMN ESOCIAL_TIPO_DEPENDENTE.DESCRICAO IS
'Descricao';

GRANT ALL ON ESOCIAL_TIPO_DEPENDENTE TO "PUBLIC";



/*------ GERASYS.TI 10/08/2018 13:28:09 --------*/

ALTER TABLE PESSOA_FISICA_DEPENDENTE
    ADD ID_PARENTESTO "CHAR(2)";

COMMENT ON COLUMN PESSOA_FISICA_DEPENDENTE.ID_PARENTESTO IS
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
alter ID_PARENTESTO position 7;

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




/*------ GERASYS.TI 10/08/2018 13:28:55 --------*/

ALTER TABLE PESSOA_FISICA_DEPENDENTE ALTER ID_PARENTESTO TO ID_TIPO_DEPENDENTE;




/*------ GERASYS.TI 10/08/2018 13:29:16 --------*/

ALTER TABLE PESSOA_FISICA_DEPENDENTE
ADD CONSTRAINT FK_PESSOA_FISICA_DEPENDENTE_2
FOREIGN KEY (ID_TIPO_DEPENDENTE)
REFERENCES ESOCIAL_TIPO_DEPENDENTE(CODIGO);




/*------ GERASYS.TI 10/08/2018 13:38:20 --------*/

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




/*------ GERASYS.TI 10/08/2018 13:38:33 --------*/

ALTER TABLE SERVIDOR_DEPENDENTE
ADD CONSTRAINT FK_SERVIDOR_DEPENDENTE_2
FOREIGN KEY (ID_TIPO_DEPENDENTE)
REFERENCES ESOCIAL_TIPO_DEPENDENTE(CODIGO);



/*------ GERASYS.TI 10/08/2018 13:39:27 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 7, column 1.
from.

*/

/*------ GERASYS.TI 10/08/2018 13:39:41 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
D.ID_PESSOA.
At line 8, column 9.

*/

/*------ GERASYS.TI 10/08/2018 13:39:51 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
D.CPF.
At line 5, column 7.

*/

/*------ GERASYS.TI 10/08/2018 13:42:47 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 5, column 14.
.

*/


/*------ GERASYS.TI 10/08/2018 13:47:52 --------*/

ALTER TABLE SERVIDOR_DEPENDENTE
    ADD CPF INTEGER;

COMMENT ON COLUMN SERVIDOR_DEPENDENTE.CPF IS
'eSocial - CPF do dependente';

alter table SERVIDOR_DEPENDENTE
alter ID position 1;

alter table SERVIDOR_DEPENDENTE
alter ID_SERVIDOR position 2;

alter table SERVIDOR_DEPENDENTE
alter NOME position 3;

alter table SERVIDOR_DEPENDENTE
alter CPF position 4;

alter table SERVIDOR_DEPENDENTE
alter SEXO position 5;

alter table SERVIDOR_DEPENDENTE
alter PARENTESCO position 6;

alter table SERVIDOR_DEPENDENTE
alter ID_TIPO_DEPENDENTE position 7;

alter table SERVIDOR_DEPENDENTE
alter DT_NASCIMENTO position 8;

alter table SERVIDOR_DEPENDENTE
alter NATURAL_CIDADE position 9;

alter table SERVIDOR_DEPENDENTE
alter NATURAL_UF position 10;

alter table SERVIDOR_DEPENDENTE
alter CARTORIO_NOME position 11;

alter table SERVIDOR_DEPENDENTE
alter CARTORIO_CIDADE position 12;

alter table SERVIDOR_DEPENDENTE
alter CARTORIO_UF position 13;

alter table SERVIDOR_DEPENDENTE
alter REGISTRO_NUM position 14;

alter table SERVIDOR_DEPENDENTE
alter REGISTRO_LIVRO position 15;

alter table SERVIDOR_DEPENDENTE
alter REGISTRO_FOLHA position 16;

alter table SERVIDOR_DEPENDENTE
alter DEFICIENTE position 17;

alter table SERVIDOR_DEPENDENTE
alter ATIVO_SAL_FAMILIA position 18;

alter table SERVIDOR_DEPENDENTE
alter ATIVO_IRRF position 19;

alter table SERVIDOR_DEPENDENTE
alter PERCENT_PENSAO_ALIMENT position 20;

alter table SERVIDOR_DEPENDENTE
alter VALOR_PENSAO_ALIMENT position 21;

alter table SERVIDOR_DEPENDENTE
alter DESCR_PARENTESCO position 22;




/*------ GERASYS.TI 10/08/2018 13:50:19 --------*/

ALTER TABLE SERVIDOR_DEPENDENTE DROP CPF;




/*------ GERASYS.TI 10/08/2018 16:22:35 --------*/

ALTER TABLE SERVIDOR
    ADD ID_ENTID_SINDICAL "INTEGER";

COMMENT ON COLUMN SERVIDOR.ID_ENTID_SINDICAL IS
'eSocial - Entidade Sincical da Categoria';

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
alter ID_ENTID_SINDICAL position 16;

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
alter DESCR_SUB_UNID_ORCAM2 position 40;

alter table SERVIDOR
alter ID_UNID_GESTORA position 41;

alter table SERVIDOR
alter DESCR_UNID_LOTACAO position 42;

alter table SERVIDOR
alter DESCR_DEPTO position 43;

alter table SERVIDOR
alter DESCR_CARGO_ORIGEM position 44;

alter table SERVIDOR
alter DESCR_CARGO_ATUAL position 45;

alter table SERVIDOR
alter DESCR_ESCOLARIDADE position 46;

alter table SERVIDOR
alter DESCR_EST_FUNCIONAL position 47;

alter table SERVIDOR
alter DESCR_EFETIVO position 48;

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
alter NAO_CALCULAR_ATS position 59;

alter table SERVIDOR
alter DT_ADMISSAO2 position 60;

alter table SERVIDOR
alter ID_SYS_ANTER position 61;

alter table SERVIDOR
alter ID_HORARIO position 62;

alter table SERVIDOR
alter CALC_SAL_CARGO_ORIGEM position 63;

alter table SERVIDOR
alter REF_SAL_INICIAL position 64;

alter table SERVIDOR
alter DT_BASE_CALC_ATS position 65;

alter table SERVIDOR
alter DESVIO_DE_FUNCAO position 66;

alter table SERVIDOR
alter CATEG_SEFIP position 67;

alter table SERVIDOR
alter OCORRENCIA_SEFIP position 68;

alter table SERVIDOR
alter CPF_FTDO position 69;

alter table SERVIDOR
alter PIS_PASEP_FTDO position 70;

alter table SERVIDOR
alter DESCR_HORARIO position 71;

alter table SERVIDOR
alter DESCR_SUB_UNID_ORCAMENT position 72;

alter table SERVIDOR
alter CONTRA_CHEQUE_WEB position 73;

alter table SERVIDOR
alter NAO_CALC_SAL_FAM position 74;




/*------ GERASYS.TI 10/08/2018 16:22:58 --------*/

ALTER TABLE SERVIDOR
ADD CONSTRAINT FK_SERVIDOR_9
FOREIGN KEY (ID_ENTID_SINDICAL)
REFERENCES ENTID_SINDICAL(ID);



/*------ GERASYS.TI 08/09/2018 10:33:10 --------*/

/*!!! Error occured !!!
Unsuccessful execution caused by a system error that precludes successful execution of subsequent statements.
Dynamic SQL Error.
expression evaluation not supported.
Strings cannot be divided in dialect 3.

*/

/*------ GERASYS.TI 08/09/2018 10:33:38 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 44, column 52.
,.

*/

/*------ GERASYS.TI 08/09/2018 10:56:03 --------*/

/*!!! Error occured !!!
Unsuccessful execution caused by a system error that precludes successful execution of subsequent statements.
Dynamic SQL Error.
expression evaluation not supported.
Invalid data type for division in dialect 3.

*/

/*------ GERASYS.TI 08/09/2018 10:56:04 --------*/

/*!!! Error occured !!!
Unsuccessful execution caused by a system error that precludes successful execution of subsequent statements.
Dynamic SQL Error.
expression evaluation not supported.
Invalid data type for division in dialect 3.

*/

/*------ GERASYS.TI 08/09/2018 10:56:07 --------*/

/*!!! Error occured !!!
Unsuccessful execution caused by a system error that precludes successful execution of subsequent statements.
Dynamic SQL Error.
expression evaluation not supported.
Invalid data type for division in dialect 3.

*/

/*------ GERASYS.TI 08/09/2018 10:56:07 --------*/

/*!!! Error occured !!!
Unsuccessful execution caused by a system error that precludes successful execution of subsequent statements.
Dynamic SQL Error.
expression evaluation not supported.
Invalid data type for division in dialect 3.

*/

/*------ GERASYS.TI 08/09/2018 10:56:08 --------*/

/*!!! Error occured !!!
Unsuccessful execution caused by a system error that precludes successful execution of subsequent statements.
Dynamic SQL Error.
expression evaluation not supported.
Invalid data type for division in dialect 3.

*/

/*------ GERASYS.TI 08/09/2018 10:56:11 --------*/

/*!!! Error occured !!!
Unsuccessful execution caused by a system error that precludes successful execution of subsequent statements.
Dynamic SQL Error.
expression evaluation not supported.
Invalid data type for division in dialect 3.

*/

/*------ GERASYS.TI 08/09/2018 10:56:12 --------*/

/*!!! Error occured !!!
Unsuccessful execution caused by a system error that precludes successful execution of subsequent statements.
Dynamic SQL Error.
expression evaluation not supported.
Invalid data type for division in dialect 3.

*/

/*------ GERASYS.TI 08/09/2018 10:56:21 --------*/

/*!!! Error occured !!!
Unsuccessful execution caused by a system error that precludes successful execution of subsequent statements.
Dynamic SQL Error.
expression evaluation not supported.
Invalid data type for division in dialect 3.

*/


/*------ GERASYS.TI 08/09/2018 11:54:41 --------*/

ALTER TABLE SERVIDOR
    ADD TIPO_OPERACAO ESOCIAL_OPERACAO;

COMMENT ON COLUMN SERVIDOR.TIPO_OPERACAO IS
'eSocial - Operacao do registro:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';




/*------ GERASYS.TI 08/09/2018 11:54:49 --------*/

UPDATE SERVIDOR
SET TIPO_OPERACAO = 'I';




/*------ GERASYS.TI 08/09/2018 12:00:57 --------*/

ALTER TABLE PESSOA_FISICA ALTER DEFIFIENTE_COTA TO DEFICIENTE_COTA;

