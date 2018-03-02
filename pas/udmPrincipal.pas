unit udmPrincipal;

interface

uses
  SysUtils, Classes, WideStrings, DBXFirebird, DB, SqlExpr, cxClasses, cxStyles,
  cxGridTableView, cxContainer, cxEdit, cxHint, FMTBcd, DBClient, Provider,
  Windows, Messages, Variants, Graphics, Controls, Forms, Dialogs, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, StdCtrls, dxScreenTip, dxCustomHint, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinsForm;

type
  TdmPrincipal = class(TDataModule)
    SConPrincipal: TSQLConnection;
    cxEditStyleReadyOnly: TcxEditStyleController;
    cxEditStyleNormal: TcxEditStyleController;
    cxEditStyleCheckBox: TcxEditStyleController;
    cxStyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    GridTableViewStyleSheetPadrao: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetPadrao2: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetPadrao3: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetPadrao4: TcxGridTableViewStyleSheet;
    cxStyle52: TcxStyle;
    GridTableViewStyleSheetPadrao5: TcxGridTableViewStyleSheet;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxLabelStyleNormal: TcxEditStyleController;
    cxLabelStyleNormal2: TcxEditStyleController;
    cxHintStyleController: TcxHintStyleController;
    cxLabelStyleNormal3: TcxEditStyleController;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    cxStyle69: TcxStyle;
    cxStyle70: TcxStyle;
    cxStyle71: TcxStyle;
    cxStyle72: TcxStyle;
    cxStyle73: TcxStyle;
    cxStyle74: TcxStyle;
    cxStyle75: TcxStyle;
    cxStyle76: TcxStyle;
    cxStyle77: TcxStyle;
    GridTableViewStyleSheetPadrao6: TcxGridTableViewStyleSheet;
    cxStyle78: TcxStyle;
    cxStyle79: TcxStyle;
    cxStyle80: TcxStyle;
    cxStyle81: TcxStyle;
    cxStyle82: TcxStyle;
    cxStyle83: TcxStyle;
    cxStyle84: TcxStyle;
    cxStyle85: TcxStyle;
    cxStyle86: TcxStyle;
    cxStyle87: TcxStyle;
    cxStyle88: TcxStyle;
    cxStyle89: TcxStyle;
    cxStyle90: TcxStyle;
    cxStyle91: TcxStyle;
    qryLogUsuario: TSQLDataSet;
    dspLogUsuario: TDataSetProvider;
    cdsLogUsuario: TClientDataSet;
    cxStyle92: TcxStyle;
    qryLogUsuarioID: TIntegerField;
    qryLogUsuarioDATA_MOVIM: TDateField;
    qryLogUsuarioHORA_MOVIM: TTimeField;
    qryLogUsuarioID_USUARIO_LOGADO: TIntegerField;
    qryLogUsuarioID_USUARIO_EXECUT: TIntegerField;
    qryLogUsuarioNOME_FORM1: TStringField;
    qryLogUsuarioNOME_FORM2: TStringField;
    qryLogUsuarioNOME_TABELA: TStringField;
    qryLogUsuarioOPERACAO: TStringField;
    qryLogUsuarioCAMPO_PK1: TStringField;
    qryLogUsuarioCAMPO_PK2: TStringField;
    qryLogUsuarioCAMPO_PK3: TStringField;
    qryLogUsuarioCAMPO_PK4: TStringField;
    qryLogUsuarioCAMPO_PK5: TStringField;
    qryLogUsuarioCAMPO_PK6: TStringField;
    qryLogUsuarioNOME_CAMPO: TMemoField;
    qryLogUsuarioVAL_CAMPO_ANTER: TMemoField;
    qryLogUsuarioVAL_CAMPO_NOVO: TMemoField;
    cdsLogUsuarioID: TIntegerField;
    cdsLogUsuarioDATA_MOVIM: TDateField;
    cdsLogUsuarioHORA_MOVIM: TTimeField;
    cdsLogUsuarioID_USUARIO_LOGADO: TIntegerField;
    cdsLogUsuarioID_USUARIO_EXECUT: TIntegerField;
    cdsLogUsuarioNOME_FORM1: TStringField;
    cdsLogUsuarioNOME_FORM2: TStringField;
    cdsLogUsuarioNOME_TABELA: TStringField;
    cdsLogUsuarioOPERACAO: TStringField;
    cdsLogUsuarioCAMPO_PK1: TStringField;
    cdsLogUsuarioCAMPO_PK2: TStringField;
    cdsLogUsuarioCAMPO_PK3: TStringField;
    cdsLogUsuarioCAMPO_PK4: TStringField;
    cdsLogUsuarioCAMPO_PK5: TStringField;
    cdsLogUsuarioCAMPO_PK6: TStringField;
    cdsLogUsuarioNOME_CAMPO: TMemoField;
    cdsLogUsuarioVAL_CAMPO_ANTER: TMemoField;
    cdsLogUsuarioVAL_CAMPO_NOVO: TMemoField;
    qryLogUsuarioNOME_USUARIO: TStringField;
    qryLogUsuarioCARGO_USUARIO: TStringField;
    cdsLogUsuarioNOME_USUARIO: TStringField;
    cdsLogUsuarioCARGO_USUARIO: TStringField;
    GridTableViewStyleSheetPadrao7: TcxGridTableViewStyleSheet;
    cxStyle93: TcxStyle;
    cxStyle94: TcxStyle;
    cxStyle95: TcxStyle;
    cxStyle96: TcxStyle;
    cxStyle97: TcxStyle;
    cxStyle98: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    cxStyle99: TcxStyle;
    cxStyle100: TcxStyle;
    cxStyle101: TcxStyle;
    cxStyle102: TcxStyle;
    cxStyle103: TcxStyle;
    cxStyle104: TcxStyle;
    cxStyle105: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle106: TcxStyle;
    cxStyle107: TcxStyle;
    cxStyle108: TcxStyle;
    cxStyle109: TcxStyle;
    cxStyle110: TcxStyle;
    cxStyle111: TcxStyle;
    cxStyle112: TcxStyle;
    cxStyle113: TcxStyle;
    cxStyle114: TcxStyle;
    cxStyle115: TcxStyle;
    cxStyle116: TcxStyle;
    cxStyle117: TcxStyle;
    cxStyle118: TcxStyle;
    cxStyle119: TcxStyle;
    dxSkinController: TdxSkinController;
    procedure cdsLogUsuarioAfterInsert(DataSet: TDataSet);
    procedure SConPrincipalAfterDisconnect(Sender: TObject);
    procedure SConPrincipalAfterConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure SConPrincipalBeforeConnect(Sender: TObject);
  private
    { Private declarations }
    pv_sMsgErro: WideString;
    pv_lSemUsuario: String[1];
    pv_sNomeCampoPK1,
    pv_sNomeCampoPK2,
    pv_sNomeCampoPK3,
    pv_sNomeCampoPK4,
    pv_sNomeCampoPK5,
    pv_sNomeCampoPK6: string[40];
    procedure IdentificaCampoPK(sNomeTab: string);
  public
    { Public declarations }
    pb_lBancoOk: Boolean;
    Procedure GeraLog(oCds1: TClientDataSet; sOperacao,sNomeTab,sNomeForm1,sNomeForm2: String);
    Function ConectaBanco(sBanco: string): Boolean;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

