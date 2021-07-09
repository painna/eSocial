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
  //Data.DB,
  //Datasnap.DBClient,
  dxGDIPlusClasses,
  Bind4D,
  Bind4D.Attributes,
  Bind4D.Types,
  eSocial.Views.Styles,
  eSocial.Views.Styles.Colors,
  eSocial.Views.Default,
  eSocial.Controllers.Interfaces, Vcl.Samples.Gauges;

type
  [FormDefault('Tabela de Eventos')]
  TViewEventoTabelaEnviar = class(TViewDefault)
    PanelFooter: TPanel;

    [ComponentBindStyle(DARK, FONT_SIZE_NORMAL, FONT_COLOR_WHITE, FONT_NAME)]
    pnlConfirmar: TPanel;
    btnConfirmar: TSpeedButton;

    pnlFechar: TPanel;
    btnFechar: TSpeedButton;

    BevelSpace: TBevel;
    FlowPanelBody: TFlowPanel;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Label1: TLabel;
    Image3: TImage;
    Label2: TLabel;
    Image4: TImage;
    Label3: TLabel;
    Image5: TImage;
    Label4: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Panel4: TPanel;

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

    pnlS1000: TPanel;
    imgS1000: TImage;
    lblS1000: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gpbOperacaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbCompetenciaChange(Sender: TObject);private
    { Private declarations }
    ICompetencia : IControllerCompetencia;
    procedure CreateTables;
    procedure CreateFields;
    procedure SaveRegisters;

    procedure LimparPainelProcesso(aVisualizar : Boolean);
    procedure VerificarOperacoes;
    procedure VerificarEventos;
  public
    { Public declarations }
  end;

  procedure ViewEventoTabelaEnviar(const aOwner  : TComponent);

implementation

{$R *.dfm}

uses
  udmPrincipal,
  udmESocial,
  eSocial.Controllers.Factory;

procedure ViewEventoTabelaEnviar(const aOwner  : TComponent);
var
  aView : TViewEventoTabelaEnviar;
begin
  aView := TViewEventoTabelaEnviar.Create(aOwner);
  try
    aView.ShowModal;
  finally
    aView.DisposeOf;
  end;
end;

procedure TViewEventoTabelaEnviar.btnConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TViewEventoTabelaEnviar.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
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
  ICompetencia := TControllerFactory.Competencia;
  ICompetencia.DAO.Get;

  dmESocial.LerConfiguracao;
  dmESocial.ListarCompetencias(cmbCompetencia, ICompetencia.DAO.This.Ano + ICompetencia.DAO.This.Mes);

  cmbCompetencia.Enabled := ICompetencia.DAO.This.Encerrado;     // Obrigar envio na competência que ainda está em aberta
  gpbOperacao.Enabled    := not ICompetencia.DAO.This.Encerrado; // Liberar apenas se algum evento estiver pendente de envio

  LimparPainelProcesso(False);
//
//  cbS1035.Enabled := (Pesquisa('CONFIG_ESOCIAL', 'ID_CONFIG_ORGAO', '1', 'POSSUI_TABELA_CARREIRA', '') = FLAG_SIM);
//  Checb_ZeraBase.Visible := dmESocial.AmbienteWebServiceHomologacao;
end;

procedure TViewEventoTabelaEnviar.FormShow(Sender: TObject);
begin
  inherited;
  VerificarOperacoes;
  VerificarEventos;
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
begin

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
end;

end.
