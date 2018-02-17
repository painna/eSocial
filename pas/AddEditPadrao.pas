unit AddEditPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, FMTBcd, DB,
  DBClient, Provider, SqlExpr, StdCtrls, cxButtons, ExtCtrls, cxClasses,
  cxStyles, cxGridTableView, cxContainer, cxEdit,
  cxControls, cxGroupBox, Padrao1, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, dxSkinsCore, dxSkinsDefaultPainters, dxSkinBlack, dxSkinBlue,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TfrmAddEditPadrao = class(TfrmPadrao1)
    PanelClient: TPanel;
    Panel: TPanel;
    btnCancelar: TcxButton;
    btnGravar: TcxButton;
    sds1: TSQLDataSet;
    dsp1: TDataSetProvider;
    cds1: TClientDataSet;
    ds1: TDataSource;
    lblPadrao: TcxLabel;
    procedure btnGravarClick(Sender: TObject);
    procedure cds1AfterInsert(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cds1AfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure cds1BeforeCancel(DataSet: TDataSet);
  private
    { Private declarations }
    pv_sFormCall : String;
  public
    { Public declarations }
    pv_iIdAddEdit: Integer;
    pb_sNovoNova,
    pb_sNomeTab,
    pb_sNomeCampoPK,
    pb_sNomeGenerator,
    pb_sTitJanela: String;
    pb_iId : Integer;
    pb_lAdd: Boolean;
    Function Executa(sFormCall: String; iId: Integer): Integer;
    //procedure HintInPanel(Sender: TObject); //esse é procedimento genérico
  end;

var
  frmAddEditPadrao: TfrmAddEditPadrao;

implementation

uses UtilsDb, gsLib, udmPrincipal, VarGlobais;

{$R *.dfm}

procedure TfrmAddEditPadrao.btnGravarClick(Sender: TObject);
begin
   if (cds1.State in [dsInsert, dsEdit]) then
   begin
      if Not Confirma('Gravar '+iIf(CDS1.State=dsInsert,'Nova '+pb_sTitJanela,'Alterações')+' ?') then exit;
      //BeforePostClient(cds1);
      SalvaTransacao(cds1);
      pv_iIdAddEdit := cds1.FieldByName(pb_sNomeCampoPK).Value;
   end;
   Close;
end;

procedure TfrmAddEditPadrao.cds1AfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  dmPrincipal.GeraLog(cds1,iIf(pb_lAdd,'1','2'),pb_sNomeTab,pv_sFormCall,Self.Name);
end;

procedure TfrmAddEditPadrao.cds1AfterInsert(DataSet: TDataSet);
begin
  cds1.FieldByName(pb_sNomeCampoPK).AsString := IncrementGenerator(pb_sNomeGenerator, 1);
end;

procedure TfrmAddEditPadrao.cds1BeforeCancel(DataSet: TDataSet);
begin
   try
      CancelGenerator(self.cds1.State,self.pb_sNomeTab,self.pb_sNomeCampoPK,
         self.cds1.FieldByName(self.pb_sNomeCampoPK).Value);
   except
   end;
end;

Function TfrmAddEditPadrao.Executa(sFormCall: String; iId: Integer): Integer;
Begin
  pv_sFormCall:= sFormCall;
  pv_iIdAddEdit:= 0;
  pb_lAdd      := (iId = 0);
  pb_iId       := iId;
  ShowModal;
  Result    := pv_iIdAddEdit;
End;

procedure TfrmAddEditPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (cds1.State in [dsInsert, dsEdit]) then
  begin
     cds1.Cancel;
     cds1.CancelUpdates;
  end;
  cds1.Close;
end;

procedure TfrmAddEditPadrao.FormCreate(Sender: TObject);
begin
  inherited;
  pb_sNovoNova := 'NOVA';
end;

procedure TfrmAddEditPadrao.FormShow(Sender: TObject);
Var
  i: Integer;
begin
  inherited;
  {
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TWinControl then
       TEdit(Components[i]).onEnter := HintInPanel;
       //to usando TEdit, pois em WinControl OnEnter é protegido
  }
  cds1.Close;
  sds1.ParamByName('pId').Value := pb_iId;
  cds1.Open;
  if pb_lAdd then
     cds1.Insert
  else
     cds1.Edit;
  Caption := iIf(pb_lAdd,pb_sNovoNova,'ALTERANDO')+' '+pb_sTitJanela;
end;

{
procedure TfrmAddEditPadrao.HintInPanel(Sender: TObject); //esse é procedimento genérico
begin
  if cds1.State = dsBrowse then exit;
  pnMsg.Caption := TWinControl(Sender).Hint;
end;
}

end.
