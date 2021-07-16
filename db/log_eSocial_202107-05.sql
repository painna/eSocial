


/*------ GERASYS.TI 15/07/2021 18:27:30 --------*/

ALTER TABLE CONFIG_ESOCIAL
    ADD ID_EVENTO "VARCHAR(40)";

COMMENT ON COLUMN CONFIG_ESOCIAL.ID_EVENTO IS
'eSocial - ID atual do registro no portal eSocial';




/*------ GERASYS.TI 15/07/2021 18:28:10 --------*/

CREATE INDEX IDX_CONFIG_ESOCIAL_IDEVENTO
ON CONFIG_ESOCIAL (ID_EVENTO);



/*------ 15/07/2021 18:29:15 --------*/

ALTER TABLE UNID_GESTORA
    ADD ID_EVENTO "VARCHAR(40)";

/*------ 15/07/2021 18:29:15 --------*/

COMMENT ON COLUMN UNID_GESTORA.ID_EVENTO IS
'eSocial - ID atual do registro no portal eSocial';

/*------ 15/07/2021 18:29:15 --------*/

CREATE INDEX IDX_UNID_GESTORA_IDEVENTO
ON UNID_GESTORA (ID_EVENTO);

/*------ 15/07/2021 18:31:18 --------*/

ALTER TABLE EVENTO
    ADD ID_EVENTO "VARCHAR(40)";

/*------ 15/07/2021 18:31:18 --------*/

COMMENT ON COLUMN EVENTO.ID_EVENTO IS
'eSocial - ID atual do registro no portal eSocial';

/*------ 15/07/2021 18:31:18 --------*/

CREATE INDEX IDX_EVENTO_IDEVENTO
ON EVENTO (ID_EVENTO);

/*------ 15/07/2021 18:32:01 --------*/

ALTER TABLE CONFIG_ORGAO
    ADD ID_EVENTO "VARCHAR(40)";

/*------ 15/07/2021 18:32:01 --------*/

COMMENT ON COLUMN CONFIG_ORGAO.ID_EVENTO IS
'eSocial - ID atual do registro no portal eSocial';

/*------ 15/07/2021 18:32:01 --------*/

CREATE INDEX IDX_CONFIG_ORGAO_IDEVENTO
ON CONFIG_ORGAO (ID_EVENTO);