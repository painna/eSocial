unit ConfigurarCertificado;

interface

uses
  ACBrDFeConfiguracoes,
  ACBrBase,
  ACBrDFe,
  ACBrUtil,
  ACBreSocial,
  ACBrMail,
  ACBrDFeSSL,
  ACBrDFeOpenSSL,
  ACBreSocialWebServices,
  pcesConversaoeSocial,
  pcnConversao,

  TypInfo,
  synacode,
  blcksock,
  FileCtrl,
  StrUtils,
  Math,
  IniFiles,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Samples.Spin,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmConfigurarCertificado = class(TForm)
    pgcConfigurar: TPageControl;
    tbsGeral: TTabSheet;
    GroupBox1: TGroupBox;
    sbtnPathSalvar: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    spPathSchemas: TSpeedButton;
    Label1: TLabel;
    edtPathLogs: TEdit;
    ckSalvar: TCheckBox;
    cbxExibirErroSchema: TCheckBox;
    edtFormatoAlerta: TEdit;
    cbxRetirarAcentos: TCheckBox;
    cbVersaoDF: TComboBox;
    edtPathSchemas: TEdit;
    gbDadosEmpresa: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edtIdEmpregador: TEdit;
    edtIdTransmissor: TEdit;
    cbTEmpregador: TComboBox;
    tbsCertificado: TTabSheet;
    Label6: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    GroupBox2: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    sbtnCaminhoCert: TSpeedButton;
    Label17: TLabel;
    sbtnGetCert1: TSpeedButton;
    edtCaminho: TEdit;
    edtSenha: TEdit;
    edtNumSerie: TEdit;
    btnValidadeData: TButton;
    btnNumSerie: TButton;
    btnSubjectName: TButton;
    btnCNPJ: TButton;
    btnIssuerName: TButton;
    GroupBox3: TGroupBox;
    edtCalcHash: TEdit;
    btnSHA_RSA: TButton;
    cbAssinar: TCheckBox;
    btnHTTPS: TButton;
    btnX509: TButton;
    cbSSLLib: TComboBox;
    cbCryptLib: TComboBox;
    cbHttpLib: TComboBox;
    cbXmlSignLib: TComboBox;
    tbsWebService: TTabSheet;
    GroupBox4: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    cbxVisualizar: TCheckBox;
    rgTipoAmb: TRadioGroup;
    cbxSalvarSOAP: TCheckBox;
    seTimeOut: TSpinEdit;
    cbSSLType: TComboBox;
    GroupBox8: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edtProxyHost: TEdit;
    edtProxyPorta: TEdit;
    edtProxyUser: TEdit;
    edtProxySenha: TEdit;
    GroupBox9: TGroupBox;
    Label24: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    cbxAjustarAut: TCheckBox;
    edtTentativas: TEdit;
    edtIntervalo: TEdit;
    edtAguardar: TEdit;
    tbsArquivos: TTabSheet;
    sbPatheSocial: TSpeedButton;
    Label28: TLabel;
    Label36: TLabel;
    sbPathEvento: TSpeedButton;
    cbxSalvarArqs: TCheckBox;
    cbxPastaMensal: TCheckBox;
    cbxAdicionaLiteral: TCheckBox;
    cbxEmissaoPatheSocial: TCheckBox;
    cbxSalvaPathEvento: TCheckBox;
    cbxSepararPorCNPJ: TCheckBox;
    edtPatheSocial: TEdit;
    edtPathEvento: TEdit;
    btnSalvarConfig: TBitBtn;
    opdAbrir: TOpenDialog;
    procedure PathClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure sbtnPathSalvarClick(Sender: TObject);
    procedure spPathSchemasClick(Sender: TObject);
    procedure sbtnCaminhoCertClick(Sender: TObject);
    procedure sbtnGetCert1Click(Sender: TObject);
    procedure btnValidadeDataClick(Sender: TObject);
    procedure btnNumSerieClick(Sender: TObject);
    procedure btnSubjectNameClick(Sender: TObject);
    procedure btnCNPJClick(Sender: TObject);
    procedure btnIssuerNameClick(Sender: TObject);
    procedure sbPatheSocialClick(Sender: TObject);
    procedure sbPathEventoClick(Sender: TObject);
  private
    { Private declarations }
    function GetESocial : TACBreSocial;
  public
    { Public declarations }
    property eSocial : TACBreSocial read GetESocial;
  end;

