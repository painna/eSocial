unit AddEditPadrao2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, FMTBcd, DB,
  DBClient, Provider, SqlExpr, StdCtrls, cxButtons, ExtCtrls, cxClasses,
  cxStyles, cxGridTableView, cxContainer, cxEdit,
  Padrao1, cxControls, cxLabel, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TfrmAddEditPadrao2 = class(TfrmPadrao1)
    PanelClient: TPanel;
    sds1: TSQLDataSet;
    dsp1: TDataSetProvider;
    cds1: TClientDataSet;
    ds1: TDataSource;
    Panel: TPanel;
    btnCancelar: TcxButton;
    btnGravar: TcxButton;
    lblPadrao: TcxLabel;
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cds1AfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
  private
    { Private declarations }
    //procedure HintInPanel(Sender: TObject); //esse é procedimento genérico
  public
    { Public declarations }
    pb_sFormCall: String;
    pb_sNovoNova,
    pb_sNomeTab,
    pb_sNomeCampoPK,
    pb_sNomeGenerator,
    pb_sTitJanela: String;
    pb_iId1,
    pb_iId2,
    pb_iIdRet    : Integer;
    pb_lAdd      : Boolean;
    pb_iIdAddEdit: Integer;
    Function Executa(sFormCall: String; iId1,iId2,iIdRet: Integer; lAdd: Boolean): Integer;
  end;

var
  frmAddEditPadrao2: TfrmAddEditPadrao2;

implementation

uses UtilsDb, gsLib, udmPrincipal;

{$R *.dfm}

procedure TfrmAddEditPadrao2.btnGravarClick(Sender: TObject);
Var
  lOk: Boolean;
begin
  if (cds1.State in [dsInsert,dsEdit]) then
  begin
     if Not Confirma('Gravar '+iIf(CDS1.State=dsInsert,pb_sNovoNova + ' ' + pb_sTitJanela,'Alterações')+' ?') then exit;
     BeforePostClient(cds1);
     SalvaTransacao(cds1);
     //iIdAddEdit := cds1.FieldByName(g_sNomeCampoPK).Value;
  end;
  Close;
end;

procedure TfrmAddEditPadrao2.cds1AfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  dmPrincipal.GeraLog(cds1,iIf(pb_lAdd,'1','2'),pb_sNomeTab,pb_sFormCall,Self.Name);
end;

Function TfrmAddEditPadrao2.Executa(sFormCall: String; iId1,iId2,iIdRet: Integer; lAdd: Boolean): Integer;
Begin
  pb_sFormCall := sFormCall;
  pb_iIdAddEdit:= 0;
  pb_lAdd      := lAdd;
  pb_iId1      := iId1;
  pb_iId2      := iId2;
  pb_iIdRet    := iIdRet;
  ShowModal;
  Result    := pb_iIdAddEdit;
End;

procedure TfrmAddEditPadrao2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (cds1.State in [dsInsert,dsEdit]) then
  begin
     cds1.Cancel;
     cds1.CancelUpdates;
  end;
end;

procedure TfrmAddEditPadrao2.FormCreate(Sender: TObject);
begin
  inherited;
  pb_sNovoNova := 'NOVA';
end;

procedure TfrmAddEditPadrao2.FormShow(Sender: TObject);
Var
  i: Integer;
begin
  inherited;
  {
  for i := 0 to ComponentCount - 1 do
  if Components[i] is TWinControl then
    TEdit(Components[i]).onEnter := HintInPanel; //to usando TEdit, pois em WinControl OnEnter é protegido
  }
  Caption := iIf(pb_lAdd,pb_sNovoNova,'ALTERANDO')+' '+pb_sTitJanela;
end;

{
procedure TfrmAddEditPadrao2.HintInPanel(Sender: TObject); //esse é procedimento genérico
begin
  if cds1.State = dsBrowse then exit;
  pnMsg.Caption := TWinControl(Sender).Hint;
end;
}

end.
