/*------ GERASYS.TI 15/07/2021 18:27:30 --------*/

ALTER TABLE CONFIG_ESOCIAL
    ADD ID_EVENTO "VARCHAR(40)";

COMMENT ON COLUMN CONFIG_ESOCIAL.ID_EVENTO IS
'eSocial - ID atual do registro no portal eSocial (Evento S1000)';




/*------ GERASYS.TI 15/07/2021 18:28:10 --------*/

CREATE INDEX IDX_CONFIG_ESOCIAL_IDEVENTO
ON CONFIG_ESOCIAL (ID_EVENTO);



/*------ 15/07/2021 18:29:15 --------*/

ALTER TABLE UNID_GESTORA
    ADD ID_EVENTO "VARCHAR(40)";

/*------ 15/07/2021 18:29:15 --------*/

COMMENT ON COLUMN UNID_GESTORA.ID_EVENTO IS
'eSocial - ID atual do registro no portal eSocial (Evento S1005)';

/*------ 15/07/2021 18:29:15 --------*/

CREATE INDEX IDX_UNID_GESTORA_IDEVENTO
ON UNID_GESTORA (ID_EVENTO);

/*------ 15/07/2021 18:31:18 --------*/

ALTER TABLE EVENTO
    ADD ID_EVENTO "VARCHAR(40)";

/*------ 15/07/2021 18:31:18 --------*/

COMMENT ON COLUMN EVENTO.ID_EVENTO IS
'eSocial - ID atual do registro no portal eSocial (Evento S1010)';

/*------ 15/07/2021 18:31:18 --------*/

CREATE INDEX IDX_EVENTO_IDEVENTO
ON EVENTO (ID_EVENTO);

/*------ 15/07/2021 18:32:01 --------*/

ALTER TABLE CONFIG_ORGAO
    ADD ID_EVENTO "VARCHAR(40)";

/*------ 15/07/2021 18:32:01 --------*/

COMMENT ON COLUMN CONFIG_ORGAO.ID_EVENTO IS
'eSocial - ID atual do registro no portal eSocial (Evento S1020)';

/*------ 15/07/2021 18:32:01 --------*/

CREATE INDEX IDX_CONFIG_ORGAO_IDEVENTO
ON CONFIG_ORGAO (ID_EVENTO);



/*------ GERASYS.TI 23/07/2021 15:56:09 --------*/

COMMENT ON PROCEDURE SET_ESOCIAL_LOG_EVENTO IS 'Procedure SET Log Eventos x Protocolo

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Stored procedure responsavel por gravar os registros de associacao dos dados
de origem dos eventos e os protocolos de retorno.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    23/07/2021 - IMR :
        * Adicao do parametro ID_EVENTO que corresponde a identificacao do registro
          gerado/processado em arquivo XML.

    16/09/2018 - IMR :
        + Criacao da store procedure na base de dados.';




