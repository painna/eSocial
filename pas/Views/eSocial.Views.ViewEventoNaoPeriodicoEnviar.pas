unit eSocial.Views.ViewEventoNaoPeriodicoEnviar;

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
  [FormDefault('Tabela de Eventos Não Periódicos')]
  TViewEventoNaoPeriodicoEnviar = class(TViewDefault)
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
    pnlS2190: TPanel;
    imgS2190: TImage;
    lblS2190: TLabel;

    [ComponentBindStyle(WHITE, FONT_SIZE_SMALL, FONT_COLOR_NORMAL, FONT_NAME)]

    [ComponentBindStyle(WHITE, FONT_SIZE_SMALL, FONT_COLOR_NORMAL, FONT_NAME)]

    [ComponentBindStyle(WHITE, FONT_SIZE_SMALL, FONT_COLOR_NORMAL, FONT_NAME)]

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
    pnlS2200: TPanel;
    imgS2200: TImage;
    lblS2200: TLabel;
    pnlS2205: TPanel;
    imgS2205: TImage;
    lblS2205: TLabel;
    pnlS2206: TPanel;
    imgS2206: TImage;
    lblS2206: TLabel;
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

  procedure EventoPeriodicoEnviar(const aOwner  : TComponent);

var
  ViewEventoNaoPeriodicoEnviar : TViewEventoNaoPeriodicoEnviar;

implementation

{$R *.dfm}

uses
  System.StrUtils,
  gsLib,
  udmPrincipal,
  udmESocial,
  VarGlobais,
  eSocial.Controllers.Factory,
  eSocial.Services.Utils;

procedure EventoPeriodicoEnviar(const aOwner  : TComponent);
begin
  if not Assigned(ViewEventoNaoPeriodicoEnviar) then
    ViewEventoNaoPeriodicoEnviar := TViewEventoNaoPeriodicoEnviar.Create(aOwner);

  ViewEventoNaoPeriodicoEnviar.ShowModal;
end;

procedure TViewEventoNaoPeriodicoEnviar.ApplyStyleLocal;
begin
  gagProcesso.ForeColor := DARK;
end;

procedure TViewEventoNaoPeriodicoEnviar.btnConfirmarClick(Sender: TObject);
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

procedure TViewEventoNaoPeriodicoEnviar.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewEventoNaoPeriodicoEnviar.CarregarDados;
begin
  ICompetencia := TControllerFactory.Competencia;
  ICompetencia.DAO.Get;

  dmESocial.LerConfiguracao;
  dmESocial.ListarCompetencias(cmbCompetencia, ICompetencia.DAO.This.Ano + ICompetencia.DAO.This.Mes);

  cmbCompetencia.Enabled := ICompetencia.DAO.This.Encerrado;     // Obrigar envio na competência que ainda está em aberta
  gpbOperacao.Enabled    := not ICompetencia.DAO.This.Encerrado; // Liberar apenas se algum evento estiver pendente de envio
end;

procedure TViewEventoNaoPeriodicoEnviar.cmbCompetenciaChange(Sender: TObject);
begin
  VerificarOperacoes;
  VerificarEventos;
end;

function TViewEventoNaoPeriodicoEnviar.eSocial: TACBreSocial;
begin
  Result := dmESocial.ACBrESocial;
end;

function TViewEventoNaoPeriodicoEnviar.EventoSelecionado: Boolean;
var
  I : Integer;
begin
  I := 0;

  if (imgS2190.Tag = 1) then Inc(I);
  if (imgS2200.Tag = 1) then Inc(I);
  if (imgS2205.Tag = 1) then Inc(I);
  if (imgS2206.Tag = 1) then Inc(I);

  Result := (I > 0);
end;

procedure TViewEventoNaoPeriodicoEnviar.FormCreate(Sender: TObject);
begin
  inherited;
  ApplyStyleLocal;
  LoadImagesDefault;
end;

procedure TViewEventoNaoPeriodicoEnviar.FormShow(Sender: TObject);
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

