program Remun_eSocial;

uses
  Forms,
  Principal in '..\pas\Principal.pas' {frmPrincipal},
  VarGlobais in '..\pas\VarGlobais.pas',
  UtilsDb in '..\pas\UtilsDb.pas',
  Padrao1 in '..\pas\Padrao1.pas' {frmPadrao1},
  CadTabPadrao2 in '..\pas\CadTabPadrao2.pas' {frmCadTabPadrao2},
  udmPrincipal in '..\pas\udmPrincipal.pas' {dmPrincipal: TDataModule},
  uEditComandosSQL in '..\pas\uEditComandosSQL.pas' {frmEditComandosSQL},
  gsLib in '..\pas\gsLib.pas',
  uSobre in '..\pas\uSobre.pas' {frmSobre},
  uLogin in '..\pas\uLogin.pas' {frmLogin},
  CadPadrao in '..\pas\CadPadrao.pas' {frmCadPadrao},
  AddEditPadrao in '..\pas\AddEditPadrao.pas' {frmAddEditPadrao},
  AddEditPadrao2 in '..\pas\AddEditPadrao2.pas' {frmAddEditPadrao2},
  AlteraSenha in '..\pas\AlteraSenha.pas' {frmAlteraSenha},
  uESocial in '..\pas\uESocial.pas',
  VareSocial in 'VareSocial.pas',
  SelecionaMesAno in '..\pas\SelecionaMesAno.pas' {frmSelecionaMesAno},
  ConfigurarCertificado in '..\pas\ConfigurarCertificado.pas' {frmConfigurarCertificado},
  udmESocial in '..\pas\udmESocial.pas' {dmESocial: TDataModule},
  SelecionarCertificado in '..\pas\SelecionarCertificado.pas' {frmSelecionarCertificado},
  DialogoPadrao in '..\pas\DialogoPadrao.pas' {frmDialogoPadrao},
  EnvioEventoTabela in '..\pas\EnvioEventoTabela.pas' {frmEnvioEventoTabela};

{$R *.res}

begin

  Application.Initialize;

  Application.Title := 'Remuneratu$ - eSocial';
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmSobre, frmSobre);
  Application.CreateForm(TfrmEditComandosSQL, frmEditComandosSQL);
  Application.CreateForm(TfrmSobre, frmSobre);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmAlteraSenha, frmAlteraSenha);
  Application.CreateForm(TfrmSelecionaMesAno, frmSelecionaMesAno);
  Application.CreateForm(TdmESocial, dmESocial);
  frmSobre.Show;
  frmSobre.Update;

  frmSobre.VerificaVersao('N');
  Application.Run;

end.
