


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



/*------ GERASYS.TI 07/03/2018 17:27:29 --------*/

CREATE DOMAIN ESOCIAL_OPERACAO AS
CHAR(1)
DEFAULT 'I'
NOT NULL
CHECK (value in ('I', 'A', 'E', 'P'));COMMENT ON DOMAIN ESOCIAL_OPERACAO IS 'Opercao do registro:
I - nclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';




/*------ GERASYS.TI 07/03/2018 17:27:50 --------*/

COMMENT ON DOMAIN ESOCIAL_OPERACAO IS 'Operacao do registro no eSocial:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';




/*------ GERASYS.TI 07/03/2018 17:28:22 --------*/

ALTER TABLE CONFIG_ESOCIAL
    ADD TIPO_OPERACAO ESOCIAL_OPERACAO;

COMMENT ON COLUMN CONFIG_ESOCIAL.TIPO_OPERACAO IS
'Operacao do registro no eSocial:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';




/*------ GERASYS.TI 07/03/2018 17:28:49 --------*/

ALTER TABLE CONFIG_ESOCIAL DROP TIPO_OPERACAO;




/*------ GERASYS.TI 07/03/2018 17:29:05 --------*/

ALTER TABLE CONFIG_ESOCIAL
    ADD TIPO_OPERACAO ESOCIAL_OPERACAO;

COMMENT ON COLUMN CONFIG_ESOCIAL.TIPO_OPERACAO IS
'Operacao do registro no eSocial:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';




/*------ GERASYS.TI 07/03/2018 17:29:11 --------*/

UPDATE CONFIG_ESOCIAL
SET TIPO_OPERACAO = 'I';




/*------ GERASYS.TI 12/03/2018 13:42:02 --------*/

CREATE SEQUENCE GEN_ESOCIAL_EVENTOS;




/*------ GERASYS.TI 12/03/2018 13:48:47 --------*/

ALTER TABLE EVENTO
    ADD TIPO_OPERACAO ESOCIAL_OPERACAO;

COMMENT ON COLUMN EVENTO.TIPO_OPERACAO IS
'Operacao do registro no eSocial:
I - Inclusao
A - Alteracao
E - Exclusao
P - Processado/Enviado';




/*------ GERASYS.TI 12/03/2018 13:48:56 --------*/

UPDATE EVENTO
SET TIPO_OPERACAO = 'I';




/*------ GERASYS.TI 12/03/2018 14:00:57 --------*/

CREATE SEQUENCE GEN_ESOCIAL_EVENTO_S1010;




/*------ GERASYS.TI 12/03/2018 14:15:05 --------*/

CREATE DOMAIN "VARCHAR(150)" AS
VARCHAR(150);


/*------ GERASYS.TI 12/03/2018 14:16:28 --------*/

CREATE DOMAIN "VARCHAR(250)" AS
VARCHAR(250);


/*------ GERASYS.TI 12/03/2018 14:16:50 --------*/

CREATE TABLE ESOCIAL_NATUREZA_RUBRICA (
    CODIGO "CHAR(5)" NOT NULL,
    NOME "VARCHAR(150)",
    DESCRICAO "VARCHAR(250)");

ALTER TABLE ESOCIAL_NATUREZA_RUBRICA
ADD CONSTRAINT PK_ESOCIAL_NATUREZA_RUBRICA
PRIMARY KEY (CODIGO);

GRANT ALL ON ESOCIAL_NATUREZA_RUBRICA TO "PUBLIC";



/*------ GERASYS.TI 12/03/2018 14:20:42 --------*/

ALTER TABLE EVENTO
    ADD NAT_RUBRICA "CHAR(5)";

COMMENT ON COLUMN EVENTO.NAT_RUBRICA IS
'Natureza da Rubrica da Folha de Pagamento:
Anexo I dos Leiautes do eSocial versao 2.4 - Tabela 03';




/*------ GERASYS.TI 12/03/2018 14:22:33 --------*/

CREATE INDEX IDX_EVENTO_TIPO_OPERACAO
ON EVENTO (TIPO_OPERACAO);

CREATE INDEX IDX_EVENTO_NATUREZA_RUBRICA
ON EVENTO (NAT_RUBRICA);




/*------ GERASYS.TI 12/03/2018 16:08:44 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'BLOB_SUB_TYPE_0'
where (RDB$FIELD_NAME = 'DESCRICAO') and
(RDB$RELATION_NAME = 'ESOCIAL_NATUREZA_RUBRICA')
;




/*------ GERASYS.TI 12/03/2018 16:20:08 --------*/