procedure TViewEventoNaoPeriodicoEnviar.GerarEnviarEventos;
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

  // Gerar e enviar evento S2190 : ---
  FStep := EVENTO_2190;
  try
    aEventoOK  := False;
    aProtocolo := TProtocoloESocial.Create(EmptyStr);
    aProtocolo.CompetenciaID := IntToStr(TCompetencia(cmbCompetencia.Items.Objects[cmbCompetencia.ItemIndex]).ID);

    if (imgS2190.Tag = 1) then
      TThread.Synchronize(nil, procedure
      begin
        TServiceUtils.ImageResource('icon_question24', imgS2190);
      end);

    // 1. Varrer os registros pendente de envio
    while aContinuar and IOperacao.DAO.Get([aCompetencia, FStep, aOperacao]).This.Processar do
    begin
      eSocial.Eventos.Clear;
      dmESocial.LerConfiguracao;

      // 2. Gerar e enviar arquivo XML
      aContinuar := dmESocial.Gerar_eSocial2190(TCompetencia(cmbCompetencia.Items.Objects[cmbCompetencia.ItemIndex]), False, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
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
        dmPrincipal.SConPrincipal.ExecuteDirect('execute procedure SP_ESOCIAL_EVENTOS_PEND_PERIODICO');
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
        TServiceUtils.ImageResource('icon_success24', imgS2190);
      end);
  finally
    aProtocolo.DisposeOf;
    Sleep(500);
  end;

  // Gerar e enviar evento S2200: ---
  FStep := EVENTO_2200;
  try
    aEventoOK  := False;
    aProtocolo := TProtocoloESocial.Create(EmptyStr);
    aProtocolo.CompetenciaID := IntToStr(TCompetencia(cmbCompetencia.Items.Objects[cmbCompetencia.ItemIndex]).ID);

    if (imgS2200.Tag = 1) then
      TThread.Synchronize(nil, procedure
      begin
        TServiceUtils.ImageResource('icon_question24', imgS2200);
      end);

    // 1. Varrer os registros pendente de envio
    while aContinuar and IOperacao.DAO.Get([aCompetencia, FStep, aOperacao]).This.Processar do
    begin
      eSocial.Eventos.Clear;
      dmESocial.LerConfiguracao;

      // 2. Gerar e enviar arquivo XML
      aContinuar := dmESocial.Gerar_eSocial2200(TCompetencia(cmbCompetencia.Items.Objects[cmbCompetencia.ItemIndex]), False, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
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
        dmPrincipal.SConPrincipal.ExecuteDirect('execute procedure SP_ESOCIAL_EVENTOS_PEND_PERIODICO');
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
        TServiceUtils.ImageResource('icon_success24', imgS2200);
      end);
  finally
    aProtocolo.DisposeOf;
    Sleep(500);
  end;

  // Gerar e enviar evento S2205 : ---
  FStep := EVENTO_2205;
  try
    aEventoOK  := False;
    aProtocolo := TProtocoloESocial.Create(EmptyStr);
    aProtocolo.CompetenciaID := IntToStr(TCompetencia(cmbCompetencia.Items.Objects[cmbCompetencia.ItemIndex]).ID);

    if (imgS2205.Tag = 1) then
      TThread.Synchronize(nil, procedure
      begin
        TServiceUtils.ImageResource('icon_question24', imgS2205);
      end);

    // 1. Varrer os registros pendente de envio
    while aContinuar and IOperacao.DAO.Get([aCompetencia, FStep, aOperacao]).This.Processar do
    begin
      eSocial.Eventos.Clear;
      dmESocial.LerConfiguracao;

      // 2. Gerar e enviar arquivo XML
      aContinuar := dmESocial.Gerar_eSocial2205(TCompetencia(cmbCompetencia.Items.Objects[cmbCompetencia.ItemIndex]), False, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
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
        dmPrincipal.SConPrincipal.ExecuteDirect('execute procedure SP_ESOCIAL_EVENTOS_PEND_PERIODICO');
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
        TServiceUtils.ImageResource('icon_success24', imgS2205);
      end);
  finally
    aProtocolo.DisposeOf;
    Sleep(500);
  end;

  // Gerar e enviar evento S2206 : ---
  FStep := EVENTO_2206;
  try
    aEventoOK  := False;
    aProtocolo := TProtocoloESocial.Create(EmptyStr);
    aProtocolo.CompetenciaID := IntToStr(TCompetencia(cmbCompetencia.Items.Objects[cmbCompetencia.ItemIndex]).ID);

    if (imgS2206.Tag = 1) then
      TThread.Synchronize(nil, procedure
      begin
        TServiceUtils.ImageResource('icon_question24', imgS2206);
      end);

    // 1. Varrer os registros pendente de envio
    while aContinuar and IOperacao.DAO.Get([aCompetencia, FStep, aOperacao]).This.Processar do
    begin
      eSocial.Eventos.Clear;
      dmESocial.LerConfiguracao;

      // 2. Gerar e enviar arquivo XML
      aContinuar := dmESocial.Gerar_eSocial2206(TCompetencia(cmbCompetencia.Items.Objects[cmbCompetencia.ItemIndex]), False, aModoLancamento, lblProcesso, gagProcesso, aProtocolo);
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
        dmPrincipal.SConPrincipal.ExecuteDirect('execute procedure SP_ESOCIAL_EVENTOS_PEND_PERIODICO');
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
        TServiceUtils.ImageResource('icon_success24', imgS2206);
      end);
  finally
    aProtocolo.DisposeOf;
    Sleep(500);
  end;
