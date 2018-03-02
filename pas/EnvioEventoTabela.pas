unit EnvioEventoTabela;

interface

uses
  ACBreSocial,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DialogoPadrao, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Samples.Gauges;

type
  TfrmEnvioEventoTabela = class(TfrmDialogoPadrao)
    gpbParametro: TGroupBox;
    gpbEvento: TGroupBox;
    cbS1000: TCheckBox;
    cbS1005: TCheckBox;
    cbS1010: TCheckBox;
    cbS1020: TCheckBox;
    cbS1030: TCheckBox;
    cbS1035: TCheckBox;
    cbS1040: TCheckBox;
    cbS1050: TCheckBox;
    cbS1060: TCheckBox;
    cbS1070: TCheckBox;
    cbS1080: TCheckBox;
    gpbOperacao: TRadioGroup;
    lblAnoMes: TLabel;
    cmbAnoMes: TComboBox;
    Checb_ZeraBase: TCheckBox;
    pnlProcesso: TPanel;
    gagProcesso: TGauge;
    lblProcesso: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);

    function GetESocial : TACBreSocial;
  private
    { Private declarations }
    property eSocial : TACBreSocial read GetESocial;

    procedure LimparPainelProcesso(aVisualizar : Boolean);

    function EventoSelecionado : Boolean;
    function GeradoEnviado : Boolean;
  public
    { Public declarations }
  end;

var
  frmEnvioEventoTabela: TfrmEnvioEventoTabela;

implementation

{$R *.dfm}

uses
  gsLib,
  udmPrincipal,
  udmESocial,
  pcesConversaoeSocial;

procedure TfrmEnvioEventoTabela.btnOkClick(Sender: TObject);
begin
  if (gpbOperacao.ItemIndex = -1) then
    Mensagem('Favor selecionar o tipo de operação', 'Alerta!', MB_ICONWARNING)
  else
  if not EventoSelecionado then
    Mensagem('Favor selecionar o(s) evento(s) para geração/envio do(s) aquivos XML', 'Alerta!', MB_ICONWARNING)
  else
  if GeradoEnviado then
    ModalResult := mrOk;
end;

function TfrmEnvioEventoTabela.EventoSelecionado: Boolean;
var
  I : Integer;
begin
  I := 0;

  if cbS1000.Checked then Inc(I);
  if cbS1005.Checked then Inc(I);
  if cbS1010.Checked then Inc(I);
  if cbS1020.Checked then Inc(I);
  if cbS1030.Checked then Inc(I);
  if cbS1035.Checked then Inc(I);
  if cbS1040.Checked then Inc(I);
  if cbS1050.Checked then Inc(I);
  if cbS1060.Checked then Inc(I);
  if cbS1070.Checked then Inc(I);
  if cbS1080.Checked then Inc(I);

  Result := (I > 0);
end;

procedure TfrmEnvioEventoTabela.FormCreate(Sender: TObject);
begin
  inherited;
  dmESocial.ListarCompetencias(cmbAnoMes);
  LimparPainelProcesso(False);
end;

function TfrmEnvioEventoTabela.GeradoEnviado: Boolean;
var
  ok ,
  aRetorno : Boolean;
  aModoLancamento : TModoLancamento;
begin
  aRetorno := True;
  dmESocial.LerConfiguracao;
  LimparPainelProcesso(True);

  Screen.Cursor   := crHourGlass;
  aModoLancamento := eSStrToModoLancamento(ok, IntToStr(gpbOperacao.ItemIndex));

  try
    if not dmESocial.CertificadoInstalado then
      Mensagem('Certificado não instalado/configurado', 'Alerta!', MB_ICONEXCLAMATION)
    else
    if not dmESocial.CertificadoValido then
      Mensagem('Certificado inválido', 'Alerta!', MB_ICONEXCLAMATION)
    else
    begin
      try
        eSocial.Eventos.Clear;
        dmESocial.LerConfiguracao;

        aRetorno := dmESocial.CertificadoInstalado;
        if not aRetorno then
          Mensagem('Certificado não instalado!', 'Aviso', MB_ICONINFORMATION);

        aRetorno := dmESocial.CertificadoValido;
        if not aRetorno then
          Mensagem('Certificado não válido!', 'Aviso', MB_ICONINFORMATION);

        if aRetorno and cbS1000.Checked then
          aRetorno := dmESocial.Gerar_eSocial1000(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso);
        if aRetorno and cbS1005.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1005(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso);
        if aRetorno and cbS1010.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1010(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso);
        if aRetorno and cbS1020.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1020(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso);
        if aRetorno and cbS1030.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1030(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso);
        if aRetorno and cbS1035.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1035(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso);
        if aRetorno and cbS1040.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1040(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso);
        if aRetorno and cbS1050.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1050(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso);
        if aRetorno and cbS1060.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1060(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso);
        if aRetorno and cbS1070.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1070(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso);
        if aRetorno and cbS1080.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1080(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso);

        if aRetorno then
          aRetorno := dmESocial.EventoEnviado_eSocial(egIniciais, cmbAnoMes.Text, lblProcesso, gagProcesso);

        if not aRetorno then
          Mensagem(dmESocial.MensagemRetorno.Text, 'Alerta Retorno', MB_ICONWARNING);
      except
        On E : Exception do
        begin
          aRetorno := False;
          Mensagem('Erro ao tentar gerar/enviar arquivo(s).' + #13#13 + E.Message, 'Erro', MB_ICONERROR);
        end;
      end;
    end;
  finally
    LimparPainelProcesso(False);
    Screen.Cursor := crDefault;
    Result := aRetorno;
  end;
end;

function TfrmEnvioEventoTabela.GetESocial: TACBreSocial;
begin
  Result := dmESocial.ACBrESocial;
end;

procedure TfrmEnvioEventoTabela.LimparPainelProcesso(aVisualizar: Boolean);
begin
  pnlProcesso.Visible  := aVisualizar;
  lblProcesso.Caption  := EmptyStr;
  gagProcesso.Progress := 0;
end;

end.
