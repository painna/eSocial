unit EnvioEventoTabela;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.Samples.Gauges,

  DialogoPadrao,
  ACBreSocial,
  udmESocial,
  eSocial.Controllers.Interfaces;

type
  TfrmEnvioEventoTabela = class(TfrmDialogoPadrao)
    gpbParametro: TGroupBox;
    gpbEvento: TGroupBox;
    gpbOperacao: TRadioGroup;
    lblAnoMes: TLabel;
    cmbAnoMes: TComboBox;
    pnlProcesso: TPanel;
    gagProcesso: TGauge;
    lblProcesso: TLabel;
    Checb_ZeraBase: TCheckBox;
    FlowPanel: TFlowPanel;
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
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cbS1040Click(Sender: TObject);
    procedure cmbAnoMesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gpbOperacaoClick(Sender: TObject);
    procedure cbS1005Click(Sender: TObject);
  private
    { Private declarations }
    ICompetencia : IControllerCompetencia;
    procedure LimparPainelProcesso(aVisualizar : Boolean);
    procedure VerificarOperacoes;
    procedure VerificarEventos;

    function GetESocial : TACBreSocial;
    function EventoSelecionado : Boolean;
    function GeradoEnviado : Boolean;
  public
    { Public declarations }
    property eSocial : TACBreSocial read GetESocial;
  end;

var
  frmEnvioEventoTabela: TfrmEnvioEventoTabela;

implementation

{$R *.dfm}

uses
  gsLib,
  UtilsDb,
  udmPrincipal,
  pcesConversaoeSocial,
  eSocial.Controllers.Factory;

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

procedure TfrmEnvioEventoTabela.cbS1005Click(Sender: TObject);
begin
  if cbS1005.Checked then
  begin
    cbS1000.Checked := False;
    cbS1010.Checked := False;
    cbS1020.Checked := False;
    cbS1030.Checked := False;
    cbS1035.Checked := False;
    cbS1040.Checked := False;
    cbS1050.Checked := False;
    cbS1060.Checked := False;
    cbS1070.Checked := False;
    cbS1080.Checked := False;
  end;
end;

procedure TfrmEnvioEventoTabela.cbS1040Click(Sender: TObject);
begin
  if cbS1040.Checked then
  begin
    cbS1030.Enabled := False;
    cbS1030.Checked := True;
  end
  else
    cbS1030.Enabled := True;
end;

procedure TfrmEnvioEventoTabela.cmbAnoMesChange(Sender: TObject);
begin
  VerificarOperacoes;
  VerificarEventos;
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
  ICompetencia := TControllerFactory.Competencia;
  ICompetencia.DAO.Get;

  dmESocial.LerConfiguracao;
  dmESocial.ListarCompetencias(cmbAnoMes, ICompetencia.DAO.This.Ano + ICompetencia.DAO.This.Mes);

  cmbAnoMes.Enabled    := ICompetencia.DAO.This.Encerrado;     // Obrigar envio na competência que ainda está em aberta
  gpbOperacao.Enabled  := not ICompetencia.DAO.This.Encerrado; // Liberar apenas se algum evento estiver pendente de envio

  LimparPainelProcesso(False);

  cbS1035.Enabled := (Pesquisa('CONFIG_ESOCIAL', 'ID_CONFIG_ORGAO', '1', 'POSSUI_TABELA_CARREIRA', '') = FLAG_SIM);
  Checb_ZeraBase.Visible := dmESocial.AmbienteWebServiceHomologacao;
end;

procedure TfrmEnvioEventoTabela.FormShow(Sender: TObject);
begin
  inherited;
  VerificarOperacoes;
  VerificarEventos;
end;

function TfrmEnvioEventoTabela.GeradoEnviado : Boolean;
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

        if aRetorno and cbS1000.Checked then
          aRetorno := dmESocial.Gerar_eSocial1000(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS1005.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1005(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS1010.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1010(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS1020.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1020(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS1030.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1030(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS1035.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1035(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS1040.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1040(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS1050.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1050(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS1060.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1060(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS1070.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1070(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
        if aRetorno and cbS1080.Checked  then
          aRetorno := dmESocial.Gerar_eSocial1080(cmbAnoMes.Text, Checb_ZeraBase.Checked, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);

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

function TfrmEnvioEventoTabela.GetESocial: TACBreSocial;
begin
  Result := dmESocial.ACBrESocial;
end;

procedure TfrmEnvioEventoTabela.gpbOperacaoClick(Sender: TObject);
begin
  VerificarEventos;
end;

procedure TfrmEnvioEventoTabela.LimparPainelProcesso(aVisualizar: Boolean);
begin
  pnlProcesso.Visible  := aVisualizar;
  lblProcesso.Caption  := EmptyStr;
  gagProcesso.Progress := 0;
end;

procedure TfrmEnvioEventoTabela.VerificarEventos;
var
  aCompetencia,
  aOperacao   : String;
  IOperacao : IControllerOperacao;
begin
  aCompetencia := StringReplace(cmbAnoMes.Text, '-', '', [rfReplaceAll]);
  IOperacao := TControllerFactory.Operacao;

  case gpbOperacao.ItemIndex of
    0 : aOperacao := 'I';
    1 : aOperacao := 'A';
    2 : aOperacao := 'E';
  end;

  cbS1000.Checked := IOperacao.DAO.Get([aCompetencia, 'S1000', aOperacao]).This.Processar;
  cbS1005.Checked := IOperacao.DAO.Get([aCompetencia, 'S1005', aOperacao]).This.Processar;
  cbS1010.Checked := IOperacao.DAO.Get([aCompetencia, 'S1010', aOperacao]).This.Processar;
  cbS1020.Checked := IOperacao.DAO.Get([aCompetencia, 'S1020', aOperacao]).This.Processar;

  cbS1000.Enabled := cbS1000.Checked;
  cbS1005.Enabled := cbS1005.Checked;
  cbS1010.Enabled := cbS1010.Checked;
  cbS1020.Enabled := cbS1020.Checked;

  cbS1005Click(cbS1005);
end;

procedure TfrmEnvioEventoTabela.VerificarOperacoes;
var
  aCompetencia : String;
  IOperacao : IControllerOperacao;
begin
  aCompetencia := StringReplace(cmbAnoMes.Text, '-', '', [rfReplaceAll]);
  IOperacao    := TControllerFactory.Operacao;

  ICompetencia.DAO.Get( aCompetencia );
  IOperacao.DAO.Get( aCompetencia );

  gpbOperacao.Enabled   := not ICompetencia.DAO.This.Encerrado; // Liberar apenas se algum evento estiver pendente de envio
  gpbOperacao.ItemIndex := -1;

  gpbOperacao.Controls[0].Enabled := IOperacao.DAO.This.Insercao;
  gpbOperacao.Controls[1].Enabled := IOperacao.DAO.This.Alteracao;
  gpbOperacao.Controls[2].Enabled := IOperacao.DAO.This.Exclusao;

  if gpbOperacao.Controls[0].Enabled and (not gpbOperacao.Controls[1].Enabled) and (not gpbOperacao.Controls[2].Enabled) then
    gpbOperacao.ItemIndex := 0
  else
  if (not gpbOperacao.Controls[0].Enabled) and gpbOperacao.Controls[1].Enabled and (not gpbOperacao.Controls[2].Enabled) then
    gpbOperacao.ItemIndex := 1
  else
  if (not gpbOperacao.Controls[0].Enabled) and (not gpbOperacao.Controls[1].Enabled) and gpbOperacao.Controls[2].Enabled then
    gpbOperacao.ItemIndex := 2;
end;

end.