/*------ GERASYS.TI 23/07/2021 15:58:53 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_ESOCIAL_LOG_EVENTO (
    EVENTO "VARCHAR(10)",
    TABELA "VARCHAR(30)",
    CAMPO "VARCHAR(120)",
    VALORES "VARCHAR(100)",
    OPERACAO ESOCIAL_OPERACAO,
    ID "BIGINT",
    PROTOCOLO "VARCHAR(30)",
    ID_EVENTO "VARCHAR(40)")
as
begin
  if (exists(
    Select
      pr.id
    from ESOCIAL_RETORNO_PROTOCOLO pr
    where pr.numero = :protocolo
  )) then
  begin
    if (not exists(
      Select
        lg.tabela
      from ESOCIAL_LOG_EVENTO lg
      where lg.evento   = :evento
        and lg.operacao = :operacao
        and lg.id       = :id
        and lg.protocolo_envio = :protocolo
    )) then
    begin
      Insert Into ESOCIAL_LOG_EVENTO (
          evento
        , operacao
        , id
        , tabela
        , campo
        , valores
        , protocolo_envio
        , id_evento
      ) values (
          :evento
        , :operacao
        , :id
        , :tabela
        , :campo
        , :valores
        , :protocolo
        , :id_evento
      );
    end
  end
end^

SET TERM ; ^




/*------ GERASYS.TI 23/07/2021 16:16:53 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_ESOCIAL_LOG_EVENTO (
    PROTOCOLO "VARCHAR(30)")
as
declare variable TABELA "VARCHAR(40)";
declare variable CAMPO "VARCHAR(120)";
declare variable VALORES "VARCHAR(100)";
declare variable ID "VARCHAR(40)";
declare variable ID_EVENTO "VARCHAR(40)";
declare variable POS_CAMPO integer;
declare variable POS_VALOR integer;
declare variable SCRIPTUPDATE "VARCHAR(250)";
begin
  for
    Select
        lg.tabela
      , coalesce(lg.campo, 'ID')
      , coalesce(lg.valores, '')
      , cast(lg.id as "VARCHAR(40)")
      , trim(coalesce(lg.id_evento, ''))
    from ESOCIAL_LOG_EVENTO lg
    where lg.protocolo_envio = :protocolo
    Into
        tabela
      , campo
      , valores
      , id
      , id_evento
  do
  begin
    if (position(';', :valores) = 0) then
    begin
      scriptUpdate = 'Update ' || :tabela || ' set TIPO_OPERACAO = ''P'', ID_EVENTO = ''' || :id_evento || '''  where ' || :campo || ' = ' || :id;
      execute statement :scriptUpdate;
    end
    else
    begin
      pos_campo = position(';', :campo);
      pos_valor = position(';', :valores);
      scriptUpdate = 'Update ' || :tabela || ' set TIPO_OPERACAO = ''P'', ID_EVENTO = ''' || :id_evento || '''  ' ||
        'where ' || substring(:campo from 1 for :pos_campo - 1)                   || ' = ' || substring(:valores from 1 for :pos_valor - 1) ||
        '  and ' || substring(:campo from :pos_campo + 1 for char_length(:campo)) || ' = ' || substring(:valores from :pos_valor + 1 for char_length(:valores));
      execute statement :scriptUpdate;
    end
  end 
end^

SET TERM ; ^




/*------ GERASYS.TI 23/07/2021 16:18:14 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_ESOCIAL_LOG_EVENTO (
    PROTOCOLO "VARCHAR(30)")
as
declare variable TABELA "VARCHAR(40)";
declare variable CAMPO "VARCHAR(120)";
declare variable VALORES "VARCHAR(100)";
declare variable ID "VARCHAR(40)";
declare variable ID_EVENTO "VARCHAR(40)";
declare variable POS_CAMPO integer;
declare variable POS_VALOR integer;
declare variable SCRIPTUPDATE "VARCHAR(250)";
begin
  for
    Select
        lg.tabela
      , coalesce(lg.campo, 'ID')
      , coalesce(lg.valores, '')
      , cast(lg.id as "VARCHAR(40)")
      , trim(coalesce(lg.id_evento, ''))
    from ESOCIAL_LOG_EVENTO lg
    where lg.protocolo_envio = :protocolo
    Into
        tabela
      , campo
      , valores
      , id
      , id_evento
  do
  begin
    if (position(';', :valores) = 0) then
    begin
      scriptUpdate = 'Update ' || :tabela || ' set TIPO_OPERACAO = ''P'', ID_EVENTO = ''' || :id_evento || '''  where ' || :campo || ' = ' || :id;
      execute statement :scriptUpdate;
    end
    else
    begin
      pos_campo = position(';', :campo);
      pos_valor = position(';', :valores);
      scriptUpdate = 'Update ' || :tabela || ' set TIPO_OPERACAO = ''P'', ID_EVENTO = ''' || :id_evento || '''  ' ||
        'where ' || substring(:campo from 1 for :pos_campo - 1)                   || ' = ' || substring(:valores from 1 for :pos_valor - 1) ||
        '  and ' || substring(:campo from :pos_campo + 1 for char_length(:campo)) || ' = ' || substring(:valores from :pos_valor + 1 for char_length(:valores));
      execute statement :scriptUpdate;
    end
  end 
end^

SET TERM ; ^

COMMENT ON PROCEDURE SP_ESOCIAL_LOG_EVENTO IS 'Procedure SP Log Eventos x Protocolo (Processar)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Stored procedure responsavel por processar os LOGs de envio dos eventos, evitando
assim que determinados dados enviados/processados pelo eSocial sejam novamente
enviados.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    23/07/2021 - IMR :
        * Inclusao do campo ID_EVENTO no processamento de retorno dos eventos
          enviados ao e-Social.

    16/09/2018 - IMR :
        + Criacao da store procedure na base de dados.';



/*------ GERASYS.TI 23/07/2021 16:51:37 --------*/



/*------ 23/07/2021 18:46:36 --------*/

CREATE DOMAIN "VARCHAR(260)" AS
VARCHAR(260);

/*------ 23/07/2021 18:46:36 --------*/

CREATE DOMAIN "VARCHAR(270)" AS
VARCHAR(270);

/*------ 23/07/2021 18:46:36 --------*/

CREATE TABLE ESOCIAL_CATEGORIA_TRAB (
    CODIGO     "CHAR(3)" NOT NULL,
    DESCRICAO  "VARCHAR(270)"
);

/*------ 23/07/2021 18:46:36 --------*/

ALTER TABLE ESOCIAL_CATEGORIA_TRAB ADD CONSTRAINT PK_ESOCIAL_CATEGORIA_TRAB PRIMARY KEY (CODIGO);

/*------ 23/07/2021 18:46:36 --------*/

GRANT ALL ON ESOCIAL_CATEGORIA_TRAB TO "GERASYS.TI" WITH GRANT OPTION;

/*------ 23/07/2021 18:46:36 --------*/