uses gsLib, UtilsDb, VarGlobais;

{$R *.dfm}

procedure TdmPrincipal.cdsLogUsuarioAfterInsert(DataSet: TDataSet);
Var
  i: Integer;
begin
  i := StrToInt(IncrementGenerator('GEN_ID_LOG_USUARIO',1));
  cdsLogUsuarioID.Value := i;
end;

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin

  Screen.Cursor := crHourGlass;

  glb_sMultiOrgao := ini_le_secao('Multi_Orgao');
  if Trim(glb_sMultiOrgao) = '' then
     glb_sMultiOrgao := 'N';

  ConectaBanco('');

  Screen.Cursor := crDefault;
  glb_sVersao   := Versao_Executavel(Application.ExeName);
end;

Function TdmPrincipal.ConectaBanco(sBanco: string): Boolean;
Var
  lCriouUsuario: Boolean;
  sDataBase: String;
begin

  SConPrincipal.Connected := False;
  pb_lBancoOk := True;

  if sBanco = '' then
     sDataBase := GetPathDataBase()
  else
     sDataBase := sBanco;

  if sDataBase = '' then
  begin
    Result := False;
    exit;
  end;

  SConPrincipal.Params.Clear;
  SConPrincipal.Params.Values['DriverName']       := 'Firebird';
  SConPrincipal.Params.Values['RoleName']         := 'RoleName';
  SConPrincipal.Params.Values['User_Name']        := 'GERASYS.TI';
  SConPrincipal.Params.Values['Password']         := 'gsti2010';
  SConPrincipal.Params.Values['ServerCharSet']    := 'WIN1252';
  SConPrincipal.Params.Values['SQLDialect']       := '3';
  SConPrincipal.Params.Values['ErrorResourceFile']:= '';
  SConPrincipal.Params.Values['LocaleCode']       := '0000';
  SConPrincipal.Params.Values['BlobSize']         := '-1';
  SConPrincipal.Params.Values['CommitRetain']     := 'False';
  SConPrincipal.Params.Values['WaitOnLocks']      := 'True';
  SConPrincipal.Params.Values['IsolationLevel']   := 'ReadCommitted';
  SConPrincipal.Params.Values['Trim Char']        := 'False';
  SConPrincipal.Params.Values['DataBase']         := sDataBase;

  Try
     SConPrincipal.Connected := True;
  except
     on E: Exception do
     begin
        if Pos('I/O error during',e.Message) > 0 then
        begin
           Mensagem('Não foi Possível Conectar c/ o Banco de Dados ...'+#13+
              'Contate o Suporte do Sistema ...'+#13+
              '('+E.Message+')',
              'Erro', MB_ICONERROR+MB_OK);
           pb_lBancoOk := False;
        end else
        if Pos('Your user name and password are not defined',e.Message) > 0 then
        begin
           Mensagem('Ainda Não foi criado o Usuário e Senha do Banco de Dados.'+#13+
                    'Informe o Caminho do aplicativo GSEC.EXE, que o Remuneratu$'+#13+
                    'fará isso pra você.'+#13+
                    '('+E.Message+')',
              'Erro', MB_ICONERROR+MB_OK);
        end;
     end;
  End;

  Result := SConPrincipal.Connected;

