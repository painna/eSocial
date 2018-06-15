unit UtilsDb;

interface

USES SysUtils, WinTypes, WinProcs, Classes, Messages, Controls, DateUtils,
     Forms, Dialogs, stdCtrls, Grids, DBGrids, DBClient,
     Graphics, Db, JPEG, SqlExpr, Provider, StrUtils, Variants,
     cxGridTableView, cxGridDBTableView, cxGrid;

Function UltimoSequencial(sNomeTab,sCampoId: String): Integer;
Function UltimoID(sNomeTab: String): Integer;
Procedure Logradouros(oEd1,oEd2: TCustomEdit);
Procedure Bairros(oEd1,oEd2: TCustomEdit);
Procedure LocaisDePagto(oEd1,oEd2: TCustomEdit);
Function Pesquisa(sTabela, sCampoPesq, sTextPesq, sCampoRet, sMensagem: String): String;
Function PesquisaData(sTabela, sCampoPesq, sTextPesq, sCampoRet, sMensagem: String): TDateTime;
Procedure AtualizaUltSequencial(sTabela: String; iUltSequencial: Integer);
Procedure MostraDados(sTabela,sCampoId,sCampoDisp1,sCampoDisp2,sTextoPesq: String; oEdit1,oEdit2: TCustomEdit; sMsg: String);
Procedure CancelaTransacao(oTab: TClientDataSet; sNomeTab: String);
Function ProximoNumero(sTabela,sCampoPesq: String; bDigVerificador: Boolean; iTam: Integer): String;
Function SalvaTransacao(oTab: TClientDataSet): Boolean;
Function ExcluiRegistro(oTab: TClientDataSet): Boolean;
Procedure SetIndice(oTab: TClientDataSet; oDbg: TDBGrid; wCol: Word; oFrame1: TFrame);
Procedure PesquisaIncremental(sTexto: String; oTab: TClientDataSet);
Function ProxColGrid(iMaxColGrid,iColAtual: Integer): Integer;
Procedure gsRefreshClient(oCds: TClientDataSet; sNomeCampoPk: String; iId: Integer);
Procedure gsRefreshClient2(oCds: TClientDataSet; sNomeCampoPk1,sNomeCampoPk2,sNomeCampoPk3: String;
                           iId,iId2,iId3: Integer);
Function NavegaClient(wKey: Word; Grid1: TcxGridDbTableView): Word;
Function NavegaClient2(wKey: Word; cds1: TClientDataSet): Word;
Function MovimEncerradoSUO(sAnoMes,sParcela: String; iSubUndOrcam: Integer): Boolean;
Function MovimEncerradoMesAno(sAnoMes,sParcela: String): Boolean;
function GetFieldValue(Table, Field, WhereClausule: string): string;
function OpenClient(Client: TClientDataSet; CommandText: String): Boolean;
procedure CloseClient(Client: TClientDataSet);
procedure BeforePostClient(Client: TClientDataSet);
function GetDataSet(cdsClient: TClientDataSet): TSQLDataSet; //ult. vs. 2010/05/26
function IncrementGenerator(Generator_: String; N_: Integer): String;
procedure CancelGenerator(oDataSetState: TDataSetState; sTab, sIdGen: String;
  iIdCancel: integer);
Function UnidGestoraPermiteUsuario(iIdUnidGestora,iIdSubUnidOrcam,
  iIdServidor: Integer; sPesq,sAnoMes: String): Boolean;
function CNPJ_Razao_Social_UG(iUnidGestora,iSubUnidOrcam: Integer): TStringList;
Function QtdRegChaveEstrangeira(sPesquisa,sCampo,sTabela: String): Integer;
Function RetiraUnidGestSemPermissao(sMultiUnidGestora: widestring;
   sAnoMes: string): widestring;
function ValidaPIS_PASEP_CPF(sId,sCPF,sPIS_PASEP,sOper: string): Boolean;
function UsuarioPermissaoTabela(iUsuario: integer; sTab: string): string;
Function CriaCampoTab(sTab,sCampo,sTipo: string): Boolean;
function OcultaTriggers_e_procs: Boolean;

implementation

uses VarGlobais, udmPrincipal, gsLib;

Function UltimoSequencial(sNomeTab,sCampoId: String): Integer;
Var
   oQry1: TSQLQuery;
   iSequencial: Integer;
Begin
   sNomeTab := UpperCase(sNomeTab);
   oQry1:= TSQLQuery.Create(Nil);
   oQry1.SQLConnection := dmPrincipal.SConPrincipal;
   oQry1.SQL.Add('SELECT MAX('+sCampoId+') AS ULT_ID FROM '+sNomeTab);
   Try
      try
         oQry1.Open;
         iSequencial := oQry1.FieldByName('ULT_ID').AsInteger+1;
      except
         iSequencial := 1;
      end;
   Finally
      oQry1.Close;
      FreeAndNil(oQry1);
   End;
   Result := iSequencial;
End;

Function UltimoID(sNomeTab: String): Integer;
Var
   oQry1: TSQLQuery;
   iId: Integer;
