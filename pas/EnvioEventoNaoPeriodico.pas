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
    procedure gpbOperacaoClick(Sender: TObject);
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
  //if cbS2241.Checked then Inc(I);
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
  dmESocial.ListarCompetenciasAdmissao(cmbAnoMes);
  LimparPainelProcesso(False);
//  cbS1035.Enabled := (Pesquisa('CONFIG_ESOCIAL', 'ID_CONFIG_ORGAO', '1', 'POSSUI_TABELA_CARREIRA', '') = FLAG_SIM);
  cbS2400.Enabled := (Pesquisa('CONFIG_ESOCIAL', 'ID_CONFIG_ORGAO', '1', 'POSSUI_RPPS', '') = FLAG_SIM);
  Checb_ZeraBase.Visible := dmESocial.AmbienteWebServiceHomologacao;
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
        aProtocolo.CompetenciaID := IntToStr(TCompetencia(cmbAnoMes.Items.Objects[cmbAnoMes.ItemIndex]).ID);

        if aRetorno and cbS2190.Checked then
          aRetorno := dmESocial.Gerar_eSocial2190(TCompetencia(cmbAnoMes.Items.Objects[cmbAnoMes.ItemIndex]), Checb_ZeraBase.Checked, mlInclusao, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS2200.Checked  then
          aRetorno := dmESocial.Gerar_eSocial2200(TCompetencia(cmbAnoMes.Items.Objects[cmbAnoMes.ItemIndex]), Checb_ZeraBase.Checked, mlInclusao, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS2205.Checked  then
          aRetorno := dmESocial.Gerar_eSocial2205(TCompetencia(cmbAnoMes.Items.Objects[cmbAnoMes.ItemIndex]), Checb_ZeraBase.Checked, mlAlteracao, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS2206.Checked  then
          aRetorno := dmESocial.Gerar_eSocial2206(TCompetencia(cmbAnoMes.Items.Objects[cmbAnoMes.ItemIndex]), Checb_ZeraBase.Checked, mlAlteracao, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS2210.Checked  then
          aRetorno := dmESocial.Gerar_eSocial2210(TCompetencia(cmbAnoMes.Items.Objects[cmbAnoMes.ItemIndex]), Checb_ZeraBase.Checked, mlInclusao, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS2220.Checked  then
          aRetorno := dmESocial.Gerar_eSocial2220(TCompetencia(cmbAnoMes.Items.Objects[cmbAnoMes.ItemIndex]), Checb_ZeraBase.Checked, mlInclusao, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS2230.Checked  then
          aRetorno := dmESocial.Gerar_eSocial2230(TCompetencia(cmbAnoMes.Items.Objects[cmbAnoMes.ItemIndex]), Checb_ZeraBase.Checked, mlInclusao, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS2240.Checked  then
          aRetorno := dmESocial.Gerar_eSocial2240(TCompetencia(cmbAnoMes.Items.Objects[cmbAnoMes.ItemIndex]), Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
//        if aRetorno and cbS2241.Checked  then
//          aRetorno := dmESocial.Gerar_eSocial2241(TCompetencia(cmbAnoMes.Items.Objects[cmbAnoMes.ItemIndex]), Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS2250.Checked  then
          aRetorno := dmESocial.Gerar_eSocial2250(TCompetencia(cmbAnoMes.Items.Objects[cmbAnoMes.ItemIndex]), Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS2260.Checked  then
          aRetorno := dmESocial.Gerar_eSocial2260(TCompetencia(cmbAnoMes.Items.Objects[cmbAnoMes.ItemIndex]), Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
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
        if aRetorno and cbS2400.Checked  then
          aRetorno := dmESocial.Gerar_eSocial2400(TCompetencia(cmbAnoMes.Items.Objects[cmbAnoMes.ItemIndex]), Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
//        if aRetorno and cbS1080.Checked  then
//          aRetorno := dmESocial.Gerar_eSocial1080(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);

        if aRetorno then
          aRetorno   := dmESocial.EventoEnviado_eSocial(egIniciais, cmbAnoMes.Text, lblProcesso, gagProcesso, aProtocolo);

        if aRetorno then
        begin
          dmESocial.GravarProtocoloRetorno(aProtocolo);
          dmESocial.AtualizarOperacoes(aModoLancamento, aProtocolo, TCompetencia(cmbAnoMes.Items.Objects[cmbAnoMes.ItemIndex]));
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

procedure TfrmEnvioEventoNaoPeriodico.gpbOperacaoClick(Sender: TObject);
begin
  cbS2200.Enabled := (gpbOperacao.ItemIndex = 0);
  cbS2205.Enabled := (gpbOperacao.ItemIndex = 1);
  cbS2206.Enabled := (gpbOperacao.ItemIndex = 1);
  cbS2210.Enabled := (gpbOperacao.ItemIndex = 0);
  cbS2220.Enabled := (gpbOperacao.ItemIndex = 0);
  cbS2230.Enabled := (gpbOperacao.ItemIndex = 0);
  cbS2240.Enabled := (gpbOperacao.ItemIndex = 0) or (gpbOperacao.ItemIndex = 1);
//  cbS2241.Enabled := (gpbOperacao.ItemIndex = 0) or (gpbOperacao.ItemIndex = 1);
//  cbS2298.Enabled := (gpbOperacao.ItemIndex = 1);
//  cbS2299.Enabled := (gpbOperacao.ItemIndex = 1);

  if not cbS2200.Enabled then cbS2200.Checked := False;
  if not cbS2205.Enabled then cbS2205.Checked := False;
  if not cbS2206.Enabled then cbS2206.Checked := False;
  if not cbS2210.Enabled then cbS2210.Checked := False;
  if not cbS2220.Enabled then cbS2220.Checked := False;
  if not cbS2230.Enabled then cbS2230.Checked := False;
  if not cbS2240.Enabled then cbS2240.Checked := False;
//  if not cbS2241.Enabled then cbS2241.Checked := False;
//  if not cbS2298.Enabled then cbS2299.Checked := False;
//  if not cbS2299.Enabled then cbS2299.Checked := False;
end;

procedure TfrmEnvioEventoNaoPeriodico.LimparPainelProcesso(aVisualizar: Boolean);
begin
  pnlProcesso.Visible  := aVisualizar;
  lblProcesso.Caption  := EmptyStr;
  gagProcesso.Progress := 0;
end;

end.