ALTER TABLE SERVIDOR
    ADD ID_ENTID_SINDICAL "INTEGER",
    ADD CONSELHO_ORGAO "VARCHAR(10)",
    ADD CONSELHO_UF "CHAR(2)" DEFAULT 'PA',
    ADD CONSELHO_DT_EMISSAO "DATE",
    ADD CONSELHO_DT_VALIDADE "DATE",
    ADD TIPO_OPERACAO ESOCIAL_OPERACAO,
    ADD DATA_OPERACAO ESOCIAL_DATA,
    ADD CATEGORIA_TRAB "CHAR(3)";

/*------ 23/07/2021 18:46:36 --------*/

COMMENT ON COLUMN SERVIDOR.ID_ENTID_SINDICAL IS
'eSocial - Entidade Sincical da Categoria';

/*------ 23/07/2021 18:46:36 --------*/

COMMENT ON COLUMN SERVIDOR.CONSELHO_REGISTRO IS
'eSocial - (OC - Orgao da Classe) - Registro/numero no conselho';

/*------ 23/07/2021 18:46:36 --------*/

COMMENT ON COLUMN SERVIDOR.CONSELHO_ORGAO IS
'eSocial - (OC - Orgao da Classe) - Orgao do conselho';

/*------ 23/07/2021 18:46:36 --------*/

COMMENT ON COLUMN SERVIDOR.CONSELHO_UF IS
'eSocial - (OC - Orgao da Classe) - UF dpo conselho';

/*------ 23/07/2021 18:46:36 --------*/

COMMENT ON COLUMN SERVIDOR.CONSELHO_DT_EMISSAO IS
'eSocial - (OC - Orgao da Classe) - Data de emissao do registro';

/*------ 23/07/2021 18:46:36 --------*/

COMMENT ON COLUMN SERVIDOR.CONSELHO_DT_VALIDADE IS
'eSocial - (OC - Orgao da Classe) - Data de validade do registro';

/*------ 23/07/2021 18:46:37 --------*/

COMMENT ON COLUMN SERVIDOR.TIPO_OPERACAO IS
'eSocial - Operacao do registro:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';

/*------ 23/07/2021 18:46:37 --------*/

COMMENT ON COLUMN SERVIDOR.DATA_OPERACAO IS
'eSocial - Data da operacao de insercao ou edicao do registro';

/*------ 23/07/2021 18:46:37 --------*/

COMMENT ON COLUMN SERVIDOR.CATEGORIA_TRAB IS
'eSocial - Categoria do Trabalhador:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 01';

/*------ 23/07/2021 18:56:49 --------*/

ALTER TABLE SERVIDOR
ADD CONSTRAINT FK_SERVIDOR_SINDICATO
FOREIGN KEY (ID_ENTID_SINDICAL)
REFERENCES ENTID_SINDICAL(ID);

/*------ 23/07/2021 18:56:49 --------*/

ALTER TABLE SERVIDOR
ADD CONSTRAINT FK_SERVIDOR_CATEGORIA
FOREIGN KEY (CATEGORIA_TRAB)
REFERENCES ESOCIAL_CATEGORIA_TRAB(CODIGO);

/*------ 23/07/2021 19:07:14 --------*/

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
end;;

/*------ 23/07/2021 19:07:14 --------*/

COMMENT ON DOMAIN ESOCIAL_SMALLINT IS 'eSocial - Inteiro de baixo valor';

/*------ 23/07/2021 19:07:14 --------*/

ALTER TABLE TAB_RACA_COR
    ADD ID_ESOCIAL ESOCIAL_SMALLINT DEFAULT 6;

/*------ 23/07/2021 19:07:14 --------*/

COMMENT ON COLUMN TAB_RACA_COR.ID_ESOCIAL IS
'eSocial - Identificacao da Raça e cor do trabalhador:
1 - Branca
2 - Preta
3 - Parda
4 - Amarela
5 - Indígena
6 - Não informado';

/*------ 23/07/2021 19:07:14 --------*/

ALTER TABLE ESTADO_CIVIL
    ADD ID_ESOCIAL ESOCIAL_SMALLINT;

/*------ 23/07/2021 19:07:14 --------*/

COMMENT ON COLUMN ESTADO_CIVIL.ID_ESOCIAL IS
'eSocial - Identificacao do Estado civil do trabalhador, conforme opções abaixo:
1 - Solteiro
2 - Casado
3 - Divorciado
4 - Separado
5 - Viúvo';

/*------ 23/07/2021 19:07:14 --------*/

ALTER TABLE ESCOLARIDADE
    ADD ID_ESOCIAL "CHAR(2)";

/*------ 23/07/2021 19:07:14 --------*/

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

/*------ 23/07/2021 19:07:14 --------*/

ALTER TABLE NACIONALIDADE
    ADD ID_ESOCIAL "CHAR(3)";

/*------ 23/07/2021 19:07:14 --------*/

COMMENT ON COLUMN NACIONALIDADE.ID_ESOCIAL IS
'eSocial - Pais de Nascimento:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 06';

/*------ 23/07/2021 19:07:14 --------*/

CREATE TABLE ESOCIAL_TIPO_LOGRADOURO (
    CODIGO     "VARCHAR(5)" NOT NULL,
    DESCRICAO  "VARCHAR(30)"
);

