unit EnvioEventoTabela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DialogoPadrao, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmEnvioEventoTabela = class(TfrmDialogoPadrao)
    gpbParametro: TGroupBox;
    gpbEvento: TGroupBox;
    cbS1000: TCheckBox;
    cbS1005: TCheckBox;
    cbS1010: TCheckBox;
    cbS1020: TCheckBox;
    cbS1030: TCheckBox;
    cbS1035: TCheckBox;
    Checb_ZeraBase: TCheckBox;
    cbS1040: TCheckBox;
    cbS1050: TCheckBox;
    cbS1060: TCheckBox;
    cbS1070: TCheckBox;
    cbS1080: TCheckBox;
    gpbOperacao: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnvioEventoTabela: TfrmEnvioEventoTabela;

implementation

{$R *.dfm}

end.
