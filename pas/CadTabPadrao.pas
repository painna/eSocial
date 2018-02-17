unit CadTabPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Padrao1, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, cxContainer, FMTBcd, DBClient, Provider, SqlExpr, dxCore,
  dxGDIPlusClasses, ExtCtrls, cxTextEdit, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxNavigator, cxDBNavigator, StdCtrls, cxButtons, cxClasses, cxCheckBox,
  cxLabel, cxMaskEdit, cxDropDownEdit, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, jpeg, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  TfrmCadTabPadrao = class(TfrmPadrao1)
    pButtons: TPanel;
    btnNovo: TcxButton;
    btnAlterar: TcxButton;
    btnExcluir: TcxButton;
    btnFechar: TcxButton;
    GridTable: TcxGrid;
    GridTableDBTableView1: TcxGridDBTableView;
    GridTableLevel1: TcxGridLevel;
    dsp1: TDataSetProvider;
    cds1: TClientDataSet;
    ds1: TDataSource;
    PopupMenu1: TPopupMenu;
    Novo1: TMenuItem;
    Alterar1: TMenuItem;
    Exluir1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    GridTableDBTableView1Column7: TcxGridDBColumn;
    GridTableDBTableView1Column8: TcxGridDBColumn;
    Panel: TPanel;
    edPesquisa: TcxTextEdit;
    btnImprimir: TcxButton;
    cxLabel1: TcxLabel;
    qry1: TSQLQuery;
    Image1: TImage;
    cxDBNavigator1: TcxDBNavigator;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edPesquisaPropertiesChange(Sender: TObject);
    procedure GridTableDBTableView1ColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure btnFecharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure edPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Novo1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure cds1AfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure FormDestroy(Sender: TObject);
    procedure GridTableDBTableView1DblClick(Sender: TObject);
    procedure GridTableDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPesquisaKeyPress(Sender: TObject; var Key: Char);
  private
    pv_iTop,
    pv_iLeft: integer;
    procedure SetColGrid(iCol: Integer);
    { Private declarations }
  public
    { Public declarations }
    pb_sNomeTab,
    pb_sTextoSQL_Principal,
    pb_sNomeCampoPK,
    pb_sTitJanela1,
    pb_sTitJanela2,
    pb_sConfirmExclui: String;
    pb_iIdAddEdit    : Integer;
    pb_aCamposPesq   : array[1..5] of string;
    Procedure gsOpenClient;
    procedure PermissoesUsuario(iIdUsuario: integer; sNomeTab: String);
  end;

var
  frmCadTabPadrao: TfrmCadTabPadrao;

implementation

uses UtilsDb, gsLib, udmPrincipal, VarGlobais;

{$R *.dfm}

procedure TfrmCadTabPadrao.btnAlterarClick(Sender: TObject);
begin
   //


end;

procedure TfrmCadTabPadrao.btnExcluirClick(Sender: TObject);
begin
  if cds1.RecordCount = 0 then exit;
  if Confirma('Deseja Realmente EXCLUIR '+pb_sConfirmExclui+' '+pb_sTitJanela1+' ?') then
  begin
     //CancelGenerator(cds1.State,pb_sNomeGenerator,cds1.FieldByName(pb_sNomeCampoPK).Value);
     try
        ExcluiRegistro(cds1);
     except

     end;
  end;
end;

procedure TfrmCadTabPadrao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadTabPadrao.btnNovoClick(Sender: TObject);
begin
   //

end;

procedure TfrmCadTabPadrao.cds1AfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
   dmPrincipal.GeraLog(cds1,'3',pb_sNomeTab,Self.Name,'');
end;

procedure TfrmCadTabPadrao.edPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Shift = [] then NavegaClient(Key,GridTableDBTableView1);
end;

procedure TfrmCadTabPadrao.edPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //if CharEspeciais(Key) then Key := #0;
end;

procedure TfrmCadTabPadrao.edPesquisaPropertiesChange(Sender: TObject);
begin
   if not TcxTextEdit(Sender).Enabled then exit;
   gsOpenClient;
   //PesquisaIncremental(TcxTextEdit(Sender).Text,cds1);
end;

procedure TfrmCadTabPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cds1.Close;
end;