end;

procedure TViewEventoNaoPeriodicoEnviar.gpbOperacaoClick(Sender: TObject);
begin
  VerificarEventos;
end;

procedure TViewEventoNaoPeriodicoEnviar.LimparPainelProcesso(aVisualizar: Boolean);
begin
  pnlProcesso.Visible  := aVisualizar;
  lblProcesso.Caption  := 'Iniciando processo...';
  gagProcesso.Progress := 0;
end;

procedure TViewEventoNaoPeriodicoEnviar.LoadImagesDefault;
begin
  TServiceUtils.ImageResource('icon_inform32',  imgInform);
  TServiceUtils.ImageResource('icon_alert32',   imgAlert);
  TServiceUtils.ImageResource('icon_error32',   imgError);
  TServiceUtils.ImageResource('icon_success32', imgSuccess);

  TServiceUtils.ImageResource('icon_question24', imgS2190);
  TServiceUtils.ImageResource('icon_question24', imgS2200);
  TServiceUtils.ImageResource('icon_question24', imgS2205);
  TServiceUtils.ImageResource('icon_question24', imgS2206);
end;

procedure TViewEventoNaoPeriodicoEnviar.ProcessarRetorno(Sender: TObject);
var
  aError : Boolean;
begin
  try
    aError := False;

    if Sender is TThread then
      aError := Assigned(TThread(Sender).FatalException);

    if aError then
    begin
      if FStep.Equals(EVENTO_2190) then
        TServiceUtils.ImageResource('icon_error24', imgS2190)
      else
      if FStep.Equals(EVENTO_2200) then
        TServiceUtils.ImageResource('icon_error24', imgS2200)
      else
      if FStep.Equals(EVENTO_2205) then
        TServiceUtils.ImageResource('icon_error24', imgS2205)
      else
      if FStep.Equals(EVENTO_2206) then
        TServiceUtils.ImageResource('icon_error24', imgS2206);

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

procedure TViewEventoNaoPeriodicoEnviar.VerificarEventos;
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

  imgS2190.Tag := StrToInt( IfThen(IOperacao.DAO.Get([aCompetencia, EVENTO_2190, aOperacao]).This.Processar, '1', '0') );
  imgS2200.Tag := StrToInt( IfThen(IOperacao.DAO.Get([aCompetencia, EVENTO_2200, aOperacao]).This.Processar, '1', '0') );
  imgS2205.Tag := StrToInt( IfThen(IOperacao.DAO.Get([aCompetencia, EVENTO_2205, aOperacao]).This.Processar, '1', '0') );
  imgS2206.Tag := StrToInt( IfThen(IOperacao.DAO.Get([aCompetencia, EVENTO_2206, aOperacao]).This.Processar, '1', '0') );

  if (imgS2190.Tag = 1) then
    TServiceUtils.ImageResource('icon_alert24', imgS2190)
  else
    TServiceUtils.ImageResource('icon_inform24', imgS2190);

  if (imgS2200.Tag = 1) then
    TServiceUtils.ImageResource('icon_alert24', imgS2200)
  else
    TServiceUtils.ImageResource('icon_inform24', imgS2200);

  if (imgS2205.Tag = 1) then
    TServiceUtils.ImageResource('icon_alert24', imgS2205)
  else
    TServiceUtils.ImageResource('icon_inform24', imgS2205);

  if (imgS2206.Tag = 1) then
    TServiceUtils.ImageResource('icon_alert24', imgS2206)
  else
    TServiceUtils.ImageResource('icon_inform24', imgS2206);
end;

procedure TViewEventoNaoPeriodicoEnviar.VerificarOperacoes;
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
