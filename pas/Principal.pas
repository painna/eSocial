unit Principal;

interface

uses
  StrUtils, DateUtils,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, SqlExpr, DB, DBClient, SimpleDS, Menus, IniFiles, ShellApi,
  ActnList, XPStyleActnCtrls, ActnMan, WideStrings, DBXInterbase, StdCtrls,
  cxHint, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer,
  ToolWin, ComCtrls, ImgList, dxStatusBar, cxTreeView,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxDBEdit, Provider,
  dxBarExtItems, dxBar, cxLookAndFeels,
  cxLookAndFeelPainters, DBXFirebird, StdActns, XPMan, cxDropDownEdit,
  cxCalendar, ExtCtrls, cxButtons, cxGroupBox, cxLabel, Buttons, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinsdxStatusBarPainter, dxSkinsdxBarPainter,
  ZipForge, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, dxSkinsForm, jpeg, dxSkinBlack,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, System.Actions, System.ImageList, cxImageList,
  eSocial.Controllers.Interfaces,
  eSocial.Controllers.Factory, Vcl.AppEvnts;

type
  TfrmPrincipal = class(TForm)
    stbInforme: TdxStatusBar;
    MainMenu: TMainMenu;
    Tabelas1: TMenuItem;
    imSair1: TMenuItem;
    imFerramentas: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    ActionManager: TActionManager;
    WindowCascade1: TWindowCascade;
    WindowClose1: TWindowClose;
    XPManifest1: TXPManifest;
    pnBarraFerramentas: TPanel;
    BrManager: TdxBarManager;
    qryUsuario: TSQLQuery;
    qryUsuarioID: TIntegerField;
    qryUsuarioNOME_CURTO: TStringField;
    qryUsuarioNOME_COMPLETO: TStringField;
    qryUsuarioSERVIDOR: TStringField;
    qryUsuarioID_SERVIDOR: TIntegerField;
    qryUsuarioCARGO_FUNCAO: TStringField;
    qryUsuarioOBSERVACAO: TStringField;
    qryUsuarioSENHA: TStringField;
    qryUsuarioACESS_TAB_CARGO: TStringField;
    qryUsuarioACESS_CAD_SERVID: TStringField;
    qryUsuarioALTERA_FICHA_FINANC: TStringField;
    qryUsuarioCALC_REAJUSTE_SAL: TStringField;
    qryUsuarioCALC_FOLHA: TStringField;
    qryUsuarioCANCEL_CALC_FOLHA: TStringField;
    qryUsuarioCONFIG_RELS: TStringField;
    qryUsuarioREL_TABELAS: TStringField;
    qryUsuarioREL_SERVIDORES: TStringField;
    qryUsuarioREL_FINANCEIROS: TStringField;
    qryUsuarioREL_DOCTOS: TStringField;
    qryUsuarioREL_OUTROS: TStringField;
    qryUsuarioGERADOR_RELS: TStringField;
    qryUsuarioCONFIG_ORGAO: TStringField;
    qryUsuarioCONFIG_SYSTEMA: TStringField;
    qryUsuarioEXPORT_CRED_SAL_CONTA: TStringField;
    qryUsuarioEXPORT_GFIP: TStringField;
    qryUsuarioEXPORT_RAIS: TStringField;
    qryUsuarioEXPORT_DIRF: TStringField;
    qryUsuarioEXPORT_TCM: TStringField;
    qryUsuarioEXPORT_OUTROS: TStringField;
    qryUsuarioCONSULTAR_CALC_SERVIDOR: TStringField;
    qryUsuarioREST_BACKUP: TStringField;
    qryUsuarioCOPY_EVENTO_MES_ANTER: TStringField;
    qryUsuarioIMPORT_EVENTO_TXT: TStringField;
    qryUsuarioEXECUT_COMAND_SQL: TStringField;
    qryUsuarioENCERRAR_REABRIR_MOVIM: TStringField;
    qryUsuarioCONFIG_SISTEMA: TStringField;
    qryUsuarioLAN_PAGTO_PREST_SERVICO: TStringField;
    qryUsuarioLAN_ATESTADO_MEDICO: TStringField;
    qryUsuarioLAN_PORT_DIARIA: TStringField;
    N31: TMenuItem;
    lblMsg1: TLabel;
    imgList24: TcxImageList;
    pnSubBarra: TPanel;
    Image2: TImage;
    Label1: TLabel;
    lblWhatsApp: TLinkLabel;
    ImageBackGround: TImage;
    sbSair: TSpeedButton;
    Image5: TImage;
    lblAcessoRemoto: TLabel;
    Image4: TImage;
    imConfigurarCertificado: TMenuItem;
    mnEnvio: TMenuItem;
    imEventoTabela: TMenuItem;
    imEventoPeriodico: TMenuItem;
    imEventoNaoPeriodico: TMenuItem;
    imgList16: TcxImageList;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    imConfigurarESocial: TMenuItem;
    imArquivoUnidadeGestora: TMenuItem;
    imArquivoEvento: TMenuItem;
    imArquivoAmbienteTrabalho: TMenuItem;
    imAtualizarSquemasXSD: TMenuItem;
    N1: TMenuItem;
    imBaixarBibliotecas: TMenuItem;
    AppEvents: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imSair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure lblWhatsAppLinkClick(Sender: TObject; const Link: string; LinkType: TSysLinkType);
    procedure lblAcessoRemotoClick(Sender: TObject);
    procedure imConfigurarCertificadoClick(Sender: TObject);
    procedure imEventoTabelaClick(Sender: TObject);
    procedure imConfigurarESocialClick(Sender: TObject);
    procedure imEventoNaoPeriodicoClick(Sender: TObject);
    procedure imEventoPeriodicoClick(Sender: TObject);
    procedure imArquivoUnidadeGestoraClick(Sender: TObject);
    procedure imArquivoEventoClick(Sender: TObject);
    procedure imArquivoAmbienteTrabalhoClick(Sender: TObject);
    procedure AppEventsActivate(Sender: TObject);
    procedure AppEventsModalBegin(Sender: TObject);
    procedure AppEventsModalEnd(Sender: TObject);

  private
    ICompetencia : IControllerCompetencia;

    pv_lPerguntaFechar,
    pv_lPrimeiraVez,
    pv_lVerVersao,
    pv_lInicializacao: Boolean;
    pv_sPerguntaBackup: String[1];
    pv_sFecharAplicacao: string[1];
    function JanelaExiste(Janela: TComponentName): Boolean;
    procedure WriteStringIniFile(ipsFileName, ipsSection, ipsIdent,
      ipsValue: String);
    function ReadStringIniFile(ipsFileName, ipsSection, ipsIdent,
      ipsDefault: String): String;
    procedure HabilitaItensMenu;
    function VerAnoMesTrava(sAnoMesCript: string): String;
    procedure ValidaAnoMesTrava;

  public

  end;

