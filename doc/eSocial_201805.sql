

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

