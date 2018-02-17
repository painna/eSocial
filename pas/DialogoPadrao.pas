unit DialogoPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Padrao1, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfrmDialogoPadrao = class(TfrmPadrao1)
    pnlControle: TPanel;
    btnCancelar: TBitBtn;
    btnOk: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogoPadrao: TfrmDialogoPadrao;

implementation

{$R *.dfm}

end.