end;

Procedure TdmPrincipal.GeraLog(oCds1: TClientDataSet; sOperacao,sNomeTab,
  sNomeForm1,sNomeForm2: String);
Var
  iConta: Integer;
  sValTemp,
  sValTemp2: WideString;
  sValCampoTemp: string;
  sNomeCampo: Widestring;
  sAlterou,
  sAlterou2: string[1];
begin

{
  IdentificaCampoPK(sNomeTab);

  cdsLogUsuario.Close;
  qryLogUsuario.ParamByName('pNewId').Value := 0;
  cdsLogUsuario.Open;
  cdsLogUsuario.Insert;
  cdsLogUsuarioDATA_MOVIM.Value       := Date;
  cdsLogUsuarioHORA_MOVIM.Value       := Time;
  cdsLogUsuarioID_USUARIO_LOGADO.Value:= glb_iIdOperLogado;
  cdsLogUsuarioID_USUARIO_EXECUT.Value:= glb_iIdOperExecut;
  cdsLogUsuarioNOME_USUARIO.Value      := Criptografa(Pesquisa('USUARIO','ID',
     IntToStr(glb_iIdOperExecut),'NOME_COMPLETO',''),'2',40);
  cdsLogUsuarioCARGO_USUARIO.Value      := Criptografa(Pesquisa('USUARIO','ID',
     IntToStr(glb_iIdOperExecut),'CARGO_FUNCAO',''),'2',40);
  cdsLogUsuarioNOME_FORM1.Value       := sNomeForm1;
  cdsLogUsuarioNOME_FORM2.Value       := sNomeForm2;
  cdsLogUsuarioNOME_TABELA.Value      := sNomeTab;
  if pv_sNomeCampoPK1 <> '' then
     cdsLogUsuarioCAMPO_PK1.Value     := UpperCase(pv_sNomeCampoPK1);
  if pv_sNomeCampoPK2 <> '' then
     cdsLogUsuarioCAMPO_PK2.Value     := UpperCase(pv_sNomeCampoPK2);
  if pv_sNomeCampoPK3 <> '' then
     cdsLogUsuarioCAMPO_PK3.Value     := UpperCase(pv_sNomeCampoPK3);
  if pv_sNomeCampoPK4 <> '' then
     cdsLogUsuarioCAMPO_PK4.Value     := UpperCase(pv_sNomeCampoPK4);
  if pv_sNomeCampoPK5 <> '' then
     cdsLogUsuarioCAMPO_PK5.Value     := UpperCase(pv_sNomeCampoPK5);
  if pv_sNomeCampoPK6 <> '' then
     cdsLogUsuarioCAMPO_PK6.Value     := UpperCase(pv_sNomeCampoPK6);
  cdsLogUsuarioOPERACAO.Value         := sOperacao;

  sNomeCampo := '';

  for iConta := 0 to oCds1.FieldCount - 1 do
  begin

     sAlterou  := 'N';
     sAlterou2 := 'N';

     if (ocds1.Fields[iConta].IsBlob) then Continue;

     if (cdsLogUsuarioOPERACAO.Value = '1') then
     begin

        if (Empty(VarToWideStr(ocds1.Fields[iConta].NewValue)) or
           (ocds1.Fields[iConta].IsNull)) then continue;

        cdsLogUsuarioNOME_CAMPO.AsVariant := cdsLogUsuarioNOME_CAMPO.AsVariant +
           '['+Trim(ocds1.Fields[iConta].FieldName)+'];';

        if ocds1.Fields[iConta].DataType = ftInteger then
        begin
           cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant :=
              cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant +
              '['+Trim(IntToStr(ocds1.Fields[iConta].NewValue))+'];';
        end else
        if (ocds1.Fields[iConta].DataType = ftBCD) or
                (ocds1.Fields[iConta].DataType = ftFMTBcd) or
                (ocds1.Fields[iConta].DataType = ftCurrency) then
        begin
           cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant :=
              cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant +
              '['+Trim(CurrToStr(ocds1.Fields[iConta].NewValue))+'];';
        end else
        if ocds1.Fields[iConta].DataType = ftDate then
        begin
           cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant :=
              cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant +
              '['+Trim(DateToStr(ocds1.Fields[iConta].NewValue))+'];';
        end else
        if ocds1.Fields[iConta].DataType = ftTime then
        begin
           cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant :=
              cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant +
              '['+Trim(TimeToStr(ocds1.Fields[iConta].NewValue))+'];';
        end else
        begin
           cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant :=
              cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant +
              '['+Trim(VarToStr(ocds1.Fields[iConta].NewValue))+'];';
        end;
     end else
     if cdsLogUsuarioOPERACAO.Value = '2' then
     begin

        if (ocds1.Fields[iConta].OldValue <> ocds1.Fields[iConta].NewValue) then
        begin

           sNomeCampo := Trim(ocds1.Fields[iConta].FieldName);

           if ocds1.Fields[iConta].IsNull then
           begin
              cdsLogUsuarioVAL_CAMPO_ANTER.Value := ' ';
              sAlterou := 'S';
           end else
           begin
              if ocds1.Fields[iConta].DataType = ftInteger then
              begin
                 cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant :=
                    cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant +
                    '['+Trim(IntToStr(ocds1.Fields[iConta].OldValue))+'];';
                 sAlterou := 'S';
              end else
              if (ocds1.Fields[iConta].DataType = ftBCD) or
                      (ocds1.Fields[iConta].DataType = ftFMTBcd) or
                      (ocds1.Fields[iConta].DataType = ftCurrency) then
              begin
                 try
                    sValTemp := CurrToStr(ocds1.Fields[iConta].OldValue);
                 except
                    sValTemp := '0';
                 end;
                 cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant :=
                       cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant +
                       '['+Trim(sValTemp)+'];';
                 sAlterou := 'S';
              end else
              if ocds1.Fields[iConta].DataType = ftDate then
              begin
                 cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant :=
                    cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant +
                    '['+Trim(DateToStr(ocds1.Fields[iConta].OldValue))+'];';
                 sAlterou := 'S';
              end else
              if ocds1.Fields[iConta].DataType = ftTime then
              begin
                 cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant :=
                    cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant +
                    '['+Trim(TimeToStr(ocds1.Fields[iConta].OldValue))+'];';
                 sAlterou := 'S';
              end else
              begin
                 cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant :=
                 cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant +
                    '['+VarToStr(ocds1.Fields[iConta].OldValue)+'];';
                 sAlterou := 'S';
              end;

           end;

           if ocds1.Fields[iConta].IsNull then
           begin
              cdsLogUsuarioVAL_CAMPO_NOVO.Value := ' ';
              sAlterou2 := 'S';
           end else
           begin
              if ocds1.Fields[iConta].DataType = ftInteger then
              begin
                 cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant :=
                    cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant +
                    '['+Trim(IntToStr(ocds1.Fields[iConta].NewValue))+'];';
                 sAlterou2 := 'S';
              end else
              if (ocds1.Fields[iConta].DataType = ftBCD) or
                      (ocds1.Fields[iConta].DataType = ftFMTBcd) or
                      (ocds1.Fields[iConta].DataType = ftCurrency) then
              begin
                 try
                    sValTemp := CurrToStr(ocds1.Fields[iConta].NewValue);
                 except
                    sValTemp := '0';
                 end;
                 cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant :=
                    cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant +
                    '['+Trim(sValTemp)+'];';
                 sAlterou2 := 'S';
              end else
              if ocds1.Fields[iConta].DataType = ftDate then
              begin
                 cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant :=
                    cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant +
                    '['+Trim(DateToStr(ocds1.Fields[iConta].NewValue))+'];';
                 sAlterou2 := 'S';
              end else
              if ocds1.Fields[iConta].DataType = ftTime then
              begin
                 cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant :=
                    cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant +
                    '['+Trim(TimeToStr(ocds1.Fields[iConta].NewValue))+'];';
                 sAlterou2 := 'S';
              end else
              begin
                 cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant :=
                 cdsLogUsuarioVAL_CAMPO_NOVO.AsVariant +
                    '['+VarToStr(ocds1.Fields[iConta].NewValue)+'];';
                 sAlterou2 := 'S';
              end;
           end;

           if (sAlterou = 'S') or (sAlterou2 = 'S') then
              cdsLogUsuarioNOME_CAMPO.AsVariant := cdsLogUsuarioNOME_CAMPO.AsVariant +
                 '['+sNomeCampo+'];';

        end;

     end else
     begin
        if Empty(VarToWideStr(ocds1.Fields[iConta].OldValue)) then continue;

        cdsLogUsuarioNOME_CAMPO.AsVariant := cdsLogUsuarioNOME_CAMPO.AsVariant +
           '['+Trim(ocds1.Fields[iConta].FieldName)+'];';
        if ocds1.Fields[iConta].DataType = ftInteger then
        begin
           cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant :=
              cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant +
              '['+Trim(IntToStr(ocds1.Fields[iConta].NewValue))+'];';
        end else
        if (ocds1.Fields[iConta].DataType = ftBCD) or
                (ocds1.Fields[iConta].DataType = ftFMTBcd) or
                (ocds1.Fields[iConta].DataType = ftCurrency) then
        begin
           try
              cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant :=
                 cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant +
                 '['+Trim(CurrToStr(ocds1.Fields[iConta].NewValue))+'];'
           except
              cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant :=
                 cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant +
                 '[0];'
           end;
        end else
        if ocds1.Fields[iConta].DataType = ftDate then
        begin
           cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant :=
              cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant +
              '['+Trim(DateToStr(ocds1.Fields[iConta].NewValue))+'];';
        end else
        if ocds1.Fields[iConta].DataType = ftTime then
        begin
           cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant :=
              cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant +
              '['+Trim(TimeToStr(ocds1.Fields[iConta].NewValue))+'];';
        end else
        begin
           cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant :=
              cdsLogUsuarioVAL_CAMPO_ANTER.AsVariant +
              '['+Trim(VarToStr(ocds1.Fields[iConta].NewValue))+'];';
        end;
     end;
  end;

  SalvaTransacao(cdsLogUsuario);
  cdsLogUsuario.Close;
}