/*------ 23/07/2021 19:07:14 --------*/

ALTER TABLE ESOCIAL_TIPO_LOGRADOURO
ADD CONSTRAINT PK_ESOCIAL_TIPO_LOGRADOURO
PRIMARY KEY (CODIGO);

/*------ 23/07/2021 19:07:14 --------*/

GRANT ALL ON ESOCIAL_TIPO_LOGRADOURO TO "GERASYS.TI" WITH GRANT OPTION;

/*------ 23/07/2021 19:07:14 --------*/

GRANT ALL ON ESOCIAL_TIPO_LOGRADOURO TO GERASYSTI WITH GRANT OPTION;

/*------ 23/07/2021 19:07:14 --------*/

GRANT ALL ON ESOCIAL_TIPO_LOGRADOURO TO PUBLIC;

/*------ 23/07/2021 19:07:14 --------*/

GRANT ALL ON ESOCIAL_TIPO_LOGRADOURO TO PUBLIC WITH GRANT OPTION;

/*------ 23/07/2021 19:07:14 --------*/

ALTER TABLE PESSOA_FISICA
    ADD ID_NATURAL_CIDADE "INTEGER";

/*------ 23/07/2021 19:07:14 --------*/

COMMENT ON COLUMN PESSOA_FISICA.ID_NATURAL_CIDADE IS
'eSocial - Codigo do Municipio de nascimento conforme a tabela do IBGE.';

/*------ 23/07/2021 19:07:14 --------*/

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

/*------ 23/07/2021 19:07:14 --------*/

COMMENT ON COLUMN PESSOA_FISICA.CNH_DT_EMISSAO IS
'eSocial - Data de emissao da CNH';

/*------ 23/07/2021 19:07:14 --------*/

COMMENT ON COLUMN PESSOA_FISICA.ENDER_TIPO IS
'eSocial - Tipo do Logradouro:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 20';

/*------ 23/07/2021 19:07:14 --------*/

COMMENT ON COLUMN PESSOA_FISICA.ID_ENDER_CIDADE IS
'eSocial - Codigo do Municipio de residencia conforme a tabela do IBGE.';

/*------ 23/07/2021 19:07:14 --------*/

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_FISICO IS
'eSocial - Deficiente Fisico:
N - Nao
S - Sim';

/*------ 23/07/2021 19:07:14 --------*/

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_VISUAL IS
'eSocial - Deficiente Visual:
N - Nao
S - Sim';

/*------ 23/07/2021 19:07:14 --------*/

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_AUDITIVO IS
' eSocial - Deficiente Auditivo:
N - Nao
S - Sim';

/*------ 23/07/2021 19:07:14 --------*/

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_MENTAL IS
'eSocial - Deficiencia Mental:
N - Nao
S - Sim';

/*------ 23/07/2021 19:07:14 --------*/

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_INTELECTUAL IS
'eSocial - Deficiente Intelectual:
N - Nao
S - Sim';

/*------ 23/07/2021 19:07:14 --------*/

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_READAPTADO IS
'eSocial - Deficiente Reabilitado:
N - Nao
S - Sim

Readaptado: O servidor esta investido em cargo de atribuicoes e responsabilidades
compativeis com a limitacao que tenha sofrido em sua capacidade fisica ou mental
verificada em inspecao medica.';

/*------ 23/07/2021 19:07:14 --------*/

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_COTA IS
'eSocial - Deficiente com uso de Cota:
N - Nao
S - Sim';

/*------ 23/07/2021 19:07:14 --------*/

COMMENT ON COLUMN PESSOA_FISICA.DEFICIENTE_OBS IS
'eSocial - Deficiente (Observacoes)';

/*------ 23/07/2021 19:07:14 --------*/

COMMENT ON COLUMN PESSOA_FISICA.TIPO_OPERACAO IS
'eSocial - Operacao do registro:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';

/*------ 23/07/2021 19:07:14 --------*/

COMMENT ON COLUMN PESSOA_FISICA.DATA_OPERACAO IS
'eSocial - Data da operacao de insercao ou edicao do registro';

/*------ 23/07/2021 19:12:43 --------*/

ALTER TABLE PESSOA_FISICA
ADD CONSTRAINT FK_PESSOA_FISICA_TIPO_LOG
FOREIGN KEY (ENDER_TIPO)
REFERENCES ESOCIAL_TIPO_LOGRADOURO(CODIGO);

/*------ 23/07/2021 19:12:43 --------*/

ALTER TABLE TAB_HORARIO
    ADD TIPO_OPERACAO ESOCIAL_OPERACAO,
    ADD PERMITE_FLEXIBILIDADE SIM_NAO,
    ADD TIPO_INTERVALO ESOCIAL_TIPO_2,
    ADD DURACAO_JORNADA "CHAR(4)",
    ADD DURACAO_INTERVALO "CHAR(4)",
    ADD INTERVALO_INICIO "CHAR(4)",
    ADD INTERVALO_FINAL "CHAR(4)";

/*------ 23/07/2021 19:12:43 --------*/

