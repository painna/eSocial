unit eSocial.Views.ViewEventoTabelaEnviar;

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
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.DBCtrls,
  Vcl.Samples.Gauges,
  Bind4D,
  Bind4D.Attributes,
  Bind4D.Types,
  eSocial.Views.Styles,
  eSocial.Views.Styles.Colors,
  eSocial.Views.Default,
  eSocial.Controllers.Interfaces,
  ACBreSocial,
  pcesConversaoeSocial;

type
  [FormDefault('Tabela de Eventos')]
  TViewEventoTabelaEnviar = class(TViewDefault)
    PanelFooter: TPanel;

    [ComponentBindStyle(DARK, FONT_SIZE_NORMAL, FONT_COLOR_WHITE, FONT_NAME)]
    pnlConfirmar: TPanel;
    btnConfirmar: TSpeedButton;

    pnlFechar: TPanel;
    btnFechar: TSpeedButton;

    [ComponentBindStyle(WHITE, FONT_SIZE_SMALL, FONT_COLOR_NORMAL, FONT_NAME)]
    lblCompetencia: TLabel;

    [ComponentBindStyle(WHITE, FONT_SIZE_SMALL, FONT_COLOR_NORMAL, FONT_NAME)]
    cmbCompetencia: TComboBox;

    [ComponentBindStyle(WHITE, FONT_SIZE_SMALL, FONT_COLOR_NORMAL, FONT_NAME)]
    gpbOperacao: TRadioGroup;

    [ComponentBindStyle(WHITE, FONT_SIZE_SMALL, FONT_COLOR_NORMAL, FONT_NAME)]
    lblProcesso: TLabel;
    gagProcesso: TGauge;
    pnlProcesso: TPanel;

    [ComponentBindStyle(WHITE, FONT_SIZE_SMALL, FONT_COLOR_NORMAL, FONT_NAME)]
    pnlS1000: TPanel;
    imgS1000: TImage;
    lblS1000: TLabel;

    [ComponentBindStyle(WHITE, FONT_SIZE_SMALL, FONT_COLOR_NORMAL, FONT_NAME)]
    pnlS1005: TPanel;
    imgS1005: TImage;
    lblS1005: TLabel;

    [ComponentBindStyle(WHITE, FONT_SIZE_SMALL, FONT_COLOR_NORMAL, FONT_NAME)]
    pnlS1010: TPanel;
    imgS1010: TImage;
    lblS1010: TLabel;

    [ComponentBindStyle(WHITE, FONT_SIZE_SMALL, FONT_COLOR_NORMAL, FONT_NAME)]
    pnlS1020: TPanel;
    imgS1020: TImage;
    lblS1020: TLabel;

    BevelSpace: TBevel;
    FlowPanelBody: TFlowPanel;
    PanelLegendas: TPanel;
    imgInform: TImage;
    PanelFiltros: TPanel;
    lblInformSemPedencia: TLabel;
    imgAlert: TImage;
    lblInformPendencia: TLabel;
    imgError: TImage;
    lblInformErroEnvio: TLabel;
    imgSuccess: TImage;
    lblInformSucessoEnvio: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    pnlCompetencia: TPanel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gpbOperacaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbCompetenciaChange(Sender: TObject);
  private
    { Private declarations }
    ICompetencia : IControllerCompetencia;
    FStep : String;
    FSucesso : Smallint;

    procedure ApplyStyleLocal;
    procedure LoadImagesDefault;

    procedure LimparPainelProcesso(aVisualizar : Boolean);
    procedure CarregarDados;
    procedure VerificarOperacoes;
    procedure VerificarEventos;
    procedure GerarEnviarEventos;
    procedure ProcessarRetorno(Sender: TObject);

    function EventoSelecionado : Boolean;
    function eSocial : TACBreSocial;
  public
    { Public declarations }
  end;

  procedure EventoTabelaEnviar(const aOwner  : TComponent);

var
  ViewEventoTabelaEnviar : TViewEventoTabelaEnviar;

implementation

{$R *.dfm}

uses
  System.StrUtils,
  gsLib,
  udmPrincipal,
  udmESocial,
  eSocial.Controllers.Factory,
  eSocial.Services.Utils;

