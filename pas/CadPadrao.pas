unit CadPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Padrao1, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, cxContainer, FMTBcd, DBClient, Provider, SqlExpr,
  dxGDIPlusClasses, ExtCtrls, cxTextEdit, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxNavigator, cxDBNavigator, StdCtrls, cxButtons, cxClasses,
  ComCtrls, cxLabel, cxMaskEdit, cxDropDownEdit, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TfrmCadPadrao = class(TfrmPadrao1)
    pButtons: TPanel;
    btnNovo: TcxButton;
    btnAlterar: TcxButton;
    btnExcluir: TcxButton;
    btnFechar: TcxButton;
    btnPesquisar: TcxButton;
    Panel1: TPanel;
    btnGravar: TcxButton;
    btnCancelar: TcxButton;
    PanelClient: TPanel;
    btnImprimir: TcxButton;
    Nav1: TcxDBNavigator;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure cds1AfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure cds1BeforeDelete(DataSet: TDataSet);
    procedure cds1BeforeCancel(DataSet: TDataSet);
  private
    { Private declarations }
    pv_iTop,
    pv_iLeft: integer;
    procedure HintInPanel(Sender: TObject);
  public
    { Public declarations }
    pb_sNomeTab,
    pb_sNomeCampoPK,
    pb_sTitJanela1,
    pb_sTitJanela2   : String;
    pb_sConfirmExclui: String;
    pb_iIdAddEdit    : Integer;
    pb_sNovoNova     : String;
    Procedure gsOpenClient;
    procedure PermissoesUsuario(iIdUsuario: integer; sNomeTab: String); //esse é procedimento genérico
  end;

var
  frmCadPadrao: TfrmCadPadrao;
  pv_lIncluir,
  pv_lAlterar,
  pv_lExcluir : Boolean;
  pv_sOperacao: string[1];
  pv_lConfirm : Boolean;

implementation

uses UtilsDb, gsLib, udmPrincipal, VarGlobais;

{$R *.dfm}

procedure TfrmCadPadrao.btnCancelarClick(Sender: TObject);
begin
   //CancelaTransacao(cds1,pb_sNomeTab); // implementar no form
   Panel1.Caption := ' Modo Consulta ...';

end;

procedure TfrmCadPadrao.btnExcluirClick(Sender: TObject);
begin
{  // implementar no form
   if cds1.RecordCount = 0 then exit;
   if Confirma('Deseja Realmente EXCLUIR '+pb_sConfirmExclui+' '+pb_sTitJanela1) then
   begin
      pb_sOperacao := '3';
      ExcluiRegistro(cds1);
   end;
   }
end;

procedure TfrmCadPadrao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadPadrao.btnGravarClick(Sender: TObject);
begin

  pv_lConfirm := Confirma('Gravar '+iIf(pv_sOperacao='1','Novo '+pb_sTitJanela1,'Alerações')+' ?');

{  // implementar no form
  if (cds1.State in [dsInsert, dsEdit]) then
  begin
     //if Not Confirma('Gravar '+iIf(CDS1.State=dsInsert,'Novo '+pb_sTitJanela1,'Alerações')+' ?') then exit;
     BeforePostClient(cds1);
     SalvaTransacao(cds1);
     Panel1.Caption := ' Modo Consulta ...';
  end;
  }
end;

procedure TfrmCadPadrao.btnNovoClick(Sender: TObject);
begin
  // implementar o controle de usuário
  if TcxButton(Sender).Tag = 1 then
  begin
     pv_sOperacao  := '1';
     Panel1.Caption:= ' Incluindo Novo ...'
  end else
  begin
     pv_sOperacao  := '2';
     Panel1.Caption:= ' Alterando ...';
  end;
end;

procedure TfrmCadPadrao.cds1AfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  //dmPrincipal.GeraLog(cds1,pb_sOperacao,pb_sNomeTab,Self.Name,''); // será feito no banco
end;

procedure TfrmCadPadrao.cds1BeforeCancel(DataSet: TDataSet);
begin
{
   CancelGenerator(cds1.State,pb_sNomeTab,pb_sNomeCampoPK,  // implementar em cada form
      cds1.FieldByName(pb_sNomeCampoPK).Value);
      }
end;

