unit uSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JPEG, Padrao1, StdCtrls, ExtCtrls, Buttons, StrUtils;

type
  TfrmSobre = class(TfrmPadrao1)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    lblCelular1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblCelular2: TLabel;
    lblTelFixo: TLabel;
    btnOk: TBitBtn;
    Panel3: TPanel;
    lblAguarde: TLabel;
    Image2: TImage;
    Memo1: TMemo;
    Memo3: TMemo;
    Memo2: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    pv_lPrimVez,
    pv_lVerVersao: Boolean;
  public
    { Public declarations }
    pb_lContinuar,
    pb_lAtualizaExe: Boolean;
    function VerificaVersao(sMsg: string): Boolean;
  end;

var
  frmSobre: TfrmSobre;

implementation

uses VarGlobais, gsLib, udmPrincipal, UtilsDb;

{$R *.dfm}

procedure TfrmSobre.Edit1Exit(Sender: TObject);
begin
  pv_lPrimVez := True;
  FormActivate(Self);
end;

procedure TfrmSobre.FormActivate(Sender: TObject);
begin
  inherited;
  {
  if pv_lPrimVez then
  begin
     VerificaVersao('N');
     pv_lPrimVez := False;
  end;}
end;

procedure TfrmSobre.FormCreate(Sender: TObject);
Var
  sEmpresa: String;
  sCNPJ: string[14];
  sDtVerDb: string[25];
  sTemp: string[10];
begin
  inherited;
  lblAguarde.Caption := '';
  sEmpresa := Pesquisa('CONFIG_ORGAO','ID','1','RAZAO_SOCIAL','');
  sEmpresa := Criptografa(sEmpresa,'2',60);
  sCNPJ := Pesquisa('CONFIG_ORGAO','ID','1','CNPJ','');
  sCNPJ := Criptografa(sCNPJ,'2',14);
  Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+
     '\GERASYS_Logo_2011.Jpg');
  try
     sDtVerDb := Pesquisa('CONFIG_SISTEMA','ID','1','DT_VER_DB','');
  except
     sDtVerDb := '01/01/2013';
  end;
  if Trim(sDtVerDb) = '' then
     sDtVerDb := '01/01/2013';
  sTemp := Pesquisa('CONFIG_SISTEMA','ID','1','HORA_VER_DB','');
  if Trim(sTemp) = '' then
     sTemp := '00:00:01';
  sDtVerDb := sDtVerDb+' - '+Trim(sTemp);

  Memo1.Lines.Clear;
  Memo1.Lines.Add(' ');
  Memo1.Lines.Add(glb_sSistema+' - Ver.: '+glb_sVersao);
  Memo1.Lines.Add(' ');
  Memo2.Lines.Clear;
  Memo2.Lines.Add('Este Software está Licenciado para: ');
  Memo2.Lines.Add(Trim(sEmpresa));
  Memo2.Lines.Add('CNPJ: '+FormatString('99.999.999/9999-99',sCNPJ));
  Memo2.Lines.Add('Até '+
                  NomeMes(StrToInt(Copy(glb_sAnoMesTrava,5,2)))+'/'+
                  leftStr(glb_sAnoMesTrava,4));
  Memo3.Lines.Clear;
  Memo3.Lines.Add('Banco de Dados: '+dmPrincipal.SConPrincipal.Params.Values['Database']);
  Memo3.Lines.Add('');
  Memo3.Lines.Add('Data da Versão do Banco de Dados: '+sDtVerDb);

end;

procedure TfrmSobre.FormShow(Sender: TObject);
begin
  inherited;
  lblAguarde.Caption := '';
  if not btnOk.Visible then
     lblAguarde.Caption := 'Aguarde, inicializando o sistema ...';
  if btnOk.Visible then
     btnOk.SetFocus;
{
   if pv_lInicializacao then
   begin
      frmSobre.Close;
      FreeAndNil(frmSobre);
      pv_lVerVersao := False;
   end else
      glb_iIdOperLogado := 0;
}

end;

Function TfrmSobre.VerificaVersao(sMsg: string): Boolean;
Var
  sNomePastaAtuaizaExe: WideString;
  sVersaoExe_db,
  sVersaoBackup,
  sUltimaVersao: String;
begin

  Screen.Cursor := crHourGlass;
  pb_lAtualizaExe := False;

  sVersaoBackup := Versao_Executavel(ExtractFilePath(Application.ExeName)+
     'BACKUP.EXE');
  sUltimaVersao := GetUltmaVersao('BACKUP');
  if sUltimaVersao <> '' then
  begin
     if StrToInt(ExtraiPonto(sUltimaVersao)) > StrToInt(ExtraiPonto(sVersaoBackup)) then
     begin
        if Confirma('Foi dectada uma Nova Versão do Programa de Backup.'+#13+
                 'Deseja fazer a Atualização do mesmo agora ?') then
        Atualiza_Executavel('BACKUP');
     end else
     if sMsg = 'S' then
        Mensagem('O Programa de Backup está atualizado ...',
          'Aviso !!!',MB_OK+MB_ICONINFORMATION);
  end;

  sUltimaVersao := GetUltmaVersao('REMUN_ESOCIAL');
  if sUltimaVersao = '' then
  begin
     if Confirma('Não foi possível verificar se há nova versão do Sistema.'+#13+
                 'Deseja continuar assim mesmo ? '+#13+
                 'Obs.: Caso Não, entre em contacto com o Suporte Técnico do Sistema') then
     begin
        Result        := True;
        pb_lContinuar := True;
     end
     else
     begin
        Result        := False;
        pb_lContinuar := False;
     end;
     Exit;
  end;

  if StrToInt(ExtraiPonto(sUltimaVersao)) > StrToInt(ExtraiPonto(glb_sVersao)) then
  begin
     Mensagem('Foi dectada uma Nova Versão deste Programa. '+#13+
              'O mesmo será fecahado para que seja feita a atualização automática ...',
              'Aviso !!!',
              MB_OK+MB_ICONEXCLAMATION);
     pb_lAtualizaExe := True;
     Result := False;
     pb_lContinuar := True;
  end else
  begin
     if sMsg = 'S' then
        Mensagem('Este Programa está atualizado ...',
          'Aviso !!!',MB_OK+MB_ICONINFORMATION);
     pb_lAtualizaExe := False;
     pb_lContinuar := True;
     {
     sVersaoExe_db := Pesquisa('CONFIG_ORGAO','ID','1','VER_EXE','');
     if StrToInt(ExtraiPonto(glb_sVersao)) > StrToInt(ExtraiPonto(sVersaoExe_db)) then
     begin
        if Confirma('Uma nova Versão foi detectada, o Sistema fará uma auto-verificação '+#13+
                 'de mudança(s) na Estrutura da Base de Dados. Caso haja, serão feitas'+#13+
                 'as auto-alterações necessárias. Deseja iniciar o procedimento agora ?') then
        begin
           frmAtualizaDb := TfrmAtualizaDb.Create(Self);
           frmAtualizaDb.Executa(glb_sVersao);
           FreeAndNil(frmAtualizaDb);
        end;
     end;
     }
  end;

  Screen.Cursor := crDefault;

end;

end.
