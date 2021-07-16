unit ConfigurarESocial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AddEditPadrao2, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Menus, Data.FMTBcd, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Vcl.StdCtrls, cxButtons, cxLabel, Vcl.ExtCtrls,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxDBEdit, cxCurrencyEdit, cxCheckBox, cxCalendar;

type
  TfrmConfigurarESocial = class(TfrmAddEditPadrao2)
    pgDados: TcxPageControl;
    tbsUNG: TcxTabSheet;
    tbsContador: TcxTabSheet;
    lblID_UNID_GESTORA: TcxLabel;
    dbeID_UNID_GESTORA: TcxDBLookupComboBox;
    lblNAT_JURIDICA: TcxLabel;
    dbeNAT_JURIDICA: TcxDBLookupComboBox;
    dbeNRO_SIAFI: TcxDBTextEdit;
    lblNRO_SIAFI: TcxLabel;
    lblSUBTETO_VENCTO_VALOR: TcxLabel;
    dbeSUBTETO_VENCTO_TIPO: TcxDBLookupComboBox;
    dbeSUBTETO_VENCTO_VALOR: TcxDBCurrencyEdit;
    lblSUBTETO_VENCTO_TIPO: TcxLabel;
    dbePOSSUI_RPPS: TcxDBCheckBox;
    lblCONTADOR_NOME: TcxLabel;
    dbeCONTADOR_NOME: TcxDBTextEdit;
    cds1ID_CONFIG_ORGAO: TIntegerField;
    cds1ID_UNID_GESTORA: TIntegerField;
    cds1CONTADOR_NOME: TStringField;
    cds1CONTADOR_CPF: TStringField;
    cds1CONTADOR_FONEFIXO: TStringField;
    cds1CONTADOR_FONECELULAR: TStringField;
    cds1CONTADOR_EMAIL: TStringField;
    cds1NAT_JURIDICA: TStringField;
    cds1NRO_SIAFI: TStringField;
    cds1SUBTETO_VENCTO_TIPO: TStringField;
    cds1SUBTETO_VENCTO_VALOR: TFMTBCDField;
    cds1POSSUI_RPPS: TStringField;
    sds1ID_CONFIG_ORGAO: TIntegerField;
    sds1ID_UNID_GESTORA: TIntegerField;
    sds1CONTADOR_NOME: TStringField;
    sds1CONTADOR_CPF: TStringField;
    sds1CONTADOR_FONEFIXO: TStringField;
    sds1CONTADOR_FONECELULAR: TStringField;
    sds1CONTADOR_EMAIL: TStringField;
    sds1NAT_JURIDICA: TStringField;
    sds1NRO_SIAFI: TStringField;
    sds1SUBTETO_VENCTO_TIPO: TStringField;
    sds1SUBTETO_VENCTO_VALOR: TFMTBCDField;
    sds1POSSUI_RPPS: TStringField;
    qryUNG: TSQLDataSet;
    dspUNG: TDataSetProvider;
    cdsUNG: TClientDataSet;
    dsUNG: TDataSource;
    qryNatureza: TSQLDataSet;
    dspNatureza: TDataSetProvider;
    cdsNatureza: TClientDataSet;
    dsNatureza: TDataSource;
    qryTipoTeto: TSQLDataSet;
    dspTipoTeto: TDataSetProvider;
    cdsTipoTeto: TClientDataSet;
    dsTipoTeto: TDataSource;
    lblCONTADOR_CPF: TcxLabel;
    dbeCONTADOR_CPF: TcxDBMaskEdit;
    dbeCONTADOR_FONEFIXO: TcxDBMaskEdit;
    lblCONTADOR_FONEFIXO: TcxLabel;
    lblCONTADOR_FONECELULAR: TcxLabel;
    dbeCONTADOR_FONECELULAR: TcxDBMaskEdit;
    dbeCONTADOR_EMAIL: TcxDBTextEdit;
    lblCONTADOR_EMAIL: TcxLabel;
    sds1TIPO_OPERACAO: TStringField;
    cds1TIPO_OPERACAO: TStringField;
    sds1DATA_IMPLANTACAO: TDateField;
    cds1DATA_IMPLANTACAO: TDateField;
    dbeDATA_IMPLANTACAO: TcxDBDateEdit;
    lblDATA_IMPLANTACAO: TcxLabel;
    dbePOSSUI_TABELA_CARREIRA: TcxDBCheckBox;
    sds1POSSUI_TABELA_CARREIRA: TStringField;
    cds1POSSUI_TABELA_CARREIRA: TStringField;
    tbsResponsavel: TcxTabSheet;
    cxLabel1: TcxLabel;
    dbeRESPONSAVEL_NOME: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    dbeRESPONSAVEL_CPF: TcxDBMaskEdit;
    cxLabel3: TcxLabel;
    dbeRESPONSAVEL_FONEFIXO: TcxDBMaskEdit;
    cxLabel4: TcxLabel;
    dbeRESPONSAVEL_FONECELULAR: TcxDBMaskEdit;
    cxLabel5: TcxLabel;
    dbeRESPONSAVEL_EMAIL: TcxDBTextEdit;
    sds1RESPONSAVEL_NOME: TStringField;
    sds1RESPONSAVEL_CPF: TStringField;
    sds1RESPONSAVEL_FONEFIXO: TStringField;
    sds1RESPONSAVEL_FONECELULAR: TStringField;
    sds1RESPONSAVEL_EMAIL: TStringField;
    cds1RESPONSAVEL_NOME: TStringField;
    cds1RESPONSAVEL_CPF: TStringField;
    cds1RESPONSAVEL_FONEFIXO: TStringField;
    cds1RESPONSAVEL_FONECELULAR: TStringField;
    cds1RESPONSAVEL_EMAIL: TStringField;
    qryServidor: TSQLDataSet;
    dspServidor: TDataSetProvider;
    cdsServidor: TClientDataSet;
    btnAbrirNavegador: TcxButton;
    cxLabel6: TcxLabel;
    procedure ValidarFone(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure ValidarNumeroCPF(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure cds1NewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure cds1BeforePost(DataSet: TDataSet);
    procedure btnGravarClick(Sender: TObject);
    procedure ds1DataChange(Sender: TObject; Field: TField);
    procedure btnAbrirNavegadorClick(Sender: TObject);
  private
    { Private declarations }
    procedure ServidorGestorUG(const aUG : Integer);
  public
    { Public declarations }
  end;

  // http://www.contaspublicas.gov.br/AtuLinks2.asp?cod=3207317 (Buscar Código SIAFI)

var
  frmConfigurarESocial: TfrmConfigurarESocial;

implementation

{$R *.dfm}

uses
  Winapi.ShellAPI,
  udmESocial,
  udmPrincipal,
  gsLib,
  UtilsDb;

procedure TfrmConfigurarESocial.btnAbrirNavegadorClick(Sender: TObject);
Var
  aLink : string;
begin
  aLink := 'http://www.contaspublicas.gov.br/atualizalinks.asp';
  ShellExecute(0, nil, PChar(aLink), nil, nil, 1);
end;

procedure TfrmConfigurarESocial.btnGravarClick(Sender: TObject);
begin
  if cds1.State = dsInsert then
    cds1TIPO_OPERACAO.AsString := FLAG_OPERACAO_INSERIR
  else
  begin
    if cds1TIPO_OPERACAO.AsString = FLAG_OPERACAO_ENVIADO then
      cds1TIPO_OPERACAO.AsString := FLAG_OPERACAO_ALTERAR;
  end;

  inherited;
end;

procedure TfrmConfigurarESocial.cds1BeforePost(DataSet: TDataSet);
begin
  inherited;
  if not ValidarCPF(dbeRESPONSAVEL_CPF.Text) then
  begin
    Mensagem('CPF do Responsável é Inválido!', 'Alerta', MB_ICONWARNING);
    Abort;
  end
  else
  if not ValidarCPF(dbeCONTADOR_CPF.Text) then
  begin
    Mensagem('CPF do Contador é Inválido!', 'Alerta', MB_ICONWARNING);
    Abort;
  end;

  if cds1DATA_IMPLANTACAO.IsNull then
    cds1DATA_IMPLANTACAO.AsDateTime := StrToDate('01/' + FormatDateTime('mm/yyyy', Date));

  if cds1.State = dsInsert then
    cds1TIPO_OPERACAO.AsString := FLAG_OPERACAO_INSERIR
  else
  if (cds1TIPO_OPERACAO.AsString = FLAG_OPERACAO_ENVIADO) then
    cds1TIPO_OPERACAO.AsString := FLAG_OPERACAO_ALTERAR;
end;

procedure TfrmConfigurarESocial.cds1NewRecord(DataSet: TDataSet);
begin
  inherited;
  cds1ID_CONFIG_ORGAO.AsInteger       := 1;
  cds1POSSUI_RPPS.AsString            := FLAG_NAO;
  cds1POSSUI_TABELA_CARREIRA.AsString := FLAG_SIM;
  cds1DATA_IMPLANTACAO.AsDateTime     := StrToDate('01/' + FormatDateTime('mm/yyyy', Date));
end;

procedure TfrmConfigurarESocial.ds1DataChange(Sender: TObject; Field: TField);
begin
  if Field = cds1ID_UNID_GESTORA then
  begin
    ServidorGestorUG(cds1ID_UNID_GESTORA.AsInteger);
    if (not cdsServidor.IsEmpty) and (cds1.State in [dsInsert, dsEdit]) then
    begin
      cds1RESPONSAVEL_NOME.AsString := Trim(Copy(cdsServidor.FieldByName('nome').AsString, 1, cds1RESPONSAVEL_NOME.Size));
      cds1RESPONSAVEL_CPF.AsString  := Trim(Copy(cdsServidor.FieldByName('cpf').AsString, 1, cds1RESPONSAVEL_CPF.Size));
      cds1RESPONSAVEL_FONEFIXO.AsString    := Trim(Copy(cdsServidor.FieldByName('telefone').AsString, 1, cds1RESPONSAVEL_FONEFIXO.Size));
      cds1RESPONSAVEL_FONECELULAR.AsString := Trim(Copy(cdsServidor.FieldByName('celular').AsString, 1, cds1RESPONSAVEL_FONECELULAR.Size));
      cds1RESPONSAVEL_EMAIL.AsString       := Trim(Copy(cdsServidor.FieldByName('e_mail').AsString, 1, cds1RESPONSAVEL_EMAIL.Size));
    end;
  end;
end;

procedure TfrmConfigurarESocial.FormCreate(Sender: TObject);
begin
  inherited;
  pb_sNomeTab     := 'CONFIG_ESOCIAL';
  pb_sNomeCampoPK := 'ID_CONFIG_ORGAO';
  pb_sFormCall    := 'frmConfigurarESocial';
  pb_sTitJanela   := 'Configurar eSocial';

  pgDados.ActivePage := tbsUNG;

  cdsUNG.Open;
  cdsNatureza.Open;
  cdsTipoTeto.Open;
end;

procedure TfrmConfigurarESocial.FormShow(Sender: TObject);
begin
  inherited;
  cds1.ParamByName('ID').AsInteger := 1;
  cds1.Open;

  ServidorGestorUG(cds1ID_UNID_GESTORA.AsInteger);
end;

procedure TfrmConfigurarESocial.ServidorGestorUG(const aUG: Integer);
begin
  cdsServidor.Close;
  cdsServidor.ParamByName('ug').AsInteger := aUG;
  cdsServidor.Open;
end;

procedure TfrmConfigurarESocial.ValidarNumeroCPF(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  aValue : String;
begin
  aValue := VarToStr(DisplayValue)
    .Replace('.', '', [rfReplaceAll])
    .Replace('-', '', [rfReplaceAll])
    .Trim;
  ErrorText := 'O número de CPF está incompleto!';
  Error  := (aValue <> EmptyStr) and (aValue.Length < 11);
end;

procedure TfrmConfigurarESocial.ValidarFone(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  aValue : String;
begin
  aValue := VarToStr(DisplayValue)
    .Replace('(', '', [rfReplaceAll])
    .Replace('-', '', [rfReplaceAll])
    .Replace(')', '', [rfReplaceAll])
    .Trim;
  ErrorText := 'O número de informado está incompleto!';
  Error  := (aValue <> EmptyStr) and (aValue.Length < 10);
end;

end.