procedure TfrmCadTabPadrao.FormCreate(Sender: TObject);
Var
   x: Extended;
begin
   inherited;
   Position := poScreenCenter;
   Top      := Top - 80;
   Left     := Left - 51;
   Position := poDesigned;
   {x := (glb_iWidth - Width) / 2;
   pv_iLeft := Inteiro(x);
   Left := pv_iLeft;
   Top := 3;
   {
   x := (glb_iHeight - Height) / 2;
   pv_iTop := glb_iHeigthBarraTop + 5;
   if (pv_iTop <= 0) then
   begin
      pv_iTop := 0;
      pv_iTop := pv_iTop + 23;
   end;
   }

   glb_sNomeForm1 := Self.Name;
   if pb_sTextoSQL_Principal = EmptyStr then
      pb_sTextoSQL_Principal := 'select * from '+pb_sNomeTab;
   if pb_aCamposPesq[1] = EmptyStr then
      pb_aCamposPesq[1] := 'ID';
   if pb_aCamposPesq[2] = EmptyStr then
      pb_aCamposPesq[2] := 'DESCRICAO';

   Application.ProcessMessages;

end;

procedure TfrmCadTabPadrao.FormDestroy(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmCadTabPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
  iConta,
  iConta2,
  iQtdCols: Integer;
begin
  if (Shift = []) and (Key = VK_F3)  then
  begin
     if edPesquisa.Visible then
        edPesquisa.SetFocus;
  end else
  if key = VK_F4 then
  begin
     iConta  := 0;
     iQtdCols:= GridTableDBTableView1.ColumnCount - 1;
     while True do
     begin
        if iConta > iQtdCols then iConta := 0;
        if GridTableDBTableView1.Columns[iConta].SortOrder <> soNone then
        begin
           GridTableDBTableView1.Columns[iConta].SortOrder := soNone;
           GridTableDBTableView1.Columns[iConta].Styles.Header := Nil;
           iConta2 := iConta+1;
           while true do
           begin
              if iConta2 > iQtdCols then iConta2 := 0;
              if GridTableDBTableView1.Columns[iConta2].Tag = 1 then
              begin
                 GridTableDBTableView1.Columns[iConta2].SortOrder := soAscending;
                 GridTableDBTableView1.Columns[iConta2].Styles.Header := dmPrincipal.cxStyle20;
                 SetColGrid(iConta2);
                 exit;
              end;
              Inc(iConta2);
           end;
        end;
        Inc(iConta);
     end;
  end else
     inherited;
end;

procedure TfrmCadTabPadrao.FormShow(Sender: TObject);
begin
  inherited;
  gsOpenClient;
  Caption := pb_sTitJanela2;
  //GridTableDBTableView1ColumnHeaderClick(GridTableDBTableView1,GridTableDBTableView1.Columns[0]);
  SetColGrid(0);
  GridTable.SetFocus;

  PermissoesUsuario(glb_iIdOperLogado,pb_sNomeTab);

  //Sender: TcxGridTableView; AColumn: TcxGridColumn);
  //lblTitColPesquisa.Caption := 'Pesquisar por '+
  //   GridTableDBTableView1.Columns[0].Caption+':';
end;

procedure TfrmCadTabPadrao.GridTableDBTableView1ColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
Var
   iConta: Integer;
   sColsPesq: String;
begin
   {
   ColsPesq := ';'+pb_aCamposPesq[1]+';'+pb_aCamposPesq[2]+';';
   f pb_aCamposPesq[3] <> EmptyStr then
      sColsPesq := sColsPesq+';'+pb_aCamposPesq[3]+';';
   if pb_aCamposPesq[4] <> EmptyStr then
      sColsPesq := sColsPesq+';'+pb_aCamposPesq[4]+';';
   if pb_aCamposPesq[5] <> EmptyStr then
      sColsPesq := sColsPesq+';'+pb_aCamposPesq[5]+';';
   }
   SetColGrid(AColumn.Index);
   for iConta := 0 to TcxGridTableView(Sender).ColumnCount - 1 do
      TcxGridTableView(Sender).Columns[iConta].Styles.Header := nil;
   {
   for iConta := 0 to TcxGridTableView(Sender).ColumnCount - 1 do
      if Pos(TcxGridTableView(Sender).Columns[iConta].Name,sColsPesq) > 0 Then
         AColumn.Styles.Header := dmPrincipal.cxStyle7;}
   AColumn.Styles.Header := dmPrincipal.cxStyle7;
end;

procedure TfrmCadTabPadrao.GridTableDBTableView1DblClick(Sender: TObject);
begin
  if btnAlterar.Enabled then btnAlterar.Click;
end;

procedure TfrmCadTabPadrao.GridTableDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = []) and (Key = VK_RETURN) then btnAlterar.Click;
end;

Procedure TfrmCadTabPadrao.gsOpenClient;
Var
  sPesq: string;
begin
  sPesq := '%'+Trim(edPesquisa.Text)+'%';
  cds1.DisableControls;
  cds1.Close;
  qry1.SQL.Clear;
  qry1.SQL.Add(pb_sTextoSQL_Principal);
  if Trim(edPesquisa.Text) <> ''  then
  begin
     qry1.SQL.Add('where '+pb_aCamposPesq[1]+' like '+QuotedStr(sPesq)+
       ' or '+pb_aCamposPesq[2]+' like '+QuotedStr(sPesq));
     if pb_aCamposPesq[3] <> EmptyStr then
        qry1.SQL.Add(' or '+pb_aCamposPesq[3]+' like '+QuotedStr(sPesq));
     if pb_aCamposPesq[4] <> EmptyStr then
        qry1.SQL.Add(' or '+pb_aCamposPesq[4]+' like '+QuotedStr(sPesq));
     if pb_aCamposPesq[5] <> EmptyStr then
        qry1.SQL.Add(' or '+pb_aCamposPesq[5]+' like '+QuotedStr(sPesq));
  end;
  cds1.Open;
  cds1.EnableControls;
end;

procedure TfrmCadTabPadrao.Novo1Click(Sender: TObject);
begin
  if (TMenuItem(Sender).Tag = 1) and
     (btnNovo.Enabled) then
     btnNovo.Click
  else if (TMenuItem(Sender).Tag = 2) and
     (btnAlterar.Enabled) then
     btnAlterar.Click
  else if (TMenuItem(Sender).Tag = 3) and
     (btnExcluir.Enabled) then
     btnExcluir.Click
  else if TMenuItem(Sender).Tag = 4 then
     btnFechar.Click
end;

procedure TfrmCadTabPadrao.PermissoesUsuario(iIdUsuario: integer; sNomeTab: String);
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
     btnNovo.Enabled   := (oqryUsuarioPermissaoTabela.FieldByName('INCLUIR').Value='S');
     btnAlterar.Enabled:= (oqryUsuarioPermissaoTabela.FieldByName('ALTERAR').Value='S');
     btnExcluir.Enabled:= (oqryUsuarioPermissaoTabela.FieldByName('EXCLUIR').Value='S');
     oqryUsuarioPermissaoTabela.Close;
  finally
     FreeAndNil(oqryUsuarioPermissaoTabela);
  end;

  sTextSQL := 'SELECT REL_TABELAS FROM USUARIO WHERE ID = '+IntToStr(iIdUsuario);
  try
     oqryPermissaoEspecial := TSQLQuery.Create(Self);
     oqryPermissaoEspecial.SQLConnection := dmPrincipal.SConPrincipal;
     oqryPermissaoEspecial.SQL.Add(sTextSQL);
     oqryPermissaoEspecial.Open;
     btnImprimir.Enabled := (oqryPermissaoEspecial.FieldByName('REL_TABELAS').Value='S');
     oqryPermissaoEspecial.Close;
  finally
     FreeAndNil(oqryPermissaoEspecial);
  end;

end;

Procedure TfrmCadTabPadrao.SetColGrid(iCol: Integer);
begin
   //if lblTitColPesquisa.Enabled then
   //   lblTitColPesquisa.Caption:= '&Pesquisar por '+
   //      GridTableDBTableView1.Columns[iCol].Caption+':';
   cds1.IndexFieldNames := GridTableDBTableView1.Columns[iCol].DataBinding.FieldName;
end;

end.