COMMENT ON COLUMN TAB_HORARIO.TIPO_OPERACAO IS
'eSocial - Operacao do registro:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';

/*------ 23/07/2021 19:12:43 --------*/

COMMENT ON COLUMN TAB_HORARIO.PERMITE_FLEXIBILIDADE IS
'eSocial - Permite flexibilidade:
N - Nao
S - Sim';

/*------ 23/07/2021 19:12:44 --------*/

COMMENT ON COLUMN TAB_HORARIO.TIPO_INTERVALO IS
'eSocial - Tipo de intervalo:
1 - Intervalor me horario fixo
2 - Intervalor me horario variado';

/*------ 23/07/2021 19:12:44 --------*/

COMMENT ON COLUMN TAB_HORARIO.DURACAO_JORNADA IS
'eSocial - Duracao da jornada em minutos';

/*------ 23/07/2021 19:12:44 --------*/

COMMENT ON COLUMN TAB_HORARIO.DURACAO_INTERVALO IS
'eSocial - Duracao do intervalo em minutos';

/*------ 23/07/2021 19:12:44 --------*/

COMMENT ON COLUMN TAB_HORARIO.INTERVALO_INICIO IS
'eSocial - Hora inicial do intervalo';

/*------ 23/07/2021 19:12:44 --------*/

COMMENT ON COLUMN TAB_HORARIO.INTERVALO_FINAL IS
'eSocial - Hora final do intervalor';

/*------ 23/07/2021 19:12:44 --------*/

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

/*------ 23/07/2021 19:12:44 --------*/

SET TERM ; ^

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

/*------ 23/07/2021 19:12:44 --------*/

SET TERM ; ^


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column ID position 1;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column ID_PESSOA_FISICA position 2;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column MATRICULA position 3;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column EFETIVO position 4;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DT_CONCURSO position 5;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DT_ADMISSAO position 6;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DT_READMISSAO position 7;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DOCTO_ADMISSAO position 8;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column ANO_PRIM_EMPREGO position 9;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column ID_SITUACAO_TCM position 10;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column ID_SUB_UNID_ORCAMENT position 11;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column ID_UNID_LOTACAO position 12;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column ID_DEPTO position 13;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column ID_CARGO_ORIGEM position 14;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column ID_CARGO_ATUAL position 15;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column REF_SALARIO position 16;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column VENCTO_BASE position 17;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column ID_ESCOLARIDADE position 18;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column FORMACAO position 19;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column CARGA_HOR_MENSAL position 20;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column QTD_DEPEND_IRRF position 21;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column CALC_VENCTO_BASE position 22;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column BLOQ_LANCTO_EVENTO_AUTO position 23;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column CALC_PREVID position 24;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column CALC_IRRF position 25;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column ID_EST_FUNCIONAL position 26;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column HORA_ENTRADA1 position 27;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column HORA_SAIDA1 position 28;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column HORA_ENTRADA2 position 29;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column HORA_SAIDA2 position 30;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column OBSERVACAO position 31;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column STATUS position 32;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DESCR_SITUAC_TCM position 33;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DESCR_SUB_UNID_ORCAMENT position 34;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DESCR_SUB_UNID_ORCAM2 position 35;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column ID_UNID_GESTORA position 36;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DESCR_UNID_LOTACAO position 37;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DESCR_DEPTO position 38;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DESCR_CARGO_ORIGEM position 39;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DESCR_CARGO_ATUAL position 40;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DESCR_ESCOLARIDADE position 41;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DESCR_EST_FUNCIONAL position 42;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column NOME_SERVIDOR position 43;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column TIPO_SAL position 44;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column FORMA_CALC_SAL position 45;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column BASE_CALC_HORA_AULA position 46;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column MOVIM_DEFINITIVA position 47;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column CPF_PF position 48;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column PIS_PASEP_PF position 49;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DT_NASCIMENTO_PF position 50;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column ID_RACA_COR_PF position 51;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DESCR_RACA_COR position 52;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DESCR_EFETIVO position 53;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column NAO_CALCULAR_ATS position 54;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DT_ADMISSAO2 position 55;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column ID_SYS_ANTER position 56;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column ID_HORARIO position 57;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column CALC_SAL_CARGO_ORIGEM position 58;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DESCR_HORARIO position 59;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column REF_SAL_INICIAL position 60;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DT_BASE_CALC_ATS position 61;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DESVIO_DE_FUNCAO position 62;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column CATEG_SEFIP position 63;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column OCORRENCIA_SEFIP position 64;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column CPF_FTDO position 65;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column PIS_PASEP_FTDO position 66;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column CONTRA_CHEQUE_WEB position 67;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column NAO_CALC_SAL_FAM position 68;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column GRUPO_C_CHEQUE position 69;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column PARENT_INST_PENSAO position 70;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column ID_INST_PENSAO position 71;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column ID_SESSAO position 72;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column OPER_USUARIO position 73;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column SITUAC_FUNCIONAL_TCM position 74;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DESCR_SITUAC_FUNCIONAL_TCM position 75;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column MATRIC_CONSIG position 76;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column ID_ENTID_SINDICAL position 77;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column CONSELHO_REGISTRO position 78;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column CONSELHO_ORGAO position 79;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column CONSELHO_UF position 80;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column CONSELHO_DT_EMISSAO position 81;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column CONSELHO_DT_VALIDADE position 82;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column TIPO_OPERACAO position 83;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column DATA_OPERACAO position 84;