var
  frmPrincipal: TfrmPrincipal;
  Inicializacao: Boolean = True;

implementation

uses
  udmPrincipal,
  VarGlobais,
  gsLib,
  UtilsDb,
  uLogin,
  uSobre,

  udmESocial,
  ConfigurarESocial,
  EnvioEventoNaoPeriodico,
  EnvioEventoPeriodico,
  eSocial.Views.Esmaecer,
  eSocial.Views.ViewEventoTabelaEnviar,
  eSocial.Views.ViewEventoNaoPeriodicoEnviar,
  eSocial.Views.ViewEventoPeriodicoEnviar;

{$R *.dfm}

procedure TfrmPrincipal.imArquivoAmbienteTrabalhoClick(Sender: TObject);
begin
  Mensagem('Rotina ainda n�o dispon�vel nesta vers�o!', 'Informa��o', MB_ICONINFORMATION);
end;

procedure TfrmPrincipal.imArquivoEventoClick(Sender: TObject);
begin
  Mensagem('Rotina ainda n�o dispon�vel nesta vers�o!', 'Informa��o', MB_ICONINFORMATION);
end;

procedure TfrmPrincipal.imArquivoUnidadeGestoraClick(Sender: TObject);
begin
  Mensagem('Rotina ainda n�o dispon�vel nesta vers�o!', 'Informa��o', MB_ICONINFORMATION);