Begin
   sNomeTab := UpperCase(sNomeTab);
   oQry1:= TSQLQuery.Create(Nil);
   oQry1.SQLConnection := dmPrincipal.SConPrincipal;
   oQry1.SQL.Add('SELECT MAX(ID) AS ULT_ID FROM '+sNomeTab);
   Try
      try
         oQry1.Open;
         iId := oQry1.FieldByName('ULT_ID').Value;
      except
         iId := 0;
      end;
   Finally
      oQry1.Close;
      FreeAndNil(oQry1);
      Result := iId;
   End;
End;

Procedure Logradouros(oEd1,oEd2: TCustomEdit);
Var
   oQry1: TSQLQuery;
Begin
   oQry1 := TSQLQuery.Create(Nil);
   oQry1.SqlConnection := dmPrincipal.SConPrincipal;
   oQry1.SQL.Add('SELECT ID_LOGRADOURO FROM LOGRADOURO ORDER BY ID_LOGRADOURO');
   oQry1.Open;
   oEd1.Text := oQry1.FieldByName('ID_LOGRADOURO').Value;
   oQry1.Last;
   oEd2.Text := oQry1.FieldByName('ID_LOGRADOURO').Value;
   oQry1.Close;
   oQry1.Free;
End;

Procedure Bairros(oEd1,oEd2: TCustomEdit);
Var
   oQry1: TSQLQuery;
Begin
   oQry1 := TSQLQuery.Create(Nil);
   oQry1.SqlConnection := dmPrincipal.SConPrincipal;
   oQry1.SQL.Add('SELECT ID_BAIRRO FROM BAIRRO ORDER BY ID_BAIRRO');
   oQry1.Open;
   oEd1.Text := oQry1.FieldByName('ID_BAIRRO').Value;
   oQry1.Last;
   oEd2.Text := oQry1.FieldByName('ID_BAIRRO').Value;
   oQry1.Close;
   oQry1.Free;
End;

Procedure LocaisDePagto(oEd1,oEd2: TCustomEdit);
Var
   oQry1: TSQLQuery;
Begin
   oQry1 := TSQLQuery.Create(Nil);
   oQry1.SqlConnection := dmPrincipal.SConPrincipal;
   oQry1.SQL.Add('SELECT ID_LOCAL_PAGTO FROM LOCAL_DE_PAGAMENTO ORDER BY ID_LOCAL_PAGTO');
   oQry1.Open;
   oEd1.Text := oQry1.FieldByName('ID_LOCAL_PAGTO').Value;
   oQry1.Last;
   oEd2.Text := oQry1.FieldByName('ID_LOCAL_PAGTO').Value;
   oQry1.Close;
   oQry1.Free;
End;

Function Pesquisa(sTabela, sCampoPesq, sTextPesq, sCampoRet, sMensagem: String): String;
Var
   oQry1: TSQLQuery;
Begin

   oQry1 := TSQLQuery.Create(Nil);
   oQry1.SQLConnection := dmPrincipal.SConPrincipal;
   oQry1.SQL.Clear;
   oQry1.SQL.Add('SELECT '+UpperCase(sCampoRet)+' FROM '+UpperCase(sTabela)+
                          ' WHERE '+UpperCase(sCampoPesq)+' = :Param1');

   oQry1.Params[0].AsString := Trim(sTextPesq);
   Try
     oQry1.Open;
     Try
         Result := Trim(oQry1.FieldByName(UpperCase(sCampoRet)).AsString);
     except
         Result := '';
     End;
     If Result = '' Then
        If sMensagem <> '' Then
           Mensagem(sMensagem,'E r r o !!!',MB_ICONERROR+MB_OK);
   Finally
     oQry1.Close;
     oQry1.Free;
   End;
End;

Function PesquisaData(sTabela, sCampoPesq, sTextPesq, sCampoRet, sMensagem: String): TDateTime;
Var
   oQry1: TSQLQuery;
Begin

   oQry1 := TSQLQuery.Create(Nil);
   oQry1.SQLConnection := dmPrincipal.SConPrincipal;
   oQry1.SQL.Clear;
   oQry1.SQL.Add('SELECT '+UpperCase(sCampoRet)+' FROM '+UpperCase(sTabela)+
                          ' WHERE '+UpperCase(sCampoPesq)+' = :Param1');

   oQry1.Params[0].AsString := Trim(sTextPesq);
   Try
     oQry1.Open;
     Try
         Result := oQry1.FieldByName(UpperCase(sCampoRet)).AsDateTime;
     except
         Result := null;
     End;
     If Result = null Then
        If sMensagem <> '' Then
           Mensagem(sMensagem,'E r r o !!!',MB_ICONERROR+MB_OK);
   Finally
     oQry1.Close;
     oQry1.Free;
   End;
End;

Procedure AtualizaUltSequencial(sTabela: String; iUltSequencial: Integer);
Var
   oQry1: TSQLQuery;
