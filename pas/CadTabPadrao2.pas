unit CadTabPadrao2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Padrao1, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, cxEdit, cxTextEdit, StdCtrls, cxGroupBox, cxPC,
  cxNavigator, cxDBNavigator, cxButtons, ExtCtrls, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, FMTBcd, DBClient, Provider,
  SqlExpr, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxLabel, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxBarBuiltInMenu, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmCadTabPadrao2 = class(TfrmPadrao1)
    pButtons: TPanel;
    btnNovo: TcxButton;
    btnAlterar: TcxButton;
    btnExcluir: TcxButton;
    btnFechar: TcxButton;
    Page1: TcxPageControl;
    ts1: TcxTabSheet;
    ts2: TcxTabSheet;
    Panel: TPanel;
    edPesquisa: TcxTextEdit;
    GridTable1: TcxGrid;
    GridTable1DBTableView1: TcxGridDBTableView;
    GridTable1DBTableView1Column1: TcxGridDBColumn;
    GridTable1DBTableView1Column2: TcxGridDBColumn;
    GridTable1DBTableView1Column3: TcxGridDBColumn;
    GridTable1Level1: TcxGridLevel;
    sds1: TSQLDataSet;
    dsp1: TDataSetProvider;
    cds1: TClientDataSet;
    ds1: TDataSource;
    lblTitColPesquisa: TcxLabel;
    PopupMenu1: TPopupMenu;
    Novo1: TMenuItem;
    Alterar1: TMenuItem;
    Exluir1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    btnImprimir: TcxButton;
    cxDBNavigator1: TcxDBNavigator;
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridDBTableView2ColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure GridTable1DBTableView1ColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure edPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Novo1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    pv_iTop,
    pv_iLeft: integer;
  public
    { Public declarations }
    g_sNomeTab,
    g_sNomeCampoPK,
    g_sTitJanela1,
    g_sTitJanela2   : String;
    g_sConfirmExclui: String;
    g_iIdAddEdit    : Integer;
  end;

var
  frmCadTabPadrao2: TfrmCadTabPadrao2;

implementation

uses UtilsDb, udmPrincipal, VarGlobais, gsLib;

{$R *.dfm}

procedure TfrmCadTabPadrao2.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadTabPadrao2.GridDBTableView2ColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
  lblTitColPesquisa.Caption := '&Pesquisar p/ '+GridTable1DBTableView1.Columns[AColumn.Index].Caption;
end;

procedure TfrmCadTabPadrao2.edPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //inherited;
  if Shift = [] then NavegaClient(Key,GridTable1DBTableView1);
end;

procedure TfrmCadTabPadrao2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//



end;

procedure TfrmCadTabPadrao2.FormCreate(Sender: TObject);
//Var
//   x: Extended;
begin
  inherited;
   {
   x := (glb_iWidth - Width) / 2;
   pv_iLeft := Inteiro(x);
   x := (glb_iHeight - Height) / 2;
   pv_iTop := Inteiro(x - 45) + 13;
   if (pv_iTop <= 0) then
   begin
      pv_iTop := 0;
      pv_iTop := pv_iTop + 23;
   end;
   }
   glb_sNomeForm1 := Self.Name;
   Position := poScreenCenter;
   //Self.Left:= pv_iLeft;
   //Self.Top := pv_iTop;
   Application.ProcessMessages;
end;

procedure TfrmCadTabPadrao2.FormDestroy(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmCadTabPadrao2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //inherited;
  If (Shift = []) And (Key = VK_RETURN) Then
     SelectNext(ActiveControl,True,True)
  Else
  If (Shift = [ssShift]) And (Key = VK_RETURN) Then
     SelectNext(ActiveControl,False,True)
  Else
  if ((Shift = []) And (Key = VK_F3)) Then
     edPesquisa.SetFocus;
end;

procedure TfrmCadTabPadrao2.FormShow(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmCadTabPadrao2.GridTable1DBTableView1ColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
  lblTitColPesquisa.Caption := '&Pesquisar p/ '+GridTable1DBTableView1.Columns[AColumn.Index].Caption;
end;

procedure TfrmCadTabPadrao2.Novo1Click(Sender: TObject);
begin
  if TMenuItem(Sender).Tag = 1 then
     btnNovo.Click
  else if TMenuItem(Sender).Tag = 2 then
     btnAlterar.Click
  else if TMenuItem(Sender).Tag = 3 then
     btnExcluir.Click
  else if TMenuItem(Sender).Tag = 4 then
     btnFechar.Click
end;

end.