procedure EventoTabelaEnviar(const aOwner  : TComponent);
begin
  if not Assigned(ViewEventoTabelaEnviar) then
    ViewEventoTabelaEnviar := TViewEventoTabelaEnviar.Create(aOwner);

  ViewEventoTabelaEnviar.ShowModal;
end;

procedure TViewEventoTabelaEnviar.ApplyStyleLocal;
begin
  gagProcesso.ForeColor := DARK;
end;

procedure TViewEventoTabelaEnviar.btnConfirmarClick(Sender: TObject);
var
  aRetorno : Boolean;
  aThread  : TThread;
begin
  if (gpbOperacao.ItemIndex = -1) then
    Mensagem('Nenhum tipo de operação foi selecionado', 'Alerta!', MB_ICONWARNING)
  else
  if not EventoSelecionado then
    Mensagem('Nenhum evento possui registros pendentes para geração/envio dos aquivos XML', 'Alerta!', MB_ICONWARNING)
  else
  if not dmESocial.CertificadoInstalado then
    Mensagem('Certificado não instalado/configurado', 'Alerta!', MB_ICONEXCLAMATION)
  else
  if not dmESocial.CertificadoValido then
    Mensagem('Certificado inválido', 'Alerta!', MB_ICONEXCLAMATION)
  else
  if Confirma('Eventos de Tabela', 'Você confirma a geração e envio dos eventos para o portal e-Social?') then
  begin
    LimparPainelProcesso(True);

    // Bloquear botões...
    btnConfirmar.Enabled := False;
    btnFechar.Enabled    := False;
    Screen.Cursor        := crSQLWait;

    FStep    := EmptyStr;
    FSucesso := 0;

    // Iniciar thread para geração e envio dos eventos...
    aThread := TThread.CreateAnonymousThread( GerarEnviarEventos );
    aThread.OnTerminate := ProcessarRetorno;
    aThread.Start;
  end;
end;

procedure TViewEventoTabelaEnviar.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewEventoTabelaEnviar.CarregarDados;
begin
  ICompetencia := TControllerFactory.Competencia;
  ICompetencia.DAO.Get;

  dmESocial.LerConfiguracao;
  dmESocial.ListarCompetencias(cmbCompetencia, ICompetencia.DAO.This.Ano + ICompetencia.DAO.This.Mes);

  cmbCompetencia.Enabled := ICompetencia.DAO.This.Encerrado;     // Obrigar envio na competência que ainda está em aberta
  gpbOperacao.Enabled    := not ICompetencia.DAO.This.Encerrado; // Liberar apenas se algum evento estiver pendente de envio
end;

procedure TViewEventoTabelaEnviar.cmbCompetenciaChange(Sender: TObject);
begin
  VerificarOperacoes;
  VerificarEventos;
end;

function TViewEventoTabelaEnviar.eSocial: TACBreSocial;
begin
  Result := dmESocial.ACBrESocial;
end;

function TViewEventoTabelaEnviar.EventoSelecionado: Boolean;
var
  I : Integer;
begin
  I := 0;

  if (imgS1000.Tag = 1) then Inc(I);
  if (imgS1005.Tag = 1) then Inc(I);
  if (imgS1010.Tag = 1) then Inc(I);
  if (imgS1020.Tag = 1) then Inc(I);

  Result := (I > 0);
end;

procedure TViewEventoTabelaEnviar.FormCreate(Sender: TObject);
begin
  inherited;
  ApplyStyleLocal;
  LoadImagesDefault;
end;