Begin
{
   sTabela := UpperCase(sTabela);
   oQry1 := TSQLQuery.Create(Nil);
   oQry1.SQLConnection := dmPrincipal.SConPrincipal;

   oQry1.SQL.Add('SELECT ULTIMO_SEQUENCIAL, NOME_DA_TABELA FROM CONTROLE_DE_SEQUENCIAL WHERE NOME_DA_TABELA = :sTab');
   oQry1.ParamByName('sTab').Value := sTabela;
   Try
      oQry1.Open;
      If oQry1.FieldByName('NOME_DA_TABELA').Value = Null Then
      Begin
         oQry1.Close;
         oQry1.SQL.Clear;
         oQry1.SQL.Add('INSERT INTO CONTROLE_DE_SEQUENCIAL (ID_CONTROL_SEQUENCIAL,NOME_DA_TABELA,ULTIMO_SEQUENCIAL');
         oQry1.SQL.Add('VALUES (:iIdControlSeq,:sNomeTab,:iUltSeq)');
         oQry1.ParamByName('iIdControlSeq').Value:= UltimoSequencial('CONTROLE_DE_SEQUENCIAL')+1;
         oQry1.ParamByName('sNomeTab').Value     := sTabela;
         oQry1.ParamByName('iUltSeq').Value      := iUltSequencial;
         oQry1.ExecSQL;
      End Else
      Begin
         oQry1.Close;
         oQry1.SQL.Clear;
         oQry1.SQL.Add('UPDATE CONTROLE_DE_SEQUENCIAL SET ULTIMO_SEQUENCIAL = :iUltSeq WHERE NOME_DA_TABELA = :sTab');
         oQry1.ParamByName('iUltSeq').Value := iUltSequencial;
         oQry1.ParamByName('sTab').Value    := sTabela;
         oQry1.ExecSQL;
      End;
   Finally
      oQry1.Close;
      oQry1.Free;
   End;
}
End;

Procedure MostraDados(sTabela,sCampoId,sCampoDisp1,sCampoDisp2,sTextoPesq: String;
   oEdit1,oEdit2: TCustomEdit; sMsg: String);
Var
   oQry1       : TSqlQuery;
   sCPF_CNPJ   : String[14];
   sTextoSQL   : String;
Begin
   oQry1 := TSqlQuery.Create(Nil);
   sCPF_CNPJ:= '';
   oQry1.SQLConnection := dmPrincipal.SConPrincipal;
   oQry1.SQL.Clear;
   sTextoSQL :=  'SELECT '+sCampoDisp1+', '+sCampoDisp2+' '+
                 'FROM '+sTabela+' '+
                 'WHERE '+sCampoId+' = :pCodigo';
   oQry1.SQL.Add(sTextoSQL);
   oQry1.Params[0].Value := sTextoPesq;
   oQry1.Open;
   Try
      If oQry1.FieldByName(sCampoDisp1).IsNull Then
      Begin
         If sMsg <> '' Then
            Mensagem('Código de '+sMsg+' inválido !','E r r o !!!',MB_ICONEXCLAMATION+MB_OK);
         Exit;
      End;
      oEdit1.Text:= oQry1.FieldByName(sCampoDisp1).Value;
      If Not oQry1.FieldByName(sCampoDisp2).IsNull Then
         oEdit2.Text := oQry1.FieldByName(sCampoDisp2).Value;
   Finally
      oQry1.Close;
      FreeAndNil(oQry1);
   End;
End;

Procedure CancelaTransacao(oTab: TClientDataSet; sNomeTab: String);
Var
   iSequencial,
   iSequencial2: Integer;
   lAdd        : Boolean;
Begin
   lAdd := (oTab.State = dsInsert);
   If oTab.State in [dsInsert,dsEdit] Then oTab.Cancel;
   oTab.CancelUpdates;
   {
   If Not lAdd Then Exit;
   sNomeTab := UpperCase(sNomeTab);
   iSequencial2 := UltimoSequencial(sNomeTab);
   If iSequencial = iSequencial2 Then
      AtualizaUltSequencial(sNomeTab,iSequencial-1);
   }
End;

Function ProximoNumero(sTabela,sCampoPesq: String; bDigVerificador: Boolean; iTam: Integer): String;
Var
   iUltSequencial: Integer;
Begin
   sTabela := UpperCase(sTabela);
   iUltSequencial:= UltimoSequencial(sTabela,sCampoPesq);
   Inc(iUltSequencial);
   If bDigVerificador = True Then
   Begin
      Result := IntToStr(iUltSequencial);
      Result := PreencheZeros(Result,iTam-1);
      If sTabela = 'PROPRIETARIO' Then
         Result := Result + CalcDigProprietario(Result)
      Else If sTabela = 'UNIDADE_CONSUMIDORA' Then
         Result := Result + CalcDigUnidConsumidora(Result)
   End Else
   Begin
      If iTam > 0 Then
         Result := PreencheZeros(IntToStr(iUltSequencial),iTam)
      Else
         Result := IntToStr(iUltSequencial);
   End;
   //AtualizaUltSequencial(sTabela,iUltSequencial);
End;

Function SalvaTransacao(oTab: TClientDataSet): Boolean;
Begin
   Result := True;
   If oTab.State in [dsInsert,dsEdit] Then
      oTab.Post;
   try
      oTab.ApplyUpdates(0);
   except
     on E: Exception do
     begin
       Mensagem('Não foi possível Gravar essa Transação no Banco de Dados !'+#13+
         '('+E.Message+')',
         'E R R O !!!',MB_OK+MB_ICONERROR);
       oTab.CancelUpdates;
       Result := False;
     end;
   end;
End;

Function ExcluiRegistro(oTab: TClientDataSet): Boolean;
Begin
   Result := True;
   oTab.Delete;
   try
      oTab.ApplyUpdates(0);
   except
      on E: Exception do
      begin
         Mensagem('Não foi possível Excluir esse Registro do Banco de Dados !'+#13+
                  '('+E.Message+')','E R R O !!!',MB_OK+MB_ICONERROR);
         oTab.CancelUpdates;
         Result := False;
      end;
   end;
