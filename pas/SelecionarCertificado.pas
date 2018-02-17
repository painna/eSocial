unit SelecionarCertificado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfrmSelecionarCertificado = class(TForm)
    pnlControle: TPanel;
    btnCancelar: TBitBtn;
    btnOk: TBitBtn;
    stgCertificado: TStringGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionarCertificado: TfrmSelecionarCertificado;

implementation

{$R *.dfm}

end.