/*------ GERASYS.TI 23/07/2021 19:14:49 --------*/

alter table SERVIDOR
alter column CATEGORIA_TRAB position 85;


/*------ GERASYS.TI 23/07/2021 19:25:07 --------*/

ALTER TABLE PESSOA_FISICA
    ADD CTPS_UF "CHAR(2)";

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
alter RG_NUM position 9;

alter table PESSOA_FISICA
alter RG_ORGAO_EMISSOR position 10;

alter table PESSOA_FISICA
alter RG_UF position 11;

alter table PESSOA_FISICA
alter RG_DT_EMISSAO position 12;

alter table PESSOA_FISICA
alter CPF position 13;

alter table PESSOA_FISICA
alter PIS_PASEP position 14;

alter table PESSOA_FISICA
alter CNH_NUM position 15;

alter table PESSOA_FISICA
alter CNH_DT_VENCTO position 16;

alter table PESSOA_FISICA
alter TIT_ELEITOR_NUM position 17;

alter table PESSOA_FISICA
alter TIT_ELEITOR_ZONA position 18;

alter table PESSOA_FISICA
alter TIT_ELEITOR_SECAO position 19;

alter table PESSOA_FISICA
alter RESERVISTA position 20;

alter table PESSOA_FISICA
alter ID_ESTADO_CIVIL position 21;

alter table PESSOA_FISICA
alter CONJUGE_NOME position 22;

alter table PESSOA_FISICA
alter CONJUGE_CPF position 23;

alter table PESSOA_FISICA
alter FILIACAO_PAI position 24;

alter table PESSOA_FISICA
alter FILIACAO_MAE position 25;

alter table PESSOA_FISICA
alter ENDER_LOGRAD position 26;

alter table PESSOA_FISICA
alter ENDER_NUM position 27;

alter table PESSOA_FISICA
alter ENDER_BAIRRO position 28;

alter table PESSOA_FISICA
alter ENDER_CIDADE position 29;

alter table PESSOA_FISICA
alter ENDER_CEP position 30;

alter table PESSOA_FISICA
alter ENDER_UF position 31;

alter table PESSOA_FISICA
alter TELEFONE position 32;

alter table PESSOA_FISICA
alter E_MAIL position 33;

alter table PESSOA_FISICA
alter FOTO position 34;

alter table PESSOA_FISICA
alter DESCR_ESTADO_CIVIL position 35;

alter table PESSOA_FISICA
alter CPF_FTDO position 36;

alter table PESSOA_FISICA
alter PIS_PASEP_FTDO position 37;

alter table PESSOA_FISICA
alter ENDER_COMPLEM position 38;

alter table PESSOA_FISICA
alter ANO_CHEGADA_BRASIL position 39;

alter table PESSOA_FISICA
alter ID_NACIONALIDADE position 40;

alter table PESSOA_FISICA
alter DESCR_NACIONALIDADE position 41;

alter table PESSOA_FISICA
alter CNH_CATEG position 42;

alter table PESSOA_FISICA
alter ID_ESCOLARIDADE position 43;

alter table PESSOA_FISICA
alter DESCR_ESCOLARIDADE position 44;

alter table PESSOA_FISICA
alter ANO_PRIM_EMPREGO position 45;

alter table PESSOA_FISICA
alter ID_SYS_ANTER position 46;

alter table PESSOA_FISICA
alter RG_COMPLETO position 47;

alter table PESSOA_FISICA
alter CTPS_NUM position 48;

alter table PESSOA_FISICA
alter CTPS_SERIE position 49;

alter table PESSOA_FISICA
alter CTPS_UF position 50;

alter table PESSOA_FISICA
alter CTPS_DT_EXPED position 51;

alter table PESSOA_FISICA
alter ID_SESSAO position 52;

alter table PESSOA_FISICA
alter OPER_USUARIO position 53;

alter table PESSOA_FISICA
alter ID_NATURAL_CIDADE position 54;

alter table PESSOA_FISICA
alter CNH_DT_EMISSAO position 55;

alter table PESSOA_FISICA
alter ENDER_TIPO position 56;

alter table PESSOA_FISICA
alter ID_ENDER_CIDADE position 57;

alter table PESSOA_FISICA
alter DEFICIENTE_FISICO position 58;

alter table PESSOA_FISICA
alter DEFICIENTE_VISUAL position 59;

alter table PESSOA_FISICA
alter DEFICIENTE_AUDITIVO position 60;

alter table PESSOA_FISICA
alter DEFICIENTE_MENTAL position 61;

alter table PESSOA_FISICA
alter DEFICIENTE_INTELECTUAL position 62;

alter table PESSOA_FISICA
alter DEFICIENTE_READAPTADO position 63;

