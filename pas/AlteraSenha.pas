unit AlteraSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Padrao1, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, StdCtrls, Buttons, ExtCtrls,
  cxLabel, cxTextEdit, dxSkinsCore, dxSkinsDefaultPainters, FMTBcd, DB, SqlExpr,
  DBClient, Provider, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  TfrmAlteraSenha = class(TfrmPadrao1)
    edConfirmSenha: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    edNovaSenha: TcxTextEdit;
    qryUsuario: TSQLQuery;
    provUsuario: TDataSetProvider;
    cdsUsuario: TClientDataSet;
    qryUsuarioID: TIntegerField;
    qryUsuarioSENHA: TStringField;
    cdsUsuarioID: TIntegerField;
    cdsUsuarioSENHA: TStringField;
    procedure edConfirmSenhaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function Executa: Boolean;
  end;

var
  frmAlteraSenha: TfrmAlteraSenha;

implementation

uses udmPrincipal, gsLib, UtilsDb, VarGlobais;

{$R *.dfm}

procedure TfrmAlteraSenha.btnOkClick(Sender: TObject);
Var
   sSenhaCript: string[8];
begin

   if (Empty(edNovaSenha.Text)) or
      (Empty(edConfirmSenha.Text)) then exit;

   edConfirmSenhaExit(edConfirmSenha);

   sSenhaCript := Criptografa(edNovaSenha.Text,'1',8);

   cdsUsuario.Close;
   qryUsuario.ParamByName('pUsuario').Value := glb_iIdOperLogado;
   cdsUsuario.Open;
   cdsUsuario.Edit;
   cdsUsuarioSENHA.Value := sSenhaCript;

   try
      SalvaTransacao(cdsUsuario);
      Mensagem('Senha Alterada com sucesso ...','P a r a b é n s !!!',
         MB_OK+MB_ICONEXCLAMATION);
   except

   end;

   {
   try
      try
         qryUsuario.ExecSQL();
         Mensagem('Senha Alterada com sucesso ...','P a r a b é n s !!!',
            MB_OK+MB_ICONEXCLAMATION);
      except
         on E: Exception do
         begin
            Mensagem('Não foi Posível Alterar a Senha ...'+#13+
               '('+E.Message+')',
               'Erro', MB_ICONERROR+MB_OK);
         end;
      end;
   finally
      qryUsuario.close;
   end;

   }

   cdsUsuario.Close;

   Close;

end;

procedure TfrmAlteraSenha.edConfirmSenhaExit(Sender: TObject);
begin
   If Empty(edConfirmSenha.Text) Then Exit;
   if edConfirmSenha.Text <> edNovaSenha.Text then
   begin
      Mensagem('As Senhas precisam ser iguais ...',
         'E r r o !!!',MB_OK+MB_ICONERROR);
      edNovaSenha.SetFocus;
   end;
end;

Function TfrmAlteraSenha.Executa: Boolean;
begin
  Result := (ShowModal = mrOK);
end;

procedure TfrmAlteraSenha.FormShow(Sender: TObject);
begin
   edNovaSenha.SetFocus;
end;

end.
