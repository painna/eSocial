unit EnvioEventoPeriodico;

interface

uses
  udmESocial,
  ACBreSocial,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DialogoPadrao, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Samples.Gauges;

type
  TfrmEnvioEventoPeriodico = class(TfrmDialogoPadrao)
    gpbParametro: TGroupBox;
    lblAnoMes: TLabel;
    gpbOperacao: TRadioGroup;
    cmbAnoMes: TComboBox;
    gpbEvento: TGroupBox;
    Checb_ZeraBase: TCheckBox;
    pnlProcesso: TPanel;
    gagProcesso: TGauge;
    lblProcesso: TLabel;
    cbS1200: TCheckBox;
    cbS1202: TCheckBox;
    cbS1207: TCheckBox;
    cbS1210: TCheckBox;
    cbS1250: TCheckBox;
    cbS1260: TCheckBox;
    cbS1300: TCheckBox;
    cbS1299: TCheckBox;
    cbS1298: TCheckBox;
    cbS1295: TCheckBox;
    cbS1280: TCheckBox;
    cbS1270: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimparPainelProcesso(aVisualizar : Boolean);

    function GetESocial : TACBreSocial;
    function EventoSelecionado : Boolean; virtual; abstract;
    function GeradoEnviado : Boolean; virtual; abstract;
  public
    { Public declarations }
    property eSocial : TACBreSocial read GetESocial;
  end;

var
  frmEnvioEventoPeriodico: TfrmEnvioEventoPeriodico;

implementation

{$R *.dfm}

uses
  gsLib,
  UtilsDb,
  udmPrincipal,
  pcesConversaoeSocial;

{ TfrmEnvioEventoPeriodico }

procedure TfrmEnvioEventoPeriodico.btnOkClick(Sender: TObject);
begin
  if (gpbOperacao.ItemIndex = -1) then
    Mensagem('Favor selecionar o tipo de operação', 'Alerta!', MB_ICONWARNING)
  else
  if not EventoSelecionado then
    Mensagem('Favor selecionar o(s) evento(s) para geração/envio do(s) aquivos XML', 'Alerta!', MB_ICONWARNING)
  else
  if GeradoEnviado then
    ModalResult := mrOk;
end;

procedure TfrmEnvioEventoPeriodico.FormCreate(Sender: TObject);
begin
  inherited;
  dmESocial.ListarCompetenciasAdmissao(cmbAnoMes);
  LimparPainelProcesso(False);
//  cbS1035.Enabled := (Pesquisa('CONFIG_ESOCIAL', 'ID_CONFIG_ORGAO', '1', 'POSSUI_TABELA_CARREIRA', '') = FLAG_SIM);
end;

function TfrmEnvioEventoPeriodico.GetESocial: TACBreSocial;
begin
  Result := dmESocial.ACBrESocial;
end;

procedure TfrmEnvioEventoPeriodico.LimparPainelProcesso(aVisualizar: Boolean);
begin
  pnlProcesso.Visible  := aVisualizar;
  lblProcesso.Caption  := EmptyStr;
  gagProcesso.Progress := 0;
end;

end.