end;

procedure TfrmPrincipal.imConfigurarCertificadoClick(Sender: TObject);
begin
   if (MDIChildCount>0) then
   begin
      Mensagem('Voc� precisa Fechar todas as Janelas deste Programa, '+#13+
               'antes de Executar essa Opera��o ...',
               'Aviso !!!',MB_OK+MB_ICONEXCLAMATION);
      Exit;
   end;
   dmESocial.ConfigurarCertificado(Self);
end;

procedure TfrmPrincipal.imConfigurarESocialClick(Sender: TObject);
begin
   if (MDIChildCount>0) then
   begin
      Mensagem('Voc� precisa Fechar todas as Janelas deste Programa, '+#13+
               'antes de Executar essa Opera��o ...',
               'Aviso !!!',MB_OK+MB_ICONEXCLAMATION);
      Exit;
   end;

   try
     frmConfigurarESocial := TfrmConfigurarESocial.Create(Self);
     frmConfigurarESocial.ShowModal;
   finally
     FreeAndNil(frmConfigurarESocial);
   end;
end;

procedure TfrmPrincipal.imEventoNaoPeriodicoClick(Sender: TObject);
var
  iConfiguracao : IControllerConfiguracao;
begin
  if (MDIChildCount > 0) then
    Mensagem('Voc� precisa Fechar todas as Janelas deste Programa, ' + #13 +
             'antes de Executar essa Opera��o ...',
             'Aviso !!!', MB_ICONEXCLAMATION)
  else
//    Mensagem('Rotina ainda n�o dispon�vel nesta vers�o!' + #13 + 'Recurso em homologa��o.', 'Informa��o', MB_ICONINFORMATION);
  begin
    iConfiguracao := TControllerFactory.Configuracao;
    iConfiguracao.DAO.Get;

    if not iConfiguracao.ValidarConfiguracao then
      Mensagem('Verifique as pend�ncias informadas a seguir:' + #13#13 +
               iConfiguracao.Erros + #13 +
               'Antes de Executar essa Opera��o verifique as configura��es do sistema.',
               'Valida��o', MB_ICONERROR)
    else
    begin
      Screen.Cursor := crSQLWait;
      dmPrincipal.SConPrincipal.ExecuteDirect('execute procedure SP_ESOCIAL_EVENTOS_PEND_NAO_PER');
      Screen.Cursor := crDefault;

      EventoNaoPeriodicoEnviar(Self);
    end;
  end;
end;

procedure TfrmPrincipal.imEventoPeriodicoClick(Sender: TObject);
var
  iConfiguracao : IControllerConfiguracao;