End;

Procedure SetIndice(oTab: TClientDataSet; oDbg: TDBGrid; wCol: Word; oFrame1: TFrame);
Var
   iConta: Integer;
   sCampoIndex: String;
Begin
{
   If Trim(oDbg.Columns[wCol].Title.Caption) = '' Then Exit;
   sCampoIndex := oDbg.Columns[wCol].FieldName;
   For iConta := 0 To oDbg.Columns.Count-1 Do
   Begin
      oDbg.Columns[iConta].Title.Font.Color:= glb_oCorColTitGrid_Normal;  // Normal
      oDbg.Columns[iConta].Title.Font.Style:= [fsBold];
   End;
   oTab.IndexFieldNames := sCampoIndex;
   oDbg.Columns[wCol].Title.Font.Color:= glb_oCorColTitGrid_Destacada;  // Destacado
   oDbg.Columns[wCol].Title.Font.Style:= [fsBold];
   If oFrame1 <> Nil Then
   Begin
      For iConta := 0 To oFrame1.ComponentCount - 1 Do
      Begin
         If oFrame1.Components[iConta] Is TEdit Then
            TEdit(oFrame1.Components[iConta]).MaxLength := oTab.FieldByName(sCampoIndex).Size
         Else If oFrame1.Components[iConta] Is TGroupBox Then
            TGroupBox(oFrame1.Components[iConta]).Caption := ' '+oDbg.Columns[wCol].Title.Caption+': ( [F3] -> Muda Ordem ... ) ';
      End;
   End;
}
End;

Procedure PesquisaIncremental(sTexto: String; oTab: TClientDataSet);
Var
  sCampoPesq: String;
  iTemp     : Integer;
  crTemp    : Currency;
Begin
  With oTab Do
  Begin
     If Empty(sTexto) Then
     Begin
        First;
        Exit;
     End;
     iTemp := 0;
     crTemp:= 0;
     sCampoPesq := oTab.IndexFieldNames;
     {
     if (oTab.FieldByName(sCampoPesq) Is TIntegerField) then
     begin
        try
           iTemp := StrToInt(sTexto);
        finally
           iTemp := -1;
        end;
     end else
     if (oTab.FieldByName(sCampoPesq) Is TCurrencyField) then
     begin
        try
           crTemp := StrToCurr(sTexto);
        finally
           iTemp := -1;
        end;
     end;
     if (iTemp=-1) or (crTemp=-1) then exit;
     }
     DisableControls;
     Try
        Locate(sCampoPesq,sTexto,[loPartialKey]);
     Except
     End;
     EnableControls;
  End;
End;

Function ProxColGrid(iMaxColGrid,iColAtual: Integer): Integer;
Begin
  Result := iColAtual+1;
  If Result > iMaxColGrid Then
     Result := 0;
End;

Procedure gsRefreshClient(oCds: TClientDataSet; sNomeCampoPk: String; iId: Integer);
begin
  ocds.DisableControls;
  ocds.Close;
  ocds.Open;
  oCds.Locate(sNomeCampoPk,IntToStr(iId),[]);
  ocds.EnableControls;
end;

Procedure gsRefreshClient2(oCds: TClientDataSet; sNomeCampoPk1,sNomeCampoPk2,sNomeCampoPk3: String;
  iId,iId2,iId3: Integer);
Var
  sIndexSave: string;
begin
  sIndexSave := ocds.IndexFieldNames;
  ocds.DisableControls;
  ocds.Close;
  if sNomeCampoPk3 <> '' then
     ocds.IndexFieldNames := sNomeCampoPK1+';'+sNomeCampoPK2+';'+sNomeCampoPK3
  else
     ocds.IndexFieldNames := sNomeCampoPK1+';'+sNomeCampoPK2;
  ocds.Open;
  if sNomeCampoPk3 <> '' then
     ocds.FindKey([iId,iId2,iId3])
  else
     ocds.FindKey([iId,iId2]);
  ocds.IndexFieldNames := sIndexSave;
  ocds.EnableControls;
end;

Function NavegaClient(wKey: Word; Grid1: TcxGridDbTableView): Word;
Begin
  If wKey in [VK_END,VK_HOME,VK_UP,VK_DOWN] Then
  Begin
    Case wKey of
       VK_END : grid1.DataController.GotoLast;
       VK_HOME: grid1.DataController.GotoFirst;
       VK_UP  : grid1.DataController.GotoPrev;
       VK_DOWN: grid1.DataController.GotoNext;
    End;
    Result := 0;
  End Else
    Result := wKey;
End;

Function NavegaClient2(wKey: Word; cds1: TClientDataSet): Word;
Begin
  If wKey in [VK_END,VK_HOME,VK_UP,VK_DOWN] Then
  Begin
    Case wKey of
       VK_END : cds1.Last;
       VK_HOME: cds1.First;
       VK_UP  : cds1.Prior;
       VK_DOWN: cds1.Next;
    End;
    Result := 0;
  End Else
    Result := wKey;
End;

Function MovimEncerradoSUO(sAnoMes,sParcela: String; iSubUndOrcam: Integer): Boolean;
Var
   oQry1: TSQLQuery;