end;

procedure TdmPrincipal.SConPrincipalAfterConnect(Sender: TObject);
begin
   {Mensagem('O Banco foi Conectado ...','Aviso !!!',
     MB_OK+MB_ICONEXCLAMATION);}
end;

procedure TdmPrincipal.SConPrincipalAfterDisconnect(Sender: TObject);
begin
   {
   if not SConPrincipal.Connected then
      Mensagem('*** O Banco Não está conectado ***','Aviso !!!',
         MB_OK+MB_ICONEXCLAMATION);}
end;

procedure TdmPrincipal.SConPrincipalBeforeConnect(Sender: TObject);
Var
  lCriouUsuario: Boolean;
begin

{
  pv_lSemUsuario := False;
  pv_sMsgErro := '';
  pb_lBancoOk := True;
  Screen.Cursor := crHourGlass;
  if SConPrincipal.Connected then
     SConPrincipal.Close;

  SConPrincipal.Params.Clear;
  SConPrincipal.Params.Values['DriverName']       := 'Firebird';
  SConPrincipal.Params.Values['RoleName']         := 'RoleName';
  SConPrincipal.Params.Values['User_Name']        := 'GERASYS.TI';
  SConPrincipal.Params.Values['Password']         := 'gsti2010';
  SConPrincipal.Params.Values['ServerCharSet']    := 'WIN1252';
  SConPrincipal.Params.Values['SQLDialect']       := '3';
  SConPrincipal.Params.Values['ErrorResourceFile']:= '';
  SConPrincipal.Params.Values['LocaleCode']       := '0000';
  SConPrincipal.Params.Values['BlobSize']         := '-1';
  SConPrincipal.Params.Values['CommitRetain']     := 'False';
  SConPrincipal.Params.Values['WaitOnLocks']      := 'True';
  SConPrincipal.Params.Values['IsolationLevel']   := 'ReadCommitted';
  SConPrincipal.Params.Values['Trim Char']        := 'False';
  SConPrincipal.Params.Values['DataBase']         := GetPathDataBase();

  Try
     SConPrincipal.Connected := True;
  except
     on E: Exception do
        pv_sMsgErro := e.Message;
  end;

  Screen.Cursor := crDefault;
  }

