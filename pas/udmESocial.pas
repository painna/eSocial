unit udmESocial;

interface

uses
  udmPrincipal,
  ConfigurarCertificado,

  ACBrDFeConfiguracoes,
  ACBrBase,
  ACBrDFe,
  ACBrUtil,
  ACBreSocial,
  ACBrMail,
  ACBrDFeSSL,
  ACBrDFeOpenSSL,
  ACBreSocialWebServices,
  ACBrIntegrador,
  pcesConversaoeSocial,
  pcnConversao,

  TypInfo,
  synacode,
  blcksock,
  FileCtrl,
  StrUtils,
  Math,
  IniFiles,
  Windows,
  Forms,
  Dialogs,

  System.SysUtils, System.Classes, Controls, Vcl.StdCtrls, Vcl.Samples.Gauges,
  Data.FMTBcd, Data.SqlExpr, Data.DB, Datasnap.DBClient, Datasnap.Provider, ACBrValidador;

type
  TTipoOperacao = (toInclusao, toAlteracao, toExclusao);
//  TAnoMes = class
//    private
//      aAno : Integer;
//      aMes : Integer;
//    public
//      property Ano : Integer read aAno write aAno;
//      property Mes : Integer read aMes write aMes;
//  end;

  TProtocoloESocial = class(TObject)
    private
      aDataHota : TDateTime;
      aNumeroInscricao,
      aVersao   ,
      aNumero   : String;
      aArquivos : TStringList;
      procedure SetNumeroInscricao(Value : String);
      procedure SetVersao(Value : String);
      procedure SetNumero(Value : String);
    public
      property DataHora : TDateTime read aDataHota write aDataHota;
      property NumeroInscricao : String read aNumeroInscricao write SetNumeroInscricao;
      property Versao   : String read aVersao write SetVersao;
      property Numero   : String read aNumero write SetNumero;
      property Arquivos : TStringList read aArquivos write aArquivos;

      constructor Create(Value : String); overload;
      destructor Destroy; override;
  end;

  TdmESocial = class(TDataModule)
    ACBrESocial: TACBreSocial;
    ACBrMail: TACBrMail;
    dspTabela: TDataSetProvider;
    cdsTabela: TClientDataSet;
    qryTabela: TSQLQuery;
    ACBrValidador: TACBrValidador;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure btnSalvar(Sender: TObject);
  private
    { Private declarations }
    aForm : TfrmConfigurarCertificado;
    aMensagemRetorno : TStringList;
    procedure AtualizaSSLLibsCombo;
    procedure GravarConfiguracao;
    procedure SetSQL(aSQL : TStringList);

    function GetMensagemRetorno : TStringList;
    function ProximaCompetencia(aCompetencia : String) : String;
  public
    { Public declarations }
    property MensagemRetorno : TStringList read GetMensagemRetorno;

    procedure ListarCompetencias(aLista : TComboBox);
    procedure LerConfiguracao;

    function CertificadoInstalado : Boolean;
    function CertificadoValido : Boolean;
    function AmbienteWebServiceHomologacao : Boolean;
    function AmbienteWebServiceProducao : Boolean;

    // procedures eventos de tabela
    function Gerar_eSocial1000(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge) : Boolean;
    function Gerar_eSocial1005(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge) : Boolean;
    function Gerar_eSocial1010(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge) : Boolean;
    function Gerar_eSocial1020(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge) : Boolean; virtual; abstract;
    function Gerar_eSocial1030(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge) : Boolean;
    function Gerar_eSocial1035(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge) : Boolean; virtual; abstract;
    function Gerar_eSocial1040(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge) : Boolean; virtual; abstract;
    function Gerar_eSocial1050(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge) : Boolean; virtual; abstract;
    function Gerar_eSocial1060(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge) : Boolean; virtual; abstract;
    function Gerar_eSocial1070(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge) : Boolean; virtual; abstract;
    function Gerar_eSocial1080(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge) : Boolean; virtual; abstract;

    function ConfigurarCertificado(const AOwner : TComponent) : Boolean;
    function EventoEnviado_eSocial(aGrupo : TeSocialGrupo; aCompetencia : String;
      aLabel : TLabel; aProcesso : TGauge; var aProtocolo : TProtocoloESocial) : Boolean;
  end;

var
  dmESocial: TdmESocial;

  procedure ShowInforme(aTitulo, aMensagem : String);

  function IfThen(aExpressao : Boolean; aTrue, aFalse : tpSimNao) : tpSimNao; overload;
  function ValidarCPF(aCPF : String) : Boolean;

const
  FLAG_SIM = 'S';
  FLAG_NAO = 'N';
  FLAG_OPERACAO_INSERIR = 'I';
  FLAG_OPERACAO_ALTERAR = 'A';
  FLAG_OPERACAO_EXCLUIR = 'E';
  FLAG_OPERACAO_ENVIADO = 'P';

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  VarGlobais, gsLib, UtilsDb;

{$R *.dfm}

procedure ShowInforme(aTitulo, aMensagem : String);
begin
  Application.MessageBox(PChar(aMensagem), PChar(aTitulo), MB_ICONINFORMATION);
end;

function IfThen(aExpressao : Boolean; aTrue, aFalse : tpSimNao) : tpSimNao;
begin
  if aExpressao then
    Result := aTrue
  else
    Result := aFalse;
end;

procedure TdmESocial.AtualizaSSLLibsCombo;
begin
  if Assigned(aForm) then
    with aForm do
    begin
      cbSSLLib.ItemIndex     := Integer(ACBrESocial.Configuracoes.Geral.SSLLib);
      cbCryptLib.ItemIndex   := Integer(ACBrESocial.Configuracoes.Geral.SSLCryptLib);
      cbHttpLib.ItemIndex    := Integer(ACBrESocial.Configuracoes.Geral.SSLHttpLib);
      cbXmlSignLib.ItemIndex := Integer(ACBrESocial.Configuracoes.Geral.SSLXmlSignLib);

      cbSSLType.Enabled := (ACBrESocial.Configuracoes.Geral.SSLHttpLib in [httpWinHttp, httpOpenSSL]);
    end;
end;

function ValidarCPF(aCPF : String) : Boolean;
var
  sCpf : String;
begin
  sCpf := OnlyNumber(Trim(aCPF));
  with dmESocial, ACBrValidador do
  begin
    TipoDocto := docCPF;
    Documento := sCpf;
    Result    := ValidCPF(sCpf, False);
  end;
end;

