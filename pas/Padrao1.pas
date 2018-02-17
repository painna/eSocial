unit Padrao1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, ToolWin, Menus, StdCtrls, DB, jpeg,
  ExtCtrls, Mask, Buttons, DateUtils, ShellCtrls, DBCGrids, FileCtrl, ShellApi,
  MidasLib, cxControls, DBCtrls, IniFiles, Registry, DBClient, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinsForm;
type
  TfrmPadrao1 = class(TForm)
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    //procedure ProcessaMsg(var Msg: TMsg; var Handled: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPadrao1: TfrmPadrao1;

implementation

uses udmPrincipal;

{$R *.dfm}

procedure TfrmPadrao1.FormActivate(Sender: TObject);
begin
   if not dmPrincipal.SConPrincipal.Connected then
      dmPrincipal.SConPrincipal.Connected := True;
end;

procedure TfrmPadrao1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: Integer;
  NotOk: Boolean;
begin

  Notok := True;

  for i := 0 to ComponentCount - 1 do
    if ((Components[i] is TcxCustomComboBox) or (Components[i] is TcxCustomDateEdit))
      and TWinControl(Components[i]).Focused and (TWinControl(Components[i]).Tag = 1)  then
    begin
      NotOk := False;
      Break;
    end;

  if NotOk then
  begin
    If (Shift = []) And (Key = VK_RETURN) Then
       SelectNext(ActiveControl,True,True)
    Else
    If (Shift = [ssShift]) And (Key = VK_RETURN) Then
       SelectNext(ActiveControl,False,True);
  end;
end;

end.