end;

Procedure TdmPrincipal.IdentificaCampoPK(sNomeTab: string);
Var
  sTabPK_Id1,
  sTabPK_Id2,
  sTabPK_Id3,
  sTabPK_Id4,
  sTabPK_Id_IdServid,
  sTabPK_AnoMes_Parc_IdServid_IdEvento: String;
begin

  sTabPK_Id1 := ';cargo_funcao;categ_funcional;config_ipm;config_orgao;'+
    'config_port_diaria;config_sistema;depto;entid_financ;entid_sindical;';
  sTabPK_Id2 := ';evento;estado_funcional;fator_prog_sal;mensagem_contra_cheque;'+
    'motivo_muda_cargo;orden_despesa;pagto_diaria;pagto_prest_servico;';
  sTabPK_Id3 := ';pasta_padrao;pessoa_fisica;pessoa_juridica;prestador_servico;'+
    'sal_minimo;servidor;setor;sub_unid_orcament;tab_aliq_fap;';
  sTabPK_Id4 := ';tab_aliq_previd;tab_aliq_previd_patronal;tab_deducao_irrf;'+
    'tab_irrf;tab_sal_familia;unid_gestora;unid_orcament;usuario';

  sTabPK_Id_IdServid := ';atestado_medico;hist_ferias;hist_movim_est_func;'+
    'hist_muda_cargo;hist_transf_sub_und_orcam;movim_est_func_retorno;'+
    'servidor_conta_banc;';

  sTabPK_AnoMes_Parc_IdServid_IdEvento := ';lancto_evento;lancto_evento_calc;';

  pv_sNomeCampoPK1 := '';
  pv_sNomeCampoPK2 := '';
  pv_sNomeCampoPK3 := '';
  pv_sNomeCampoPK4 := '';
  pv_sNomeCampoPK5 := '';
  pv_sNomeCampoPK6 := '';

  if (Pos(';'+Trim(LowerCase(sNomeTab))+';',sTabPK_Id1) > 0) or
     (Pos(';'+Trim(LowerCase(sNomeTab))+';',sTabPK_Id2) > 0) or
     (Pos(';'+Trim(LowerCase(sNomeTab))+';',sTabPK_Id3) > 0) or
     (Pos(';'+Trim(LowerCase(sNomeTab))+';',sTabPK_Id4) > 0) then
  begin
     pv_sNomeCampoPK1 := 'ID';
  end else
  if Pos(';'+Trim(LowerCase(sNomeTab))+';',sTabPK_Id_IdServid) > 0 then
  begin
     pv_sNomeCampoPK1 := 'ID';
     pv_sNomeCampoPK2 := 'ID_SERVIDOR';
  end else
  if Pos(';'+Trim(LowerCase(sNomeTab))+';',sTabPK_AnoMes_Parc_IdServid_IdEvento) > 0 then
  begin
     pv_sNomeCampoPK1 := 'ANO_MES';
     pv_sNomeCampoPK2 := 'PARCELA';
     pv_sNomeCampoPK3 := 'ID_SERVIDOR';
     pv_sNomeCampoPK4 := 'ID_EVENTO';
  end else
  if Trim(LowerCase(sNomeTab)) = 'base_calc_mes_servidor' then
  begin
     pv_sNomeCampoPK1 := 'ANO_MES';
     pv_sNomeCampoPK2 := 'PARCELA';
     pv_sNomeCampoPK3 := 'ID_SERVIDOR';
  end else
  if Trim(LowerCase(sNomeTab)) = 'carga_hor_prof_lancto' then
  begin
     pv_sNomeCampoPK1 := 'ANO_MES';
     pv_sNomeCampoPK2 := 'ID_SERVIDOR';
     pv_sNomeCampoPK3 := 'ID_UNID_LOTACAO';
  end else
  if Trim(LowerCase(sNomeTab)) = 'progress_sal' then
  begin
     pv_sNomeCampoPK1 := 'ID_CARGO';
     pv_sNomeCampoPK2 := 'ID';
  end else
  if Trim(LowerCase(sNomeTab)) = 'config_abono_fundeb' then
  begin
     pv_sNomeCampoPK1 := 'REF_ANO';
     pv_sNomeCampoPK2 := 'PARCELA';
  end else
  if Trim(LowerCase(sNomeTab)) = 'config_deposito_bancario' then
  begin
     pv_sNomeCampoPK1 := 'REF_ANO';
     pv_sNomeCampoPK2 := 'PARCELA';
     pv_sNomeCampoPK3 := 'ID_ENTID_FINANC';
     pv_sNomeCampoPK4 := 'ID_REMESSA';
     pv_sNomeCampoPK5 := 'ID_SUB_UNID_ORCAMENT';
  end else
  if Trim(LowerCase(sNomeTab)) = 'ctrl_process_geral' then
  begin
     pv_sNomeCampoPK1 := 'REF_ANO';
     pv_sNomeCampoPK2 := 'PARCELA';
  end else
  if Trim(LowerCase(sNomeTab)) = 'ctrl_process_geral' then
  begin
     pv_sNomeCampoPK1 := 'REF_ANO';
     pv_sNomeCampoPK2 := 'PARCELA';
     pv_sNomeCampoPK3 := 'ID_SUB_UNID_ORCAMENT';
  end else
  if Trim(LowerCase(sNomeTab)) = 'deducao_entid_previd' then
  begin
     pv_sNomeCampoPK1 := 'REF_ANO';
     pv_sNomeCampoPK2 := 'PARCELA';
     pv_sNomeCampoPK3 := 'id_est_funcional';
     pv_sNomeCampoPK4 := 'id_servidor';
  end else
  if Trim(LowerCase(sNomeTab)) = 'deposito_bancario' then
  begin
     pv_sNomeCampoPK1 := 'REF_ANO';
     pv_sNomeCampoPK2 := 'PARCELA';
     pv_sNomeCampoPK3 := 'id_servidor';
  end else
  if Trim(LowerCase(sNomeTab)) = 'desconto_consig' then
  begin
     pv_sNomeCampoPK1 := 'ID_SERVIDOR';
     pv_sNomeCampoPK2 := 'ID_ENTID_FINANC';
     pv_sNomeCampoPK3 := 'id_evento';
  end else
  if Trim(LowerCase(sNomeTab)) = 'escala_ferias' then
  begin
     pv_sNomeCampoPK1 := 'ano';
     pv_sNomeCampoPK2 := 'ID_SERVIDOR';
     pv_sNomeCampoPK3 := 'ID_sub_unid_orcament';
  end else
  if Trim(LowerCase(sNomeTab)) = 'evento_entid_financ' then
  begin
     pv_sNomeCampoPK1 := 'id_entid_financ';
     pv_sNomeCampoPK2 := 'id_evento';
     pv_sNomeCampoPK3 := 'ordem_evento';
  end else
  if Trim(LowerCase(sNomeTab)) = 'hist_reajuste_salario' then
  begin
     pv_sNomeCampoPK1 := 'ano_mes';
     pv_sNomeCampoPK2 := 'id_cargo';
  end else
  if Trim(LowerCase(sNomeTab)) = 'inicializa_mes_servidor' then
  begin
     pv_sNomeCampoPK1 := 'ano_mes';
     pv_sNomeCampoPK2 := 'id_servidor';
  end else
  if Trim(LowerCase(sNomeTab)) = 'pagto_quitacao' then
  begin
     pv_sNomeCampoPK1 := 'ano_mes';
     pv_sNomeCampoPK2 := 'parcela';
     pv_sNomeCampoPK3 := 'id_servidor';
     pv_sNomeCampoPK4 := 'id_quitacao';
  end else
  if Trim(LowerCase(sNomeTab)) = 'pensao_alimenticia' then
  begin
     pv_sNomeCampoPK1 := 'ano_mes';
     pv_sNomeCampoPK2 := 'parcela';
     pv_sNomeCampoPK3 := 'id_servidor';
     pv_sNomeCampoPK4 := 'id_dependente';
  end else
  if Trim(LowerCase(sNomeTab)) = 'servidor_dependente' then
  begin
     pv_sNomeCampoPK1 := 'id_servidor';
     pv_sNomeCampoPK2 := 'id_dependente';
  end else
  if Trim(LowerCase(sNomeTab)) = 'servidor_evento_fixo' then
  begin
     pv_sNomeCampoPK1 := 'id_servidor';
     pv_sNomeCampoPK2 := 'id_evento';
  end else
  if Trim(LowerCase(sNomeTab)) = 'usuario_permissao_tabela' then
  begin
     pv_sNomeCampoPK1 := 'id_usuario';
     pv_sNomeCampoPK2 := 'id_usuario_tabela';
  end else
  if Trim(LowerCase(sNomeTab)) = 'usuario_unid_gestora' then
  begin
     pv_sNomeCampoPK1 := 'id_usuario';
     pv_sNomeCampoPK2 := 'id_unid_gestora';
  end;

end;

{
     on E: Exception do
     begin
        if Pos('I/O error during',e.Message) > 0 then
        begin
           Mensagem('Não foi Possível Conectar c/ o Banco de Dados ...'+#13+
              'Contate o Suporte do Sistema ...'+#13+
              '('+E.Message+')',
              'Erro', MB_ICONERROR+MB_OK);
           pb_lBancoOk := False;
        end else
        if Pos('Your user name and password are not defined',e.Message) > 0 then
        begin
           Mensagem('Ainda Não foi criado o Usuário e Senha do Banco de Dados.'+#13+
                    'Informe o Caminho do aplicativo GSEC.EXE, que o Remuneratu$'+#13+
                    'fará isso pra você.'+#13+
                    '('+E.Message+')',
              'Erro', MB_ICONERROR+MB_OK);
           frmCriaUsuarioBanco := TfrmCriaUsuarioBanco.Create(Self);
           frmCriaUsuarioBanco.ShowModal;
           lCriouUsuario := frmCriaUsuarioBanco.pb_lCriouUsario;
           FreeAndNil(frmCriaUsuarioBanco);
           if not lCriouUsuario then
              pb_lBancoOk := False;
        end;
     end;
  End;
}

end.
