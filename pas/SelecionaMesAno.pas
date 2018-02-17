unit SelecionaMesAno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Padrao1, cxGraphics, cxControls, cxLookAndFeels, StrUtils,
  cxLookAndFeelPainters, cxContainer, cxEdit, Menus, StdCtrls, cxButtons,
  cxSpinEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxGroupBox, Buttons,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  TfrmSelecionaMesAno = class(TfrmPadrao1)
    gbMes: TcxGroupBox;
    cbMes: TcxComboBox;
    gbParcela: TcxGroupBox;
    cbParcela: TcxComboBox;
    gbAno: TcxGroupBox;
    edAno: TcxSpinEdit;
    btnOk_: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbMesPropertiesPopup(Sender: TObject);
    procedure cbMesPropertiesCloseUp(Sender: TObject);
    procedure cbParcelaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionaMesAno: TfrmSelecionaMesAno;

implementation

uses udmPrincipal, VarGlobais, gsLib;

{$R *.dfm}

procedure TfrmSelecionaMesAno.btnOkClick(Sender: TObject);
begin
   glb_sAnoMesTrab:=edAno.Text+PreencheZeros(IntToStr(cbMes.ItemIndex+1),2);

   if (glb_sAnoMesTrab>glb_sAnoMesTrava) then
      if (RightStr(glb_sAnoMesTrab,2)<'13') then
         glb_sAnoMesTrab:=glb_sAnoMesTrava;

   glb_sParcela:=IntToStr(cbParcela.ItemIndex);
   glb_sDescrParcela:=cbParcela.Text;
   glb_sDescrMesAnoTrab:=Maiusculas(NomeMes(StrToInt(RightStr(glb_sAnoMesTrab,2))))+
     ' / '+LeftStr(glb_sAnoMesTrab,4);
end;

procedure TfrmSelecionaMesAno.cbMesPropertiesCloseUp(Sender: TObject);
begin
   TcxComboBox(Sender).Tag := 0;
end;

procedure TfrmSelecionaMesAno.cbMesPropertiesPopup(Sender: TObject);
begin
   TcxComboBox(Sender).Tag := 1;
end;

procedure TfrmSelecionaMesAno.cbParcelaExit(Sender: TObject);
begin
   if not ((Trim(cbParcela.Text) = 'NORMAL') or
           (Trim(cbParcela.Text) = 'COMPLEMENTAR') or
           (Trim(cbParcela.Text) = 'AUXÍLIO ALIMENTAÇÃO')) then
      cbParcela.SetFocus;
end;

procedure TfrmSelecionaMesAno.FormShow(Sender: TObject);
begin
   inherited;
   cbMes.ItemIndex    := StrToInt(Copy(glb_sAnoMesTrab,5,2))-1;
   edAno.Value        := StrToInt(Copy(glb_sAnoMesTrab,1,4));
   cbParcela.ItemIndex:= StrToInt(glb_sParcela);
   cbMes.SetFocus;
end;

end.


