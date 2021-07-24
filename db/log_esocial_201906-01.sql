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

/*------ GERASYS.TI 13/06/2019 12:13:07 --------*/

ALTER TABLE PESSOA_FISICA
    ADD ID_NATURAL_CIDADE "INTEGER";

COMMENT ON COLUMN PESSOA_FISICA.ID_NATURAL_CIDADE IS
'eSocial - Codigo do Municipio de nascimento conforme a tabela do IBGE.';

/*------ GERASYS.TI 13/06/2019 13:19:12 --------*/

ALTER TABLE PESSOA_FISICA
    ADD CNH_DT_EMISSAO "DATE",
    ADD ENDER_TIPO "VARCHAR(5)" DEFAULT 'IND',
    ADD ID_ENDER_CIDADE "INTEGER",
    ADD DEFICIENTE_FISICO SIM_NAO,
    ADD DEFICIENTE_VISUAL SIM_NAO,
    ADD DEFICIENTE_AUDITIVO SIM_NAO,
    ADD DEFICIENTE_MENTAL SIM_NAO,
    ADD DEFICIENTE_INTELECTUAL SIM_NAO,
    ADD DEFICIENTE_READAPTADO SIM_NAO,
    ADD DEFICIENTE_COTA SIM_NAO,
    ADD DEFICIENTE_OBS "VARCHAR(250)",
    ADD TIPO_OPERACAO ESOCIAL_OPERACAO,
    ADD DATA_OPERACAO ESOCIAL_DATA;

COMMENT ON COLUMN PESSOA_FISICA.CNH_DT_EMISSAO IS
'eSocial - Data de emissao da CNH';

COMMENT ON COLUMN PESSOA_FISICA.ENDER_TIPO IS
'eSocial - Tipo do Logradouro:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 20';

COMMENT ON COLUMN PESSOA_FISICA.ID_ENDER_CIDADE IS
'eSocial - Codigo do Municipio de residencia conforme a tabela do IBGE.';

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_FISICO IS
'eSocial - Deficiente Fisico:
N - Nao
S - Sim';

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_VISUAL IS
'eSocial - Deficiente Visual:
N - Nao
S - Sim';

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_AUDITIVO IS
' eSocial - Deficiente Auditivo:
N - Nao
S - Sim';

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_MENTAL IS
'eSocial - Deficiencia Mental:
N - Nao
S - Sim';

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_INTELECTUAL IS
'eSocial - Deficiente Intelectual:
N - Nao
S - Sim';

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_READAPTADO IS
'eSocial - Deficiente Reabilitado:
N - Nao
S - Sim

Readaptado: O servidor esta investido em cargo de atribuicoes e responsabilidades
compativeis com a limitacao que tenha sofrido em sua capacidade fisica ou mental
verificada em inspecao medica.';

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_COTA IS
'eSocial - Deficiente com uso de Cota:
N - Nao
S - Sim';

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_OBS IS
'eSocial - Deficiente (Observacoes)';

COMMENT ON COLUMN PESSOA_FISICA.TIPO_OPERACAO IS
'eSocial - Operacao do registro:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';

COMMENT ON COLUMN PESSOA_FISICA.DATA_OPERACAO IS
'eSocial - Data da operacao de insercao ou edicao do registro';

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
alter ID_NATURAL_CIDADE position 9;

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
alter ENDER_TIPO position 28;

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
alter ID_ENDER_CIDADE position 35;

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
alter CNH_CATEG position 46;

alter table PESSOA_FISICA
alter ID_ESCOLARIDADE position 47;

alter table PESSOA_FISICA
alter DESCR_ESCOLARIDADE position 48;

alter table PESSOA_FISICA
alter ANO_PRIM_EMPREGO position 49;

alter table PESSOA_FISICA
alter RG_COMPLETO position 50;

alter table PESSOA_FISICA
alter DEFICIENTE_FISICO position 51;

alter table PESSOA_FISICA
alter DEFICIENTE_VISUAL position 52;

alter table PESSOA_FISICA
alter DEFICIENTE_AUDITIVO position 53;

alter table PESSOA_FISICA
alter DEFICIENTE_MENTAL position 54;

alter table PESSOA_FISICA
alter DEFICIENTE_INTELECTUAL position 55;

alter table PESSOA_FISICA
alter DEFICIENTE_READAPTADO position 56;

alter table PESSOA_FISICA
alter DEFICIENTE_COTA position 57;

alter table PESSOA_FISICA
alter DEFICIENTE_OBS position 58;

alter table PESSOA_FISICA
alter TIPO_OPERACAO position 59;

alter table PESSOA_FISICA
alter DATA_OPERACAO position 60;

/*------ GERASYS.TI 13/06/2019 13:19:39 --------*/

UPDATE PESSOA_FISICA
SET DEFICIENTE_FISICO = 'N',
    DEFICIENTE_VISUAL = 'N',
    DEFICIENTE_AUDITIVO = 'N',
    DEFICIENTE_MENTAL = 'N',
    DEFICIENTE_INTELECTUAL = 'N',
    DEFICIENTE_READAPTADO = 'N',
    DEFICIENTE_COTA = 'N',
    TIPO_OPERACAO = 'I';

/*------ GERASYS.TI 13/06/2019 13:20:18 --------*/

ALTER TABLE PESSOA_FISICA
ADD CONSTRAINT FK_PESSOA_FISICA_TIPO_LOG
FOREIGN KEY (ENDER_TIPO)
REFERENCES ESOCIAL_TIPO_LOGRADOURO(CODIGO);

/*------ GERASYS.TI 13/06/2019 13:38:01 --------*/

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



/*------ GERASYS.TI 13/06/2019 13:40:41 --------*/

SET TERM ^ ;

CREATE trigger tg_pessoa_fisica_esocial_oper for pessoa_fisica
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
end^

SET TERM ; ^




/*------ GERASYS.TI 13/06/2019 13:41:20 --------*/

SET TERM ^ ;

CREATE trigger tg_horario_esocial_oper for tab_horario
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

/*------ GERASYS.TI 13/06/2019 13:46:53 --------*/

Update PESSOA_FISICA p Set
  p.data_operacao = (Select min(s.dt_admissao) from SERVIDOR s where s.id_pessoa_fisica = p.id and s.dt_admissao is not null)
where p.data_operacao is not null;

/*------ GERASYS.TI 13/06/2019 13:46:57 --------*/

COMMIT WORK;
