UPDATE OR INSERT INTO ESCOLARIDADE (ID, DESCRICAO, COD_RAIS, ID_ESOCIAL)
                            VALUES (1, 'NÃO ESPECIFICADO', '0 ', '01')
                          MATCHING (ID);
UPDATE OR INSERT INTO ESCOLARIDADE (ID, DESCRICAO, COD_RAIS, ID_ESOCIAL)
                            VALUES (2, 'ANALFABETO', '1 ', '02')
                          MATCHING (ID);
UPDATE OR INSERT INTO ESCOLARIDADE (ID, DESCRICAO, COD_RAIS, ID_ESOCIAL)
                            VALUES (3, 'ATÉ 5o. ANO INCOMPLETO', '2 ', '04')
                          MATCHING (ID);
UPDATE OR INSERT INTO ESCOLARIDADE (ID, DESCRICAO, COD_RAIS, ID_ESOCIAL)
                            VALUES (4, '5o. ANO COMPLETO', '3 ', '05')
                          MATCHING (ID);
UPDATE OR INSERT INTO ESCOLARIDADE (ID, DESCRICAO, COD_RAIS, ID_ESOCIAL)
                            VALUES (5, 'DO 6o. AO 9o. INCOMPLETO', '4 ', '06')
                          MATCHING (ID);
UPDATE OR INSERT INTO ESCOLARIDADE (ID, DESCRICAO, COD_RAIS, ID_ESOCIAL)
                            VALUES (6, 'ENSINO FUNDAMENTAL COMPLETO', '5 ', '07')
                          MATCHING (ID);
UPDATE OR INSERT INTO ESCOLARIDADE (ID, DESCRICAO, COD_RAIS, ID_ESOCIAL)
                            VALUES (7, 'ENSINO MÉDIO INCOMPLETO', '6 ', '08')
                          MATCHING (ID);
UPDATE OR INSERT INTO ESCOLARIDADE (ID, DESCRICAO, COD_RAIS, ID_ESOCIAL)
                            VALUES (8, 'ENSINO MÉDIO COMPLETO', '7 ', '09')
                          MATCHING (ID);
UPDATE OR INSERT INTO ESCOLARIDADE (ID, DESCRICAO, COD_RAIS, ID_ESOCIAL)
                            VALUES (9, 'EDUCAÇÃO SUPERIOR INCOMPLETA', '8 ', '11')
                          MATCHING (ID);
UPDATE OR INSERT INTO ESCOLARIDADE (ID, DESCRICAO, COD_RAIS, ID_ESOCIAL)
                            VALUES (10, 'EDUCAÇÃO SUPERIOR COMPLETA', '9 ', '12')
                          MATCHING (ID);
UPDATE OR INSERT INTO ESCOLARIDADE (ID, DESCRICAO, COD_RAIS, ID_ESOCIAL)
                            VALUES (11, 'MESTRADO', 'A ', NULL)
                          MATCHING (ID);
UPDATE OR INSERT INTO ESCOLARIDADE (ID, DESCRICAO, COD_RAIS, ID_ESOCIAL)
                            VALUES (12, 'DOUTORADO', 'B ', NULL)
                          MATCHING (ID);
UPDATE OR INSERT INTO ESCOLARIDADE (ID, DESCRICAO, COD_RAIS, ID_ESOCIAL)
                            VALUES (13, 'PÓS-GRADUAÇÃO', 'C ', NULL)
                          MATCHING (ID);

COMMIT WORK;
