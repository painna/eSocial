SET SQL DIALECT 3;


SET TERM ^ ;



CREATE OR ALTER TRIGGER TG_SERVIDOR_ESOCIAL_OPER FOR SERVIDOR
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
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
end
^


SET TERM ; ^

