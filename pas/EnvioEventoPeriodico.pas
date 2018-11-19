unit EnvioEventoPeriodico;

interface

uses
  udmESocial,
  ACBreSocial,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DialogoPadrao, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Samples.Gauges;

type
  TfrmEnvioEventoPeriodico = class(TfrmDialogoPadrao)
    gpbParametro: TGroupBox;
    lblAnoMes: TLabel;
    gpbOperacao: TRadioGroup;
    cmbAnoMes: TComboBox;
    gpbEvento: TGroupBox;
    Checb_ZeraBase: TCheckBox;
    pnlProcesso: TPanel;
    gagProcesso: TGauge;
    lblProcesso: TLabel;
    cbS1200: TCheckBox;
    cbS1202: TCheckBox;
    cbS1207: TCheckBox;
    cbS1210: TCheckBox;
    cbS1250: TCheckBox;
    cbS1260: TCheckBox;
    cbS1300: TCheckBox;
    cbS1299: TCheckBox;
    cbS1298: TCheckBox;
    cbS1295: TCheckBox;
    cbS1280: TCheckBox;
    cbS1270: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimparPainelProcesso(aVisualizar : Boolean);

    function GetESocial : TACBreSocial;
    function EventoSelecionado : Boolean;
    function GeradoEnviado : Boolean;
  public
    { Public declarations }
    property eSocial : TACBreSocial read GetESocial;
  end;

var
  frmEnvioEventoPeriodico: TfrmEnvioEventoPeriodico;

implementation

{$R *.dfm}

uses
  gsLib,
  UtilsDb,
  udmPrincipal,
  pcesConversaoeSocial;

{ TfrmEnvioEventoPeriodico }

procedure TfrmEnvioEventoPeriodico.btnOkClick(Sender: TObject);
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

function TfrmEnvioEventoPeriodico.EventoSelecionado: Boolean;
var
  I : Integer;
begin
  I := 0;

  if cbS1200.Checked then Inc(I);
  if cbS1202.Checked then Inc(I);
  if cbS1207.Checked then Inc(I);
  if cbS1210.Checked then Inc(I);
  if cbS1250.Checked then Inc(I);
  if cbS1260.Checked then Inc(I);
  if cbS1300.Checked then Inc(I);
  if cbS1299.Checked then Inc(I);
  if cbS1298.Checked then Inc(I);
  if cbS1295.Checked then Inc(I);
  if cbS1280.Checked then Inc(I);
  if cbS1270.Checked then Inc(I);

  Result := (I > 0);
end;

procedure TfrmEnvioEventoPeriodico.FormCreate(Sender: TObject);
begin
  inherited;
  dmESocial.ListarCompetenciasFolha(cmbAnoMes);
  LimparPainelProcesso(False);
  cbS1202.Enabled := (Pesquisa('CONFIG_ESOCIAL', 'ID_CONFIG_ORGAO', '1', 'POSSUI_RPPS', '') = FLAG_SIM);
end;

function TfrmEnvioEventoPeriodico.GeradoEnviado: Boolean;
var
  ok ,
  aRetorno : Boolean;
  aModoLancamento : TModoLancamento;
  aProtocolo : TProtocoloESocial;
begin
  aRetorno := True;
  dmESocial.LerConfiguracao;
  LimparPainelProcesso(True);

  Screen.Cursor   := crHourGlass;
  aModoLancamento := TModoLancamento(gpbOperacao.ItemIndex); //eSStrToModoLancamento(ok, IntToStr(gpbOperacao.ItemIndex));

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

        aProtocolo := TProtocoloESocial.Create(EmptyStr);

        if aRetorno and cbS1200.Checked then
          aRetorno := dmESocial.Gerar_eSocial1200(TCompetencia(cmbAnoMes.Items.Objects[cmbAnoMes.ItemIndex]), Checb_ZeraBase.Checked, mlInclusao, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS1202.Checked then
          aRetorno := dmESocial.Gerar_eSocial1202(TCompetencia(cmbAnoMes.Items.Objects[cmbAnoMes.ItemIndex]), Checb_ZeraBase.Checked, mlInclusao, lblProcesso, gagProcesso, aProtocolo);
//        if aRetorno and cbS1207.Checked then
//          aRetorno := dmESocial.Gerar_eSocial1207(TCompetencia(cmbAnoMes.Items.Objects[cmbAnoMes.ItemIndex]), Checb_ZeraBase.Checked, mlInclusao, lblProcesso, gagProcesso, aProtocolo);

        if aRetorno then
          aRetorno := dmESocial.EventoEnviado_eSocial(egIniciais, cmbAnoMes.Text, lblProcesso, gagProcesso, aProtocolo);

        if aRetorno then
        begin
          dmESocial.GravarProtocoloRetorno(aProtocolo);
          dmESocial.AtualizarOperacoes(aModoLancamento, aProtocolo);
          Mensagem('Protocolo : ' + aProtocolo.Numero + #13#13 + aProtocolo.Arquivos.Text, 'Informe', MB_ICONINFORMATION);
        end
        else
        if not aRetorno then
          if (dmESocial.MensagemRetorno.Count > 0) then
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
    aProtocolo.Free;
    LimparPainelProcesso(False);
    Screen.Cursor := crDefault;
    Result := aRetorno;
  end;
end;

function TfrmEnvioEventoPeriodico.GetESocial: TACBreSocial;
begin
  Result := dmESocial.ACBrESocial;
end;

procedure TfrmEnvioEventoPeriodico.LimparPainelProcesso(aVisualizar: Boolean);
begin
  pnlProcesso.Visible  := aVisualizar;
  lblProcesso.Caption  := EmptyStr;
  gagProcesso.Progress := 0;
end;

end.