alter table PESSOA_FISICA
alter DEFICIENTE_COTA position 64;

alter table PESSOA_FISICA
alter DEFICIENTE_OBS position 65;

alter table PESSOA_FISICA
alter TIPO_OPERACAO position 66;

alter table PESSOA_FISICA
alter DATA_OPERACAO position 67;




/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ID position 1;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column NOME position 2;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column APELIDO position 3;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column SEXO position 4;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ID_RACA_COR position 5;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column DT_NASCIMENTO position 6;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column NATURAL_CIDADE position 7;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column NATURAL_UF position 8;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column RG_NUM position 9;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column RG_ORGAO_EMISSOR position 10;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column RG_UF position 11;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column RG_DT_EMISSAO position 12;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column CPF position 13;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column PIS_PASEP position 14;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column CNH_NUM position 15;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column CNH_CATEG position 16;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column CNH_DT_EMISSAO position 17;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column CNH_DT_VENCTO position 18;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column TIT_ELEITOR_NUM position 19;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column TIT_ELEITOR_ZONA position 20;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column TIT_ELEITOR_SECAO position 21;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column RESERVISTA position 22;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ID_ESTADO_CIVIL position 23;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column CONJUGE_NOME position 24;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column CONJUGE_CPF position 25;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column FILIACAO_PAI position 26;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column FILIACAO_MAE position 27;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ENDER_LOGRAD position 28;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ENDER_NUM position 29;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ENDER_BAIRRO position 30;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ENDER_CIDADE position 31;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ENDER_CEP position 32;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ENDER_UF position 33;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column TELEFONE position 34;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column E_MAIL position 35;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column FOTO position 36;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column DESCR_ESTADO_CIVIL position 37;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column CPF_FTDO position 38;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column PIS_PASEP_FTDO position 39;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ENDER_COMPLEM position 40;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ANO_CHEGADA_BRASIL position 41;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ID_NACIONALIDADE position 42;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column DESCR_NACIONALIDADE position 43;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ID_ESCOLARIDADE position 44;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column DESCR_ESCOLARIDADE position 45;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ANO_PRIM_EMPREGO position 46;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ID_SYS_ANTER position 47;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column RG_COMPLETO position 48;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column CTPS_NUM position 49;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column CTPS_SERIE position 50;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column CTPS_UF position 51;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column CTPS_DT_EXPED position 52;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ID_SESSAO position 53;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column OPER_USUARIO position 54;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ID_NATURAL_CIDADE position 55;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ENDER_TIPO position 56;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column ID_ENDER_CIDADE position 57;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column DEFICIENTE_FISICO position 58;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column DEFICIENTE_VISUAL position 59;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column DEFICIENTE_AUDITIVO position 60;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column DEFICIENTE_MENTAL position 61;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column DEFICIENTE_INTELECTUAL position 62;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column DEFICIENTE_READAPTADO position 63;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column DEFICIENTE_COTA position 64;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column DEFICIENTE_OBS position 65;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column TIPO_OPERACAO position 66;


/*------ GERASYS.TI 23/07/2021 19:27:37 --------*/

alter table PESSOA_FISICA
alter column DATA_OPERACAO position 67;


/*------ GERASYS.TI 23/07/2021 19:28:17 --------*/

ALTER TABLE PESSOA_FISICA ALTER COLUMN CNH_CATEG
SET DEFAULT 'B'
;

/*------ GERASYS.TI 23/07/2021 20:59:35 --------*/

SET TERM ^ ;

CREATE trigger tg_servidor_eventoesocial for servidor
active after insert or update position 1
AS
  declare variable competencia "VARCHAR(6)";
begin
  Select first 1
    c.competencia
  from GET_ESOCIAL_COMPETENCIA_ATIVA c
  Into
    competencia;

  execute procedure SET_ESOCIAL_GERAR_EVENTOS('S2200'
    , :competencia
    , new.tipo_operacao
    , Case when new.tipo_operacao != 'P' then 'S' else 'N' end
    , 'Cadastro de Pessoa Fisica/Servidor'
  );
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_SERVIDOR_EVENTOESOCIAL IS 'Trigger Gerar Evento S2200 (eSocial - Cadastramento Inicial do Vínculo e Admissao/Ingresso de Trabalhador)

    Autor   :   Isaque M. Ribeiro
    Data    :   06/07/2021

Trigger responsavel por gerar a necessidade de processamento do evento "S2200" no
eSocial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    23/07/2021 - IMR :
        + Criacao da trigger na base de dados.';