procedure TdmESocial.btnSalvar(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    GravarConfiguracao;
    LerConfiguracao;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TdmESocial.CertificadoInstalado: Boolean;
begin
  if Assigned(ACBrESocial.Configuracoes.Certificados) then
    Result :=
      (Trim(ACBrESocial.Configuracoes.Certificados.NumeroSerie) <> EmptyStr) or
      ((Trim(ACBrESocial.Configuracoes.Certificados.ArquivoPFX) <> EmptyStr) and (Trim(ACBrESocial.Configuracoes.Certificados.Senha) <> EmptyStr))
  else
    Result := False;
end;

function TdmESocial.CertificadoValido: Boolean;
begin
  if Assigned(ACBrESocial.Configuracoes.Certificados) then
    Result := ACBrESocial.Configuracoes.Certificados.VerificarValidade
  else
    Result := False;
end;

function TdmESocial.AmbienteWebServiceHomologacao : Boolean;
begin
  if Assigned(ACBrESocial.Configuracoes.WebServices) then
    Result := (ACBrESocial.Configuracoes.WebServices.Ambiente = taHomologacao)
  else
    Result := False;
end;

function TdmESocial.AmbienteWebServiceProducao : Boolean;
begin
  if Assigned(ACBrESocial.Configuracoes.WebServices) then
    Result := (ACBrESocial.Configuracoes.WebServices.Ambiente = taProducao)
  else
    Result := False;
end;

function TdmESocial.ConfigurarCertificado(const AOwner: TComponent): Boolean;
begin
  if not Assigned(aForm) then
    aForm := TfrmConfigurarCertificado.Create(AOwner);

  try
    LerConfiguracao;
    Result := (aForm.ShowModal = mrOk);
  finally
  end;
end;

procedure TdmESocial.DataModuleCreate(Sender: TObject);
begin
  aForm := TfrmConfigurarCertificado.Create(Self);
  aForm.btnSalvarConfig.OnClick := btnSalvar;

//  ACBrIntegrador.PastaInput  := ExtractFilePath(ParamStr(0)) + 'Integra\In\';
//  ACBrIntegrador.PastaOutput := ExtractFilePath(ParamStr(0)) + 'Integra\Out\';
//  ACBrIntegrador.ArqLOG      := ExtractFilePath(ParamStr(0)) + 'Integra_log_' + FormatDateTime('yyyymmdd".txt"', Now);
//
//  if not DirectoryExists(ACBrIntegrador.PastaInput) then
//    ForceDirectories(ACBrIntegrador.PastaInput);
//  if not DirectoryExists(ACBrIntegrador.PastaOutput) then
//    ForceDirectories(ACBrIntegrador.PastaOutput);
end;

procedure TdmESocial.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(aForm) then
    FreeAndNil(aForm);
end;

function TdmESocial.EventoEnviado_eSocial(aGrupo: TeSocialGrupo;
  aCompetencia: String; aLabel: TLabel; aProcesso: TGauge;
  var aProtocolo : TProtocoloESocial): Boolean;
var
  aDataHora1 ,
  aDataHora2 ,
  aDataHora3 ,
  aDataHora4 ,
  aDataHora5 : TDateTime;
  aRetorno   : Boolean;
  I : Integer;
  sPath    ,
  sArquivo : String;
begin
  aRetorno := False;
  try
    aLabel.Caption     := 'Enviando...';
    aProcesso.Progress := aProcesso.MaxValue - 1;
    Application.ProcessMessages;

    ACBrESocial.Eventos.TipoEmpregador := ACBrESocial.Configuracoes.Geral.TipoEmpregador;
    ACBrESocial.Eventos.GerarXMLs;
    ACBrESocial.Eventos.SaveToFiles;

    I :=
      ACBrESocial.Eventos.Iniciais.Count   +
      ACBrESocial.Eventos.Tabelas.Count    +
      ACBrESocial.Eventos.Periodicos.Count +
      ACBrESocial.Eventos.NaoPeriodicos.Count;

    if (I = 0) then
      Mensagem('Sem dados para envio!', 'Aviso', MB_ICONINFORMATION)
    else
    begin

      aDataHora1 := Now;
      aDataHora2 := aDataHora1 + StrToTime('00:00:01');
      aDataHora3 := aDataHora1 + StrToTime('00:00:02');
      aDataHora4 := aDataHora1 + StrToTime('00:00:03');
      aDataHora5 := aDataHora1 + StrToTime('00:00:04');
      aRetorno   := ACBrESocial.Enviar(aGrupo);

      Sleep(3000);

      if aRetorno then
        with ACBrESocial.Eventos, ACBrESocial.WebServices.EnvioLote.RetEnvioLote do
        begin
          if Status.cdResposta in [201, 202] then
          begin
            aProtocolo.Versao   := dadosRecLote.versaoAplicRecepcao;
            aProtocolo.DataHora := dadosRecLote.dhRecepcao;
            aProtocolo.Numero   := dadosRecLote.Protocolo;
            aProtocolo.NumeroInscricao := IdeTransmissor.NrInsc;

            sPath    := PathWithDelim(ACBrESocial.Configuracoes.Arquivos.GetPatheSocial(aProtocolo.DataHora, ACBrESocial.Configuracoes.Geral.IdEmpregador));
            sArquivo := sPath + '\' + FormatDateTime('yyyymmddhhmmss', aDataHora1);

            // Pegar Arquivo de Envio
            if FileExists(sArquivo + '-env-lot.xml') then
              aProtocolo.Arquivos.Add(sArquivo + '-env-lot.xml');

            // Pegar Arquivo de Retorno
            if FileExists(sArquivo + '-rec.xml') then
              aProtocolo.Arquivos.Add(sArquivo + '-rec.xml')
            else
            begin
              sArquivo := sPath + '\' + FormatDateTime('yyyymmddhhmmss', aDataHora2);
              if FileExists(sArquivo + '-rec.xml') then
                aProtocolo.Arquivos.Add(sArquivo + '-rec.xml')
              else
              begin
                sArquivo := sPath + '\' + FormatDateTime('yyyymmddhhmmss', aDataHora3);
                if FileExists(sArquivo + '-rec.xml') then
                  aProtocolo.Arquivos.Add(sArquivo + '-rec.xml')
                else
                begin
                  sArquivo := sPath + '\' + FormatDateTime('yyyymmddhhmmss', aDataHora4);
                  if FileExists(sArquivo + '-rec.xml') then
                    aProtocolo.Arquivos.Add(sArquivo + '-rec.xml')
                  else
                  begin
                    sArquivo := sPath + '\' + FormatDateTime('yyyymmddhhmmss', aDataHora5);
                    if FileExists(sArquivo + '-rec.xml') then
                      aProtocolo.Arquivos.Add(sArquivo + '-rec.xml');
                  end;
                end;
              end;
            end;

            aLabel.Caption     := 'Envio realizado com sucesso...';
            aProcesso.Progress := aProcesso.MaxValue;
            Application.ProcessMessages;
          end
          else
          begin
            if not Assigned(aMensagemRetorno) then
              aMensagemRetorno := TStringList.Create;

            aMensagemRetorno.BeginUpdate;
            aMensagemRetorno.Clear;

            for I := 0 to Status.Ocorrencias.Count - 1 do
            begin
              with Status.Ocorrencias.Items[I] do
              begin
                aMensagemRetorno.Add('Ocorrencia '     + FormatFloat('###00', I + 1));
                aMensagemRetorno.Add('  Código.....: ' + FormatFloat('##00000', Codigo));
                aMensagemRetorno.Add('  Descrição..: ' + Descricao);
                aMensagemRetorno.Add('  Tipo.......: ' + IntToStr(Tipo));
                aMensagemRetorno.Add('  Localização: ' + Localizacao + #13#13);
              end;
            end;

            aMensagemRetorno.EndUpdate;

            aRetorno := False;
          end;
        end;

    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmESocial.Gerar_eSocial1000(aCompetencia: String;  aZerarBase : Boolean;
  aModoLancamento : TModoLancamento;
  aLabel: TLabel; aProcesso: TGauge): Boolean;
var
  aRetorno : Boolean;
  aSQL : TStringList;
  ok   : Boolean;
  I    : Integer;
begin
  aRetorno := False;
  aSQL := TStringList.Create;
  ok   := True;
  try
    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Select');
    aSQL.Add('    c.*');
    aSQL.Add('  , e.*');
    aSQL.Add('  , u.RAZAO_SOCIAL as ENTE_FERERATIVO');
    aSQL.Add('from CONFIG_ORGAO c');
    aSQL.Add('  inner join CONFIG_ESOCIAL e on (e.ID_CONFIG_ORGAO = c.ID)');
    aSQL.Add('  inner join UNID_GESTORA   u on (u.ID = e.ID_UNID_GESTORA)');
    aSQL.Add('where c.id = 1');
    aSQL.EndUpdate;
    SetSQL(aSQL);

    if cdsTabela.IsEmpty then
      raise Exception.Create('Dados de configuração de eSocial ainda não foram informado!');

    aSQL.BeginUpdate;
    case aModoLancamento of
      mlInclusao  : aSQL.Add('  and e.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_INSERIR));
      mlAlteracao : aSQL.Add('  and e.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_ALTERAR));
      mlExclusao  : aSQL.Add('  and e.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_EXCLUIR));
    end;
    aSQL.EndUpdate;
    SetSQL(aSQL);

    I := 1;

    aProcesso.MaxValue := cdsTabela.RecordCount;
    aProcesso.Progress := 0;
    Application.ProcessMessages;

    cdsTabela.First;
    while not cdsTabela.Eof do
    begin
      with ACBrESocial.Eventos.Iniciais.S1000.Add do
      begin
        // So tem na Versão 2.x4.1
        // taProducao, taProducaoRestrita
        evtInfoEmpregador.Sequencial      := StrToInt(IncrementGenerator('GEN_ESOCIAL_EVENTO_S1000', 1));
        evtInfoEmpregador.IdeEvento.TpAmb := taProducaoRestrita;

        evtInfoEmpregador.IdeEvento.ProcEmi := peAplicEmpregador;
        evtInfoEmpregador.IdeEvento.VerProc := Versao_Executavel(ParamStr(0));

        evtInfoEmpregador.IdeEmpregador.TpInsc := tiCNPJ;
        evtInfoEmpregador.IdeEmpregador.NrInsc := Criptografa(cdsTabela.FieldByName('CNPJ').AsString, '2', 14);

        evtInfoEmpregador.ModoLancamento := aModoLancamento;
        evtInfoEmpregador.InfoEmpregador.IdePeriodo.IniValid := aCompetencia;
        evtInfoEmpregador.InfoEmpregador.IdePeriodo.FimValid := '2099-12';

        with evtInfoEmpregador.InfoEmpregador.InfoCadastro do
        begin
          NmRazao   := Criptografa(cdsTabela.FieldByName('RAZAO_SOCIAL').AsString, '2', 60);
          ClassTrib := ct01; // CNPJ
          if aZerarBase then
          Begin
            NmRazao   := 'RemoverEmpregadorDaBaseDeDadosDaProducaoRestrita';
            ClassTrib := ct00;
          End;

          NatJurid         := Trim(ReplaceStr(cdsTabela.FieldByName('NAT_JURIDICA').AsString, '-', ''));
          IndCoop          := icCooperativadeTrabalho;
          IndConstr        := iconNaoeConstrutora;
          IndDesFolha      := idfNaoAplicavel;
          IndOptRegEletron := iorOptoupeloregistro;
          IndEntEd         := tpNao;
          IndEtt           := tpNao;
          nrRegEtt         := EmptyStr;

          InfoOp.nrSiafi            := Trim(cdsTabela.FieldByName('NRO_SIAFI').AsString);
          InfoOp.infoEnte.nmEnte    := Trim(cdsTabela.FieldByName('ENTE_FERERATIVO').AsString); // Nome do Entidade Federativa ao qual o órgão está vinculado
          InfoOp.infoEnte.uf        := eSStrTouf(ok, Trim(cdsTabela.FieldByName('ENDER_UF').AsString));
          InfoOp.infoEnte.codMunic  := cdsTabela.FieldByName('COD_MUNICIPIO_RAIS').AsInteger;   // Conforme Tabela do IBGE
          InfoOp.infoEnte.indRPPS   := IfThen(AnsiUpperCase(Trim(cdsTabela.FieldByName('POSSUI_RPPS').AsString)) = FLAG_SIM, tpSim, tpNao);
          InfoOp.infoEnte.subteto   := eSStrToIdeSubteto(ok, Trim(cdsTabela.FieldByName('SUBTETO_VENCTO_TIPO').AsString));
          InfoOp.infoEnte.vrSubteto := cdsTabela.FieldByName('SUBTETO_VENCTO_VALOR').AsCurrency; // Valor do subteto do Entedade Federativa

//          // Dados para empresas particulares
//
//          dadosIsencao.IdeMinLei    := 'Sigla Min';
//          dadosIsencao.NrCertif     := '1111';
//          dadosIsencao.DtEmisCertif := date;
//          dadosIsencao.DtVencCertif := date;
//          dadosIsencao.NrProtRenov  := '10';
//          dadosIsencao.DtProtRenov  := date;
//          dadosIsencao.DtDou        := date;
//          dadosIsencao.PagDou       := '111';

          Contato.NmCtt    := Trim(cdsTabela.FieldByName('CONTADOR_NOME').AsString);
          Contato.CpfCtt   := OnlyNumber(Trim(cdsTabela.FieldByName('CONTADOR_CPF').AsString));
          Contato.FoneFixo := OnlyNumber(Trim(cdsTabela.FieldByName('CONTADOR_FONEFIXO').AsString));
          Contato.FoneCel  := OnlyNumber(Trim(cdsTabela.FieldByName('CONTADOR_FONECELULAR').AsString));
          Contato.email    := AnsiLowerCase(Trim(cdsTabela.FieldByName('CONTADOR_EMAIL').AsString));

          InfoOrgInternacional.IndAcordoIsenMulta := iaiSemacordo;  // (iaiSemacordo, iaiComacordo);
        end;

        evtInfoEmpregador.InfoEmpregador.InfoCadastro.SoftwareHouse.Clear;

        with evtInfoEmpregador.InfoEmpregador.InfoCadastro.SoftwareHouse.Add do
        begin
          CnpjSoftHouse := '11122050000168';
          NmRazao  := 'GERASYS TECNOINFO LTDA - ME';
          NmCont   := 'Gerson Farias';
          Telefone := '94981194915';
          email    := 'gerasys.ti.adm@gmail.com';
        end;

        with evtInfoEmpregador.InfoEmpregador.InfoCadastro.InfoComplementares do
        begin
          SituacaoPJ.IndSitPJ := isPJSitNormal;
          SituacaoPF.IndSitPF := isPFSitNormal;
        end;

        evtInfoEmpregador.InfoEmpregador.NovaValidade.IniValid := aCompetencia;
        evtInfoEmpregador.InfoEmpregador.NovaValidade.FimValid := '2099-12';
      end;

      aLabel.Caption     := Trim(cdsTabela.FieldByName('ENTE_FERERATIVO').AsString);
      aProcesso.Progress := I;
      Application.ProcessMessages;
      Inc(I);

      cdsTabela.Next;
    end;

    aRetorno := True;
  finally
    aSQL.Free;
    Result := aRetorno;
  end;
end;

function TdmESocial.Gerar_eSocial1005(aCompetencia: String; aZerarBase: Boolean; aModoLancamento: TModoLancamento;
  aLabel: TLabel; aProcesso: TGauge): Boolean;
var
  aRetorno : Boolean;
  aSQL : TStringList;
  ok   : Boolean;
  I    : Integer;
begin
  aRetorno := False;
  aSQL := TStringList.Create;
  ok   := True;
  try
//    for i := 0 to 2 do
//    begin
//      with ACBreSocial1.Eventos.Iniciais.S1005.Add do
//      begin
//        evtTabEstab.Sequencial := 0;
//
//        evtTabEstab.IdeEvento.TpAmb := taProducaoRestrita;
//        evtTabEstab.IdeEvento.ProcEmi := TpProcEmi(0);
//        evtTabEstab.IdeEvento.VerProc := '1.0';
//
//        evtTabEstab.IdeEmpregador.TpInsc := tiCPF;
//        evtTabEstab.IdeEmpregador.NrInsc := '0123456789';
//
//        evtTabEstab.ModoLancamento := TModoLancamento(i);
//        evtTabEstab.infoEstab.IdeEstab.TpInsc := tiCNPJ;
//        evtTabEstab.infoEstab.IdeEstab.NrInsc := '012345678901234';
//        evtTabEstab.infoEstab.IdeEstab.IniValid := '2015-05';
//        evtTabEstab.infoEstab.IdeEstab.FimValid := '2099-12';
//
//        evtTabEstab.infoEstab.DadosEstab.cnaePrep := '2015';
//
//        evtTabEstab.infoEstab.DadosEstab.aliqGilrat.AliqRat := arat1;
//        evtTabEstab.infoEstab.DadosEstab.aliqGilrat.Fap := 1.5;
//        evtTabEstab.infoEstab.DadosEstab.aliqGilrat.AliqRatAjust := 2.5;
//
//        evtTabEstab.infoEstab.DadosEstab.aliqGilrat.ProcAdmJudRat.tpProc := tpTpProc(1);
//        evtTabEstab.infoEstab.DadosEstab.aliqGilrat.ProcAdmJudRat.nrProc := '20150512';
//        evtTabEstab.infoEstab.DadosEstab.aliqGilrat.ProcAdmJudRat.codSusp := '1';
//
//        evtTabEstab.infoEstab.DadosEstab.aliqGilrat.ProcAdmJudFap.tpProc := tpTpProc(1);
//        evtTabEstab.infoEstab.DadosEstab.aliqGilrat.ProcAdmJudFap.nrProc := '20150512';
//        evtTabEstab.infoEstab.DadosEstab.aliqGilrat.ProcAdmJudFap.codSusp := '2';
//
//        evtTabEstab.infoEstab.DadosEstab.infoCaepf.tpCaepf := tcContrIndividual;
//
//        evtTabEstab.infoEstab.DadosEstab.infoObra.indSubstPatrObra := tpIndSubstPatronalObra(1);
//
//        evtTabEstab.infoEstab.DadosEstab.infoTrab.regPt := tpRegPt(3);
//
//        evtTabEstab.infoEstab.DadosEstab.infoTrab.infoApr.contApr := tpContApr(2);
//        evtTabEstab.infoEstab.DadosEstab.infoTrab.infoApr.nrProcJud := '20150612';
//        evtTabEstab.infoEstab.DadosEstab.infoTrab.infoApr.contEntEd := tpSim;
//        with evtTabEstab.infoEstab.DadosEstab.infoTrab.infoApr.infoEntEduc.Add do
//          NrInsc := '0123456789';
//
//        evtTabEstab.infoEstab.DadosEstab.infoTrab.infoPCD.contPCD := tpContPCD(9);
//        evtTabEstab.infoEstab.DadosEstab.infoTrab.infoPCD.nrProcJud := '20160131';
//
//        evtTabEstab.infoEstab.NovaValidade.IniValid := '2014-05';
//        evtTabEstab.infoEstab.NovaValidade.FimValid := '2099-12';
//      end;
//    end;

    aRetorno := True;
  finally
    aSQL.Free;
    Result := aRetorno;
  end;
end;

function TdmESocial.Gerar_eSocial1010(aCompetencia: String; aZerarBase: Boolean; aModoLancamento: TModoLancamento;
  aLabel: TLabel; aProcesso: TGauge): Boolean;
var
  aRetorno : Boolean;
  aSQL : TStringList;
  ok   : Boolean;
  I    : Integer;
begin
  aRetorno := False;
  aSQL := TStringList.Create;
  ok   := True;
  try
    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Select');
    aSQL.Add('    e.*');
    aSQL.Add('  , (Select CNPJ from CONFIG_ORGAO c where c.id = 1) as CNPJ ');
    aSQL.Add('from EVENTO e');
    aSQL.Add('where (coalesce(e.nat_rubrica, '''') <> '''')');

    case aModoLancamento of
      mlInclusao  : aSQL.Add('  and e.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_INSERIR));
      mlAlteracao : aSQL.Add('  and e.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_ALTERAR));
      mlExclusao  : aSQL.Add('  and e.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_EXCLUIR));
    end;

    aSQL.EndUpdate;
    SetSQL(aSQL);

    I := 1;

    aProcesso.MaxValue := cdsTabela.RecordCount;
    aProcesso.Progress := 0;
    Application.ProcessMessages;

    cdsTabela.First;
    while not cdsTabela.Eof do
    begin
      with ACBrESocial.Eventos.Tabelas.S1010.Add do
      begin
        evtTabRubrica.Sequencial := StrToInt(IncrementGenerator('GEN_ESOCIAL_EVENTO_S1010', 1));

        evtTabRubrica.IdeEvento.TpAmb   := taProducaoRestrita;
        evtTabRubrica.IdeEvento.ProcEmi := peAplicEmpregador;
        evtTabRubrica.IdeEvento.VerProc := Versao_Executavel(ParamStr(0));

        evtTabRubrica.IdeEmpregador.TpInsc := tiCNPJ;
        evtTabRubrica.IdeEmpregador.NrInsc := Criptografa(cdsTabela.FieldByName('CNPJ').AsString, '2', 14);

        evtTabRubrica.ModoLancamento := aModoLancamento;

        evtTabRubrica.infoRubrica.IdeRubrica.CodRubr    := Trim(cdsTabela.FieldByName('codigo').AsString);
        evtTabRubrica.infoRubrica.IdeRubrica.ideTabRubr := Trim(cdsTabela.FieldByName('id').AsString);
        evtTabRubrica.infoRubrica.IdeRubrica.IniValid   := aCompetencia;
        evtTabRubrica.infoRubrica.IdeRubrica.FimValid   := ProximaCompetencia(aCompetencia);

        evtTabRubrica.infoRubrica.DadosRubrica.dscRubr  := AnsiUpperCase(Trim(cdsTabela.FieldByName('descricao').AsString));
        evtTabRubrica.infoRubrica.DadosRubrica.natRubr  := StrToIntDef(Trim(cdsTabela.FieldByName('nat_rubrica').AsString), 0);

        if (Trim(cdsTabela.FieldByName('tipo').AsString) = 'V') then
          evtTabRubrica.infoRubrica.DadosRubrica.tpRubr := tpVencimento
        else
        if (Trim(cdsTabela.FieldByName('tipo').AsString) = 'D') then
          evtTabRubrica.infoRubrica.DadosRubrica.tpRubr := tpDesconto;

        evtTabRubrica.infoRubrica.DadosRubrica.codIncCP   := tpCodIncCP(1);
        evtTabRubrica.infoRubrica.DadosRubrica.codIncIRRF := tpCodIncIRRF(1);
        evtTabRubrica.infoRubrica.DadosRubrica.codIncFGTS := tpCodIncFGTS(1);
        evtTabRubrica.infoRubrica.DadosRubrica.codIncSIND := tpCodIncSIND(1);
        evtTabRubrica.infoRubrica.DadosRubrica.observacao := AnsiUpperCase(Trim(cdsTabela.FieldByName('descr_categ_tcm').AsString));

        evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoCP.Clear;

//        with evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoCP.Add do
//        begin
//          nrProc := '1020';
//          ExtDecisao := tpExtDecisao(1);
//          codSusp := '1';
//        end;
//
//        evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoIRRF.Clear;
//
//        with evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoIRRF.Add do
//        begin
//          nrProc := '1020';
//          codSusp := '2';
//        end;
//
//        evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoFGTS.Clear;
//
//        with evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoFGTS.Add do
//        begin
//          nrProc := '50740';
//        end;
//
//        evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoSIND.Clear;
//
//        with evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoSIND.Add do
//        begin
//          nrProc := '50';
//        end;

        if (evtTabRubrica.ModoLancamento = mlAlteracao) then
        begin
          evtTabRubrica.infoRubrica.NovaValidade.IniValid := aCompetencia;
          evtTabRubrica.infoRubrica.NovaValidade.FimValid := '2099-12';
        end;
      end;

      aLabel.Caption     := Trim(cdsTabela.FieldByName('DESCRICAO').AsString);
      aProcesso.Progress := I;
      Application.ProcessMessages;
      Inc(I);

      cdsTabela.Next;
    end;

    aRetorno := True;
  finally
    aSQL.Free;
    Result := aRetorno;
  end;
end;

function TdmESocial.Gerar_eSocial1030(aCompetencia: String; aZerarBase: Boolean; aModoLancamento: TModoLancamento;
  aLabel: TLabel; aProcesso: TGauge): Boolean;
var
  aRetorno : Boolean;
  aSQL : TStringList;
  ok   : Boolean;
  I    : Integer;
begin
  aRetorno := False;
  aSQL := TStringList.Create;
  ok   := True;
  try
    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Select');
    aSQL.Add('    f.*');
    aSQL.Add('  , c.codigo as cbo ');
    aSQL.Add('  , e.cod_rais as escolaridade ');
    aSQL.Add('  , Case when coalesce(f.dt_extinsao, current_date) > cast(' + QuotedStr(aCompetencia + '-01') + ' as date) then 0 else 1 end extinto');
    aSQL.Add('  , (Select CNPJ from CONFIG_ORGAO c where c.id = 1) as CNPJ ');
    aSQL.Add('from CARGO_FUNCAO f');
    aSQL.Add('  left join CBO c on (c.id = f.id_cbo)');
    aSQL.Add('  left join ESCOLARIDADE e on (e.id = f.id_escolaridade)');
    aSQL.Add('where (c.id > 0)');

    case aModoLancamento of
      mlInclusao  : aSQL.Add('  and f.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_INSERIR));
      mlAlteracao : aSQL.Add('  and f.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_ALTERAR));
      mlExclusao  : aSQL.Add('  and f.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_EXCLUIR));
    end;

    aSQL.EndUpdate;
    SetSQL(aSQL);

    I := 1;

    aProcesso.MaxValue := cdsTabela.RecordCount;
    aProcesso.Progress := 0;
    Application.ProcessMessages;

    cdsTabela.First;
    while not cdsTabela.Eof do
    begin
      with ACBrESocial.Eventos.Tabelas.S1030.Add do
      begin
        evtTabCargo.Sequencial := 0;

        evtTabCargo.IdeEvento.TpAmb   := taProducaoRestrita;
        evtTabCargo.IdeEvento.ProcEmi := peAplicEmpregador;
        evtTabCargo.IdeEvento.VerProc := Versao_Executavel(ParamStr(0));

        evtTabCargo.IdeEmpregador.TpInsc := tiCNPJ;
        evtTabCargo.IdeEmpregador.NrInsc := Criptografa(cdsTabela.FieldByName('CNPJ').AsString, '2', 14);

        evtTabCargo.ModoLancamento := aModoLancamento;

        evtTabCargo.infoCargo.IdeCargo.CodCargo := cdsTabela.FieldByName('id').AsString;
        evtTabCargo.infoCargo.IdeCargo.IniValid := aCompetencia;
        evtTabCargo.infoCargo.IdeCargo.FimValid := '2099-12';

        evtTabCargo.infoCargo.DadosCargo.nmCargo := AnsiUpperCase(Trim(cdsTabela.FieldByName('descricao').AsString));
        evtTabCargo.infoCargo.DadosCargo.codCBO  := cdsTabela.FieldByName('cbo').AsString;

//        evtTabCargo.infoCargo.DadosCargo.cargoPublico.acumCargo   := tpAcumCargo(0);
//        evtTabCargo.infoCargo.DadosCargo.cargoPublico.contagemEsp := tpContagemEsp(0);
//        evtTabCargo.infoCargo.DadosCargo.cargoPublico.dedicExcl   := tpSimNao(0);

        if (not cdsTabela.FieldByName('data_ato_criacao').IsNull) then
        begin
          evtTabCargo.infoCargo.DadosCargo.cargoPublico.leiCargo.nrLei := FormatFloat('#######00000', StrToCurrDef(Trim(cdsTabela.FieldByName('num_ato_criacao').AsString), 0));
          evtTabCargo.infoCargo.DadosCargo.cargoPublico.leiCargo.dtLei := cdsTabela.FieldByName('data_ato_criacao').AsDateTime;
        end
        else
        begin
          evtTabCargo.infoCargo.DadosCargo.cargoPublico.leiCargo.nrLei := '11111';
          evtTabCargo.infoCargo.DadosCargo.cargoPublico.leiCargo.dtLei := Now;
        end;

        if (cdsTabela.FieldByName('extinto').AsInteger = 1) then
          evtTabCargo.infoCargo.DadosCargo.cargoPublico.leiCargo.sitCargo := scExtincao
        else
          evtTabCargo.infoCargo.DadosCargo.cargoPublico.leiCargo.sitCargo := scCriacao;

        evtTabCargo.infoCargo.NovaValidade.IniValid := aCompetencia;
        evtTabCargo.infoCargo.NovaValidade.FimValid := '2099-12';
      end;

      aLabel.Caption     := Trim(cdsTabela.FieldByName('DESCRICAO').AsString);
      aProcesso.Progress := I;
      Application.ProcessMessages;
      Inc(I);

      cdsTabela.Next;
    end;

    aRetorno := True;
  finally
    aSQL.Free;
    Result := aRetorno;
  end;
end;

function TdmESocial.GetMensagemRetorno: TStringList;
begin
  if not Assigned(aMensagemRetorno) then
    aMensagemRetorno := TStringList.Create;
  Result := aMensagemRetorno;
end;

procedure TdmESocial.GravarConfiguracao;
var
  IniFile: String;
  Ini: TIniFile;
begin
  IniFile := ExtractFilePath(ParamStr(0)) + 'Certificado.ini'; //REMUNERATUS_INI;

  Ini := TIniFile.Create(IniFile);
  try
    with aForm do
    begin
      Ini.WriteInteger('Certificado', 'SSLLib',     cbSSLLib.ItemIndex);
      Ini.WriteInteger('Certificado', 'CryptLib',   cbCryptLib.ItemIndex);
      Ini.WriteInteger('Certificado', 'HttpLib',    cbHttpLib.ItemIndex);
      Ini.WriteInteger('Certificado', 'XmlSignLib', cbXmlSignLib.ItemIndex);
      Ini.WriteString ('Certificado', 'Caminho',  edtCaminho.Text);
      Ini.WriteString ('Certificado', 'Senha',    edtSenha.Text);
      Ini.WriteString ('Certificado', 'NumSerie', edtNumSerie.Text);

      Ini.WriteBool   ('Geral', 'AtualizarXML', ckSalvar.Checked);
      Ini.WriteBool   ('Geral', 'ExibirErroSchema', ckSalvar.Checked);
      Ini.WriteString ('Geral', 'FormatoAlerta', edtFormatoAlerta.Text);
      Ini.WriteInteger('Geral', 'VersaoDF', cbVersaoDF.ItemIndex);
      Ini.WriteBool   ('Geral', 'RetirarAcentos', cbxRetirarAcentos.Checked);
      Ini.WriteBool   ('Geral', 'Salvar', ckSalvar.Checked);
      Ini.WriteString ('Geral', 'PathSalvar', edtPathLogs.Text);
      Ini.WriteString ('Geral', 'PathSchemas', edtPathSchemas.Text);
      Ini.WriteString ('Geral', 'IdEmpregador', edtIdEmpregador.Text);
      Ini.WriteString ('Geral', 'IdTransmissor', edtIdTransmissor.Text);
      Ini.WriteInteger('Geral', 'TipoEmpregador', cbTEmpregador.ItemIndex);

      Ini.WriteInteger('WebService', 'Ambiente', rgTipoAmb.ItemIndex);
      Ini.WriteBool   ('WebService', 'Visualizar', cbxVisualizar.Checked);
      Ini.WriteBool   ('WebService', 'SalvarSOAP', cbxSalvarSOAP.Checked);
      Ini.WriteBool   ('WebService', 'AjustarAut', cbxAjustarAut.Checked);
      Ini.WriteString ('WebService', 'Aguardar', edtAguardar.Text);
      Ini.WriteString ('WebService', 'Tentativas', edtTentativas.Text);
      Ini.WriteString ('WebService', 'Intervalo', edtIntervalo.Text);
      Ini.WriteInteger('WebService', 'TimeOut', seTimeOut.Value);
      Ini.WriteInteger('WebService', 'SSLType', cbSSLType.ItemIndex);

      Ini.WriteString('Proxy', 'Host',  edtProxyHost.Text);
      Ini.WriteString('Proxy', 'Porta', edtProxyPorta.Text);
      Ini.WriteString('Proxy', 'User',  edtProxyUser.Text);
      Ini.WriteString('Proxy', 'Pass',  edtProxySenha.Text);

      Ini.WriteBool  ('Arquivos', 'Salvar',      cbxSalvarArqs.Checked);
      Ini.WriteBool  ('Arquivos', 'PastaMensal', cbxPastaMensal.Checked);
      Ini.WriteBool  ('Arquivos', 'AddLiteral',  cbxAdicionaLiteral.Checked);
      Ini.WriteBool  ('Arquivos', 'EmissaoPatheSocial', cbxEmissaoPatheSocial.Checked);
      Ini.WriteBool  ('Arquivos', 'SalvarPathEvento', cbxSalvaPathEvento.Checked);
      Ini.WriteBool  ('Arquivos', 'SepararPorCNPJ', cbxSepararPorCNPJ.Checked);
      Ini.WriteString('Arquivos', 'PatheSocial', edtPatheSocial.Text);
      Ini.WriteString('Arquivos', 'PathEvento', edtPathEvento.Text);
    end;
  finally
    Ini.Free;
  end;
end;

procedure TdmESocial.LerConfiguracao;
var
  IniFile   ,
  PathMensal,
  aSufixo   : String;
  Ini : TIniFile;
begin
  Screen.Cursor := crHourGlass;

  aSufixo := Pesquisa('CONFIG_ORGAO', 'ID', '1', 'COD_CLI_RH_TRANSP','');
  IniFile := ExtractFilePath(ParamStr(0)) + 'Certificado.ini'; //REMUNERATUS_INI;
  Ini     := TIniFile.Create(IniFile);

  try
    with aForm do
    begin
//      cbSSLLib.ItemIndex     := Ini.ReadInteger('Certificado', 'SSLLib',     Ord(libCustom));
//      cbCryptLib.ItemIndex   := Ini.ReadInteger('Certificado', 'CryptLib',   Ord(cryWinCrypt));
//      cbHttpLib.ItemIndex    := Ini.ReadInteger('Certificado', 'HttpLib',    Ord(httpWinHttp));
//      cbXmlSignLib.ItemIndex := Ini.ReadInteger('Certificado', 'XmlSignLib', Ord(xsLibXml2));
      cbSSLLib.ItemIndex     := Ini.ReadInteger('Certificado', 'SSLLib',     Ord(libOpenSSL));
      cbCryptLib.ItemIndex   := Ini.ReadInteger('Certificado', 'CryptLib',   Ord(cryOpenSSL));
      cbHttpLib.ItemIndex    := Ini.ReadInteger('Certificado', 'HttpLib',    Ord(httpOpenSSL));
      cbXmlSignLib.ItemIndex := Ini.ReadInteger('Certificado', 'XmlSignLib', Ord(xsXmlSec));
      edtCaminho.Text        := Ini.ReadString ('Certificado', 'Caminho',  '');
      edtSenha.Text          := Ini.ReadString ('Certificado', 'Senha',    '');
      edtNumSerie.Text       := Ini.ReadString ('Certificado', 'NumSerie', '');

      ACBrESocial.Configuracoes.Certificados.ArquivoPFX  := edtCaminho.Text;
      ACBrESocial.Configuracoes.Certificados.Senha       := edtSenha.Text;
      ACBrESocial.Configuracoes.Certificados.NumeroSerie := edtNumSerie.Text;

      cbxExibirErroSchema.Checked := Ini.ReadBool   ('Geral', 'ExibirErroSchema', True);
      edtFormatoAlerta.Text       := Ini.ReadString ('Geral', 'FormatoAlerta', 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.');
      cbVersaoDF.ItemIndex        := Ini.ReadInteger('Geral', 'VersaoDF', 0);
      ckSalvar.Checked            := Ini.ReadBool('Geral', 'Salvar', True);
      cbxRetirarAcentos.Checked   := Ini.ReadBool('Geral', 'RetirarAcentos', True);
      edtIdEmpregador.Text        := Ini.ReadString ('Geral', 'IdEmpregador', Pesquisa('CONFIG_ORGAO', 'ID', '1', 'CNPJ',''));
      edtIdTransmissor.Text       := Ini.ReadString ('Geral', 'IdTransmissor', '');
      cbTEmpregador.ItemIndex     := Ini.ReadInteger('Geral', 'TipoEmpregador', 0);

      if (Trim(edtIdEmpregador.Text) = EmptyStr) then
        edtIdEmpregador.Text := Criptografa(Pesquisa('CONFIG_ORGAO', 'ID', '1', 'CNPJ',''), '2', 14);

      ACBrESocial.SSL.DescarregarCertificado;

      with ACBrESocial.Configuracoes.Geral do
      begin
        SSLLib        := TSSLLib(cbSSLLib.ItemIndex);
        SSLCryptLib   := TSSLCryptLib(cbCryptLib.ItemIndex);
        SSLHttpLib    := TSSLHttpLib(cbHttpLib.ItemIndex);
        SSLXmlSignLib := TSSLXmlSignLib(cbXmlSignLib.ItemIndex);

        AtualizaSSLLibsCombo;

        ExibirErroSchema := cbxExibirErroSchema.Checked;
        RetirarAcentos   := cbxRetirarAcentos.Checked;
        FormatoAlerta    := edtFormatoAlerta.Text;
        VersaoDF         := TVersaoeSocial(cbVersaoDF.ItemIndex);
        Salvar           := ckSalvar.Checked;

        IdEmpregador   := edtIdEmpregador.Text;
        IdTransmissor  := edtIdTransmissor.Text;
        TipoEmpregador := TEmpregador(cbTEmpregador.ItemIndex);
      end;

      rgTipoAmb.ItemIndex   := Ini.ReadInteger('WebService', 'Ambiente',   0);
      cbxVisualizar.Checked := Ini.ReadBool   ('WebService', 'Visualizar', False);
      cbxSalvarSOAP.Checked := Ini.ReadBool   ('WebService', 'SalvarSOAP', False);
      cbxAjustarAut.Checked := Ini.ReadBool   ('WebService', 'AjustarAut', False);
      edtAguardar.Text      := Ini.ReadString ('WebService', 'Aguardar',   '0');
      edtTentativas.Text    := Ini.ReadString ('WebService', 'Tentativas', '5');
      edtIntervalo.Text     := Ini.ReadString ('WebService', 'Intervalo',  '0');
      seTimeOut.Value       := Ini.ReadInteger('WebService', 'TimeOut',    5000);
      cbSSLType.ItemIndex   := Ini.ReadInteger('WebService', 'SSLType',    0);

      edtProxyHost.Text  := Ini.ReadString('Proxy', 'Host',  '');
      edtProxyPorta.Text := Ini.ReadString('Proxy', 'Porta', '');
      edtProxyUser.Text  := Ini.ReadString('Proxy', 'User',  '');
      edtProxySenha.Text := Ini.ReadString('Proxy', 'Pass',  '');

      with ACBrESocial.Configuracoes.WebServices do
      begin
        Ambiente   := taHomologacao;
        Visualizar := cbxVisualizar.Checked;
        Salvar     := cbxSalvarSOAP.Checked;

        AjustaAguardaConsultaRet := cbxAjustarAut.Checked;

        if NaoEstaVazio(edtAguardar.Text) then
          AguardarConsultaRet := ifThen(StrToInt(edtAguardar.Text) < 1000,
            StrToInt(edtAguardar.Text) * 1000, StrToInt(edtAguardar.Text))
        else
          edtAguardar.Text := IntToStr(AguardarConsultaRet);

        if NaoEstaVazio(edtTentativas.Text) then
          Tentativas := StrToInt(edtTentativas.Text)
        else
          edtTentativas.Text := IntToStr(Tentativas);

        if NaoEstaVazio(edtIntervalo.Text) then
          IntervaloTentativas := ifThen(StrToInt(edtIntervalo.Text) < 1000,
            StrToInt(edtIntervalo.Text) * 1000, StrToInt(edtIntervalo.Text))
        else
          edtIntervalo.Text := IntToStr(ACBrESocial.Configuracoes.WebServices.IntervaloTentativas);

        TimeOut   := seTimeOut.Value;
        ProxyHost := edtProxyHost.Text;
        ProxyPort := edtProxyPorta.Text;
        ProxyUser := edtProxyUser.Text;
        ProxyPass := edtProxySenha.Text;
      end;

      ACBrESocial.SSL.SSLType := TSSLType(cbSSLType.ItemIndex);

      cbxSalvarArqs.Checked         := Ini.ReadBool('Arquivos', 'Salvar', False);
      cbxPastaMensal.Checked        := Ini.ReadBool('Arquivos', 'PastaMensal', False);
      cbxAdicionaLiteral.Checked    := Ini.ReadBool('Arquivos', 'AddLiteral', False);
      cbxEmissaoPatheSocial.Checked := Ini.ReadBool('Arquivos', 'EmissaoPatheSocial', False);
      cbxSalvaPathEvento.Checked    := Ini.ReadBool('Arquivos', 'SalvarPathEvento', False);
      cbxSepararPorCNPJ.Checked     := Ini.ReadBool('Arquivos', 'SepararPorCNPJ', False);
      edtPatheSocial.Text := Ini.ReadString('Arquivos', 'PatheSocial', '');
      edtPathEvento.Text  := Ini.ReadString('Arquivos', 'PathEvento', '');
      edtPathLogs.Text    := Ini.ReadString('Geral', 'PathSalvar', PathWithDelim(ExtractFilePath(ParamStr(0))) + 'Logs');
      edtPathSchemas.Text := Ini.ReadString('Geral', 'PathSchemas', PathWithDelim(ExtractFilePath(ParamStr(0))) + 'Schemas\' + GetEnumName(TypeInfo(TVersaoeSocial), Integer(cbVersaoDF.ItemIndex)));

      with ACBrESocial.Configuracoes.Arquivos do
      begin
        Salvar             := cbxSalvarArqs.Checked;
        SepararPorMes      := cbxPastaMensal.Checked;
        AdicionarLiteral   := cbxAdicionaLiteral.Checked;
        EmissaoPatheSocial := cbxEmissaoPatheSocial.Checked;
        SepararPorCNPJ     := cbxSepararPorCNPJ.Checked;
        PathSalvar  := edtPathLogs.Text;
        PathSchemas := edtPathSchemas.Text;
        PatheSocial := edtPatheSocial.Text;
      end;

      PathMensal := ACBrESocial.Configuracoes.Arquivos.GetPatheSocial(0);

      ACBrESocial.Configuracoes.Arquivos.PathSalvar := PathMensal;

      if not DirectoryExists(edtPathLogs.Text) then
        ForceDirectories(edtPathLogs.Text);
      if not DirectoryExists(edtPathSchemas.Text) then
        ForceDirectories(edtPathSchemas.Text);
    end;
  finally
    Ini.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TdmESocial.ListarCompetencias(aLista: TComboBox);
var
  x ,
  i : Integer;
  s : String;
begin
  x := 0;
  s := FormatDateTime('YYYY', Date);
  aLista.Items.BeginUpdate;
  aLista.Items.Clear;
  try
    for I := 1 to 12 do
    begin
      aLista.Items.Add(s + '-' + FormatFloat('00', I));
      if (I = StrToInt(FormatDateTime('mm', Date)) ) then
        x := aLista.Items.Count - 1;
    end;
  finally
    aLista.Items.EndUpdate;
    aLista.ItemIndex := x;
  end;
end;

function TdmESocial.ProximaCompetencia(aCompetencia : String): String;
var
  aAno ,
  aMes : Integer;
  aRetorno : String;
begin
  aAno := StrToInt(Copy(aCompetencia, 1, 4));
  aMes := StrToInt(Copy(aCompetencia, 6, 2)) + 1;

  if (aMes > 12) then
    aRetorno := IntToStr(aAno + 1) + '-01'
  else
    aRetorno := IntToStr(aAno) + FormatFloat('"-"00', aMes);

  Result := aRetorno;
end;

procedure TdmESocial.SetSQL(aSQL: TStringList);
begin
  if cdsTabela.Active then
    cdsTabela.Close;

  qryTabela.SQL.BeginUpdate;
  qryTabela.SQL.Clear;
  try
    qryTabela.SQL.AddStrings(aSQL);
  finally
    qryTabela.SQL.EndUpdate;
    cdsTabela.FetchParams;
    cdsTabela.Open;
  end;
end;

{ TProtocoloESocial }

constructor TProtocoloESocial.Create(Value : String);
begin
  inherited Create;
  aDataHota := Now;
  aNumeroInscricao := EmptyStr;
  aVersao   := EmptyStr;
  aNumero   := Trim(Value);
  aArquivos := TStringList.Create;
  aArquivos.Clear;
end;

procedure TProtocoloESocial.SetNumeroInscricao(Value: String);
begin
  aNumeroInscricao := Trim(Value);
end;

destructor TProtocoloESocial.Destroy;
begin
  aArquivos.Free;
  inherited Destroy;
end;

procedure TProtocoloESocial.SetNumero(Value: String);
begin
  aNumero := Trim(Value);
end;

procedure TProtocoloESocial.SetVersao(Value: String);
begin
  aNumero := Trim(Value);
end;

end.