var
  frmConfigurarCertificado: TfrmConfigurarCertificado;

implementation

uses SelecionarCertificado, udmESocial;

const
  SELDIRHELP = 1000;

{$R *.dfm}

procedure TfrmConfigurarCertificado.btnCNPJClick(Sender: TObject);
begin
  ShowInforme('CNPJ', eSocial.SSL.CertCNPJ);
end;

procedure TfrmConfigurarCertificado.btnIssuerNameClick(Sender: TObject);
begin
  ShowInforme('Issuer Name',
    eSocial.SSL.CertIssuerName + sLineBreak + sLineBreak +
    'Certificadora: ' + eSocial.SSL.CertCertificadora);
end;

procedure TfrmConfigurarCertificado.btnNumSerieClick(Sender: TObject);
begin
  ShowInforme('Número de Série', eSocial.SSL.CertNumeroSerie);
end;

procedure TfrmConfigurarCertificado.btnSubjectNameClick(Sender: TObject);
begin
  ShowInforme('Subject Name',
    eSocial.SSL.CertSubjectName + sLineBreak + sLineBreak +
    'Razão Social: ' + eSocial.SSL.CertRazaoSocial);
end;

procedure TfrmConfigurarCertificado.btnValidadeDataClick(Sender: TObject);
begin
  ShowInforme('Data de Validade', FormatDateBr(eSocial.SSL.CertDataVenc));
end;

procedure TfrmConfigurarCertificado.FormCreate(Sender: TObject);
var
  T : TSSLLib;
  K : TVersaoeSocial;
  U : TSSLCryptLib;
  V : TSSLHttpLib;
  X : TSSLXmlSignLib;
  Y : TSSLType;
  L : TEmpregador;
begin
  pgcConfigurar.ActivePage := tbsGeral;

  cbSSLLib.Items.Clear;
  for T := Low(TSSLLib) to High(TSSLLib) do
    cbSSLLib.Items.Add(GetEnumName(TypeInfo(TSSLLib), Integer(T)));
  cbSSLLib.ItemIndex := Ord(libCustom);

  cbCryptLib.Items.Clear;
  for U := Low(TSSLCryptLib) to High(TSSLCryptLib) do
    cbCryptLib.Items.Add(GetEnumName(TypeInfo(TSSLCryptLib), Integer(U)));
  cbCryptLib.ItemIndex := Ord(cryWinCrypt);

  cbHttpLib.Items.Clear;
  for V := Low(TSSLHttpLib) to High(TSSLHttpLib) do
    cbHttpLib.Items.Add(GetEnumName(TypeInfo(TSSLHttpLib), Integer(V)));
  cbHttpLib.ItemIndex := Ord(httpWinHttp);

  cbXmlSignLib.Items.Clear;
  for X := Low(TSSLXmlSignLib) to High(TSSLXmlSignLib) do
    cbXmlSignLib.Items.Add(GetEnumName(TypeInfo(TSSLXmlSignLib), Integer(X)));
  cbXmlSignLib.ItemIndex := Ord(xsLibXml2);

  cbSSLType.Items.Clear;
  for Y := Low(TSSLType) to High(TSSLType) do
    cbSSLType.Items.Add(GetEnumName(TypeInfo(TSSLType), Integer(Y)));
  cbSSLType.ItemIndex := Ord(LT_all);

  cbVersaoDF.Items.Clear;
  for K := Low(TVersaoeSocial) to High(TVersaoeSocial) do
    cbVersaoDF.Items.Add(GetEnumName(TypeInfo(TVersaoeSocial), Integer(K)));
  cbVersaoDF.ItemIndex := Ord(ve240);

  cbTEmpregador.Items.Clear;
  for L := Low(TEmpregador) to High(TEmpregador) do
    cbTEmpregador.Items.Add(GetEnumName(TypeInfo(TEmpregador), Integer(L)));
  cbTEmpregador.ItemIndex := Ord(teOrgaoPublico);