begin
   Result := False;
   oQry1:= TSQLQuery.Create(nil);
   oQry1.SQLConnection := dmPrincipal.SConPrincipal;
   oQry1.SQL.Add('select ENCERRADO from CTRL_PROCES_SUB_UND_ORCAM');
   oQry1.SQL.Add('where (ano_mes = :pAnoMes) and ');
   oQry1.SQL.Add('(parcela = :pParcela) and ');
   oQry1.SQL.Add('(id_sub_unid_orcam = :pIdSubUndOrcam)');
   oQry1.ParamByName('pAnoMes').Value:= sAnoMes;
   oQry1.ParamByName('pParcela').Value:= sParcela;
   oQry1.ParamByName('pIdSubUndOrcam').Value:= iSubUndOrcam;
   try
      try
         oQry1.Open;
         if oQry1.FieldByName('ENCERRADO').Value = 'S' then
            Result := True;
      except
      end;
   finally
      oQry1.Close;
      FreeAndNil(oQry1);
   end;
end;

Function MovimEncerradoMesAno(sAnoMes,sParcela: String): Boolean;
Var
   oQry1: TSQLQuery;
begin
   Result := False;
   oQry1:= TSQLQuery.Create(nil);
   oQry1.SQLConnection := dmPrincipal.SConPrincipal;
   oQry1.SQL.Add('select ENCERRADO from CTRL_PROCESS_GERAL');
   oQry1.SQL.Add('where (ano_mes = :pAnoMes) and ');
   oQry1.SQL.Add('(parcela = :pParcela)');
   oQry1.ParamByName('pAnoMes').Value:= sAnoMes;
   oQry1.ParamByName('pParcela').Value:= sParcela;
   try
      try
         oQry1.Open;
         if oQry1.FieldByName('ENCERRADO').Value = 'S' then
            Result := True;
      except
      end;
   finally
      oQry1.Close;
      FreeAndNil(oQry1);
   end;
end;

function IncrementGenerator(Generator_: String; N_: Integer): String;
Var
  oQry1: TSQLQuery;