begin
  if (MDIChildCount > 0) then
    Mensagem('Voc� precisa Fechar todas as Janelas deste Programa, ' + #13 +
             'antes de Executar essa Opera��o ...',
             'Aviso !!!', MB_ICONEXCLAMATION)
  else
    Mensagem('Rotina ainda n�o dispon�vel nesta vers�o!' + #13 + 'Recurso em homologa��o.', 'Informa��o', MB_ICONINFORMATION);
//  begin
//    iConfiguracao := TControllerFactory.Configuracao;
//    iConfiguracao.DAO.Get;
//
//    if not iConfiguracao.ValidarConfiguracao then
//      Mensagem('Verifique as pend�ncias informadas a seguir:' + #13#13 +
//               iConfiguracao.Erros + #13 +
//               'Antes de Executar essa Opera��o verifique as configura��es do sistema.',
//               'Valida��o', MB_ICONERROR)
//    else
//    begin
//      Screen.Cursor := crSQLWait;
//      dmPrincipal.SConPrincipal.ExecuteDirect('execute procedure SP_ESOCIAL_EVENTOS_PEND_TABELAS');
//      Screen.Cursor := crDefault;
//
//      EventoTabelaEnviar(Self);
//    end;
//  end;
end;

procedure TfrmPrincipal.imEventoTabelaClick(Sender: TObject);
var
  iConfiguracao : IControllerConfiguracao;
begin
  if (MDIChildCount > 0) then
    Mensagem('Voc� precisa Fechar todas as Janelas deste Programa, ' + #13 +
             'antes de Executar essa Opera��o ...',
             'Aviso !!!', MB_ICONEXCLAMATION)
  else
  begin
    iConfiguracao := TControllerFactory.Configuracao;
    iConfiguracao.DAO.Get;

    if not iConfiguracao.ValidarConfiguracao then
      Mensagem('Verifique as pend�ncias informadas a seguir:' + #13#13 +
               iConfiguracao.Erros + #13 +
               'Antes de Executar essa Opera��o verifique as configura��es do sistema.',
               'Valida��o', MB_ICONERROR)
    else
    begin
      Screen.Cursor := crSQLWait;
      dmPrincipal.SConPrincipal.ExecuteDirect('execute procedure SP_ESOCIAL_EVENTOS_PEND_TABELAS');
      Screen.Cursor := crDefault;

      EventoTabelaEnviar(Self);
    end;
  end;
end;

procedure TfrmPrincipal.AppEventsActivate(Sender: TObject);
begin
  Application.BringToFront;
end;

procedure TfrmPrincipal.AppEventsModalBegin(Sender: TObject);
begin
  if Self.Showing then
    if not TViewEsmaecer.GetInstance(Self).Showing then
      TViewEsmaecer.GetInstance(Application).Show;
end;

procedure TfrmPrincipal.AppEventsModalEnd(Sender: TObject);
begin
  if Self.Showing then
    TViewEsmaecer.GetInstance(Self).Close;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
label lblFim;
var
   lSenhaOk      : Boolean;
   sNomeUsuario  : String[40];
   sTipoOrgao    : string[1];
   iConta        : integer;
   iIdUsuarioSave: integer;
begin
  lSenhaOk := False;

  if not pv_lPrimeiraVez then
  begin
    if not dmPrincipal.SConPrincipal.Connected then
      dmPrincipal.SConPrincipal.Connected := True;

    Exit;
  end;

  if (pv_lInicializacao) then
  begin
    Self.WindowState := wsMaximized;
    Application.ProcessMessages;

    if not FileExists(ExtractFilePath(Application.ExeName)+'ShowMyPC3500.exe') then
       CopyFile(PChar(GetPathAtualizaVer+'\ShowMyPC3500.exe'), PChar(ExtractFilePath(Application.ExeName)+'ShowMyPC3500.exe'),True);

    if not frmSobre.pb_lContinuar then
       goto lblFim
    else if frmSobre.pb_lAtualizaExe then
    begin
      Atualiza_Executavel('REMUN_ESOCIAL');
      goto lblFim;
    end;

    frmSobre.Close;
    FreeAndNil(frmSobre);
    pv_lVerVersao := False;
  end
  else
    glb_iIdOperLogado := 1;

  // Validar o usu�rio passado por par�metro
  if (ParamCount = 1) then
  begin
    glb_iIdOperLogado := StrToIntDef(Trim(ParamStr(1)), 0);

    if (UpperCase(Trim(Pesquisa('USUARIO', 'ID', glb_iIdOperLogado.ToString, 'ATIVO', ''))) = 'S') then
      lSenhaOk := (UpperCase(Trim(Pesquisa('USUARIO', 'ID', glb_iIdOperLogado.ToString, 'ENVIA_ESOCIAL', ''))) = 'S');

    if not lSenhaOk then
      Mensagem('Usu�rio sem premiss�o para acessar este aplicativo', 'Aviso !!!', MB_ICONEXCLAMATION);
  end;

  if not lSenhaOk then
  begin
    frmLogin := TfrmLogin.Create(Self);
    if frmLogin.Executa then
    begin
      // Verificar permiss�o para envio de arquivos do e-Social
      lSenhaOk := (UpperCase(Trim(Pesquisa('USUARIO', 'ID', glb_iIdOperLogado.ToString, 'ENVIA_ESOCIAL', ''))) = 'S');
      if not lSenhaOk then
        Mensagem('Usu�rio sem premiss�o para acessar este aplicativo', 'Aviso !!!', MB_ICONEXCLAMATION);
    end;
  end;

  if (lSenhaOk) then
  begin
    sNomeUsuario  := Pesquisa('USUARIO','ID',IntToStr(glb_iIdOperLogado),'NOME_CURTO','');
    sNomeUsuario  := Criptografa(sNomeUsuario,'2',20);
    gUsuarioLogin := Trim(sNomeUsuario);
    stbInforme.Panels[2].Text := sNomeUsuario;
    pv_lPrimeiraVez           := False;
    HabilitaItensMenu;
  end
  else
  begin
    if pv_lInicializacao then
    begin
      lblFim:;
      Application.Terminate;
    end
    else
    begin
      glb_iIdOperLogado := iIdUsuarioSave;
      glb_iIdOperExecut := iIdUsuarioSave;
    end;
  end;

  pv_lInicializacao := False;
  FreeAndNil(frmLogin);
  Screen.Cursor := crDefault;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
var
  sPathExe: WideString;
  sLinReg: WideString;
  sStringList1: TStringList;
  iConta: Integer;
  lAlteraMes, lAlteraBanco: Boolean;
  sBancoAtual, sBancoTemp: string;
begin

   if not pv_lPerguntaFechar then
      Exit;

   sBancoAtual  := Trim(dmPrincipal.SConPrincipal.Params.Values['DataBase']);
   iConta       := Pos(':',sBancoAtual);
   sBancoAtual  := Copy(sBancoAtual,iConta+1,255);
   lAlteraMes   := False;
   sStringList1 := TStringList.Create;
   sPathexe     := ExtractFilePath(ParamStr(0));

   sStringList1.LoadFromFile(sPathexe + '\' + REMUNERATUS_INI);

   lAlteraMes   := AlteraIni(sStringList1,'ULT_ANO_MES',glb_sAnoMesTrab+' '+glb_sParcela);
   lAlteraBanco := AlteraIni(sStringList1,'ULT_ORGAO',sBancoAtual);

   if (lAlteraMes or lAlteraBanco) then
      sStringList1.SaveToFile(sPathexe + '\' + REMUNERATUS_INI);

   if (dmPrincipal.SConPrincipal.Connected) then
      dmPrincipal.SConPrincipal.Connected := False;

end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := (MDIChildCount=0);
   if (CanClose) then
     if (pv_lPerguntaFechar) then
        CanClose := Confirma('DESEJA REALMENTE ENCERRAR O PROGRAMA ?');
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
   sPathEXE: WideString;
   sAnoMesParcela: string[9];
   sAnoMesTrava: string[20];
   sHoraVerDb: String[8];
   iTemp: Integer;
begin
   glb_iHeigthBarraTop := pnSubBarra.Height;
   glb_sBancoOrgao := '';

   //if not DelphiCarregado then
   //begin
      try
         sAnoMesTrava := Pesquisa('CONFIG_ORGAO','ID','1','ANO_MES_TRAVA','');
      except
         try
            CriaCampoTab('CONFIG_ORGAO','ANO_MES_TRAVA','"VARCHAR(20)"');
            sAnoMesTrava := '00000000000000000000';
         except
         end
      end;

      if (sAnoMesTrava = '00000000000000000000') or
         (sAnoMesTrava = EmptyStr) then
      begin
         glb_sAnoMesTrava    := '198001';
         glb_sGeraRemBcoTrava:= glb_sAnoMesTrava;
         glb_sQuadrimTrava   := '0';
      end
      else
      begin
         try
            glb_sAnoMesTrava := VerAnoMesTrava(sAnoMesTrava);
         except
            glb_sAnoMesTrava := '191012';
         end;
      end;
   //end else
   //begin
   //   glb_sAnoMesTrava  := '209915';
   //   glb_sQuadrimTrava := '3';
   //end;

   try
      sHoraVerDb := Pesquisa('CONFIG_SISTEMA','ID','1','HORA_VER_DB','');
   except
      CriaCampoTab('CONFIG_SISTEMA','HORA_VER_DB','"VARCHAR(8)"');
   end;

   lblMsg1.Caption    := EmptyStr;
   glb_hHND_Principal := Handle;
   //glb_sAnoMesTrava := '201308';
   Self.Width         := Screen.Width;
   Self.Height        := Screen.Height;
   glb_iHeight        := ImageBackGround.Height;
   glb_iWidth         := ImageBackGround.Width;
   glb_iIdOperLogado  := 0;
   glb_iIdOperExecut  := 0;
   Left               := 0;
   Top                := 0;
   //Height := 734;
   //Width  := 1024;
   pv_lPerguntaFechar := True;
   pv_lPrimeiraVez    := True;
   pv_lVerVersao      := True;
   pv_lInicializacao  := True;

   try
      sAnoMesParcela  := GetUltAnoMes();
   except
      sAnoMesParcela  := '190101 0';
   end;

   glb_sAnoMesTrab    := LeftStr(sAnoMesParcela,6);
   glb_sParcela       := Copy(sAnoMesParcela,8,1);

   ValidaAnoMesTrava;

   if (RightStr(glb_sAnoMesTrab,2) <= '12') then
   begin
     if (glb_sAnoMesTrab > glb_sAnoMesTrava) then
        glb_sAnoMesTrab := glb_sAnoMesTrava;
   end;

   if (Trim(glb_sParcela) = EmptyStr) then
      glb_sParcela := '0';

   glb_sDescrParcela := DescrParcela(glb_sParcela,'N');
   glb_sSistema      := 'eSocial - Remuneratu$';

   try
     glb_sVersao := Versao_Executavel(Application.ExeName);
   except
     glb_sVersao := '00000';
   end;

   Self.Caption := glb_sSistema+' - [VER. '+glb_sVersao+']';

  Application.ProcessMessages;

  // For�ar a verifica��o de dados pendentes para envio e com isso a leitura de compet�ncias
  dmPrincipal.SConPrincipal.ExecuteDirect('execute procedure SP_ESOCIAL_EVENTOS_PEND_TABELAS');

  ICompetencia := TControllerFactory.Competencia;
  ICompetencia.DAO.Get;

  glb_sDescrMesAnoTrab := ICompetencia.DAO.This.Descricao + '/' + ICompetencia.DAO.This.Ano;
  glb_sAnoMesTrab      := ICompetencia.DAO.This.Ano + ICompetencia.DAO.This.Mes;

   stbInforme.Panels[0].Text := Criptografa(Pesquisa('CONFIG_ORGAO','ID','1','RAZAO_SOCIAL',''),'2',60);
   glb_sEmpresa              := stbInforme.Panels[0].Text;
   stbInforme.Panels[1].Text := glb_sDescrMesAnoTrab+' - '+glb_sDescrParcela+' ('+iIf(MovimEncerradoMesAno(glb_sAnoMesTrab,glb_sParcela),'ENCERRADO)','EM ABERTO)');
   stbInforme.Panels[3].Text := DateToStr(Date)+' ';
   sPathexe                  := ExtractFilePath(ParamStr(0));

   if FileExists(sPathEXE + '\Wallpaper_GeraSys.Ti_02.jpg') then
    ImageBackGround.Picture.LoadFromFile(sPathEXE + '\Wallpaper_GeraSys.Ti_02.jpg');
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
   sTipoOrgao: string[1];
begin
   pnSubBarra.Width     := Self.Width - pnBarraFerramentas.Width;
   sTipoOrgao           := Pesquisa('CONFIG_ORGAO','ID','1','TIPO_ORGAO','');
   lblWhatsApp.Caption  := '<a href="http://web.whatsapp.com">(94) 98119-4915</a>';
end;

procedure TfrmPrincipal.HabilitaItensMenu;
begin
   //
end;

procedure TfrmPrincipal.imSair1Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmPrincipal.Sobre1Click(Sender: TObject);
begin
   frmSobre := TfrmSobre.Create(Self);
   frmSobre.btnOk.Visible := True;
   frmSobre.ShowModal;
   FreeAndNil(frmSobre);
end;

function TfrmPrincipal.JanelaExiste(Janela: TComponentName): Boolean;
var
   wConta: Word;
begin
   Result := False;

   if (frmPrincipal.MDIChildCount=0) then
      Exit;

   for wConta:=0 To Pred(frmPrincipal.MDIChildCount) do
   begin
      Result := frmPrincipal.MDIChildren[wConta].Name = Janela;
      if (Result) then
         Break;
   end;
end;

procedure TfrmPrincipal.Label1MouseLeave(Sender: TObject);
begin
  Screen.Cursor := crDefault;
end;

procedure TfrmPrincipal.Label1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   Screen.Cursor := crHandPoint;
end;

procedure TfrmPrincipal.lblAcessoRemotoClick(Sender: TObject);
begin
   if FileExists(ExtractFilePath(Application.ExeName)+'ShowMyPC3500.exe') then
      ExecAndWait(ExtractFilePath(Application.ExeName)+'ShowMyPC3500.exe','',SW_SHOW)
   else
      Mensagem('O arquivo ShowMyPC3500.exe n�o est� presente na pasta.'+#13+
         'Contate o Suporte do Sistema.','AVISO !!!',MB_OK+MB_ICONEXCLAMATION);
end;

procedure TfrmPrincipal.lblWhatsAppLinkClick(Sender: TObject; const Link: string; LinkType: TSysLinkType);
Var
   sLink   : string;
begin

   sLink    := 'http://web.whatsapp.com';
   ShellExecute(0, nil, PChar(sLink), nil, nil, 1);

end;

procedure TfrmPrincipal.WriteStringIniFile(ipsFileName, ipsSection, ipsIdent,
   ipsValue: String); //ult. vs. 2010/06/16
  //escreve um valor em uma dada identidade de uma dada se��o de um dado arquivo ini
var
  lpifFile: TIniFile;
begin
  lpifFile := TIniFile.Create(ipsFileName); //abro o arquivo ini
  lpifFile.WriteString(ipsSection, ipsIdent, ipsValue); //escrevo o valor passado
  lpifFile.Free; //libero a vari�vel criada
end;

function TfrmPrincipal.ReadStringIniFile(ipsFileName, ipsSection, ipsIdent,
   ipsDefault: String): String; //ult. vs. 2010/06/16
  //l� um valor de uma dada identidade de uma dada se��o de um dado arquivo ini
var
  lpifFile: TIniFile;
begin
  lpifFile := TIniFile.Create(ipsFileName); //abro o arquivo ini
  Result := lpifFile.ReadString(ipsSection, ipsIdent, ipsDefault); //leio o valor desejado
  lpifFile.Free; //libero a vari�vel criada
end;

procedure TfrmPrincipal.Image2Click(Sender: TObject);
begin
   ShellExecute(0, nil, PChar('http://web.whatsapp.com'), nil, nil, 1);
end;

procedure TfrmPrincipal.ValidaAnoMesTrava;
Var
  iTemp: Integer;
begin
  try
    if (glb_sAnoMesTrava = EmptyStr) then glb_sAnoMesTrava := '201912'; // TEMP
    
     iTemp := StrToInt(LeftStr(glb_sAnoMesTrava,4));
     if ((RightStr(glb_sAnoMesTrava,2) < '01') or
         (RightStr(glb_sAnoMesTrava,2) > '12')) then
        glb_sAnoMesTrava := '190101';
  except
     glb_sAnoMesTrava := '190101';
  end;
end;

function TfrmPrincipal.VerAnoMesTrava(sAnoMesCript: string): String;
begin
  ;
end;

end.

