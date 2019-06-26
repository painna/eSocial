UPDATE OR INSERT INTO ESOCIAL_TIPO_DEPENDENTE (CODIGO, DESCRICAO)
                                       VALUES ('01', 'Cônjuge')
                                     MATCHING (CODIGO);
UPDATE OR INSERT INTO ESOCIAL_TIPO_DEPENDENTE (CODIGO, DESCRICAO)
                                       VALUES ('02', 'Companheiro(a) com o(a) qual tenha filho ou viva há mais de 5 (cinco) anos ou possua Declaração de União Estável')
                                     MATCHING (CODIGO);
UPDATE OR INSERT INTO ESOCIAL_TIPO_DEPENDENTE (CODIGO, DESCRICAO)
                                       VALUES ('03', 'Filho(a) ou enteado(a)')
                                     MATCHING (CODIGO);
UPDATE OR INSERT INTO ESOCIAL_TIPO_DEPENDENTE (CODIGO, DESCRICAO)
                                       VALUES ('04', 'Filho(a) ou enteado(a), universitário(a) ou cursando escola técnica de 2º grau')
                                     MATCHING (CODIGO);
UPDATE OR INSERT INTO ESOCIAL_TIPO_DEPENDENTE (CODIGO, DESCRICAO)
                                       VALUES ('06', 'Irmão(ã), neto(a) ou bisneto(a) sem arrimo dos pais, do(a) qual detenha a guarda judicial')
                                     MATCHING (CODIGO);
UPDATE OR INSERT INTO ESOCIAL_TIPO_DEPENDENTE (CODIGO, DESCRICAO)
                                       VALUES ('07', 'Irmão(ã), neto(a) ou bisneto(a) sem arrimo dos pais, universitário(a) ou cursando escola técnica de 2° grau, do(a) qual detenha a guarda judicial')
                                     MATCHING (CODIGO);
UPDATE OR INSERT INTO ESOCIAL_TIPO_DEPENDENTE (CODIGO, DESCRICAO)
                                       VALUES ('09', 'Pais, avós e bisavós')
                                     MATCHING (CODIGO);
UPDATE OR INSERT INTO ESOCIAL_TIPO_DEPENDENTE (CODIGO, DESCRICAO)
                                       VALUES ('10', 'Menor pobre do qual detenha a guarda judicial')
                                     MATCHING (CODIGO);
UPDATE OR INSERT INTO ESOCIAL_TIPO_DEPENDENTE (CODIGO, DESCRICAO)
                                       VALUES ('11', 'A pessoa absolutamente incapaz, da qual seja tutor ou curador')
                                     MATCHING (CODIGO);
UPDATE OR INSERT INTO ESOCIAL_TIPO_DEPENDENTE (CODIGO, DESCRICAO)
                                       VALUES ('12', 'Ex-cônjuge')
                                     MATCHING (CODIGO);
UPDATE OR INSERT INTO ESOCIAL_TIPO_DEPENDENTE (CODIGO, DESCRICAO)
                                       VALUES ('99', 'Agregado/Outros')
                                     MATCHING (CODIGO);

COMMIT WORK;