/*------ GERASYS.TI 23/07/2021 21:37:37 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_servidor_esocial_oper for servidor
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

    -- Marcar como processado o registro da pessoa fisica do servidor
    if (coalesce(new.tipo_operacao, 'P') = 'P') then
    begin
      Update PESSOA_FISICA p Set
          p.tipo_operacao = 'P'
      where p.id = new.id_pessoa_fisica
        and p.tipo_operacao != 'P';
    end
  end
end^

SET TERM ; ^




/*------ GERASYS.TI 23/07/2021 21:39:16 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_pessoa_fisica_esocial_oper for pessoa_fisica
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

    -- Replicar operacao para o cadastro do servidor
    if (coalesce(new.tipo_operacao, 'P') != 'P') then
    begin
      Update SERVIDOR s Set
          s.tipo_operacao = 'A'
        , s.data_operacao = current_date
      where (s.id_pessoa_fisica = new.id)
        and (s.tipo_operacao = 'P');
    end
  end
end^

SET TERM ; ^


/*------ 23/07/2021 22:06:43 --------*/

CREATE TABLE ESOCIAL_TIPO_DEPENDENTE (
    CODIGO     "CHAR(2)" NOT NULL,
    DESCRICAO  "VARCHAR(250)"
);

/*------ 23/07/2021 22:06:43 --------*/

ALTER TABLE ESOCIAL_TIPO_DEPENDENTE ADD CONSTRAINT PK_ESOCIAL_TIPO_DEPENDENTE PRIMARY KEY (CODIGO);

/*------ 23/07/2021 22:06:43 --------*/

COMMENT ON COLUMN ESOCIAL_TIPO_DEPENDENTE.CODIGO IS
'Codigo';

/*------ 23/07/2021 22:06:43 --------*/

COMMENT ON COLUMN ESOCIAL_TIPO_DEPENDENTE.DESCRICAO IS
'Descricao';

/*------ 23/07/2021 22:06:43 --------*/

GRANT ALL ON ESOCIAL_TIPO_DEPENDENTE TO "GERASYS.TI" WITH GRANT OPTION;

/*------ 23/07/2021 22:06:43 --------*/

GRANT ALL ON ESOCIAL_TIPO_DEPENDENTE TO PUBLIC;

/*------ 23/07/2021 22:06:43 --------*/

GRANT ALL ON ESOCIAL_TIPO_DEPENDENTE TO PUBLIC WITH GRANT OPTION;

/*------ 23/07/2021 22:06:43 --------*/

ALTER TABLE PESSOA_FISICA_DEPENDENTE
    ADD ID_TIPO_DEPENDENTE "CHAR(2)";

/*------ 23/07/2021 22:06:43 --------*/

COMMENT ON COLUMN PESSOA_FISICA_DEPENDENTE.ID_TIPO_DEPENDENTE IS
'eSocial - Tipo do Parentesco:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 07';

/*------ 23/07/2021 22:06:43 --------*/

ALTER TABLE PESSOA_FISICA_DEPENDENTE
ADD CONSTRAINT FK_PESSOA_FISICA_DEPENDENTE_TP
FOREIGN KEY (ID_TIPO_DEPENDENTE)
REFERENCES ESOCIAL_TIPO_DEPENDENTE(CODIGO);

/*------ 23/07/2021 22:06:43 --------*/

ALTER TABLE SERVIDOR_DEPENDENTE
    ADD ID_TIPO_DEPENDENTE "CHAR(2)";

/*------ 23/07/2021 22:06:43 --------*/

COMMENT ON COLUMN SERVIDOR_DEPENDENTE.ID_TIPO_DEPENDENTE IS
'eSocial - Tipo do Parentesco:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 07';

/*------ 23/07/2021 22:06:43 --------*/

ALTER TABLE SERVIDOR_DEPENDENTE
ADD CONSTRAINT FK_SERVIDOR_DEPENDENTE_TP
FOREIGN KEY (ID_TIPO_DEPENDENTE)
REFERENCES ESOCIAL_TIPO_DEPENDENTE(CODIGO);

/*------ 23/07/2021 22:06:43 --------*/

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

/*------ 23/07/2021 22:06:43 --------*/

SET TERM ; ^

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

/*------ 23/07/2021 22:06:43 --------*/

SET TERM ; ^

/*------ 23/07/2021 22:30:00 --------*/

Update SERVIDOR s Set
  s.data_operacao = s.dt_admissao
where s.dt_admissao is not null
  and s.data_operacao is null;

COMMIT WORK;

/*------ 23/07/2021 22:31:00 --------*/

Update PESSOA_FISICA p Set
  p.data_operacao = (Select min(s.dt_admissao) from SERVIDOR s where s.id_pessoa_fisica = p.id and s.dt_admissao is not null)
where p.data_operacao is not null;

COMMIT WORK;



/*------ GERASYS.TI 23/07/2021 22:58:14 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 1, column 25.
PASTA_PADRAO.

*/

/*------ GERASYS.TI 23/07/2021 23:06:05 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Unexpected end of command - line 94, column 152.

*/

/*------ GERASYS.TI 23/07/2021 23:06:09 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Unexpected end of command - line 94, column 152.

*/

/*------ GERASYS.TI 23/07/2021 23:06:13 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Unexpected end of command - line 94, column 152.

*/

/*------ GERASYS.TI 23/07/2021 23:08:04 --------*/

/*!!! Error occured !!!
expression evaluation not supported.
expression evaluation not supported.
Invalid data type in addition of part to DATE/TIME/TIMESTAMP in DATEADD.

*/