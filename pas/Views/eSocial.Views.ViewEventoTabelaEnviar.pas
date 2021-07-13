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
  //Data.DB,
  //Datasnap.DBClient,
  Bind4D,
  Bind4D.Attributes,
  Bind4D.Types,
  eSocial.Views.Styles,
  eSocial.Views.Styles.Colors,
  eSocial.Views.Default,
  eSocial.Controllers.Interfaces;

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
    procedure cmbCompetenciaChange(Sender: TObject);private
    { Private declarations }
    ICompetencia : IControllerCompetencia;

    procedure ApplyStyleLocal;
    procedure LoadImagesDefault;
    procedure CreateTables;
    procedure CreateFields;
    procedure SaveRegisters;

    procedure LimparPainelProcesso(aVisualizar : Boolean);
    procedure CarregarDados;
    procedure VerificarOperacoes;
    procedure VerificarEventos;
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
begin
  // Bloquear botões...
  btnConfirmar.Enabled := False;
  btnFechar.Enabled    := False;
  // Iniciar thread para geração e envio dos eventos...
  
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

procedure TViewEventoTabelaEnviar.CreateFields;
begin
//  if not _ConexaoDB.ThereIsFieldTable(TDatabaseExecution.deSourceDB, 'TAB_SERVICO', 'classe_servico') then
//    _ConexaoDB.CreateFieldTable(TDatabaseExecution.deSourceDB, 'TAB_SERVICO', 'classe_servico', 'DM_SMALLINT');
end;

procedure TViewEventoTabelaEnviar.CreateTables;
//var
//  aTabela : TStringList;
begin
//  aTabela := TStringList.Create;
//  try
//    aTabela.Clear;
//    aTabela.Add('CREATE TABLE ACQUADUTUS_CLASSE_SERVICO (');
//    aTabela.Add('   CODIGO     DM_SMALLINT NOT NULL      ');
//    aTabela.Add(' , DESCRICAO  DM_VARCHAR_50             ');
//    aTabela.Add(');                                      ');
//
//    _ConexaoDB.CreateDomains(TDatabaseExecution.deSourceDB);
//    _ConexaoDB.CreateTable(TDatabaseExecution.deSourceDB, 'ACQUADUTUS_CLASSE_SERVICO', 'CODIGO', aTabela);
//  finally
//    aTabela.DisposeOf;
//  end;
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
//
//  cbS1035.Enabled := (Pesquisa('CONFIG_ESOCIAL', 'ID_CONFIG_ORGAO', '1', 'POSSUI_TABELA_CARREIRA', '') = FLAG_SIM);
//  Checb_ZeraBase.Visible := dmESocial.AmbienteWebServiceHomologacao;
end;

procedure TViewEventoTabelaEnviar.gpbOperacaoClick(Sender: TObject);
begin
  VerificarEventos;
end;

procedure TViewEventoTabelaEnviar.LimparPainelProcesso(aVisualizar: Boolean);
begin
  pnlProcesso.Visible  := aVisualizar;
  lblProcesso.Caption  := EmptyStr;
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

procedure TViewEventoTabelaEnviar.SaveRegisters;
//var
//  I : Integer;
//  aScripts : TStringList;
begin
//  aScripts := TStringList.Create;
//  try
//    for I := Low(CLASSE_CODIGO) to High(CLASSE_CODIGO) do
//    begin
//      aScripts.BeginUpdate;
//      aScripts.Clear;
//      aScripts.Add('UPDATE OR INSERT INTO ACQUADUTUS_CLASSE_SERVICO (');
//      aScripts.Add('    codigo    ');
//      aScripts.Add('  , descricao ');
//      aScripts.Add(') values (    ');
//      aScripts.Add('    ' + CLASSE_CODIGO[I].ToString );
//      aScripts.Add('  , ' + CLASSE_DESCRICAO[I].QuotedString );
//      aScripts.Add(') MATCHING (  ');
//      aScripts.Add('    codigo    ');
//      aScripts.Add(');            ');
//      aScripts.EndUpdate;
//
//      _ConexaoDB.ExecuteStriptDB(TDatabaseExecution.deSourceDB, aScripts);
//
//      if not cdsClasses.Active then
//        cdsClasses.CreateDataSet;
//
//      if not cdsClasses.Locate('codigo', CLASSE_CODIGO[I], [])  then
//      begin
//        cdsClasses.Append;
//        cdsClasses.FieldByName('codigo').AsInteger   := CLASSE_CODIGO[I];
//        cdsClasses.FieldByName('descricao').AsString := CLASSE_DESCRICAO[I];
//        cdsClasses.Post;
//      end;
//    end;
//  finally
//    aScripts.DisposeOf;
//  end;
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
  btnConfirmar.Enabled  := gpbOperacao.Enabled;

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
end;

end.
