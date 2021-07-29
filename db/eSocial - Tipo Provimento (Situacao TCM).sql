UPDATE OR INSERT INTO SITUACAO_TCM (ID, NOVO_COD, DESCRICAO, ID_ESOCIAL)
                            VALUES (10, '01', 'COMISSIONADO', '2')
                          MATCHING (ID);
UPDATE OR INSERT INTO SITUACAO_TCM (ID, NOVO_COD, DESCRICAO, ID_ESOCIAL)
                            VALUES (20, '20', 'EFETIVO/CONCURSADO', '1')
                          MATCHING (ID);
UPDATE OR INSERT INTO SITUACAO_TCM (ID, NOVO_COD, DESCRICAO, ID_ESOCIAL)
                            VALUES (21, '60', 'EFETIVO ART. 19 (ADCT) ESTÁVEIS', '1')
                          MATCHING (ID);
UPDATE OR INSERT INTO SITUACAO_TCM (ID, NOVO_COD, DESCRICAO, ID_ESOCIAL)
                            VALUES (31, '00', 'PREFEITO', '99')
                          MATCHING (ID);
UPDATE OR INSERT INTO SITUACAO_TCM (ID, NOVO_COD, DESCRICAO, ID_ESOCIAL)
                            VALUES (32, '00', 'VICE-PREFEITO', '99')
                          MATCHING (ID);
UPDATE OR INSERT INTO SITUACAO_TCM (ID, NOVO_COD, DESCRICAO, ID_ESOCIAL)
                            VALUES (33, '41', 'PRESIDENTE DA CÂMARA', '99')
                          MATCHING (ID);
UPDATE OR INSERT INTO SITUACAO_TCM (ID, NOVO_COD, DESCRICAO, ID_ESOCIAL)
                            VALUES (34, '40', 'VEREADOR', '99')
                          MATCHING (ID);
UPDATE OR INSERT INTO SITUACAO_TCM (ID, NOVO_COD, DESCRICAO, ID_ESOCIAL)
                            VALUES (35, '00', 'MEMBRO DE CONSELHO MUNICIPAL', '99')
                          MATCHING (ID);
UPDATE OR INSERT INTO SITUACAO_TCM (ID, NOVO_COD, DESCRICAO, ID_ESOCIAL)
                            VALUES (40, '00', 'INATIVO', '99')
                          MATCHING (ID);
UPDATE OR INSERT INTO SITUACAO_TCM (ID, NOVO_COD, DESCRICAO, ID_ESOCIAL)
                            VALUES (51, '00', 'PENSIONISTA DE MAIOR IDADE', '99')
                          MATCHING (ID);
UPDATE OR INSERT INTO SITUACAO_TCM (ID, NOVO_COD, DESCRICAO, ID_ESOCIAL)
                            VALUES (52, '00', 'PENSIONISTA DE MENOR IDADE', '99')
                          MATCHING (ID);
UPDATE OR INSERT INTO SITUACAO_TCM (ID, NOVO_COD, DESCRICAO, ID_ESOCIAL)
                            VALUES (61, '70', 'TEMP S/ VINC NO PLANO DE CARGOS E SALARI', '7')
                          MATCHING (ID);
UPDATE OR INSERT INTO SITUACAO_TCM (ID, NOVO_COD, DESCRICAO, ID_ESOCIAL)
                            VALUES (62, '70', 'TEMP C/ VINC NO PLANO DE CARGOS E SALARI', '7')
                          MATCHING (ID);
UPDATE OR INSERT INTO SITUACAO_TCM (ID, NOVO_COD, DESCRICAO, ID_ESOCIAL)
                            VALUES (71, '00', 'DISPOSIÇÃO C/ ONUS P/ ORGAO DE ORIGEM', '5')
                          MATCHING (ID);
UPDATE OR INSERT INTO SITUACAO_TCM (ID, NOVO_COD, DESCRICAO, ID_ESOCIAL)
                            VALUES (72, '00', 'DISPOSIÇÃO S/ ONUS P/ ORGAO DE ORIGEM', '5')
                          MATCHING (ID);
UPDATE OR INSERT INTO SITUACAO_TCM (ID, NOVO_COD, DESCRICAO, ID_ESOCIAL)
                            VALUES (73, '26', 'DISPOSIÇÃO P/ CONV DE MUNICIP DA EDUCAÇÃ', '5')
                          MATCHING (ID);
UPDATE OR INSERT INTO SITUACAO_TCM (ID, NOVO_COD, DESCRICAO, ID_ESOCIAL)
                            VALUES (74, '25', 'DISPOSIÇÃO P/ CONV DE MUNICIP DA SAÚDE', '5')
                          MATCHING (ID);

COMMIT WORK;
