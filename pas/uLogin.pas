unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Padrao1, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, StdCtrls, Buttons, ExtCtrls,
  cxLabel, cxTextEdit, dxSkinsCore, dxSkinsDefaultPainters, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  TfrmLogin = class(TfrmPadrao1)
    edUsuario: TcxTextEdit;
    edSenha: TcxTextEdit;
    imgKey: TImage;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    lblUsuario: TcxLabel;
    lblSenha: TcxLabel;
    procedure edUsuarioExit(Sender: TObject);
    procedure edSenhaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    pv_sSenha: String[8];
  public
    { Public declarations }
    pb_lSenhaOk: Boolean;
    Function Executa: Boolean;
  end;

var
  frmLogin: TfrmLogin;

implementation

uses udmPrincipal, gsLib, UtilsDb, VarGlobais;

{$R *.dfm}

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
   pb_lSenhaOk := False;
end;

procedure TfrmLogin.btnOkClick(Sender: TObject);
Var
   sIdUsuario: String[3];
   sSenhaTemp,
   sSenhaTemp2: String[8];
begin
{
   pb_lSenhaOk := True;
   glb_iIdOperLogado := 1;
   glb_iIdOperExecut := glb_iIdOperLogado;
}
   if (Empty(edUsuario.Text)) and (Empty(edSenha.Text)) then exit;
   sSenhaTemp := Pesquisa('USUARIO','NOME_CURTO',
      Criptografa(edUsuario.Text,'1',20),'SENHA','');
   sSenhaTemp2:= Criptografa(edSenha.Text,'1',8);
   pb_lSenhaOk := (sSenhaTemp2 = sSenhaTemp);
   If Not pb_lSenhaOk Then
   Begin
      Mensagem('Senha ou Usuário Inválido ...','Erro !!!',MB_OK+MB_ICONERROR);
      edUsuario.SetFocus;
      Exit;
   End;
   sSenhaTemp2 := Criptografa(sSenhaTemp2,'2',8);
   sIdUsuario := Pesquisa('USUARIO','NOME_CURTO',
      Criptografa(edUsuario.Text,'1',20),'ID','');
   glb_iIdOperLogado := StrToInt(sIdUsuario);
   glb_iIdOperExecut := glb_iIdOperLogado;

   Close;

end;

procedure TfrmLogin.edSenhaExit(Sender: TObject);
Var
   sSenhaCript: String[8];
begin
   If Empty(edSenha.Text) Then Exit;
   sSenhaCript := Criptografa(edSenha.Text,'1',8);
   //sSenhaCript := edSenha.Text;
   If sSenhaCript <> pv_sSenha Then
   begin
      Mensagem('Senha Inválida ...','E r r o !!!',MB_OK+MB_ICONERROR);
      edSenha.SetFocus;
   end;
end;

procedure TfrmLogin.edUsuarioExit(Sender: TObject);
begin
   If Empty(edUsuario.Text) Then Exit;
   pv_sSenha := Pesquisa('USUARIO','NOME_CURTO',
      Criptografa(edUsuario.Text,'1',20),'SENHA','Nome de Usuário Inválido ...');
   if (pv_sSenha = '') then edUsuario.SetFocus;
end;

Function TfrmLogin.Executa: Boolean;
begin
   pb_lSenhaOk := False;
   ShowModal;
   Result := pb_lSenhaOk;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  if glb_iIdOperLogado = 0 then
  begin
     if DelphiCarregado then
     begin
        edUsuario.Text := 'GERASYS.TI';
        edSenha.Text   := 'gsti2010'; //'gstinew1';
     end else
        edUsuario.Text := '';
     edUsuario.SetFocus
  end else
  begin
     edUsuario.Text := Criptografa(Pesquisa('USUARIO','NOME_CURTO',
        edUsuario.Text,'ID',''),'2',20);
     edSenha.Text:= '';
     edSenha.SetFocus;
  end;
end;

end.
