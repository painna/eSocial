unit EnvioEventoNaoPeriodico;

interface

uses
  udmESocial,
  ACBreSocial,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DialogoPadrao, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Samples.Gauges;

type
  TfrmEnvioEventoNaoPeriodico = class(TfrmDialogoPadrao)
    gpbParametro: TGroupBox;
    gpbEvento: TGroupBox;
    gpbOperacao: TRadioGroup;
    lblAnoMes: TLabel;
    cmbAnoMes: TComboBox;
    pnlProcesso: TPanel;
    gagProcesso: TGauge;
    lblProcesso: TLabel;
    Checb_ZeraBase: TCheckBox;
    cbS2190: TCheckBox;
    cbS2200: TCheckBox;
    cbS2205: TCheckBox;
    cbS2206: TCheckBox;
    cbS2210: TCheckBox;
    cbS2220: TCheckBox;
    cbS2240: TCheckBox;
    cbS2230: TCheckBox;
    cbS2241: TCheckBox;
    cbS2250: TCheckBox;
    cbAviso: TComboBox;
    cbs2260: TCheckBox;
    cbS2298: TCheckBox;
    cbS2299: TCheckBox;
    cbS2300: TCheckBox;
    cbS2306: TCheckBox;
    cbS2399: TCheckBox;
    cbS2400: TCheckBox;
    cbS3000: TCheckBox;
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
  frmEnvioEventoNaoPeriodico: TfrmEnvioEventoNaoPeriodico;

implementation

{$R *.dfm}

uses
  gsLib,
  UtilsDb,
  udmPrincipal,
  pcesConversaoeSocial;

procedure TfrmEnvioEventoNaoPeriodico.btnOkClick(Sender: TObject);
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

function TfrmEnvioEventoNaoPeriodico.EventoSelecionado: Boolean;
var
  I : Integer;
begin
  I := 0;

  if cbS2190.Checked then Inc(I);
  if cbS2200.Checked then Inc(I);
  if cbS2205.Checked then Inc(I);
  if cbS2206.Checked then Inc(I);
  if cbS2210.Checked then Inc(I);
  if cbS2220.Checked then Inc(I);
  if cbS2240.Checked then Inc(I);
  if cbS2230.Checked then Inc(I);
  if cbS2241.Checked then Inc(I);
  if cbS2250.Checked then Inc(I);
  if cbs2260.Checked then Inc(I);
  if cbS2298.Checked then Inc(I);
  if cbS2299.Checked then Inc(I);
  if cbS2300.Checked then Inc(I);
  if cbS2306.Checked then Inc(I);
  if cbS2399.Checked then Inc(I);
  if cbS2400.Checked then Inc(I);
  if cbS3000.Checked then Inc(I);

  Result := (I > 0);
end;

procedure TfrmEnvioEventoNaoPeriodico.FormCreate(Sender: TObject);
begin
  inherited;
  dmESocial.ListarCompetencias(cmbAnoMes);
  LimparPainelProcesso(False);
//  cbS1035.Enabled := (Pesquisa('CONFIG_ESOCIAL', 'ID_CONFIG_ORGAO', '1', 'POSSUI_TABELA_CARREIRA', '') = FLAG_SIM);
end;

function TfrmEnvioEventoNaoPeriodico.GeradoEnviado : Boolean;
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

        if aRetorno and cbS2190.Checked then
          aRetorno := dmESocial.Gerar_eSocial2190(cmbAnoMes.Text, Checb_ZeraBase.Checked, mlInclusao, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS2200.Checked  then
          aRetorno := dmESocial.Gerar_eSocial2200(cmbAnoMes.Text, Checb_ZeraBase.Checked, mlInclusao, lblProcesso, gagProcesso, aProtocolo);
//        if aRetorno and cbS1010.Checked  then
//          aRetorno := dmESocial.Gerar_eSocial1010(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
//        if aRetorno and cbS1020.Checked  then
//          aRetorno := dmESocial.Gerar_eSocial1020(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
//        if aRetorno and cbS1030.Checked  then
//          aRetorno := dmESocial.Gerar_eSocial1030(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
//        if aRetorno and cbS1035.Checked  then
//          aRetorno := dmESocial.Gerar_eSocial1035(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
//        if aRetorno and cbS1040.Checked  then
//          aRetorno := dmESocial.Gerar_eSocial1040(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
//        if aRetorno and cbS1050.Checked  then
//          aRetorno := dmESocial.Gerar_eSocial1050(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
//        if aRetorno and cbS1060.Checked  then
//          aRetorno := dmESocial.Gerar_eSocial1060(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
//        if aRetorno and cbS1070.Checked  then
//          aRetorno := dmESocial.Gerar_eSocial1070(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
//        if aRetorno and cbS1080.Checked  then
//          aRetorno := dmESocial.Gerar_eSocial1080(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);

        if aRetorno then
          aRetorno   := dmESocial.EventoEnviado_eSocial(egIniciais, cmbAnoMes.Text, lblProcesso, gagProcesso, aProtocolo);

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

function TfrmEnvioEventoNaoPeriodico.GetESocial: TACBreSocial;
begin
  Result := dmESocial.ACBrESocial;
end;

procedure TfrmEnvioEventoNaoPeriodico.LimparPainelProcesso(aVisualizar: Boolean);
begin
  pnlProcesso.Visible  := aVisualizar;
  lblProcesso.Caption  := EmptyStr;
  gagProcesso.Progress := 0;
end;

end.