begin
  Result := '0';
  oQry1  := TSQLQuery.Create(Nil);

  try
    oQry1.SQLConnection := dmPrincipal.SConPrincipal;
    try
      oQry1.SQL.Clear;
      oQry1.SQL.Add('CREATE SEQUENCE ' + Generator_);
      oQry1.ExecSQL;
    except
    end;

    if oQry1.Active then
      oQry1.Close;

    oQry1.SQL.Clear;
    oQry1.SQL.Add('select gen_id(' + Generator_ + ', 1) as NewId from RDB$DATABASE');
    try
      oQry1.Open;
      Result := oQry1.FieldByName('NewId').AsString;
    except
      Mensagem('Não foi possível incrementar o Gerador ' + #13 + Generator_, 'Erro !!!',MB_OK+MB_ICONERROR);
    end;
  finally
    oQry1.Close;
    FreeAndNil(oQry1);
  end;
end;

procedure CancelGenerator(oDataSetState: TDataSetState;
  sTab, sIdGen: String; iIdCancel: integer);
Var
  oSP1: TSQLStoredProc;
  iUltId: Integer;
  sUltId: string;
  sNomeGen: string;
begin

  if (oDataSetState <> dsInsert) or
     (sTab = '') or (sIdGen = '') then exit;

  oSP1:= TSQLStoredProc.Create(Nil);
  oSP1.SQLConnection := dmPrincipal.SConPrincipal;
  oSP1.StoredProcName := 'SP_ATUALIZA_GEN';

  iUltId := UltimoID(sTab);

  if iUltId > 0 then
     if (sTab = 'SERVIDOR') or
        (sTab = 'PRESTADOR_SERVICO') or
        (sTab = 'BOLSA_BENEFICIARIO') then
     begin
        sUltId := IntToStr(iUltId);
        sUltId := LeftStr(sUltId,Length(sUltId)-1);
        iUltId := StrToInt(sUltId);
     end;

  try
    if iIdCancel > iUltId then
    begin
       if UpperCase(sTab) = UpperCase('hist_transf_sub_und_orcam') then
          sNomeGen := 'GEN_ID_HIST_TRANSF_SUB_UND_ORC'
       else if UpperCase(sTab) = UpperCase('PESSOA_FISICA_DEPENDENTE') then
          sNomeGen := 'GEN_ID_PESSOA_FISICA_DEPEND'
       else
          sNomeGen := 'GEN_'+sIdGen+'_'+sTab;
       oSP1.ParamByName('pe_nome_gen').Value := sNomeGen;
       oSP1.ParamByName('pe_id').Value := iUltId;
       try
          oSP1.ExecProc;
       except
          on E: Exception do
          begin
            Mensagem('('+E.Message+')','E R R O !!!',MB_OK+MB_ICONERROR);
          end;
       end;
    end;
  finally
    oSP1.Close;
    FreeAndNil(oSP1);
  end;

end;

function GetFieldValue(Table, Field, WhereClausule: string): string;
var
  DataSet: TSQLDataSet;
  Provider: TDataSetProvider;
  Client: TClientDataSet;
begin
   DataSet := TSQLDataSet.Create(Nil);
   DataSet.Name := 'sdsGetFieldValue';
   DataSet.SQLConnection := dmPrincipal.SConPrincipal;
   DataSet.GetMetadata := False;

   Provider := TDataSetProvider.Create(Nil);
   Provider.Name := 'dspGetFieldValue';
   Provider.DataSet := DataSet;
   Provider.Exported := False;
   Provider.Options := [poAllowCommandText,poUseQuoteChar];
   Provider.UpdateMode := upWhereKeyOnly;

   Client := TClientDataSet.Create(Nil);
   Client.Name := 'cdsGetFieldValue';
   Client.ProviderName := Provider.Name;
   Client.Filtered := True;

   OpenClient(Client,
    IfThen((Field<>EmptyStr) and (Table<>EmptyStr), 'select '+Field+' from '+
    Table+' ', '')+WhereClausule);

   if (Client.Active)and(not Client.Fields[0].IsNull) then
   begin
      Result := Client.Fields[0].AsString;
   end
   else

   begin
      Result := '';
   end;

   CloseClient(Client);

   Client.Free;
   Provider.Free;
   DataSet.Free;
end;

function OpenClient(Client: TClientDataSet; CommandText: String): Boolean;
begin
  Client.CommandText := IfThen(CommandText = EmptyStr, Client.CommandText,
    CommandText);

  try
    Client.Open;
  except
  on E: Exception do
  begin
     Mensagem('Erro $002'+#13+Client.Name+#13+E.Message+#13+
        Client.CommandText, 'Erro', MB_ICONERROR+MB_OK);
  end;
  end;
  Result := Client.Active;
end;


procedure CloseClient(Client: TClientDataSet);
begin
  Client.Close;
  Client.Filter := '';
end;

procedure BeforePostClient(Client: TClientDataSet);
var
  Count: integer;
begin
   for Count := 0 to (Client.Fields.Count - 1) do
   begin
     if (Client.Fields[Count].Required) and
      (Client.Fields[Count].IsNull) then
     begin
       Mensagem('O campo '+Client.Fields[Count].DisplayLabel+
          ' é obrigatório(a)', 'Aviso', MB_ICONINFORMATION+MB_OK);
       Client.Fields[Count].FocusControl;
      SysUtils.Abort;
     end;
   end;
   if Client.State = dsEdit then
     for Count := 0 to (Client.Fields.Count - 1) do
     begin
       if
          (Client.Fields[Count].Tag = 1) then
       begin
          if (Client.Fields[Count].NewValue) <>
                (Client.Fields[Count].OldValue) then
            GetDataSet(Client).Fields[Count].ProviderFlags := [pfInUpdate]
          else
            GetDataSet(Client).Fields[Count].ProviderFlags := []
       end;
     end;
end;

function GetDataSet(cdsClient: TClientDataSet): TSQLDataSet; //ult. vs. 2010/05/26
  //retorna o sqldataset associado ao clientdataset
begin
  //procuro no proprietário do clientdataset o componente com o nome
  //configurado na propriedade providername do clientdataset
  //e retorno a propriedade dataset
  if
    TDataSetProvider(
      cdsClient.Owner.FindComponent(cdsClient.ProviderName)
    ) = nil //se não encontrar nenhum componente
  then
    Result := nil
  else
    Result :=
      TSQLDataSet(
        TDataSetProvider(
          cdsClient.Owner.FindComponent(cdsClient.ProviderName)
        ).DataSet
      );
  {
    Elaborado por:
    BRUNO MAJORICO FREITAS SANTIAGO
    E-mail e MSN: contato@brunosantiago.net
    Mais informações acesse: http://brunosantiago.net
  }
end;

Function UnidGestoraPermiteUsuario(iIdUnidGestora,iIdSubUnidOrcam,
   iIdServidor: Integer; sPesq,sAnoMes: String): Boolean;
Var
   oQry1: TSQLQuery;
   oQry2: TSQLQuery;
begin
   Result := False;

   if (iIdUnidGestora = 0) and (iIdSubUnidOrcam = 0) and (iIdServidor = 0)
      then exit;

   if iIdServidor <> 0 then
   begin
      if sPesq = '1' then // Cadastro do Servidor
         iIdSubUnidOrcam := StrToInt(Pesquisa('SERVIDOR','ID',
            IntToStr(iIdServidor),'ID_SUB_UNID_ORCAMENT',''))
      else begin // na tabela de inicialização
        oQry2:= TSQLQuery.Create(Nil);
        oQry2.SQLConnection := dmPrincipal.SConPrincipal;
        oQry2.SQL.Add('SELECT ID_SUB_UNID_ORCAMENT FROM INICIALIZA_MES_SERVIDOR ');
        oQry2.SQL.Add('WHERE (ID_SERVIDOR = :pServidor) AND (ANO_MES = :pAnoMes)');
        oQry2.ParamByName('pServidor').Value:= iIdServidor;
        oQry2.ParamByName('pAnoMes').Value  := sAnoMes;
        try
          oQry2.Open;
          if not oQry2.IsEmpty then
             iIdSubUnidOrcam := oQry2.FieldByName('ID_SUB_UNID_ORCAMENT').Value;
        finally
          oQry2.Close;
          FreeAndNil(oQry2);
        end;
      end;
      iIdUnidGestora :=
         (StrToInt(Pesquisa('SUB_UNID_ORCAMENT','ID',IntToStr(iIdSubUnidOrcam),
            'ID_UNID_GESTORA','')));
   end else
   if iIdUnidGestora = 0 then
      iIdUnidGestora :=
         (StrToInt(Pesquisa('SUB_UNID_ORCAMENT','ID',IntToStr(iIdSubUnidOrcam),
            'ID_UNID_GESTORA','')));

   oQry1:= TSQLQuery.Create(Nil);
   oQry1.SQLConnection := dmPrincipal.SConPrincipal;
   oQry1.SQL.Add('SELECT * FROM USUARIO_UNID_GESTORA WHERE ');
   oQry1.SQL.Add('(ID_USUARIO = :pUsuario) AND (ID_UNID_GESTORA = :pUnidGestora)');
   oQry1.ParamByName('pUsuario').Value := glb_iIdOperExecut;
   oQry1.ParamByName('pUnidGestora').Value := iIdUnidGestora;
   try
     oQry1.Open;
     if not oQry1.IsEmpty then
        Result := True;
   finally
     oQry1.Close;
     FreeAndNil(oQry1);
   end;

end;

function CNPJ_Razao_Social_UG(iUnidGestora,iSubUnidOrcam: Integer): TStringList;
Var
  oQry1: TSQLQuery;
  sRazaoSocialPrincipal,
  sRazaoSocialUG: String[60];
  sCNPJPrincipal,
  sCNPJUnidGestora: String[14];
  slRet: TStringList;
begin
  slRet := TStringList.Create;
  oQry1 := TSQLQuery.Create(Nil);
  oQry1.SQLConnection := dmPrincipal.SConPrincipal;
  oQry1.SQL.Add('SELECT RAZAO_SOCIAL, CNPJ FROM CONFIG_ORGAO WHERE ID = 1');
  oQry1.Open;
  sRazaoSocialPrincipal:= Criptografa(oQry1.FieldByName('RAZAO_SOCIAL').Value,
     '2',60);
  sCNPJPrincipal:= Criptografa(oQry1.FieldByName('CNPJ').Value,'2',14);
  oQry1.Close;
  oQry1.SQL.Clear;
  if iSubUnidOrcam <> 0 then
  begin
     oQry1.SQL.Add('SELECT ID_UNID_GESTORA FROM SUB_UNID_ORCAMENT '+
        'WHERE ID = :pS_U_O');
     oQry1.ParamByName('pS_U_O').Value := iSubUnidOrcam;
     oQry1.Open;
     iUnidGestora := oQry1.FieldByName('ID_UNID_GESTORA').Value;
     oQry1.Close;
     oQry1.SQL.Clear;
  end;
  oQry1.SQL.Add('SELECT RAZAO_SOCIAL, CNPJ FROM UNID_GESTORA WHERE ID = :pId_UG');
  oQry1.ParamByName('pId_UG').Value := iUnidGestora;
  oQry1.Open;
  sRazaoSocialUG  := '';
  sCNPJUnidGestora:= '';
  if not oQry1.FieldByName('RAZAO_SOCIAL').IsNull then
     sRazaoSocialUG  := oQry1.FieldByName('RAZAO_SOCIAL').Value;
  if not oQry1.FieldByName('CNPJ').IsNull then
  sCNPJUnidGestora:= oQry1.FieldByName('CNPJ').Value;
  oQry1.Close;
  FreeAndNil(oQry1);

  if sCNPJUnidGestora <> sCNPJPrincipal then
  begin
     slRet.Add(sCNPJUnidGestora);
     slRet.Add(sRazaoSocialUG);
  end else
  begin
     slRet.Add(sCNPJPrincipal);
     slRet.Add(sRazaoSocialPrincipal);
  end;

  Result := slRet;

end;

Function QtdRegChaveEstrangeira(sPesquisa,sCampo,sTabela: String): Integer;
Var
   oQry: TSQLQuery;
Begin
   Screen.Cursor:= crHourGlass;
   oQry := TSQLQuery.Create(Nil);
   oQry.SQLConnection:= dmPrincipal.SConPrincipal;
   oQry.SQL.Add('SELECT '+sCampo);
   oQry.SQL.Add('FROM '+sTabela);
   oQry.SQL.Add('WHERE '+sCampo+' = :sTexto');
   oQry.ParamByName('sTexto').Value := sPesquisa;
   oQry.Open;
   Result := oQry.RecordCount;
   oQry.Free;
   Screen.Cursor:= crDefault;
End;

Function RetiraUnidGestSemPermissao(sMultiUnidGestora: WideString;
   sAnoMes: string): WideString;
Var
  sIdUGTemp: string;
  iConta: integer;
  sMultiUGRet: WideString;
  sTemp: string;
begin
  sMultiUGRet:= ';';
  sIdUGTemp  := '';
  for iConta := 1 to Length(sMultiUnidGestora) do
  begin
     sTemp := sMultiUnidGestora[iConta];
     if sTemp = ';' then
     begin
        if (iConta > 1) then
        begin
           if UnidGestoraPermiteUsuario(StrToInt(sIdUGTemp),0,0,'',sAnoMes) then
              sMultiUGRet:= sMultiUGRet + sIdUGTemp + ';';
           sIdUGTemp := '';
        end;
     end else
        sIdUGTemp := sIdUGTemp + sTemp;
  end;
  Result := sMultiUGRet;
end;

// ;1;

function ValidaPIS_PASEP_CPF(sId,sCPF,sPIS_PASEP,sOper: string): Boolean;
Var
  oQry1: TSQLQuery;
  iErro: integer;
begin
  Result := True;

  {
  oQry1 := TSQLQuery.Create(Nil);
  oQry1.SQLConnection := dmPrincipal.SConPrincipal;
  oQry1.SQL.Add('SELECT ID, NOME_SERVIDOR, PIS_PASEP_PF FROM SERVIDOR ');
  oQry1.SQL.Add('WHERE CPF_PF = :pCPF');
  oQry1.ParamByName('pCPF').Value := sCPF;
  iErro:= 0;

  try
     try
        oQry1.Open;
     except
        on E: Exception do
        begin
           Mensagem('Não foi possível executar essas instruções ...'+#13+
             '('+E.Message+')',
             'E R R O !!!',MB_OK+MB_ICONERROR);
           iErro := 1;
        end;
     end;
  finally
     if iErro = 0 then
     begin
        Result := True;
        if sOper = '1' then
        begin
           if sPIS_PASEP = oQry1.FieldByName('PIS_PASEP_PF').Value then
              if not Confirma('JÁ EXISTE UM SERVIDOR COM ESTE CPF E PIS_PASEP:'+#13+
                          'ID. :'+FormatString('99999-9',oQry1.FieldByName('ID').AsString)+
                          ' - NOME: '+oQry1.FieldByName('NOME_SERVIDOR').AsString+'.'+#13+
                          'DESEJA CONTINUAR ASSIM MESMO ?') then
                 Result := False;
        end else
        begin
           if sId <> oQry1.FieldByName('ID').AsString then
              if sPIS_PASEP = oQry1.FieldByName('PIS_PASEP_PF').Value then
                 if not Confirma('JÁ EXISTE UM SERVIDOR COM ESTE CPF E PIS_PASEP:'+#13+
                             'ID. :'+FormatString('99999-9',oQry1.FieldByName('ID').AsString)+
                             ' - NOME: '+oQry1.FieldByName('NOME_SERVIDOR').AsString+'.'+#13+
                             'DESEJA CONTINUAR ASSIM MESMO ?') then
                    Result := False;
        end;
     end;
     oQry1.Close;
     FreeAndNil(oQry1);
  end
  }
end;


function UsuarioPermissaoTabela(iUsuario: integer; sTab: string): string;
Var
   oQry1: TSQLQuery;
begin
   oQry1 := TSQLQuery.Create(Nil);
   oQry1.SQLConnection := dmPrincipal.SConPrincipal;
   oQry1.SQL.Add('select incluir, alterar, excluir');
   oQry1.SQL.Add('from usuario_permissao_tabela');
   oQry1.SQL.Add('where (id_usuario = :pUsuario) and');
   oQry1.SQL.Add('      (nome_tabela = :pTab)');
   oQry1.ParamByName('pUsuario').Value := iUsuario;
   oQry1.ParamByName('pTab').Value := sTab;

   try
      try
         oQry1.Open;
         try
            Result := iIf(oQry1.FieldByName('incluir').Value='S','S','N');
         except
            Result := 'N';
         end;
         try
            Result := Result + iIf(oQry1.FieldByName('alterar').Value='S','S','N');
         except
            Result := Result + 'N';
         end;
         try
            Result := Result + iIf(oQry1.FieldByName('excluir').Value='S','S','N');
         except
            Result := Result + 'N';
         end;
      except
         Result := 'NNN';
      end;
   finally
      oQry1.Close;
      FreeAndNil(oQry1);
   end;

end;

Function CriaCampoTab(sTab,sCampo,sTipo: string): Boolean;
begin
   Result := True;
   try
      dmPrincipal.SConPrincipal.ExecuteDirect('ALTER TABLE '+sTab+' ADD '+sCampo+' '+
         sTipo);
   except
      on E: Exception do
      begin
        Result := False;
        Mensagem('Não foi possível executar essas instruções ...'+#13+
          '('+E.Message+')',
          'E R R O !!!',MB_OK+MB_ICONERROR);
      end;
   end;
end;

function OcultaTriggers_e_procs: Boolean;
Var
  iErro: Integer;
begin
  iErro := 0;
  try
     dmPrincipal.SConPrincipal.ExecuteDirect(
        'update rdb$triggers set RDB$TRIGGER_SOURCE = null'+
        ' where RDB$SYSTEM_FLAG = 0');
  except
     on E: Exception do
     begin
       iErro := 1;
       Mensagem('Não foi possível ocultar as Triggers ...'+#13+
         '('+E.Message+')',
         'E R R O !!!',MB_OK+MB_ICONERROR);
     end;
  end;

  if iErro = 0 then
  begin
     try
        dmPrincipal.SConPrincipal.ExecuteDirect(
           'update rdb$procedures set RDB$PROCEDURE_SOURCE = null'+
           ' where RDB$SYSTEM_FLAG = 0');
     except
        on E: Exception do
        begin
          iErro := 1;
          Mensagem('Não foi possível ocultar as Procedures ...'+#13+
            '('+E.Message+')',
            'E R R O !!!',MB_OK+MB_ICONERROR);
        end;
     end;
  end;

  Result := (iErro=0);

end;

end.