ALTER TABLE ESOCIAL_NATUREZA_RUBRICA
    ADD DESCONTO "CHAR(1)" DEFAULT 'N';

COMMENT ON COLUMN ESOCIAL_NATUREZA_RUBRICA.DESCONTO IS
'Rubrica de Desconto:
N - Nao
S - Sim';

INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('0000', 'COMPLEMENTAÇÃO DE BENEFICIO DE PENSÃO', 'Para complementação do benefício de pensão.', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1000', 'SALÁRIO, VENCIMENTO, SOLDO OU SUBSÍDIO', 'Corresponde ao salário básico contratual do empregado contratado de acordo com a CLT e o vencimento mensal do servidor público e do militar', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1002', 'DESCANSO SEMANAL REMUNERADO - DSR', 'Valor correspondente a um dia de trabalho incidente sobre as verbas de natureza variável, tais como: horas extras, adicional noturno, produção, comissão, etc.', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1003', 'HORAS EXTRAORDINÁRIAS', 'Valor correspondente a hora extraordinária de trabalho, acrescido de percentual de no mínimo 50%', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1004', 'HORAS EXTRAORDINÁRIAS - INDENIZAÇÃO DE BANCO DE HORAS', 'Valor correspondente a pagamento das horas extraordinárias, inicialmente destinadas para o banco de horas e que não foram compensadas', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1005', 'DIREITO DE ARENA', 'Valores relativos a direito de arena decorrente do espetáculo, devidos ao atleta', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1006', 'INTERVALOS INTRA E INTER JORNADAS NÃO CONCEDIDOS', 'Valores relativos a intervalos não concedidos de intrajornada ou interjornada', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1007', 'LUVAS E PREMIAÇÕES', 'Valores correspondentes a prêmios e luvas, devidos ao atleta', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1009', 'SALÁRIO-FAMÍLIA - COMPLEMENTO', 'Valor excedente ao do fixado pela previdência social para o salário- família', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1010', 'SALÁRIO IN NATURA - PAGOS EM BENS OU SERVIÇOS', 'Salário in natura, também conhecido por salário utilidade, correspondente a remunerações pagas em bens ou serviços', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1011', 'SOBREAVISO E PRONTIDÃO', 'Valor correspondente a um percentual da hora normal de trabalho', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1020', 'FÉRIAS - GOZADAS', 'Valor correspondente a remuneração a que faz jus na época da concessão das férias e o adicional constitucional a que o trabalhador adquiriu direito, inclusive o adiantamento de férias, quando pagas antecipadamente', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1021', 'FÉRIAS - ABONO OU GRATIFICAÇÃO DE FÉRIAS SUPERIOR A 20 DIAS', 'Remuneração a título de abono de férias, desde que excedente a 20 (vinte) dias do salário e concedido em virtude de cláusula contratual, do regulamento da empresa, de convenção ou acordo coletivo, como por exemplo, o art. 144 da CLT', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1022', 'FÉRIAS - ABONO OU GRATIFICAÇÃO DE FÉRIAS NÃO EXCEDENTE A 20 DIAS', 'Remuneração a título de abono de férias, desde que não excedente a
20 (vinte) dias do salário e concedido em virtude de cláusula contratual, do regulamento da empresa, de convenção ou acordo coletivo, como por exemplo o art. 144 da CLT', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1023', 'FÉRIAS - ABONO PECUNIÁRIO', 'Valor correspondente a conversão em dinheiro de parte dos dias de férias a que o trabalhador adquiriu direito, inclusive o adicional constitucional', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1024', 'FÉRIAS - O DOBRO NA VIGÊNCIA DO CONTRATO', 'Valor correspondente a remuneração a que faz jus na época da concessão das férias, concedidas após o prazo de concessão, inclusive o adicional constitucional', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1040', 'LICENÇA-PRÊMIO', 'Valor relativo a licença-prêmio, em decorrência de afastamento do trabalho', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1041', 'LICENÇA-PRÊMIO INDENIZADA', 'Valor correspondente à conversão em dinheiro da licença-prêmio', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1050', 'REMUNERAÇÃO DE DIAS DE AFASTAMENTO', 'Remuneração de dias nos quais o trabalhador esteja afastado do trabalho sem prejuízo de sua remuneração', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1080', 'STOCK OPTION', 'Remuneração pelo exercício de opção de compra de ações da empresa', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1099', 'OUTRAS VERBAS SALARIAIS', 'Outras verbas salariais não previstas nos itens anteriores', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1201', 'ADICIONAL DE FUNÇÃO / CARGO CONFIANÇA', 'Adicional ou gratificação concedida em virtude de cargo ou função de confiança', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1202', 'ADICIONAL DE INSALUBRIDADE', 'Adicional por serviços em condições de insalubridade', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1203', 'ADICIONAL DE PERICULOSIDADE', 'Adicional por serviços em condições perigosas', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1204', 'ADICIONAL DE TRANSFERÊNCIA', 'Adicional em razão de transferência de trabalhador, enquanto durar a transferência', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1205', 'ADICIONAL NOTURNO', 'Adicional por trabalho em horário noturno', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1206', 'ADICIONAL POR TEMPO DE SERVIÇO', 'Adicional em virtude do tempo de serviço (anuênio, quinquênio, etc.)', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1207', 'COMISSÕES, PORCENTAGENS, PRODUÇÃO', 'Valor correspondente a contraprestação de serviço, normalmente baseada em um percentual sobre as vendas totais desse trabalhador', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1208', 'GUELTAS OU GORJETAS - REPASSADAS POR FORNECEDORES OU CLIENTES', 'Valores pagos diretamente por fornecedores a trabalhador a título de incentivos de vendas (gueltas) ou por clientes a título de recompensa por bons serviços prestados (gorjetas)', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1209', 'GUELTAS OU GORJETAS - REPASSADAS PELO EMPREGADOR', 'Valores pagos relativos a gueltas ou gorjetas, por meio de repasse ao empregador', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1210', 'GRATIFICAÇÃO POR ACORDO OU CONVENÇÃO COLETIVA', 'Verba estabelecida em acordo ou convenção coletiva de trabalho', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1211', 'GRATIFICAÇÕES', 'Verba não estabelecida em acordo ou convenção coletiva, mas paga para o empregado em decorrência de ajuste entre as partes ou por liberalidade do empregador, como por exemplo produtividade, assiduidade, etc.', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1212', 'GRATIFICAÇÕES OU OUTRAS VERBAS DE NATUREZA PERMANENTE', 'Órgão Público - Parcelas remuneratórias reconhecidamente inerentes às funções do cargo efetivo, cujo valor integra a remuneração do cargo efetivo', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1213', 'GRATIFICAÇÕES OU OUTRAS VERBAS DE NATUREZA TRANSITÓRIA', 'Órgão Público - Parcelas remuneratórias vinculadas à atividade cujo recebimento dependa de avaliação de desempenho ou determinadas condições', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1214', 'ADICIONAL DE PENOSIDADE', 'Adicional pela realização de atividade árdua que exija do trabalhador esforço, atenção ou vigilância acima do comum', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1215', 'ADICIONAL DE UNIDOCÊNCIA', 'Adicional de Unidocência para Professores de 1ª a 4ª série', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1225', 'QUEBRA DE CAIXA', 'Valor destinado a cobrir os riscos assumidos por quem trabalha com manuseio de valores, para compensar eventuais descontos ou diferenças de numerários', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1230', 'REMUNERAÇÃO DO DIRIGENTE SINDICAL', 'Remuneração paga ao trabalhador afastado, durante o exercício da atividade sindical', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1299', 'OUTROS ADICIONAIS', 'Valores relativos a outros adicionais não previstos nos itens anteriores', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1300', 'PLR - PARTICIPAÇÃO EM LUCROS OU RESULTADOS', 'Valor correspondente a participação em lucros ou resultados da empresa, de acordo com lei específica', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1350', 'BOLSA DE ESTUDO - ESTAGIÁRIO', 'Valor devido ao estagiário em atividades práticas de complementação do currículo escolar, inclusive os valores pagos a título de recesso remunerado - Lei nº 11.788 de 25/09/2008', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1351', 'BOLSA DE ESTUDO - MÉDICO RESIDENTE', 'Bolsa de estudo ao médico residente', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1352', 'BOLSA DE ESTUDO OU PESQUISA', 'Remuneração a professores, pesquisadores e demais profissionais com a finalidade de estudos ou pesquisa, exceto pagamentos a estagiário e médico-residente', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1401', 'ABONO', 'Qualquer abono concedido de forma espontânea ou em virtude de acordo ou convenção coletiva, norma, etc.', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1402', 'ABONO PIS / PASEP', 'Abono e/ou rendimento do PIS / PASEP repassado pelo empregador ou órgão público', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1403', 'ABONO LEGAL', 'As importâncias recebidas a título de ganhos eventuais e os abonos expressamente desvinculados do salário, por força da lei', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1404', 'AUXÍLIO BABÁ', 'Valor relativo a reembolso de despesas com babá, limitado ao menor salário de contribuição mensal e condicionado à comprovação do registro na carteira de trabalho e previdência social da empregada, do pagamento da remuneração e do recolhimento da contribuição previdenciária, pago em conformidade com a legislação trabalhista, observado o limite máximo de 6 (seis) anos de idade da criança. Caso haja previsão em acordo coletivo da categoria, este limite de idade poderá ser maior.', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1405', 'ASSISTÊNCIA MÉDICA', 'Valor pago diretamente ao trabalhador a título de assistência médica ou odontológica, inclusive o reembolso de despesas com medicamentos, óculos, aparelhos ortopédicos, despesas médico- hospitalares e outras similares', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1406', 'AUXÍLIO-CRECHE', 'O reembolso creche pago em conformidade com a legislação trabalhista, observado o limite máximo de 6 (seis) anos de idade da criança, quando devidamente comprovadas as despesas realizadas. Caso haja previsão em acordo coletivo da categoria, este limite de idade poderá ser maior.', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1407', 'AUXÍLIO-EDUCAÇÃO', 'Valor relativo a plano educacional, ou bolsa de estudo, que vise à educação básica de trabalhadores e seus dependentes e, desde que vinculada às atividades desenvolvidas pela empresa, à educação profissional e tecnológica de trabalhadores, nos termos da Lei nº
9.394, de 20 de dezembro de 1996, e:
1) não seja utilizado em substituição de parcela salarial;
2) o valor mensal do plano educacional ou bolsa de estudo, considerado individualmente, não ultrapasse 5% (cinco por cento) da remuneração do segurado a que se destina ou o valor correspondente a uma vez e meia o valor do limite mínimo mensal do salário de
contribuição, o que for maior', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1409', 'SALÁRIO-FAMÍLIA', 'Valor do salário-família, conforme limite legal, em virtude do número de filhos menores de 14 anos, ou inválidos de qualquer idade', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1410', 'AUXÍLIO - LOCAIS DE DIFÍCIL ACESSO', 'Valor correspondente a transporte, habitação e alimentação fornecido ao trabalhador contratado para prestar serviço em localidade distante da sua residência, em canteiro de obras ou local que, por força da atividade, exija deslocamento e estada', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1601', 'AJUDA DE CUSTO - AERONAUTA', 'Adicional mensal recebidos pelo aeronauta nos termos da lei nº 5.929, de 30 de outubro de 1973', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1602', 'AJUDA DE CUSTO DE TRANSFERÊNCIA', 'Ajuda de custo em parcela única, em razão de transferência de local de trabalho', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1620', 'RESSARCIMENTO DE DESPESAS PELO USO DE VEÍCULO PRÓPRIO', 'Ressarcimento de despesas ao trabalhador, pela utilização de veículo de sua propriedade', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1621', 'RESSARCIMENTO DE DESPESAS DE VIAGEM, EXCETO
DESPESAS COM VEÍCULOS', 'Ressarcimento de despesas pagas com recursos do trabalhador em viagens a trabalho', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1623', 'RESSARCIMENTO DE PROVISÃO', 'Ressarcimento de desconto efetuado em recibos de férias relativo a provisão de contribuição previdenciária e IRRF', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1629', 'RESSARCIMENTO DE OUTRAS DESPESAS', 'Ressarcimento de outras despesas pagas pelo trabalhador, não previstas nos itens anteriores', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1651', 'DIÁRIAS DE VIAGEM - ATÉ 50% DO SALÁRIO', 'Diárias de viagem ao trabalhador, desde que não exceda a 50% do seu salário-base mensal', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1652', 'DIÁRIAS DE VIAGEM - ACIMA DE 50% DO SALÁRIO', 'Diárias de viagem superior a 50% do salário-base mensal', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1801', 'ALIMENTAÇÃO', 'Auxílio-alimentação', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1802', 'ETAPAS (MARÍTIMOS)', 'Auxílio-alimentação ao trabalhador marítimo', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1805', 'MORADIA', 'Auxílio-moradia', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('1810', 'TRANSPORTE', 'Auxílio-transporte', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('2501', 'PRÊMIOS', 'Prêmios diversos', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('2510', 'DIREITOS AUTORAIS E INTELECTUAIS', 'Valor correspondente a participação em produção científica, intelectual ou artística', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('2801', 'QUARENTENA REMUNERADA', 'Valor equivalente a remuneração se em exercício estivesse, devida ao trabalhador desligado, em período de quarentena', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('2901', 'EMPRÉSTIMOS', 'Empréstimos ao trabalhador para posterior desconto', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('2902', 'VESTUÁRIO E EQUIPAMENTOS', 'Valor correspondente a vestuários, equipamentos e outros acessórios fornecidos ao trabalhador e utilizados no local de trabalho para prestação dos respectivos serviços', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('2920', 'REEMBOLSOS DIVERSOS', 'Valor relativo a reembolsos diversos referentes a descontos indevidos efetuados em competências anteriores', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('2930', 'INSUFICIÊNCIA DE SALDO', 'Valor lançado em folha de pagamento para cobertura de excesso de descontos em relação a vencimentos, tanto o valor do vencimento no mês em que houver a insuficiência de saldo, como o respectivo desconto no(s) mês(es) posteriores', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('2999', 'ARREDONDAMENTOS', 'Valor lançado em folha de pagamento, não superior a 99 centavos, relativo a arrendamentos', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('3501', 'REMUNERAÇÃO POR PRESTAÇÃO DE SERVIÇOS', 'Remuneração (inclusive adiantamentos) a contribuintes individuais, inclusive honorários, em trabalhos de natureza eventual e sem vínculo trabalhista', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('3505', 'RETIRADAS (PRÓ-LABORE) DE DIRETORES EMPREGADOS', 'Pró-labore ou retirada (remuneração) a diretores empregados (CLT)', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('3506', 'RETIRADAS (PRÓ-LABORE) DE DIRETORES NÃO EMPREGADOS', 'Pró-labore ou retirada (remuneração) a diretores não empregados', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('3508', 'RETIRADAS (PRÓ-LABORE) DE PROPRIETÁRIOS OU SÓCIOS', 'Pró-labore ou retirada (remuneração) a proprietários ou sócios da empresa', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('3509', 'HONORÁRIOS A CONSELHEIROS', 'Valor correspondente a honorários pagos a membros de conselho', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('3520', 'REMUNERAÇÃO DE COOPERADO', 'Remuneração a cooperado vinculado a cooperativa de trabalho', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('4010', 'COMPLEMENTAÇÃO SALARIAL DE AUXÍLIO-DOENÇA', 'Complementação salarial de auxílio-doença, extensiva à totalidade dos trabalhadores', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('4050', 'SALÁRIO MATERNIDADE', 'Remuneração mensal da trabalhadora empregada durante a licença maternidade, quando paga pelo contratante ou órgão público', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('4051', 'SALÁRIO MATERNIDADE - 13° SALÁRIO', 'Valor correspondente ao 13° salário pago pelo contratante ou órgão público, no período de licença maternidade', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('5001', '13º SALÁRIO', 'Valor relativo ao 13° salário de trabalhador, inclusive as médias de
13° salário (horas extras, adicional noturno, etc.), exceto se relativo à primeira parcela ou se pago em rescisão contratual - nessa opção devem ser classificadas também o valor pago mensalmente ao trabalhador avulso, a título de 13° salário', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('5005', '13° SALÁRIO COMPLEMENTAR', 'Valor do 13° salário complementar relativo a diferenças apuradas não consideradas na folha de fechamento do 13° salário', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('5501', 'ADIANTAMENTO DE SALÁRIO', 'Valor relativo a adiantamento, antecipação ou pagamento parcial de folha de salários', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('5504', '13º SALÁRIO - ADIANTAMENTO', 'Valor relativo a adiantamento do 13° salário', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('5510', 'ADIANTAMENTO DE BENEFÍCIOS PREVIDENCIÁRIOS', 'Valor relativo a adiantamento de benefícios a serem pagos pela
Previdência Social Oficial', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('6000', 'SALDO DE SALÁRIOS NA RESCISÃO CONTRATUAL', 'Valor correspondente aos dias trabalhados no mês da rescisão contratual', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('6001', '13º SALÁRIO RELATIVO AO AVISO-PRÉVIO INDENIZADO', 'Valor correspondente ao 13° salário incidente sobre o aviso-prévio indenizado', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('6002', '13° SALÁRIO PROPORCIONAL NA RESCISÃO', 'Valor correspondente ao 13° salário proporcional pago na rescisão do contrato de trabalho, exceto o pago sobre o aviso-prévio indenizado', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('6003', 'INDENIZAÇÃO COMPENSATÓRIA DO AVISO-PRÉVIO', 'Valor da maior remuneração do trabalhador, correspondente ao número de dias relativo ao aviso prévio, calculado de acordo com o tempo de serviço do empregado', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('6004', 'FÉRIAS - O DOBRO NA RESCISÃO', 'Valor correspondente a remuneração a que faz jus a época da rescisão contratual, correspondente a férias não concedidas no prazo legal, inclusive o adicional constitucional', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('6006', 'FÉRIAS PROPORCIONAIS', 'Valor correspondente a 1/12 avos da remuneração a que faz jus a época da rescisão contratual, fração superior a 14 dias por mês de trabalho e a projeção do aviso-prévio indenizado, inclusive o adicional constitucional', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('6007', 'FÉRIAS VENCIDAS NA RESCISÃO', 'Valor correspondente a remuneração a que faz jus a época da rescisão contratual, correspondente a férias vencidas, mas dentro do prazo concessivo, inclusive o adicional constitucional', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('6101', 'INDENIZAÇÃO COMPENSATÓRIA - MULTA RESCISÓRIA 20 OU
40% (CF/88)', 'Valor correspondente a indenização por demissão sem justa causa ou culpa recíproca (essa reconhecida pela justiça do trabalho), por ocasião da rescisão do contrato de trabalho', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('6102', 'INDENIZAÇÃO DO ART. 9º LEI Nº 7.238/84', 'Valor correspondente a indenização quando a dispensa ocorrer sem justa causa dentro dos trinta dias que antecedem a data base', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('6103', 'INDENIZAÇÃO DO ART. 14 DA LEI Nº 5.889, DE 8 DE JUNHO DE 1973', 'Valor correspondente a indenização do tempo de serviço ao safrista, importância correspondente a 1/12 (um doze avos) do salário mensal, por mês de serviço ou fração superior a 14 (quatorze) dias', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('6104', 'INDENIZAÇÃO DO ART. 479 DA
CLT', 'Valor correspondente a metade da remuneração devida ate o termino do contrato a prazo determinado em caso de rescisão antecipada', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('6105', 'INDENIZAÇÃO RECEBIDA A TÍTULO DE INCENTIVO A DEMISSÃO', 'Valor correspondente a incentivo a demissão em Programas de
Demissão Voluntária - PDV', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('6106', 'MULTA DO ART. 477 DA CLT', 'Valor devido ao trabalhador por atraso no pagamento de rescisão do contrato de trabalho (art. 477 da CLT, § 8º)', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('6107', 'INDENIZAÇÃO POR QUEBRA DE ESTABILIDADE', 'Valor correspondente a indenização por desligamento durante período de estabilidade legal, ou estabilidade derivada de acordo ou
convenção coletiva de trabalho', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('6129', 'OUTRAS INDENIZAÇÕES', 'Valor correspondente a outras indenizações previstas em leis ou em Instrumentos Coletivos de Trabalho, exceto as previstas nos itens anteriores', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('6901', 'DESCONTO DO AVISO-PRÉVIO', 'Valor descontado do trabalhador que tenha pedido demissão e não cumpriu aviso-prévio, total ou parcialmente', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('6904', 'MULTA PREVISTA NO ART. 480 DA CLT', 'Valor descontado do empregado pela rescisão antecipada, por iniciativa do empregado, do contrato de trabalho a termo', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('7001', 'PROVENTOS', 'Valor dos proventos de Aposentadoria a servidor público vinculado a Regime Próprio de Previdência Social', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('7002', 'PROVENTOS - PENSÃO POR MORTE CIVIL', 'Valor dos proventos por morte a beneficiário de servidor público vinculado a Regime Próprio de Previdência Social', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('7003', 'PROVENTOS - RESERVA', 'Valor dos proventos a militar da reserva remunerada', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('7004', 'PROVENTOS - REFORMA', 'Valor dos proventos a militar reformado', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('7005', 'PENSÃO MILITAR', 'Valor da pensão a beneficiário de militar', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9200', 'DESCONTO DE ADIANTAMENTOS', 'Valor relativo a descontos a título de adiantamentos em geral, como de salários e outros, exceto a 1ª parcela do 13° salário', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9201', 'CONTRIBUIÇÃO PREVIDENCIÁRIA', 'Desconto a título de contribuição previdenciária', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9203', 'IMPOSTO DE RENDA RETIDO NA FONTE', 'Desconto a título de imposto de renda retido na fonte - IRRF', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9205', 'PROVISÃO DE CONTRIBUIÇÃO PREVIDENCIÁRIA E IRRF', 'Desconto efetuado em recibos de férias relativo a provisão de contribuição previdenciária e IRRF', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9209', 'FALTAS OU ATRASOS', 'Desconto correspondente a faltas, atrasos no início da jornada de trabalho ou à saída antecipada do trabalhador', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9210', 'DSR S/FALTAS E ATRASOS', 'Desconto correspondente ao Descanso Semanal Remunerado - DSR, calculado sobre faltas e atrasos do trabalhador', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9213', 'PENSÃO ALIMENTÍCIA', 'Desconto correspondente a pensão alimentícia sobre o salário mensal,
13° salário, PLR e férias', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9214', '13° SALÁRIO - DESCONTO DE ADIANTAMENTO', 'Desconto de antecipação do 13° salário', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9216', 'DESCONTO DE VALE- TRANSPORTE', 'Desconto do vale-transporte referente a participação do trabalhador no custo ou em virtude de concessão do benefício em valor maior', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9217', 'CONTRIBUIÇÃO A OUTRAS ENTIDADES E FUNDOS', 'Desconto relativo a contribuições destinadas a outras entidades e fundos (Terceiros), como por exemplo, Sest, Senat, etc., devidas por algumas categorias de contribuintes individuais', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9218', 'RETENÇÕES JUDICIAIS', 'Desconto relativo a retenções de verbas devidas a trabalhadores por ordem judicial, exceto pensão alimentícia', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9219', 'DESCONTO DE ASSISTÊNCIA MÉDICA OU ODONTOLÓGICA', 'Desconto referente a participação do trabalhador no custo de assistência médica ou odontológica, ou em virtude de concessão do benefício em valor maior', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9220', 'ALIMENTAÇÃO - DESCONTO', 'Desconto referente a participação do trabalhador no custo ou em virtude de concessão do benefício em valor maior', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9221', 'DESCONTO DE FÉRIAS', 'Valor correspondente a remuneração (dias) de férias do mês corrente pago no mês anterior ou adiantamento de férias', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9222', 'DESCONTO DE OUTROS IMPOSTOS E CONTRIBUIÇÕES', 'Desconto de outros impostos, taxas e contribuições, exceto Imposto de Renda Retido na Fonte, contribuição previdenciária e contribuições destinadas a outras entidades e fundos (Terceiros)', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9223', 'PREVIDÊNCIA COMPLEMENTAR - PARTE DO EMPREGADO', 'Desconto referente a participação do trabalhador no custo ou em virtude de concessão do benefício em valor maior', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9224', 'FAPI - PARTE DO EMPREGADO', 'Desconto referente a participação do trabalhador no custo de Fundo de Aposentadoria Programada Individual - FAPI, ou em virtude de concessão do benefício em valor maior', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9225', 'PREVIDÊNCIA COMPLEMENTAR - PARTE DO SERVIDOR', 'Desconto referente a participação do trabalhador no custeio de Plano de Previdência Complementar do Servidor Público', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9226', 'DESCONTO DE FÉRIAS - ABONO', 'Desconto correspondente ao abono de férias pago no mês anterior ou adiantamento de férias', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9230', 'CONTRIBUIÇÃO SINDICAL - COMPULSÓRIA', 'Valor correspondente ao desconto da contribuição laboral correspondente a um dia de trabalho a título de contribuição sindical obrigatória', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9231', 'CONTRIBUIÇÃO SINDICAL - ASSOCIATIVA', 'Valor correspondente ao desconto referente a mensalidade sindical do trabalhador', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9232', 'CONTRIBUIÇÃO SINDICAL - ASSISTENCIAL', 'Valor correspondente ao desconto da contribuição destinada ao custeio das atividades assistenciais do sindicato', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9233', 'CONTRIBUIÇÃO SINDICAL - CONFEDERATIVA', 'Valor correspondente ao desconto da contribuição destinada ao custeio do sistema confederativo', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9250', 'SEGURO DE VIDA - DESCONTO', 'Desconto referente a participação do trabalhador no custo ou em virtude de concessão do benefício em valor maior', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9254', 'EMPRÉSTIMOS CONSIGNADOS - DESCONTO', 'Desconto de trabalhadores a título de empréstimos consignados, para repasse a instituição financeira consignatária', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9255', 'EMPRÉSTIMOS DO EMPREGADOR - DESCONTO', 'Desconto de trabalhadores a título de empréstimos efetuados pelo empregador ao trabalhador', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9258', 'CONVÊNIOS', 'Desconto relativos a convênios diversos com empresas para fornecimento de produtos ou serviços ao empregado, sem pagamento imediato, mas com posterior desconto em folha de pagamento como farmácias, supermercados, etc.', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9270', 'DANOS E PREJUÍZOS CAUSADOS PELO TRABALHADOR', 'Desconto do trabalhador para reparar danos e prejuízos por ele causados', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9290', 'DESCONTO DE PAGAMENTO INDEVIDO EM MESES ANTERIORES', 'Valor correspondente a desconto de verbas pagas indevidamente ao trabalhador em meses anteriores e que estão sendo descontadas no mês de referência, exceto valores relativos a assistência médica, alimentação, previdência complementar e seguro de vida', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9299', 'OUTROS DESCONTOS', 'Outros descontos não previstos nos itens anteriores', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9350', 'RETENÇÃO DO TETO CONSTITUCIONAL', 'Valor retido no caso de a remuneração ou subsídio ultrapassar o teto constitucional.', 'D');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9901', 'BASE DE CÁLCULO DA CONTRIBUIÇÃO PREVIDENCIÁRIA', 'Valor total da base de cálculo da contribuição previdenciária', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9902', 'TOTAL DA BASE DE CÁLCULO DO FGTS', 'Valor total da base de cálculo do FGTS', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9903', 'TOTAL DA BASE DE CÁLCULO DO IRRF', 'Valor total da base de cálculo do Imposto de Renda Retido na Fonte', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9904', 'TOTAL DA BASE DE CÁLCULO DO FGTS RESCISÓRIO', 'Valor total da base de cálculo do FGTS rescisório', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9905', 'SERVIÇO MILITAR', 'Valor não relativo a vencimento ou desconto, relativo à remuneração
a que teria direito, se em atividade, o trabalhador afastado do trabalho para prestação do serviço militar obrigatório', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9906', 'REMUNERAÇÃO NO EXTERIOR', 'Remuneração recebida no exterior por trabalhador expatriado sobre a qual incida contribuição previdenciária e/ou IRRF e/ou FGTS', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9908', 'FGTS - DEPÓSITO', 'Valor do depósito do FGTS', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9910', 'SEGUROS', 'Valor relativo a prêmio de seguro de vida em grupo pago a empresa de seguros como benefício do trabalhador', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9911', 'ASSISTÊNCIA MÉDICA', 'Valor não relativo a vencimento ou desconto, relativo à assistência prestada por serviço médico ou odontológico, próprio da empresa ou por ela conveniado, como benefício ao trabalhador', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9930', 'SALÁRIO MATERNIDADE PAGO PELA PREVIDÊNCIA SOCIAL', 'Valor correspondente a remuneração mensal do(a) trabalhador(a)
durante a licença maternidade, quando paga pela Previdência Social', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9931', '13° SALÁRIO MATERNIDADE PAGO PELA PREVIDÊNCIA SOCIAL', 'Valor correspondente ao 13° salário do(a) trabalhador(a) durante a licença maternidade, quando pago pela Previdência Social', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9932', 'AUXÍLIO-DOENÇA ACIDENTÁRIO', 'Valor relativo a base de cálculo do FGTS incidente sobre benefício previdenciário pago por Previdência Social Oficial a trabalhador afastado por acidente de trabalho', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9933', 'AUXÍLIO-DOENÇA', 'Valor de benefício previdenciário pago por Regime Próprio de
Previdência Social', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9938', 'ISENÇÃO IRRF - 65 ANOS', 'Valor da parcela isenta dos rendimentos de aposentadoria e pensão, transferência para a reserva remunerada ou reforma, pagos por órgão público de previdência oficial ou por entidade de previdência complementar, no caso de contribuinte com idade igual ou superior a
65 anos', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9939', 'OUTROS VALORES TRIBUTÁVEIS', 'Valor não relativo a vencimento ou desconto mas considerado como base de cálculo do FGTS, e/ou da contribuição previdenciária e/ou do Imposto de Renda Retido na Fonte inclusive suas deduções e isenções', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9950', 'HORAS EXTRAORDINÁRIAS - BANCO DE HORAS', 'Quantidade (em número decimal com dois dígitos) de horas extraordinárias incorporadas ao banco de horas', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9951', 'HORAS COMPENSADAS - BANCO DE HORAS', 'Quantidade (em número decimal com dois dígitos) de horas compensadas no banco de horas', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9989', 'OUTROS VALORES INFORMATIVOS', 'Outros valores informativos, que não sejam vencimentos nem descontos', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9995', 'ABONO PERMANÊNCIA', 'Corresponde ao valor da contribuição previdenciária mensal do servidor que o requerer, desde que tenha cumprido os requisitos para aposentadoria e opte em permanecer em atividade.', '');
INSERT INTO ESOCIAL_NATUREZA_RUBRICA VALUES ('9999', 'COMPLEMENTAÇÃO DE APOSENTADORIA', 'Para complementação de proventos de aposentadoria.', '');

COMMIT WORK;

