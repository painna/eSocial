


/*------ GERASYS.TI 15/06/2018 16:02:17 --------*/

ALTER TABLE CONFIG_ESOCIAL
    ADD POSSUI_TABELA_CARREIRA SIM_NAO;

COMMENT ON COLUMN CONFIG_ESOCIAL.POSSUI_TABELA_CARREIRA IS
'Possui tabela de Carreira Publica:
S - Sim
N - Nao';

alter table CONFIG_ESOCIAL
alter ID_CONFIG_ORGAO position 1;

alter table CONFIG_ESOCIAL
alter ID_UNID_GESTORA position 2;

alter table CONFIG_ESOCIAL
alter CONTADOR_NOME position 3;

alter table CONFIG_ESOCIAL
alter CONTADOR_CPF position 4;

alter table CONFIG_ESOCIAL
alter CONTADOR_FONEFIXO position 5;

alter table CONFIG_ESOCIAL
alter CONTADOR_FONECELULAR position 6;

alter table CONFIG_ESOCIAL
alter CONTADOR_EMAIL position 7;

alter table CONFIG_ESOCIAL
alter NAT_JURIDICA position 8;

alter table CONFIG_ESOCIAL
alter NRO_SIAFI position 9;

alter table CONFIG_ESOCIAL
alter SUBTETO_VENCTO_TIPO position 10;

alter table CONFIG_ESOCIAL
alter SUBTETO_VENCTO_VALOR position 11;

alter table CONFIG_ESOCIAL
alter POSSUI_RPPS position 12;

alter table CONFIG_ESOCIAL
alter POSSUI_TABELA_CARREIRA position 13;

alter table CONFIG_ESOCIAL
alter TIPO_OPERACAO position 14;

alter table CONFIG_ESOCIAL
alter DATA_IMPLANTACAO position 15;




/*------ GERASYS.TI 15/06/2018 16:02:25 --------*/

UPDATE CONFIG_ESOCIAL
SET POSSUI_TABELA_CARREIRA = 'N';




/*------ GERASYS.TI 15/06/2018 16:57:16 --------*/

CREATE DOMAIN SIM_NAO_X AS
CHAR(1);


/*------ GERASYS.TI 15/06/2018 16:58:02 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'SIM_NAO_X'
where (RDB$FIELD_NAME = 'DEDICACAO_EXCLUSIVA') and
(RDB$RELATION_NAME = 'CARGO_FUNCAO')
;




/*------ GERASYS.TI 15/06/2018 16:59:19 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'SIM_NAO_X'
where (RDB$FIELD_NAME = 'POSSUI_TABELA_CARREIRA') and
(RDB$RELATION_NAME = 'CONFIG_ESOCIAL')
;




/*------ GERASYS.TI 15/06/2018 16:59:43 --------*/

DROP DOMAIN SIM_NAO;




/*------ GERASYS.TI 15/06/2018 17:00:29 --------*/

CREATE DOMAIN SIM_NAO AS
CHAR(1)
DEFAULT 'N'
NOT NULL
CHECK (Value in ('S', 'N'));


/*------ GERASYS.TI 15/06/2018 17:00:38 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'SIM_NAO'
where (RDB$FIELD_NAME = 'DEDICACAO_EXCLUSIVA') and
(RDB$RELATION_NAME = 'CARGO_FUNCAO')
;




/*------ GERASYS.TI 15/06/2018 17:00:49 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'SIM_NAO'
where (RDB$FIELD_NAME = 'POSSUI_TABELA_CARREIRA') and
(RDB$RELATION_NAME = 'CONFIG_ESOCIAL')
;




/*------ GERASYS.TI 15/06/2018 17:00:58 --------*/

DROP DOMAIN SIM_NAO_X;