procedure TfrmCadPadrao.cds1BeforeDelete(DataSet: TDataSet);
begin
   //cds1BeforeCancel(cds1); // implementar em cada form
end;

procedure TfrmCadPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{
  if cds1.State in [dsInsert,dsEdit] then  // implementar em cada form
     CancelaTransacao(cds1,pb_sNomeTab);
  cds1.Close;
}
  Action := caFree;
end;

procedure TfrmCadPadrao.FormCreate(Sender: TObject);
Var
   x: Extended;
begin
  inherited;
  Panel1.Caption:= ' Modo Consulta ...';
  //pnMsg.Caption   := '';
  pb_sNovoNova    := 'Novo';
  {
  x := (glb_iHeight - Height) / 2;
  pv_iTop := glb_iHeigthBarraTop + 5;
  if pv_iTop < 0 then
     pv_iTop := pv_iTop + 13;
  }

  glb_sNomeForm1 := Self.Name;
  //Position := poDesktopCenter;
  //Self.Left:= pv_iLeft;

  Position := poDesigned;
  //Top := 0;
  x := (glb_iWidth - Width) / 2;
  pv_iLeft := Inteiro(x);
  Left := pv_iLeft;

  Application.ProcessMessages;

end;

procedure TfrmCadPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ((Shift = []) And (Key = VK_F3)) Then
     btnPesquisar.Click;
end;

procedure TfrmCadPadrao.FormShow(Sender: TObject);
begin


  inherited;
  PermissoesUsuario(glb_iIdOperLogado,pb_sNomeTab);

  Caption := pb_sTitJanela2;

end;

Procedure TfrmCadPadrao.gsOpenClient;
begin
  //cds1.Close;
  //cds1.Open;
end;

procedure TfrmCadPadrao.HintInPanel(Sender: TObject); //esse é procedimento genérico
begin
  //pnMsg.Caption := '';
  //if cds1.State = dsBrowse then exit;
  //pnMsg.Caption := TWinControl(Sender).Hint;
end;

procedure TfrmCadPadrao.PermissoesUsuario(iIdUsuario: integer; sNomeTab: String);
Var
  oQryUsuarioPermissaoTabela,
  oQryPermissaoEspecial     : TSQLQuery;
  sTextSQL                  : String;
begin

  sTextSQL := 'SELECT INCLUIR,ALTERAR,EXCLUIR FROM USUARIO_PERMISSAO_TABELA '+
     'WHERE (ID_USUARIO = '+IntToStr(iIdUsuario)+') AND (NOME_TABELA = '+QuotedStr(sNomeTab)+')';

  try
     oqryUsuarioPermissaoTabela := TSQLQuery.Create(Self);
     oqryUsuarioPermissaoTabela.SQLConnection := dmPrincipal.SConPrincipal;
     oqryUsuarioPermissaoTabela.SQL.Add(sTextSQL);
     oqryUsuarioPermissaoTabela.Open;
     pv_lIncluir       := (oqryUsuarioPermissaoTabela.FieldByName('INCLUIR').Value='S');
     pv_lAlterar       := (oqryUsuarioPermissaoTabela.FieldByName('ALTERAR').Value='S');
     pv_lExcluir       := (oqryUsuarioPermissaoTabela.FieldByName('EXCLUIR').Value='S');
     btnNovo.Enabled   := pv_lIncluir;
     btnAlterar.Enabled:= pv_lAlterar;
     btnExcluir.Enabled:= pv_lExcluir;
     oqryUsuarioPermissaoTabela.Close;
  finally
     FreeAndNil(oqryUsuarioPermissaoTabela);
  end;

  sTextSQL := 'SELECT REL_SERVIDORES FROM USUARIO WHERE ID = '+IntToStr(iIdUsuario);
  try

     oqryPermissaoEspecial := TSQLQuery.Create(Self);
     oqryPermissaoEspecial.SQLConnection := dmPrincipal.SConPrincipal;
     oqryPermissaoEspecial.SQL.Add(sTextSQL);
     oqryPermissaoEspecial.Open;
     btnImprimir.Enabled := (oqryPermissaoEspecial.FieldByName('REL_SERVIDORES').Value='S');
     oqryPermissaoEspecial.Close;
  finally
     FreeAndNil(oqryPermissaoEspecial);
  end;

end;

end.