procedure TViewEventoTabelaEnviar.FormShow(Sender: TObject);
begin
  inherited;
  CarregarDados;
  LimparPainelProcesso(False);

  VerificarOperacoes;
  VerificarEventos;

  try
    eSocial.SSL.CarregarCertificadoSeNecessario;
  except
    On E : Exception do
    begin
      btnConfirmar.Enabled := False;
      btnFechar.Enabled    := False;
      Mensagem('Certificado não selecionado.' + #13#13 + E.Message, 'Erro', MB_ICONERROR);
    end;
  end;
end;

procedure TViewEventoTabelaEnviar.GerarEnviarEventos;
var
  aCompetencia,
  aOperacao   : String;
  IOperacao   : IControllerOperacao;
  aContinuar  : Boolean;
  aProtocolo  : TProtocoloESocial;
  aModoLancamento : TModoLancamento;
  aEventoOK : Boolean;
begin
  aCompetencia := StringReplace(cmbCompetencia.Text, '-', '', [rfReplaceAll]);
  IOperacao  := TControllerFactory.Operacao;
  aContinuar := True;

  aModoLancamento := TModoLancamento(gpbOperacao.ItemIndex); //eSStrToModoLancamento(ok, IntToStr(gpbOperacao.ItemIndex));

  case gpbOperacao.ItemIndex of
    0 : aOperacao := 'I';
    1 : aOperacao := 'A';
    2 : aOperacao := 'E';
  end;

  // Gerar e enviar evento S1000 : ---
  FStep := 'S1000';
  try
    aEventoOK  := False;
    aProtocolo := TProtocoloESocial.Create(EmptyStr);
    aProtocolo.CompetenciaID := IntToStr(TCompetencia(cmbCompetencia.Items.Objects[cmbCompetencia.ItemIndex]).ID);

    if (imgS1000.Tag = 1) then
      TThread.Synchronize(nil, procedure
      begin
        TServiceUtils.ImageResource('icon_question24', imgS1000);
      end);

    // 1. Varrer os registros pendente de envio
    while aContinuar and IOperacao.DAO.Get([aCompetencia, FStep, aOperacao]).This.Processar do
    begin
      eSocial.Eventos.Clear;
      dmESocial.LerConfiguracao;

      // 2. Gerar e enviar arquivo XML
      aContinuar := dmESocial.Gerar_eSocial1000(cmbCompetencia.Text, False, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
      if aContinuar then
        aContinuar := dmESocial.EventoEnviado_eSocial(TeSocialGrupo.egIniciais, cmbCompetencia.Text, lblProcesso, gagProcesso, aProtocolo);

      // 3. Gravar protocolo e atualizar registros enviados
      if aContinuar then
      begin
        dmESocial.GravarProtocoloRetorno(aProtocolo);
        dmESocial.AtualizarOperacoes(aModoLancamento, aProtocolo, TCompetencia(cmbCompetencia.Items.Objects[cmbCompetencia.ItemIndex]));
        Inc(FSucesso);
        aEventoOK := True;

        // 4. Verificar novas pendentes
        dmPrincipal.SConPrincipal.ExecuteDirect('execute procedure SP_ESOCIAL_EVENTOS_PEND_TABELAS');
      end
      else
      if (eSocial.Eventos.Iniciais.Count = 0) then
        raise Exception.Create('Nenhum evento foi gerado.' + #13 + 'Entre em contato com suporte!')
      else
      if (dmESocial.MensagemRetorno.Count > 0) then
        raise Exception.Create(dmESocial.MensagemRetorno.Text);
    end;

    // 5. Atualizar ícone na tela
    if aContinuar and aEventoOK then
      TThread.Synchronize(nil, procedure
      begin
        TServiceUtils.ImageResource('icon_success24', imgS1000);
      end);
  finally
    aProtocolo.DisposeOf;
    Sleep(500);
  end;

  // Gerar e enviar evento S1005 : ---
  FStep := 'S1005';
  try
    aEventoOK  := False;
    aProtocolo := TProtocoloESocial.Create(EmptyStr);
    aProtocolo.CompetenciaID := IntToStr(TCompetencia(cmbCompetencia.Items.Objects[cmbCompetencia.ItemIndex]).ID);

    if (imgS1005.Tag = 1) then
      TThread.Synchronize(nil, procedure
      begin
        TServiceUtils.ImageResource('icon_question24', imgS1005);
      end);

    // 1. Varrer os registros pendente de envio
    while aContinuar and IOperacao.DAO.Get([aCompetencia, FStep, aOperacao]).This.Processar do
    begin
      eSocial.Eventos.Clear;
      dmESocial.LerConfiguracao;

      // 2. Gerar e enviar arquivo XML
      aContinuar := dmESocial.Gerar_eSocial1005(cmbCompetencia.Text, False, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
      if aContinuar then
        aContinuar := dmESocial.EventoEnviado_eSocial(TeSocialGrupo.egIniciais, cmbCompetencia.Text, lblProcesso, gagProcesso, aProtocolo);

      // 3. Gravar protocolo e atualizar registros enviados
      if aContinuar then
      begin
        dmESocial.GravarProtocoloRetorno(aProtocolo);
        dmESocial.AtualizarOperacoes(aModoLancamento, aProtocolo, TCompetencia(cmbCompetencia.Items.Objects[cmbCompetencia.ItemIndex]));
        Inc(FSucesso);
        aEventoOK := True;

        // 4. Verificar novas pendentes
        dmPrincipal.SConPrincipal.ExecuteDirect('execute procedure SP_ESOCIAL_EVENTOS_PEND_TABELAS');
      end
      else
      if (eSocial.Eventos.Iniciais.Count = 0) then
        raise Exception.Create('Nenhum evento foi gerado.' + #13 + 'Entre em contato com suporte!')
      else
      if (dmESocial.MensagemRetorno.Count > 0) then
        raise Exception.Create(dmESocial.MensagemRetorno.Text);
    end;

    // 5. Atualizar ícone na tela
    if aContinuar and aEventoOK then
      TThread.Synchronize(nil, procedure
      begin
        TServiceUtils.ImageResource('icon_success24', imgS1005);
      end);
  finally
    aProtocolo.DisposeOf;
    Sleep(500);
  end;

  // Gerar e enviar evento S1010 : ---
  FStep := 'S1010';
  try
    aEventoOK  := False;
    aProtocolo := TProtocoloESocial.Create(EmptyStr);
    aProtocolo.CompetenciaID := IntToStr(TCompetencia(cmbCompetencia.Items.Objects[cmbCompetencia.ItemIndex]).ID);

    if (imgS1010.Tag = 1) then
      TThread.Synchronize(nil, procedure
      begin
        TServiceUtils.ImageResource('icon_question24', imgS1010);
      end);

    // 1. Varrer os registros pendente de envio
    while aContinuar and IOperacao.DAO.Get([aCompetencia, FStep, aOperacao]).This.Processar do
    begin
      eSocial.Eventos.Clear;
      dmESocial.LerConfiguracao;

      // 2. Gerar e enviar arquivo XML
      aContinuar := dmESocial.Gerar_eSocial1010(cmbCompetencia.Text, False, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
      if aContinuar then
        aContinuar := dmESocial.EventoEnviado_eSocial(TeSocialGrupo.egIniciais, cmbCompetencia.Text, lblProcesso, gagProcesso, aProtocolo);

      // 3. Gravar protocolo e atualizar registros enviados
      if aContinuar then
      begin
        dmESocial.GravarProtocoloRetorno(aProtocolo);
        dmESocial.AtualizarOperacoes(aModoLancamento, aProtocolo, TCompetencia(cmbCompetencia.Items.Objects[cmbCompetencia.ItemIndex]));
        Inc(FSucesso);
        aEventoOK := True;

        // 4. Verificar novas pendentes
        dmPrincipal.SConPrincipal.ExecuteDirect('execute procedure SP_ESOCIAL_EVENTOS_PEND_TABELAS');
      end
      else
      if (eSocial.Eventos.Iniciais.Count = 0) then
        raise Exception.Create('Nenhum evento foi gerado.' + #13 + 'Entre em contato com suporte!')
      else
      if (dmESocial.MensagemRetorno.Count > 0) then
        raise Exception.Create(dmESocial.MensagemRetorno.Text);
    end;

    // 5. Atualizar ícone na tela
    if aContinuar and aEventoOK then
      TThread.Synchronize(nil, procedure
      begin
        TServiceUtils.ImageResource('icon_success24', imgS1010);
      end);
  finally
    aProtocolo.DisposeOf;
    Sleep(500);
  end;

  // Gerar e enviar evento S1020 : ---
  FStep := 'S1020';
  try
    aEventoOK  := False;
    aProtocolo := TProtocoloESocial.Create(EmptyStr);
    aProtocolo.CompetenciaID := IntToStr(TCompetencia(cmbCompetencia.Items.Objects[cmbCompetencia.ItemIndex]).ID);

    if (imgS1020.Tag = 1) then
      TThread.Synchronize(nil, procedure
      begin
        TServiceUtils.ImageResource('icon_question24', imgS1020);
      end);

    // 1. Varrer os registros pendente de envio
    while aContinuar and IOperacao.DAO.Get([aCompetencia, FStep, aOperacao]).This.Processar do
    begin
      eSocial.Eventos.Clear;
      dmESocial.LerConfiguracao;

      // 2. Gerar e enviar arquivo XML
      aContinuar := dmESocial.Gerar_eSocial1020(cmbCompetencia.Text, False, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
      if aContinuar then
        aContinuar := dmESocial.EventoEnviado_eSocial(TeSocialGrupo.egIniciais, cmbCompetencia.Text, lblProcesso, gagProcesso, aProtocolo);

      // 3. Gravar protocolo e atualizar registros enviados
      if aContinuar then
      begin
        dmESocial.GravarProtocoloRetorno(aProtocolo);
        dmESocial.AtualizarOperacoes(aModoLancamento, aProtocolo, TCompetencia(cmbCompetencia.Items.Objects[cmbCompetencia.ItemIndex]));
        Inc(FSucesso);
        aEventoOK := True;

        // 4. Verificar novas pendentes
        dmPrincipal.SConPrincipal.ExecuteDirect('execute procedure SP_ESOCIAL_EVENTOS_PEND_TABELAS');
      end
      else
      if (eSocial.Eventos.Iniciais.Count = 0) then
        raise Exception.Create('Nenhum evento foi gerado.' + #13 + 'Entre em contato com suporte!')
      else
      if (dmESocial.MensagemRetorno.Count > 0) then
        raise Exception.Create(dmESocial.MensagemRetorno.Text);
    end;

    // 5. Atualizar ícone na tela
    if aContinuar and aEventoOK then
      TThread.Synchronize(nil, procedure
      begin
        TServiceUtils.ImageResource('icon_success24', imgS1020);
      end);
  finally
    aProtocolo.DisposeOf;
    Sleep(500);
  end;
end;

procedure TViewEventoTabelaEnviar.gpbOperacaoClick(Sender: TObject);
begin
  VerificarEventos;
end;

procedure TViewEventoTabelaEnviar.LimparPainelProcesso(aVisualizar: Boolean);
begin
  pnlProcesso.Visible  := aVisualizar;
  lblProcesso.Caption  := 'Iniciando processo...';
  gagProcesso.Progress := 0;
end;

procedure TViewEventoTabelaEnviar.LoadImagesDefault;
begin
  TServiceUtils.ImageResource('icon_inform32',  imgInform);
  TServiceUtils.ImageResource('icon_alert32',   imgAlert);
  TServiceUtils.ImageResource('icon_error32',   imgError);
  TServiceUtils.ImageResource('icon_success32', imgSuccess);

  TServiceUtils.ImageResource('icon_question24', imgS1000);
  TServiceUtils.ImageResource('icon_question24', imgS1005);
  TServiceUtils.ImageResource('icon_question24', imgS1010);
  TServiceUtils.ImageResource('icon_question24', imgS1020);
end;

procedure TViewEventoTabelaEnviar.ProcessarRetorno(Sender: TObject);
var
  aError : Boolean;
begin
  try
    aError := False;

    if Sender is TThread then
      aError := Assigned(TThread(Sender).FatalException);

    if aError then
    begin
      if FStep.Equals('S1000') then
        TServiceUtils.ImageResource('icon_error24', imgS1000)
      else
      if FStep.Equals('S1005') then
        TServiceUtils.ImageResource('icon_error24', imgS1005)
      else
      if FStep.Equals('S1010') then
        TServiceUtils.ImageResource('icon_error24', imgS1010)
      else
      if FStep.Equals('S1020') then
        TServiceUtils.ImageResource('icon_error24', imgS1020);

      Mensagem('Evento ' + FStep + ':' + #13#13 + Exception(TThread(Sender).FatalException).Message, 'Erro', MB_ICONERROR);
    end
    else
    begin
      VerificarOperacoes;
      VerificarEventos;
      gagProcesso.Progress := gagProcesso.MaxValue;

      if (FSucesso = 0) then
        Mensagem('Nenhum evento foi gerado.' + #13 + 'Informe ao suporte para que este analise os dados da base', 'Erro!', MB_ICONERROR)
      else
        Mensagem('Arquivo(s) de evento(s) gerado(s) e enviado(s) com sucesso.', 'Sucesso!', MB_ICONINFORMATION);
    end;
  finally
    LimparPainelProcesso(False);
    btnConfirmar.Enabled := True;
    btnFechar.Enabled    := True;
    Screen.Cursor        := crDefault;
  end;
end;

procedure TViewEventoTabelaEnviar.VerificarEventos;
var
  aCompetencia,
  aOperacao   : String;
  IOperacao : IControllerOperacao;
begin
  aCompetencia := StringReplace(cmbCompetencia.Text, '-', '', [rfReplaceAll]);
  IOperacao := TControllerFactory.Operacao;

  case gpbOperacao.ItemIndex of
    0 : aOperacao := 'I';
    1 : aOperacao := 'A';
    2 : aOperacao := 'E';
  end;

  imgS1000.Tag := StrToInt( IfThen(IOperacao.DAO.Get([aCompetencia, 'S1000', aOperacao]).This.Processar, '1', '0') );
  imgS1005.Tag := StrToInt( IfThen(IOperacao.DAO.Get([aCompetencia, 'S1005', aOperacao]).This.Processar, '1', '0') );
  imgS1010.Tag := StrToInt( IfThen(IOperacao.DAO.Get([aCompetencia, 'S1010', aOperacao]).This.Processar, '1', '0') );
  imgS1020.Tag := StrToInt( IfThen(IOperacao.DAO.Get([aCompetencia, 'S1020', aOperacao]).This.Processar, '1', '0') );

  if (imgS1000.Tag = 1) then
    TServiceUtils.ImageResource('icon_alert24', imgS1000)
  else
    TServiceUtils.ImageResource('icon_inform24', imgS1000);

  if (imgS1005.Tag = 1) then
    TServiceUtils.ImageResource('icon_alert24', imgS1005)
  else
    TServiceUtils.ImageResource('icon_inform24', imgS1005);

  if (imgS1010.Tag = 1) then
    TServiceUtils.ImageResource('icon_alert24', imgS1010)
  else
    TServiceUtils.ImageResource('icon_inform24', imgS1010);

  if (imgS1020.Tag = 1) then
    TServiceUtils.ImageResource('icon_alert24', imgS1020)
  else
    TServiceUtils.ImageResource('icon_inform24', imgS1020);
end;

procedure TViewEventoTabelaEnviar.VerificarOperacoes;
var
  aCompetencia : String;
  IOperacao : IControllerOperacao;
begin
  aCompetencia := StringReplace(cmbCompetencia.Text, '-', '', [rfReplaceAll]);
  IOperacao    := TControllerFactory.Operacao;

  ICompetencia.DAO.Get( aCompetencia );
  IOperacao.DAO.Get( aCompetencia );

  gpbOperacao.Enabled   := not ICompetencia.DAO.This.Encerrado; // Liberar apenas se algum evento estiver pendente de envio
  gpbOperacao.ItemIndex := -1;

  gpbOperacao.Controls[0].Enabled := IOperacao.DAO.This.Insercao;
  gpbOperacao.Controls[1].Enabled := IOperacao.DAO.This.Alteracao;
  gpbOperacao.Controls[2].Enabled := IOperacao.DAO.This.Exclusao;

  if gpbOperacao.Controls[0].Enabled then
    gpbOperacao.ItemIndex := 0
  else
  if gpbOperacao.Controls[1].Enabled then
    gpbOperacao.ItemIndex := 1
  else
  if gpbOperacao.Controls[2].Enabled then
    gpbOperacao.ItemIndex := 2;

  btnConfirmar.Enabled := (gpbOperacao.ItemIndex > -1);
end;

end.