end;

procedure TfrmConfigurarCertificado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    Self.Close;
end;

function TfrmConfigurarCertificado.GetESocial: TACBreSocial;
begin
  Result := dmESocial.ACBrESocial;
end;

procedure TfrmConfigurarCertificado.PathClick(Sender: TObject);
var
  Dir : string;
begin
  if (Length(TEdit(Sender).Text) <= 0) then
    Dir := ExtractFileDir(Application.ExeName)
  else
    Dir := TEdit(Sender).Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP)
  then
    TEdit(Sender).Text := Dir;
end;

procedure TfrmConfigurarCertificado.sbPatheSocialClick(Sender: TObject);
begin
  PathClick(edtPatheSocial);
end;

procedure TfrmConfigurarCertificado.sbPathEventoClick(Sender: TObject);
begin
  PathClick(edtPathEvento);
end;

procedure TfrmConfigurarCertificado.sbtnCaminhoCertClick(Sender: TObject);
begin
  opdAbrir.Title      := 'Selecione o Certificado';
  opdAbrir.DefaultExt := '*.pfx';
  opdAbrir.Filter     := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
  opdAbrir.InitialDir := ExtractFileDir(Application.ExeName);
  if opdAbrir.Execute then
    edtCaminho.Text := opdAbrir.FileName;
end;

procedure TfrmConfigurarCertificado.sbtnGetCert1Click(Sender: TObject);
var
  i      : Integer;
  ASerie : String;
  AddRow : Boolean;
  aSCert : TfrmSelecionarCertificado;
begin
//  edtNumSerie.Text := eSocial.SSL.SelecionarCertificado;
  aSCert := TfrmSelecionarCertificado.Create(Self);
  try
    eSocial.SSL.LerCertificadosStore;
    AddRow := False;

    with aSCert.stgCertificado do
    begin
      ColWidths[0] := 170;
      ColWidths[1] := 250;
      ColWidths[2] := 120;
      ColWidths[3] := 80;
      ColWidths[4] := 150;
      Cells[0, 0] := 'Num.Série';
      Cells[1, 0] := 'Razão Social';
      Cells[2, 0] := 'CNPJ';
      Cells[3, 0] := 'Validade';
      Cells[4, 0] := 'Certificadora';
    end;

    for i := 0 to eSocial.SSL.ListaCertificados.Count - 1 do
    begin
      with eSocial.SSL.ListaCertificados[i] do
      begin
        ASerie := NumeroSerie;
        if (CNPJ <> '') then
        begin
          with aSCert.stgCertificado do
          begin
            if AddRow then
              RowCount := RowCount + 1;

            Cells[0, RowCount - 1] := NumeroSerie;
            Cells[1, RowCount - 1] := RazaoSocial;
            Cells[2, RowCount - 1] := CNPJ;
            Cells[3, RowCount - 1] := FormatDateBr(DataVenc);
            Cells[4, RowCount - 1] := Certificadora;

            AddRow := True;
          end;
        end;
      end;
    end;

    if (aSCert.ShowModal = mrOK) then
    begin
      edtNumSerie.Text := aSCert.stgCertificado.Cells[0, aSCert.stgCertificado.Row];
      if (Trim(edtIdTransmissor.Text) = EmptyStr) then
        edtIdTransmissor.Text := aSCert.stgCertificado.Cells[2, aSCert.stgCertificado.Row];
    end;
  finally
    FreeAndNil(aSCert);
  end;
end;

procedure TfrmConfigurarCertificado.sbtnPathSalvarClick(Sender: TObject);
begin
  PathClick(edtPathLogs);
end;

procedure TfrmConfigurarCertificado.spPathSchemasClick(Sender: TObject);
begin
  PathClick(edtPathSchemas);
end;

end.
