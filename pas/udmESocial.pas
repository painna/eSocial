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
  DateUtils,

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

  TConselho = record
    Numero   : String;
    Orgao    : String;
    UF       : String;
    Emissao  : TDateTime;
    Validade : TDateTime;
  end;

  TResponsavel = record
    ID       : Integer;
    Nome     : String;
    NIS      : String;
    Conselho : TConselho;
  end;

  TCompetencia = class(TObject)
    private
      aCodigo     ,
      aDescricao  : String;
      aDataInicial,
      aDataFinal  : TDateTime;
      function GetId : Integer;
      function GetDescricao : String;
    public
      property ID : Integer read GetId;
      property Codigo      : String read aCodigo write aCodigo;
      property Descricao   : String read GetDescricao write aDescricao;
      property DataInicial : TDateTime read aDataInicial write aDataInicial;
      property DataFinal   : TDateTime read aDataFinal write aDataFinal;

      constructor Criar;

  end;

  TProtocoloESocial = class(TObject)
    private
      aDataHota : TDateTime;
      aNumeroInscricao,
      aVersao   ,
      aNumero   : String;
      aArquivos : TStringList;

      aS1000 ,
      aS1005 ,
      aS1010 ,
      aS1020 ,
      aS1030 ,
      aS1035 ,
      aS1040 ,
      aS1050 ,
      aS1060 ,
      aS1070 ,
      aS1080 ,
      aS2200 ,
      aS2205 ,
      aS2206 ,
      aS2210 ,
      aS2220 ,
      aS2230 ,
      aS2240 ,
      aS2241 ,
      aS2250 ,
      aS2260 : Boolean;

      procedure SetNumeroInscricao(Value : String);
      procedure SetVersao(Value : String);
      procedure SetNumero(Value : String);
    public
      property DataHora : TDateTime read aDataHota write aDataHota;
      property NumeroInscricao : String read aNumeroInscricao write SetNumeroInscricao;
      property Versao   : String read aVersao write SetVersao;
      property Numero   : String read aNumero write SetNumero;
      property Arquivos : TStringList read aArquivos write aArquivos;

      property S1000 : Boolean read aS1000 write aS1000;
      property S1005 : Boolean read aS1005 write aS1005;
      property S1010 : Boolean read aS1010 write aS1010;
      property S1020 : Boolean read aS1020 write aS1020;
      property S1030 : Boolean read aS1030 write aS1030;
      property S1035 : Boolean read aS1035 write aS1035;
      property S1040 : Boolean read aS1040 write aS1040;
      property S1050 : Boolean read aS1050 write aS1050;
      property S1060 : Boolean read aS1060 write aS1060;
      property S1070 : Boolean read aS1070 write aS1070;
      property S1080 : Boolean read aS1080 write aS1080;
      property S2200 : Boolean read aS2200 write aS2200;
      property S2205 : Boolean read aS2205 write aS2205;
      property S2206 : Boolean read aS2206 write aS2206;
      property S2210 : Boolean read aS2210 write aS2210;
      property S2220 : Boolean read aS2220 write aS2220;
      property S2230 : Boolean read aS2230 write aS2230;
      property S2240 : Boolean read aS2240 write aS2240;
      property S2241 : Boolean read aS2241 write aS2241;
      property S2250 : Boolean read aS2250 write aS2250;
      property S2260 : Boolean read aS2260 write aS2260;

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
    dspDetalhe: TDataSetProvider;
    cdsDetalhe: TClientDataSet;
    qryDetalhe: TSQLQuery;
    dspProtocolo: TDataSetProvider;
    cdsProtocolo: TClientDataSet;
    qryProtocolo: TSQLQuery;
    cdsProtocoloID: TLargeintField;
    cdsProtocoloNUMERO: TStringField;
    cdsProtocoloINSCRICAO: TStringField;
    cdsProtocoloDATA_HORA: TSQLTimeStampField;
    cdsProtocoloVERSAO: TStringField;
    cdsProtocoloARQUIVO_ENVIADO: TBlobField;
    cdsProtocoloARQUIVO_RETORNO: TBlobField;
    qryProtocoloID: TLargeintField;
    qryProtocoloNUMERO: TStringField;
    qryProtocoloINSCRICAO: TStringField;
    qryProtocoloDATA_HORA: TSQLTimeStampField;
    qryProtocoloVERSAO: TStringField;
    qryProtocoloARQUIVO_ENVIADO: TBlobField;
    qryProtocoloARQUIVO_RETORNO: TBlobField;
    dspGeral: TDataSetProvider;
    cdsGeral: TClientDataSet;
    qryGeral: TSQLQuery;
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
    procedure SetSQL_Detalhe(aSQL : TStringList);
    procedure SetSQL_Geral(aSQL : TStringList);

    procedure CorrigirCidadeNascimento;

    function GetMensagemRetorno : TStringList;
    function ProximaCompetencia(aCompetencia : String) : String;
  public
    { Public declarations }
    flOperacao_eS1000 ,
    flOperacao_eS1005 ,
    flOperacao_eS1010 ,
    flOperacao_eS1020 ,
    flOperacao_eS1030 ,
    flOperacao_eS1035 ,
    flOperacao_eS1040 ,
    flOperacao_eS1050 ,
    flOperacao_eS1060 : TextFile;

    property MensagemRetorno : TStringList read GetMensagemRetorno;

    procedure ListarCompetencias(aLista : TComboBox);
    procedure ListarCompetenciasAdmissao(aLista : TComboBox);
    procedure LerConfiguracao;
    procedure GravarProtocoloRetorno(aProtocolo : TProtocoloESocial);
    procedure AtualizarOperacoes(aModoLancamento: TModoLancamento; aProtocolo: TProtocoloESocial); virtual; abstract;

    function CertificadoInstalado : Boolean;
    function CertificadoValido : Boolean;
    function AmbienteWebServiceHomologacao : Boolean;
    function AmbienteWebServiceProducao : Boolean;

    // procedures eventos de tabela
    function Gerar_eSocial1000(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;
    function Gerar_eSocial1005(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;
    function Gerar_eSocial1010(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;
    function Gerar_eSocial1020(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;
    function Gerar_eSocial1030(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;
    function Gerar_eSocial1035(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;
    function Gerar_eSocial1040(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;
    function Gerar_eSocial1050(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;
    function Gerar_eSocial1060(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;
    function Gerar_eSocial1070(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;                         virtual; abstract;
    function Gerar_eSocial1080(aCompetencia : String; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;                         virtual; abstract;

    // procedures eventos de tabela
    function Gerar_eSocial2190(aCompetencia : TCompetencia; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;                         virtual; abstract;
    function Gerar_eSocial2200(aCompetencia : TCompetencia; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;
    function Gerar_eSocial2205(aCompetencia : TCompetencia; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;
    function Gerar_eSocial2206(aCompetencia : TCompetencia; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;
    function Gerar_eSocial2210(aCompetencia : TCompetencia; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;                         virtual; abstract;
    function Gerar_eSocial2220(aCompetencia : TCompetencia; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;                         virtual; abstract;
    function Gerar_eSocial2230(aCompetencia : TCompetencia; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;                         virtual; abstract;
    function Gerar_eSocial2240(aCompetencia : TCompetencia; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;
    function Gerar_eSocial2241(aCompetencia : TCompetencia; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;
    function Gerar_eSocial2250(aCompetencia : TCompetencia; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;                         virtual; abstract;
    function Gerar_eSocial2260(aCompetencia : TCompetencia; aZerarBase : Boolean;
      aModoLancamento : TModoLancamento; aLabel : TLabel; aProcesso : TGauge;
      var aProtocolo : TProtocoloESocial) : Boolean;                         virtual; abstract;

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

  EMPTY_DATE = '30/12/1899';

  ID_NACIONALIDADE_BRASIL        = '105';
  ID_ESTADO_FUNCIONAL_DEMITIDO   = 6;
  ID_ESTADO_FUNCIONAL_APOSENTADO = 10;

  MODO_OPERACAO : array[0..3] of String = (FLAG_OPERACAO_INSERIR, FLAG_OPERACAO_ALTERAR, FLAG_OPERACAO_EXCLUIR, FLAG_OPERACAO_ENVIADO);

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  VarGlobais, gsLib, UtilsDb;

{$R *.dfm}

{ TCompetencia }

constructor TCompetencia.Criar;
begin
  inherited Create;
  aCodigo      := EmptyStr;
  aDescricao   := EmptyStr;
  aDataInicial := StrToDate(EMPTY_DATE);
  aDataFinal   := StrToDate(EMPTY_DATE);
end;

function TCompetencia.GetId : Integer;
begin
  Result := StrToIntDef(StringReplace(aCodigo, '-', '', [rfReplaceAll]) , 0);
end;

function TCompetencia.GetDescricao : String;
begin
  Result := AnsiUpperCase(aDescricao);
end;

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

procedure TdmESocial.CorrigirCidadeNascimento;
var
  aSQL : TStringList;
begin
  aSQL := TStringList.Create;
  try
    aSQL.BeginUpdate;
    aSQL.Clear;
{
execute block
as
  declare variable id Integer;
  declare variable natural_cidade varchar(40);
  declare variable natural_uf char(40);
begin
  for
    Select
        y.id
      , Case when right(y.natural_cidade_nova, 3) <> y.uf
          then y.natural_cidade || y.uf
          else y.natural_cidade_nova
        end as natural_cidade
      , right(y.uf, 2) as  natural_uf
    from (
        Select
            x.*
          , case
              when (coalesce(x.natural_uf, '')  = '') and (left(right(x.natural_cidade_nova, 3), 1)  = '-') then right(x.natural_cidade_nova, 3)
              when (coalesce(x.natural_uf, '') <> '') and (left(right(x.natural_cidade_nova, 3), 1) <> '-') then '-' || x.natural_uf
              when (coalesce(x.natural_uf, '') <> '') and (left(right(x.natural_cidade_nova, 3), 1)  = '-') then right(x.natural_cidade_nova, 3)
            end as uf
        from (
            Select
                p.id
              , p.natural_cidade
              , p.natural_uf
              , Case when right(trim(replace(p.natural_cidade, ' - ', '-')) , 1) = '-'
                  then substring(trim(replace(p.natural_cidade, ' - ', '-')) from 1 for char_length(trim(replace(p.natural_cidade, ' - ', '-'))) - 1)
                  else trim(replace(p.natural_cidade, ' - ', '-'))
                end natural_cidade_nova
            from PESSOA_FISICA p
            where p.natural_cidade is not null
        ) x
        where coalesce(trim(x.natural_cidade_nova), '') <> ''
    ) y
    where y.uf is not null
    Into
        id
      , natural_cidade
      , natural_uf
  do
  begin

    Update PESSOA_FISICA p Set
        p.natural_cidade = :natural_cidade
      , p.natural_uf     = :natural_uf
    where p.id = :id;

  end
end
}
    aSQL.EndUpdate;

    // Em desenvolvimento

  finally
    aSQL.Free;
  end;
end;

procedure TdmESocial.DataModuleCreate(Sender: TObject);
var
  aLog : String;
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
  aLog := ExtractFilePath(ParamStr(0)) + '\log\';
  if not DirectoryExists(aLog) then
    ForceDirectories(aLog);
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
//  aDataHora1  ,
//  aDataHora2  ,
//  aDataHora3  ,
//  aDataHora4  ,
//  aDataHora5  ,
//  aDataHora6  ,
//  aDataHora7  ,
//  aDataHora8  ,
//  aDataHora9  ,
//  aDataHora10 : TDateTime;
//
  aDataHoraTemp   ,
  aDataHoraInicial,
  aDataHoraFinal  : TDateTime;

  aRetorno    : Boolean;
  I : Integer;
  sPath    ,
  sArquivo : String;
begin
  aRetorno := False;
  try
    aLabel.Caption     := 'Validando dados...';
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
      aLabel.Caption := 'Enviando...';

      aDataHoraInicial := Now - StrToTime('00:00:05');       // Retorceder 5 segundos

      aRetorno := ACBrESocial.Enviar(aGrupo);

      Sleep(5000);                                           // Aguardar 5 segundos

      if aRetorno then
        with ACBrESocial.Eventos, ACBrESocial.WebServices.EnvioLote.RetEnvioLote do
        begin
          if Status.cdResposta in [201, 202] then
          begin
            aProtocolo.Versao   := dadosRecLote.versaoAplicRecepcao;
            aProtocolo.DataHora := dadosRecLote.dhRecepcao;
            aProtocolo.Numero   := dadosRecLote.Protocolo;
            aProtocolo.NumeroInscricao := IdeTransmissor.NrInsc;

            sPath := PathWithDelim(ACBrESocial.Configuracoes.Arquivos.GetPatheSocial(aProtocolo.DataHora, ACBrESocial.Configuracoes.Geral.IdEmpregador));

            aDataHoraFinal   := Now + StrToTime('00:00:59'); // Esperar até 59 segundos
            aDataHoraTemp    := aDataHoraInicial;

            while aDataHoraTemp <= aDataHoraFinal do
            begin
              sArquivo := StringReplace(sPath + '\' + FormatDateTime('yyyymmddhhmmss', aDataHoraTemp), '\\', '\', [rfReplaceAll]);

              // Pegar Arquivo de Envio
              if FileExists(sArquivo + '-env-lot.xml') then
                aProtocolo.Arquivos.Add(sArquivo + '-env-lot.xml');

              // Pegar Arquivo de Retorno
              if FileExists(sArquivo + '-rec.xml') then
              begin
                aProtocolo.Arquivos.Add(sArquivo + '-rec.xml');
                Break;
              end;

              aDataHoraTemp := aDataHoraTemp + StrToTime('00:00:01');
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
                aMensagemRetorno.Add('* Código.....: ' + FormatFloat('##00000', Codigo));
                aMensagemRetorno.Add('* Descrição..: ' + Descricao);
                aMensagemRetorno.Add('* Tipo.......: ' + IntToStr(Tipo));
                aMensagemRetorno.Add('* Localização: ' + Localizacao + #13#13);
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
  aLabel: TLabel; aProcesso: TGauge; var aProtocolo : TProtocoloESocial): Boolean;
var
  aRetorno : Boolean;
  aSQL : TStringList;
  ok   : Boolean;
  aEventoID,
  I    : Integer;
  aFileProcesso : String;
begin
  aFileProcesso := '.\log\eS1000.txt';
  AssignFile(flOperacao_eS1000, aFileProcesso);
  Rewrite(flOperacao_eS1000);

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
    aSQL.Add('  , u.cnpj as ENTE_CNPJ');
    aSQL.Add('from CONFIG_ORGAO c');
    aSQL.Add('  inner join CONFIG_ESOCIAL e on (e.ID_CONFIG_ORGAO = c.ID)');
    aSQL.Add('  inner join UNID_GESTORA   u on (u.ID = e.ID_UNID_GESTORA)');
    aSQL.Add('where c.id = 1');
//    aSQL.Add('Select');
//    aSQL.Add('    u.*');
//    aSQL.Add('  , u.cnpj as ENTE_CNPJ');
//    aSQL.Add('  , u.RAZAO_SOCIAL as ENTE_FERERATIVO');
//    aSQL.Add('');
//    aSQL.Add('  , (Select RAZAO_SOCIAL            from CONFIG_ORGAO c where c.id = 1) as RAZAO_SOCIAL_ENCRIP');
//    aSQL.Add('  , (Select SIGLA                   from CONFIG_ORGAO c where c.id = 1) as SIGLA');
//    aSQL.Add('  , (Select CNPJ                    from CONFIG_ORGAO c where c.id = 1) as CNPJ_ENCRIP');
//    aSQL.Add('  , (Select TIPO_ORGAO              from CONFIG_ORGAO c where c.id = 1) as TIPO_ORGAO');
//    aSQL.Add('  , (Select ENDER_LOGRAD            from CONFIG_ORGAO c where c.id = 1) as ENDER_LOGRAD');
//    aSQL.Add('  , (Select ENDER_NUM               from CONFIG_ORGAO c where c.id = 1) as ENDER_NUM');
//    aSQL.Add('  , (Select ENDER_BAIRRO            from CONFIG_ORGAO c where c.id = 1) as ENDER_BAIRRO');
//    aSQL.Add('  , (Select ENDER_CIDADE            from CONFIG_ORGAO c where c.id = 1) as ENDER_CIDADE');
//    aSQL.Add('  , (Select ENDER_CEP               from CONFIG_ORGAO c where c.id = 1) as ENDER_CEP');
//    aSQL.Add('  , (Select ENDER_UF                from CONFIG_ORGAO c where c.id = 1) as ENDER_UF');
//    aSQL.Add('  , (Select TELEFONE                from CONFIG_ORGAO c where c.id = 1) as TELEFONE');
//    aSQL.Add('  , (Select NOME_DIR_DRH            from CONFIG_ORGAO c where c.id = 1) as NOME_DIR_DRH');
//    aSQL.Add('  , (Select COD_CNAE                from CONFIG_ORGAO c where c.id = 1) as COD_CNAE');
//    aSQL.Add('  , (Select COD_FPAS                from CONFIG_ORGAO c where c.id = 1) as COD_FPAS');
//    aSQL.Add('  , (Select COD_NATUREZA_JURIDICA   from CONFIG_ORGAO c where c.id = 1) as COD_NATUREZA_JURIDICA');
//    aSQL.Add('  , (Select COD_MUNICIPIO_RAIS      from CONFIG_ORGAO c where c.id = 1) as COD_MUNICIPIO_RAIS');
//    aSQL.Add('  , (Select COD_MUNICIPIO_TCM       from CONFIG_ORGAO c where c.id = 1) as COD_MUNICIPIO_TCM');
//    aSQL.Add('  , (Select BRASAO                  from CONFIG_ORGAO c where c.id = 1) as BRASAO');
//    aSQL.Add('  , (Select VER_EXE                 from CONFIG_ORGAO c where c.id = 1) as VER_EXE');
//    aSQL.Add('  , (Select DT_VER_EXE              from CONFIG_ORGAO c where c.id = 1) as DT_VER_EXE');
//    aSQL.Add('  , (Select NOME_PASTA_ATUALIZA_EXE from CONFIG_ORGAO c where c.id = 1) as NOME_PASTA_ATUALIZA_EXE');
//    aSQL.Add('  , (Select TIPO_CONTRA_CHEQUE      from CONFIG_ORGAO c where c.id = 1) as TIPO_CONTRA_CHEQUE');
//    aSQL.Add('  , (Select ID_SERVID_GESTOR        from CONFIG_ORGAO c where c.id = 1) as ID_SERVID_GESTOR');
//    aSQL.Add('  , (Select NOME_SERVID_GESTOR      from CONFIG_ORGAO c where c.id = 1) as NOME_SERVID_GESTOR');
//    aSQL.Add('  , (Select DESCR_TIPO_ORGAO        from CONFIG_ORGAO c where c.id = 1) as DESCR_TIPO_ORGAO');
//    aSQL.Add('  , (Select ANO_MES_TRAVA           from CONFIG_ORGAO c where c.id = 1) as ANO_MES_TRAVA');
//    aSQL.Add('  , (Select COD_CLI_RH_TRANSP       from CONFIG_ORGAO c where c.id = 1) as COD_CLI_RH_TRANSP');
//    aSQL.Add('  , (Select COD_ORGAO_TCM           from CONFIG_ORGAO c where c.id = 1) as COD_ORGAO_TCM');
//    aSQL.Add('  , (Select COD_HASH_DRH_TRANSP     from CONFIG_ORGAO c where c.id = 1) as COD_HASH_DRH_TRANSP');
//    aSQL.Add('  , (Select E_MAIL                  from CONFIG_ORGAO c where c.id = 1) as E_MAIL');
//    aSQL.Add('  , (Select PRAZO_LICENCA           from CONFIG_ORGAO c where c.id = 1) as PRAZO_LICENCA');
//    aSQL.Add('');
//    aSQL.Add('  , (Select ID_CONFIG_ORGAO      from CONFIG_ESOCIAL e where e.id_config_orgao = 1) as ID_CONFIG_ORGAO');
//    aSQL.Add('  , (Select ID_UNID_GESTORA      from CONFIG_ESOCIAL e where e.id_config_orgao = 1) as ID_UNID_GESTORA');
//    aSQL.Add('  , (Select CONTADOR_NOME        from CONFIG_ESOCIAL e where e.id_config_orgao = 1) as CONTADOR_NOME');
//    aSQL.Add('  , (Select CONTADOR_CPF         from CONFIG_ESOCIAL e where e.id_config_orgao = 1) as CONTADOR_CPF');
//    aSQL.Add('  , (Select CONTADOR_FONEFIXO    from CONFIG_ESOCIAL e where e.id_config_orgao = 1) as CONTADOR_FONEFIXO');
//    aSQL.Add('  , (Select CONTADOR_FONECELULAR from CONFIG_ESOCIAL e where e.id_config_orgao = 1) as CONTADOR_FONECELULAR');
//    aSQL.Add('  , (Select CONTADOR_EMAIL       from CONFIG_ESOCIAL e where e.id_config_orgao = 1) as CONTADOR_EMAIL');
//
//    aSQL.Add('  , coalesce(u.NAT_JURIDICA, ');
//    aSQL.Add('  , (Select NAT_JURIDICA         from CONFIG_ESOCIAL e where e.id_config_orgao = 1)) as NATUREZA_JURIDICA');
//
//    aSQL.Add('  , coalesce(u.NRO_SIAFI, ');
//    aSQL.Add('  , (Select NRO_SIAFI            from CONFIG_ESOCIAL e where e.id_config_orgao = 1)) as SIAFI');
//
//    aSQL.Add('  , (Select SUBTETO_VENCTO_TIPO  from CONFIG_ESOCIAL e where e.id_config_orgao = 1) as SUBTETO_VENCTO_TIPO');
//    aSQL.Add('  , (Select SUBTETO_VENCTO_VALOR from CONFIG_ESOCIAL e where e.id_config_orgao = 1) as SUBTETO_VENCTO_VALOR');
//    aSQL.Add('  , (Select POSSUI_RPPS          from CONFIG_ESOCIAL e where e.id_config_orgao = 1) as POSSUI_RPPS');
//    aSQL.Add('  , (Select TIPO_OPERACAO        from CONFIG_ESOCIAL e where e.id_config_orgao = 1) as TIPO_OPERACAO');
//    aSQL.Add('  , (Select DATA_IMPLANTACAO     from CONFIG_ESOCIAL e where e.id_config_orgao = 1) as DATA_IMPLANTACAO');
//    aSQL.Add('from UNID_GESTORA u');
//    aSQL.Add('  inner join (');
//    aSQL.Add('    Select distinct');
//    aSQL.Add('        u.cnpj');
//    aSQL.Add('      , (');
//    aSQL.Add('          Select first 1');
//    aSQL.Add('            x.id');
//    aSQL.Add('          from UNID_GESTORA x');
//    aSQL.Add('          where x.cnpj = u.cnpj');
//    aSQL.Add('            and coalesce(nullif(trim(x.razao_social), ''''), '''') <> '''' ');
//    aSQL.Add('        ) as id');
//    aSQL.Add('    from UNID_GESTORA u');
//    aSQL.Add('  ) tp on (tp.id = u.id)');
//    aSQL.Add('where u.id > 0');
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
    aSQL.SaveToFile('.\log\eS1000.sql');
    SetSQL(aSQL);

    I := 1;

    aProcesso.MaxValue := cdsTabela.RecordCount;
    aProcesso.Progress := 0;
    Application.ProcessMessages;

    if not cdsTabela.IsEmpty then
      aEventoID := StrToInt(IncrementGenerator('GEN_ESOCIAL_EVENTO_S1000', 1));

    cdsTabela.First;
    while not cdsTabela.Eof do
    begin
      with ACBrESocial.Eventos.Iniciais.S1000.Add do
      begin
        evtInfoEmpregador.Sequencial := aEventoID;

        if AmbienteWebServiceProducao then
          evtInfoEmpregador.IdeEvento.TpAmb := TpTpAmb(0) //taProducao
        else
          evtInfoEmpregador.IdeEvento.TpAmb := taProducaoRestrita;

        evtInfoEmpregador.IdeEvento.ProcEmi := peAplicEmpregador;
        evtInfoEmpregador.IdeEvento.VerProc := Versao_Executavel(ParamStr(0));

        evtInfoEmpregador.IdeEmpregador.TpInsc := tiCNPJ;
        evtInfoEmpregador.IdeEmpregador.NrInsc := Criptografa(cdsTabela.FieldByName('CNPJ').AsString, '2', 14);

        with ACBrESocial.Configuracoes do
          Geral.IdEmpregador := evtInfoEmpregador.IdeEmpregador.NrInsc;

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

          InfoOp.nrSiafi := Trim(cdsTabela.FieldByName('NRO_SIAFI').AsString);

          InfoOp.infoEnte.indRPPS   := IfThen(Criptografa(cdsTabela.FieldByName('CNPJ').AsString, '2', 14) = cdsTabela.FieldByName('ENTE_CNPJ').AsString, tpSim, tpNao);
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

      Writeln(flOperacao_eS1000, 'S1000|' + MODO_OPERACAO[Ord(aModoLancamento)] + '|' + FormatFloat('0000000000', cdsTabela.FieldByName('ID').AsInteger));
      cdsTabela.Next;
    end;

    aRetorno := True;
    aProtocolo.s1000 := aRetorno;
  finally
    CloseFile(flOperacao_eS1000);
    if not aRetorno then
      DeleteFile(aFileProcesso);

    aSQL.Free;
    Result := aRetorno;
  end;
end;

function TdmESocial.Gerar_eSocial1005(aCompetencia: String; aZerarBase: Boolean; aModoLancamento: TModoLancamento;
  aLabel: TLabel; aProcesso: TGauge; var aProtocolo : TProtocoloESocial): Boolean;
var
  aRetorno : Boolean;
  aSQL : TStringList;
  ok   : Boolean;
  I    : Integer;
  aDataImplantacao : TDateTime;
  aFileProcesso : String;
begin
  aFileProcesso := '.\log\eS1005.txt';
  AssignFile(flOperacao_eS1005, aFileProcesso);
  Rewrite(flOperacao_eS1005);

  aRetorno := False;
  aSQL := TStringList.Create;
  ok   := True;
  try
    aDataImplantacao := PesquisaData('CONFIG_ESOCIAL','ID_CONFIG_ORGAO', '1', 'DATA_IMPLANTACAO', '');

    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Select');
    aSQL.Add('    ug.*');
    aSQL.Add('  , ' + QuotedStr(eSAliqRatToStr(arat2)) + ' as aliquota_rat ');
    aSQL.Add('  , coalesce(fp.valor, 0.0) as aliquota_fap ');
    aSQL.Add('  , coalesce(nullif(trim(ug.cnae_prep), ''''), (Select cast(o.cod_cnae as varchar(10)) from CONFIG_ORGAO o where o.id = 1)) as cnae_prepoderante');
    aSQL.Add('from UNID_GESTORA ug');
//    aSQL.Add('  inner join (');
//    aSQL.Add('    Select distinct');
//    aSQL.Add('        u.cnpj');
//    aSQL.Add('      , (');
//    aSQL.Add('          Select first 1');
//    aSQL.Add('            x.id');
//    aSQL.Add('          from UNID_GESTORA x');
//    aSQL.Add('          where x.cnpj = u.cnpj');
//    aSQL.Add('            and coalesce(nullif(trim(x.razao_social), ''''), '''') <> '''' ');
//    aSQL.Add('        ) as id');
//    aSQL.Add('    from UNID_GESTORA u');
//    aSQL.Add('  ) tp on (tp.id = ug.id)');
    aSQL.Add('  left join TAB_ALIQ_FAP fp on (fp.id_unid_gestora = ug.id)');
    aSQL.Add('where ug.id > 0');
    aSQL.EndUpdate;
    SetSQL(aSQL);

    if cdsTabela.IsEmpty then
      raise Exception.Create('Dados das Unidades Gestoras para o eSocial ainda não foram disponíveis!');

    aSQL.BeginUpdate;

    case aModoLancamento of
      mlInclusao  : aSQL.Add('  and ug.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_INSERIR));
      mlAlteracao : aSQL.Add('  and ug.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_ALTERAR));
      mlExclusao  : aSQL.Add('  and ug.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_EXCLUIR));
    end;

    aSQL.EndUpdate;
    aSQL.SaveToFile('.\log\eS1005.sql');
    SetSQL(aSQL);

    I := 1;

    aProcesso.MaxValue := cdsTabela.RecordCount;
    aProcesso.Progress := 0;
    Application.ProcessMessages;

    cdsTabela.First;
    while not cdsTabela.Eof do
    begin
      with ACBrESocial.Eventos.Iniciais.S1005.Add do
      begin
        with evtTabEstab do
        begin
          Sequencial     := StrToInt(IncrementGenerator('GEN_ESOCIAL_EVENTO_S1005', 1));
          ModoLancamento := aModoLancamento;

          if AmbienteWebServiceProducao then
            IdeEvento.TpAmb := TpTpAmb(0) //taProducao
          else
            IdeEvento.TpAmb := taProducaoRestrita;

          IdeEvento.ProcEmi := peAplicEmpregador;
          IdeEvento.VerProc := Versao_Executavel(ParamStr(0));

          IdeEmpregador.TpInsc := tiCNPJ;
          IdeEmpregador.NrInsc := cdsTabela.FieldByName('CNPJ_PRINCIPAL').AsString;

          with ACBrESocial.Configuracoes do
            Geral.IdEmpregador := IdeEmpregador.NrInsc;

          with infoEstab do
          begin
            with IdeEstab do
            begin
              TpInsc   := tiCNPJ;
              NrInsc   := cdsTabela.FieldByName('CNPJ').AsString;
              IniValid := aCompetencia;;
              FimValid := '2099-12';
            end;

            with DadosEstab do
            begin
              cnaePrep := cdsTabela.FieldByName('CNAE_PREPODERANTE').AsString;

              with aliqGilrat do
              begin
                AliqRat      := eSStrToAliqRat(ok, cdsTabela.FieldByName('aliquota_rat').AsString); // arat1;
                Fap          := cdsTabela.FieldByName('aliquota_fap').AsCurrency;
                AliqRatAjust := cdsTabela.FieldByName('aliquota_rat').AsCurrency * cdsTabela.FieldByName('aliquota_fap').AsCurrency; // Igual à "AliqRat x Fap"

                // Sem necessidade de "Processo administrativo/judicial relativo à alíquota RAT"
//                with ProcAdmJudRat do
//                begin
//                  tpProc := tpTpProc(1);
//                  nrProc := '20150512';
//                  codSusp := '1';
//                  tpProc := tpTpProc(1);
//                  nrProc := '20150512';
//                  codSusp := '2';
//                end;
              end;

              with infoTrab do
              begin
                regPt := eSStrTotpRegPt(ok, cdsTabela.FieldByName('regime_ponto').AsString);

                // Informação de Contratação de Aprendiz
                with infoApr do
                begin
                  contApr   := caDispensado;
//                  nrProcJud := '20150612';
//
//                  contEntEd := tpSim;
//                  infoEntEduc.Clear;
//                  with infoEntEduc.Add do
//                    NrInsc := '0123456789';
                end;

                // Contratação de trabalhadores com Deficiência
                if (cdsTabela.FieldByName('aliquota_rat').AsInteger = 1) then
                  infoPCD.contPCD := eSStrToTpContPCD(ok, cdsTabela.FieldByName('contrata_pcd').AsString);
              end;
            end;

            NovaValidade.IniValid := FormatDateTime('yyyy"-"mm', aDataImplantacao);
            NovaValidade.FimValid := '2099-12';
          end;
        end;
      end;

      aLabel.Caption     := Trim(cdsTabela.FieldByName('RAZAO_SOCIAL').AsString);
      aProcesso.Progress := I;
      Application.ProcessMessages;
      Inc(I);

      Writeln(flOperacao_eS1005, 'S1005|' + MODO_OPERACAO[Ord(aModoLancamento)] + '|' + FormatFloat('0000000000', cdsTabela.FieldByName('ID').AsInteger));
      cdsTabela.Next;
    end;

    aRetorno := True;
    aProtocolo.S1005  := aRetorno;
  finally
    CloseFile(flOperacao_eS1005);
    if not aRetorno then
      DeleteFile(aFileProcesso);

    aSQL.Free;
    Result := aRetorno;
  end;
end;

function TdmESocial.Gerar_eSocial1010(aCompetencia: String; aZerarBase: Boolean; aModoLancamento: TModoLancamento;
  aLabel: TLabel; aProcesso: TGauge; var aProtocolo : TProtocoloESocial): Boolean;
var
  aRetorno : Boolean;
  aSQL : TStringList;
  ok   : Boolean;
  aEventoID,
  I    : Integer;
  aInicio,
  aFim   : String;
  aFileProcesso : String;
begin
  aFileProcesso := '.\log\eS1010.txt';
  AssignFile(flOperacao_eS1010, aFileProcesso);
  Rewrite(flOperacao_eS1010);

  aRetorno := False;
  aSQL := TStringList.Create;
  ok   := True;
  try
    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Select');
    aSQL.Add('    e.*');
    aSQL.Add('  , (Select CNPJ from CONFIG_ORGAO c where c.id = 1) as CNPJ ');
    aSQL.Add('  , x.ano_mes_min');
    aSQL.Add('  , x.ano_mes_max');
    aSQL.Add('  , ' + QuotedStr(FLAG_NAO) + ' as INCIDE_FGTS');
    aSQL.Add('  , ' + QuotedStr(FLAG_NAO) + ' as INCIDE_SIND');
    aSQL.Add('from EVENTO e');
    aSQL.Add('  left join (');
    aSQL.Add('    Select');
    aSQL.Add('        l.id_evento');
    aSQL.Add('      , min(l.ano_mes) as ano_mes_min');
    aSQL.Add('      , max(l.ano_mes) as ano_mes_max');
    aSQL.Add('    from LANCTO_EVENTO_CALC l');
    aSQL.Add('    group by');
    aSQL.Add('        l.id_evento');
    aSQL.Add('  ) x on (x.id_evento = e.id)');
    aSQL.Add('where (coalesce(e.nat_rubrica, '''') <> '''')');

    case aModoLancamento of
      mlInclusao  : aSQL.Add('  and e.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_INSERIR));
      mlAlteracao : aSQL.Add('  and e.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_ALTERAR));
      mlExclusao  : aSQL.Add('  and e.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_EXCLUIR));
    end;

    aSQL.EndUpdate;
    aSQL.SaveToFile('.\log\eS1010.sql');
    SetSQL(aSQL);

    I := 1;

    aProcesso.MaxValue := cdsTabela.RecordCount;
    aProcesso.Progress := 0;
    Application.ProcessMessages;

//    if not cdsTabela.IsEmpty then
//      aEventoID := StrToInt(IncrementGenerator('GEN_ESOCIAL_EVENTO_S1010', 1));

    cdsTabela.First;
    while not cdsTabela.Eof do
    begin
      with ACBrESocial.Eventos.Tabelas.S1010.Add do
      begin
        aEventoID := StrToInt(IncrementGenerator('GEN_ESOCIAL_EVENTO_S1010', 1));
        evtTabRubrica.Sequencial := aEventoID;

        if AmbienteWebServiceProducao then
          evtTabRubrica.IdeEvento.TpAmb := TpTpAmb(0) //taProducao
        else
          evtTabRubrica.IdeEvento.TpAmb := taProducaoRestrita;

        evtTabRubrica.IdeEvento.ProcEmi := peAplicEmpregador;
        evtTabRubrica.IdeEvento.VerProc := Versao_Executavel(ParamStr(0));

        evtTabRubrica.IdeEmpregador.TpInsc := tiCNPJ;
        evtTabRubrica.IdeEmpregador.NrInsc := Criptografa(cdsTabela.FieldByName('CNPJ').AsString, '2', 14);

        with ACBrESocial.Configuracoes do
          Geral.IdEmpregador := evtTabRubrica.IdeEmpregador.NrInsc;

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

        if (AnsiUpperCase(Trim(cdsTabela.FieldByName('INCIDE_PREVID').AsString)) = FLAG_NAO) then
          evtTabRubrica.infoRubrica.DadosRubrica.codIncCP := cicNaoeBasedeCalculo
        else
          evtTabRubrica.infoRubrica.DadosRubrica.codIncCP := eSStrToCodIncCP(ok, '11'); // cicBasedeCalculodoSalariodeContribuicaoMensal

        if (AnsiUpperCase(Trim(cdsTabela.FieldByName('INCIDE_IRRF').AsString)) = FLAG_NAO) then
          evtTabRubrica.infoRubrica.DadosRubrica.codIncIRRF := ciiNaoeBasedeCalculo
        else
          evtTabRubrica.infoRubrica.DadosRubrica.codIncIRRF := eSStrToCodIncIRRF(ok, '11'); // ciiBasedeCalculoIRRFRemMensal

        if (AnsiUpperCase(Trim(cdsTabela.FieldByName('INCIDE_FGTS').AsString)) = FLAG_NAO) then
          evtTabRubrica.infoRubrica.DadosRubrica.codIncFGTS := cdfNaoeBasedeCalculo
        else
          evtTabRubrica.infoRubrica.DadosRubrica.codIncFGTS := eSStrToCodIncFGTS(ok, '11'); // cdfBasedeCalculoFGTS

        if (AnsiUpperCase(Trim(cdsTabela.FieldByName('INCIDE_SIND').AsString)) = FLAG_NAO) then
          evtTabRubrica.infoRubrica.DadosRubrica.codIncSIND := cisNaoebasedecalculo
        else
          evtTabRubrica.infoRubrica.DadosRubrica.codIncSIND := eSStrToCodIncSIND(ok, '11'); // cisBasedecalculo

        evtTabRubrica.infoRubrica.DadosRubrica.observacao := AnsiUpperCase(Trim(cdsTabela.FieldByName('descr_categ_tcm').AsString));

        evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoCP.Clear;
        if (StrToIntDef(eSCodIncCPToStr(evtTabRubrica.infoRubrica.DadosRubrica.codIncCP), 0) >= 91) then
          with evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoCP.Add do
          begin
            nrProc     := EmptyStr;
            ExtDecisao := edContribPatronaisSegurados;
            codSusp    := '1';
          end;

        evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoIRRF.Clear;
        if (StrToIntDef(eSCodIncIRRFToStr(evtTabRubrica.infoRubrica.DadosRubrica.codIncIRRF), 0) >= 91) then
          with evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoIRRF.Add do
          begin
            nrProc  := EmptyStr;
            codSusp := '2';
          end;

        evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoFGTS.Clear;
        if (StrToIntDef(eSCodIncFGTSToStr(evtTabRubrica.infoRubrica.DadosRubrica.codIncFGTS), 0) = 91) then
          with evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoFGTS.Add do
          begin
            nrProc := EmptyStr;
          end;

        evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoSIND.Clear;
        if (StrToIntDef(eSCodIncSINDToStr(evtTabRubrica.infoRubrica.DadosRubrica.codIncSIND), 0) = 91) then
          with evtTabRubrica.infoRubrica.DadosRubrica.IdeProcessoSIND.Add do
          begin
            nrProc := EmptyStr;
          end;

        evtTabRubrica.infoRubrica.NovaValidade.IniValid := aCompetencia;
        evtTabRubrica.infoRubrica.NovaValidade.FimValid := '2099-12';

        if (AnsiUpperCase(Trim(cdsTabela.FieldByName('SEM_USO').AsString)) = FLAG_SIM) then
        begin
          aInicio := Trim(cdsTabela.FieldByName('ANO_MES_MIN').AsString);
          aFim    := Trim(cdsTabela.FieldByName('ANO_MES_MAX').AsString);

          aInicio := Copy(aInicio, 1, 4) + '-' + Copy(aInicio, 5, 2);

          if (StrToIntDef(Copy(aFim, 5, 2), 0) > 12) then
            aFim := Copy(aFim, 1, 4) + '-12'
          else
            aFim := Copy(aFim, 1, 4) + '-' + Copy(aFim, 5, 2);

          evtTabRubrica.infoRubrica.NovaValidade.IniValid := aInicio;
          evtTabRubrica.infoRubrica.NovaValidade.FimValid := aFim;
        end;

      end;

      aLabel.Caption     := Trim(cdsTabela.FieldByName('DESCRICAO').AsString);
      aProcesso.Progress := I;
      Application.ProcessMessages;
      Inc(I);

      Writeln(flOperacao_eS1010, 'S1010|' + MODO_OPERACAO[Ord(aModoLancamento)] + '|' + FormatFloat('0000000000', cdsTabela.FieldByName('ID').AsInteger));
      cdsTabela.Next;
    end;

    aRetorno := True;
    aProtocolo.S1010 := aRetorno;
  finally
    CloseFile(flOperacao_eS1010);
    if not aRetorno then
      DeleteFile(aFileProcesso);

    aSQL.Free;
    Result := aRetorno;
  end;
end;

function TdmESocial.Gerar_eSocial1020(aCompetencia: String; aZerarBase: Boolean; aModoLancamento: TModoLancamento;
  aLabel: TLabel; aProcesso: TGauge; var aProtocolo : TProtocoloESocial): Boolean;
var
  aRetorno : Boolean;
  aSQL : TStringList;
  ok   : Boolean;
  aEventoID,
  I    : Integer;
  aFileProcesso : String;
begin
  aFileProcesso := '.\log\eS1020.txt';
  AssignFile(flOperacao_eS1020, aFileProcesso);
  Rewrite(flOperacao_eS1020);

  aRetorno := False;
  aSQL := TStringList.Create;
  ok   := True;
  try
    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Select');
    aSQL.Add('    u.RAZAO_SOCIAL as ENTE_FERERATIVO');
    aSQL.Add('  , u.cnpj as ENTE_CNPJ');
    aSQL.Add('  , c.*');
    aSQL.Add('from CONFIG_ORGAO c');
    aSQL.Add('  inner join CONFIG_ESOCIAL e on (e.id_config_orgao = c.id)');
    aSQL.Add('  inner join UNID_GESTORA   u on (u.id = e.id_unid_gestora and u.id = 1)');

    case aModoLancamento of
      mlInclusao  : aSQL.Add('  and c.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_INSERIR));
      mlAlteracao : aSQL.Add('  and c.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_ALTERAR));
      mlExclusao  : aSQL.Add('  and c.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_EXCLUIR));
    end;

    aSQL.EndUpdate;
    aSQL.SaveToFile('.\log\eS1020.sql');
    SetSQL(aSQL);

    I := 1;

    aProcesso.MaxValue := cdsTabela.RecordCount;
    aProcesso.Progress := 0;
    Application.ProcessMessages;

    if not cdsTabela.IsEmpty then
      aEventoID := StrToInt(IncrementGenerator('GEN_ESOCIAL_EVENTO_S1020', 1));


    cdsTabela.First;
    while not cdsTabela.Eof do
    begin
      with ACBrESocial.Eventos.Tabelas.S1020.Add do
      begin
        with EvtTabLotacao do
        begin
          Sequencial := aEventoID;

          if AmbienteWebServiceProducao then
            IdeEvento.TpAmb := TpTpAmb(0) //taProducao
          else
            IdeEvento.TpAmb := taProducaoRestrita;

          IdeEvento.ProcEmi := peAplicEmpregador;
          IdeEvento.VerProc := Versao_Executavel(ParamStr(0));

          IdeEmpregador.TpInsc := tiCNPJ;
          IdeEmpregador.NrInsc := Criptografa(cdsTabela.FieldByName('CNPJ').AsString, '2', 14);

          with ACBrESocial.Configuracoes do
            Geral.IdEmpregador := EvtTabLotacao.IdeEmpregador.NrInsc;

          ModoLancamento := aModoLancamento;

          with infoLotacao do
          begin
            IdeLotacao.codLotacao := FormatFloat('0000000', cdsTabela.FieldByName('ID').AsInteger);
            IdeLotacao.IniValid   := aCompetencia;
            IdeLotacao.FimValid   := '2099-12';

            with dadosLotacao do
            begin
              tpLotacao := '01';
              TpInsc    := tiCNPJ;
              NrInsc    := Criptografa(cdsTabela.FieldByName('CNPJ').AsString, '2', 14);

              with fPasLotacao do
              begin
                Fpas         := cdsTabela.FieldByName('COD_FPAS').AsString;
                codTercs     := '0000';
                codTercsSusp := EmptyStr;

//                // Informações de Processos Judiciais relativos às Contribuições Destinadas a outras Entidades
//                with infoProcJudTerceiros do
//                begin
//                  procJudTerceiro.Clear;
//
//                  with procJudTerceiro.Add do
//                  begin
//                    codTerc   := '1111';
//                    nrProcJud := '1234567891239-1345';
//                    codSusp   := '1';
//                  end;
//                end;
              end;
//              // Não se aplica a Órgãos Públicos
//              with infoEmprParcial do
//              begin
//                tpInscContrat := tpTpInscContratante(0);
//                NrInscContrat := '74563214500045';
//                tpInscProp    := TpTpInscProp(0);
//                nrInscProp    := '654234523416';
//              end;
            end;

            NovaValidade.IniValid := aCompetencia;
            NovaValidade.FimValid := '2099-12';
          end;
        end;
      end;

      aLabel.Caption     := Trim(cdsTabela.FieldByName('ENTE_FERERATIVO').AsString);
      aProcesso.Progress := I;
      Application.ProcessMessages;
      Inc(I);

      Writeln(flOperacao_eS1020, 'S1020|' + MODO_OPERACAO[Ord(aModoLancamento)] + '|' + FormatFloat('0000000000', cdsTabela.FieldByName('ID').AsInteger));
      cdsTabela.Next;
    end;
(*
  with ACBreSocial1.Eventos.Tabelas.S1020.Add do
  begin
    with EvtTabLotacao do
    begin
      Sequencial := 0;
      ModoLancamento := GetTipoOperacao;

      IdeEvento.TpAmb := taProducaoRestrita;
      IdeEvento.ProcEmi := TpProcEmi(0);
      IdeEvento.VerProc := '1.0';

      IdeEmpregador.TpInsc := tiCPF;
      IdeEmpregador.NrInsc := '0123456789';

      with infoLotacao do
      begin
        IdeLotacao.codLotacao := '300000';
        IdeLotacao.IniValid := '2015-06';
        IdeLotacao.FimValid := '2099-12';

        with dadosLotacao do
        begin
          tpLotacao := '01';
          TpInsc := tiCAEPF;
          NrInsc := '6564646565';

          with fPasLotacao do
          begin
            Fpas := '515';
            codTercs := '0015';
            codTercsSusp := '0506';

            with infoProcJudTerceiros do
            begin
              procJudTerceiro.Clear;

              with procJudTerceiro.Add do
              begin
                codTerc := '1111';
                nrProcJud := '1234567891239-1345';
                codSusp := '1';
              end;
            end;
          end;

          with infoEmprParcial do
          begin
            tpInscContrat := tpTpInscContratante(0);
            NrInscContrat := '74563214500045';
            tpInscProp := TpTpInscProp(0);
            nrInscProp := '654234523416';
          end;
        end;

        NovaValidade.IniValid := '2015-06';
        NovaValidade.FimValid := '2099-12';
      end;
    end;
  end;
*)
    aRetorno := True;
    aProtocolo.S1020 := aRetorno;
  finally
    CloseFile(flOperacao_eS1020);
    if not aRetorno then
      DeleteFile(aFileProcesso);

    aSQL.Free;
    Result := aRetorno;
  end;
end;

function TdmESocial.Gerar_eSocial1030(aCompetencia: String; aZerarBase: Boolean; aModoLancamento: TModoLancamento;
  aLabel: TLabel; aProcesso: TGauge; var aProtocolo : TProtocoloESocial): Boolean;
var
  aRetorno : Boolean;
  aSQL : TStringList;
  ok   : Boolean;
  aEventoID,
  I    : Integer;
  aFileProcesso : String;
begin
  aFileProcesso := '.\log\eS1030.txt';
  AssignFile(flOperacao_eS1030, aFileProcesso);
  Rewrite(flOperacao_eS1030);

  aRetorno := False;
  aSQL := TStringList.Create;
  ok   := True;
  try
    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Select '); // first 1
    aSQL.Add('    f.*');
    aSQL.Add('  , c.codigo as cbo ');
    aSQL.Add('  , e.cod_rais as escolaridade ');
    aSQL.Add('  , Case when coalesce(f.dt_extinsao, current_date) > cast(' + QuotedStr(aCompetencia + '-01') + ' as date) then 0 else 1 end extinto');
    aSQL.Add('  , (Select CNPJ from CONFIG_ORGAO c where c.id = 1) as CNPJ ');
    aSQL.Add('from CARGO_FUNCAO f');
    aSQL.Add('  inner join CBO c on (c.id = f.id_cbo)');
    aSQL.Add('  left join ESCOLARIDADE e on (e.id = f.id_escolaridade)');
    aSQL.Add('where (f.id > 0)');

    case aModoLancamento of
      mlInclusao  : aSQL.Add('  and f.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_INSERIR));
      mlAlteracao : aSQL.Add('  and f.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_ALTERAR));
      mlExclusao  : aSQL.Add('  and f.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_EXCLUIR));
    end;

    aSQL.EndUpdate;
    aSQL.SaveToFile('.\log\eS1030.sql');
    SetSQL(aSQL);

    I := 1;

    aProcesso.MaxValue := cdsTabela.RecordCount;
    aProcesso.Progress := 0;
    Application.ProcessMessages;

//    if not cdsTabela.IsEmpty then
//      aEventoID := StrToInt(IncrementGenerator('GEN_ESOCIAL_EVENTO_S1030', 1));

    cdsTabela.First;
    while not cdsTabela.Eof do
    begin
      with ACBrESocial.Eventos.Tabelas.S1030.Add do
      begin
        aEventoID := StrToInt(IncrementGenerator('GEN_ESOCIAL_EVENTO_S1030', 1));
        evtTabCargo.Sequencial := aEventoID;

        if AmbienteWebServiceProducao then
          evtTabCargo.IdeEvento.TpAmb := TpTpAmb(0) //taProducao
        else
          evtTabCargo.IdeEvento.TpAmb := taProducaoRestrita;

        evtTabCargo.IdeEvento.ProcEmi := peAplicEmpregador;
        evtTabCargo.IdeEvento.VerProc := Versao_Executavel(ParamStr(0));

        evtTabCargo.IdeEmpregador.TpInsc := tiCNPJ;
        evtTabCargo.IdeEmpregador.NrInsc := Criptografa(cdsTabela.FieldByName('CNPJ').AsString, '2', 14);

        with ACBrESocial.Configuracoes do
          Geral.IdEmpregador := evtTabCargo.IdeEmpregador.NrInsc;

        evtTabCargo.ModoLancamento := aModoLancamento;

        evtTabCargo.infoCargo.IdeCargo.CodCargo := cdsTabela.FieldByName('id').AsString;
        evtTabCargo.infoCargo.IdeCargo.IniValid := aCompetencia;
        evtTabCargo.infoCargo.IdeCargo.FimValid := '2099-12';

        evtTabCargo.infoCargo.DadosCargo.nmCargo := AnsiUpperCase(Trim(cdsTabela.FieldByName('descricao').AsString));
        evtTabCargo.infoCargo.DadosCargo.codCBO  := cdsTabela.FieldByName('cbo').AsString;

        evtTabCargo.infoCargo.DadosCargo.cargoPublico.acumCargo   := eSStrToAcumCargo(ok, cdsTabela.FieldByName('acumula_cargo').AsString);
        evtTabCargo.infoCargo.DadosCargo.cargoPublico.contagemEsp := eSStrToContagemEsp(ok, cdsTabela.FieldByName('contagem_especial').AsString);
        evtTabCargo.infoCargo.DadosCargo.cargoPublico.dedicExcl   := eSStrToSimNao(ok, cdsTabela.FieldByName('dedicacao_exclusiva').AsString);

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

      Writeln(flOperacao_eS1030, 'S1030|' + MODO_OPERACAO[Ord(aModoLancamento)] + '|' + FormatFloat('0000000000', cdsTabela.FieldByName('ID').AsInteger));
      cdsTabela.Next;
    end;

    aRetorno := True;
    aProtocolo.S1030 := aRetorno;
  finally
    CloseFile(flOperacao_eS1030);
    if not aRetorno then
      DeleteFile(aFileProcesso);

    aSQL.Free;
    Result := aRetorno;
  end;
end;

function TdmESocial.Gerar_eSocial1035(aCompetencia: String; aZerarBase: Boolean; aModoLancamento: TModoLancamento;
  aLabel: TLabel; aProcesso: TGauge; var aProtocolo : TProtocoloESocial): Boolean;
var
  aRetorno : Boolean;
  aSQL : TStringList;
  ok   : Boolean;
  aEventoID,
  I    : Integer;
begin
  aRetorno := False;
  aSQL := TStringList.Create;
  ok   := True;
  try

    Mensagem('Evento não disponível para esta versão.'#13'Favor entrar em contato com o fornecedor do software.' , 'Alerta', MB_ICONWARNING);

    aProtocolo.S1035 := aRetorno;
  finally
    aSQL.Free;
    Result := aRetorno;
  end;
end;

function TdmESocial.Gerar_eSocial1040(aCompetencia: String; aZerarBase: Boolean; aModoLancamento: TModoLancamento;
  aLabel: TLabel; aProcesso: TGauge; var aProtocolo : TProtocoloESocial): Boolean;
var
  aRetorno : Boolean;
  aSQL : TStringList;
  ok   : Boolean;
  aEventoID,
  I    : Integer;
begin
  aRetorno := False;
  aSQL := TStringList.Create;
  ok   := True;
  try
    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Select '); // first 1
    aSQL.Add('    f.*');
    aSQL.Add('  , c.codigo as cbo ');
    aSQL.Add('  , Case when coalesce(f.dt_extinsao, current_date) > cast(' + QuotedStr(aCompetencia + '-01') + ' as date) then 0 else 1 end extinto');
    aSQL.Add('  , (Select CNPJ from CONFIG_ORGAO c where c.id = 1) as CNPJ ');
    aSQL.Add('from CARGO_FUNCAO f');
    aSQL.Add('  inner join CBO c on (c.id = f.id_cbo)');
    aSQL.Add('where (f.id > 0)');
    aSQL.Add('  and (f.id_tipo_cargo_tcm = 10)'); // COMISSIONADO

    case aModoLancamento of
      mlInclusao  : aSQL.Add('  and f.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_INSERIR));
      mlAlteracao : aSQL.Add('  and f.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_ALTERAR));
      mlExclusao  : aSQL.Add('  and f.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_EXCLUIR));
    end;

    aSQL.EndUpdate;
    aSQL.SaveToFile('.\log\eS1040.sql');
    SetSQL(aSQL);

    I := 1;

    aProcesso.MaxValue := cdsTabela.RecordCount;
    aProcesso.Progress := 0;
    Application.ProcessMessages;

    cdsTabela.First;
    while not cdsTabela.Eof do
    begin
      with ACBrESocial.Eventos.Tabelas.S1040.Add, EvtTabFuncao do
      begin
        aEventoID := StrToInt(IncrementGenerator('GEN_ESOCIAL_EVENTO_S1040', 1));
        EvtTabFuncao.Sequencial := aEventoID;

        if AmbienteWebServiceProducao then
          IdeEvento.TpAmb := TpTpAmb(0) //taProducao
        else
          IdeEvento.TpAmb := taProducaoRestrita;

        IdeEvento.ProcEmi := peAplicEmpregador;
        IdeEvento.VerProc := Versao_Executavel(ParamStr(0));

        IdeEmpregador.TpInsc := tiCNPJ;
        IdeEmpregador.NrInsc := Criptografa(cdsTabela.FieldByName('CNPJ').AsString, '2', 14);

        with ACBrESocial.Configuracoes do
          Geral.IdEmpregador := EvtTabFuncao.IdeEmpregador.NrInsc;

        ModoLancamento := aModoLancamento;

        InfoFuncao.IdeFuncao.CodFuncao := cdsTabela.FieldByName('id').AsString;
        InfoFuncao.IdeFuncao.IniValid  := aCompetencia;
        InfoFuncao.IdeFuncao.FimValid  := '2099-12';

        InfoFuncao.DadosFuncao.dscFuncao := AnsiUpperCase(Trim(cdsTabela.FieldByName('descricao').AsString));
        InfoFuncao.DadosFuncao.codCBO    := cdsTabela.FieldByName('cbo').AsString;

        InfoFuncao.NovaValidade.IniValid := aCompetencia;
        InfoFuncao.NovaValidade.FimValid := '2099-12';
      end;

      aLabel.Caption     := Trim(cdsTabela.FieldByName('DESCRICAO').AsString);
      aProcesso.Progress := I;
      Application.ProcessMessages;
      Inc(I);

      cdsTabela.Next;
    end;

    aRetorno := True;
    aProtocolo.S1040 := aRetorno;
  finally
    aSQL.Free;
    Result := aRetorno;
  end;
end;

function TdmESocial.Gerar_eSocial1050(aCompetencia: String; aZerarBase: Boolean; aModoLancamento: TModoLancamento;
  aLabel: TLabel; aProcesso: TGauge; var aProtocolo : TProtocoloESocial): Boolean;
var
  aRetorno : Boolean;
  aSQL : TStringList;
  ok   : Boolean;
  aEventoID,
  I    : Integer;
begin
  aRetorno := False;
  aSQL := TStringList.Create;
  ok   := True;
  try
    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Select ');
    aSQL.Add('    h.id ');
    aSQL.Add('  , h.descr_horario as descricao ');
    aSQL.Add('  , h.hora_entrada1 as hora_entrada ');
    aSQL.Add('  , coalesce(h.hora_saida2, h.hora_saida) as hora_saida ');
    aSQL.Add('  , h.duracao_jornada       ');
    aSQL.Add('  , h.permite_flexibilidade ');
    aSQL.Add('  , h.tipo_intervalo    ');
    aSQL.Add('  , h.duracao_intervalo ');
    aSQL.Add('  , h.intervalo_inicio  ');
    aSQL.Add('  , h.intervalo_final   ');
    aSQL.Add('  , (Select CNPJ from CONFIG_ORGAO c where c.id = 1) as CNPJ ');
    aSQL.Add('from TAB_HORARIO h ');
    aSQL.Add('where (h.id > 0)   ');

    case aModoLancamento of
      mlInclusao  : aSQL.Add('  and h.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_INSERIR));
      mlAlteracao : aSQL.Add('  and h.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_ALTERAR));
      mlExclusao  : aSQL.Add('  and h.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_EXCLUIR));
    end;

    aSQL.EndUpdate;
    aSQL.SaveToFile('.\log\eS1050.sql');
    SetSQL(aSQL);

    I := 1;

    aProcesso.MaxValue := cdsTabela.RecordCount;
    aProcesso.Progress := 0;
    Application.ProcessMessages;

    cdsTabela.First;
    while not cdsTabela.Eof do
    begin
      with ACBrESocial.Eventos.Tabelas.S1050.Add, EvtTabHorContratual do
      begin
        aEventoID := StrToInt(IncrementGenerator('GEN_ESOCIAL_EVENTO_S1050', 1));
        Sequencial:= aEventoID;

        if AmbienteWebServiceProducao then
          IdeEvento.TpAmb := TpTpAmb(0) //taProducao
        else
          IdeEvento.TpAmb := taProducaoRestrita;

        IdeEvento.ProcEmi := peAplicEmpregador;
        IdeEvento.VerProc := Versao_Executavel(ParamStr(0));

        IdeEmpregador.TpInsc := tiCNPJ;
        IdeEmpregador.NrInsc := Criptografa(cdsTabela.FieldByName('CNPJ').AsString, '2', 14);

        with ACBrESocial.Configuracoes do
          Geral.IdEmpregador := EvtTabHorContratual.IdeEmpregador.NrInsc;

        ModoLancamento := aModoLancamento;

        InfoHorContratual.ideHorContratual.codHorContrat := cdsTabela.FieldByName('id').AsString;
        InfoHorContratual.ideHorContratual.IniValid  := aCompetencia;
        InfoHorContratual.ideHorContratual.FimValid  := '2099-12';

        with InfoHorContratual.dadosHorContratual do
        begin
          hrEntr         := Trim(cdsTabela.FieldByName('hora_entrada').AsString);
          hrSaida        := Trim(cdsTabela.FieldByName('hora_saida').AsString);
          durJornada     := StrToIntDef(Trim(cdsTabela.FieldByName('duracao_jornada').AsString), 0);
          perHorFlexivel := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('permite_flexibilidade').AsString));

          horarioIntervalo.Clear;

          if (StrToIntDef(Trim(cdsTabela.FieldByName('duracao_intervalo').AsString), 0) > 0) then
            with horarioIntervalo.Add do
            begin
              tpInterv   := eSStrToTpIntervalo(ok, Trim(cdsTabela.FieldByName('tipo_intervalo').AsString));
              durInterv  := StrToIntDef(Trim(cdsTabela.FieldByName('duracao_intervalo').AsString), 0);
              iniInterv  := Trim(cdsTabela.FieldByName('intervalo_inicio').AsString);
              termInterv := Trim(cdsTabela.FieldByName('intervalo_final').AsString);
            end;
        end;

        InfoHorContratual.NovaValidade.IniValid := aCompetencia;
        InfoHorContratual.NovaValidade.FimValid := '2099-12';
      end;

      aLabel.Caption     := Trim(cdsTabela.FieldByName('descricao').AsString);
      aProcesso.Progress := I;
      Application.ProcessMessages;
      Inc(I);

      cdsTabela.Next;
    end;

    aRetorno := True;
    aProtocolo.S1050 := aRetorno;
  finally
    aSQL.Free;
    Result := aRetorno;
  end;
end;

function TdmESocial.Gerar_eSocial1060(aCompetencia: String; aZerarBase: Boolean; aModoLancamento: TModoLancamento;
  aLabel: TLabel; aProcesso: TGauge; var aProtocolo : TProtocoloESocial): Boolean;
var
  aRetorno : Boolean;
  aSQL : TStringList;
  ok   : Boolean;
  aEventoID,
  I    : Integer;
begin
  aRetorno := False;
  aSQL := TStringList.Create;
  ok   := True;
  try
    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Select   ');
    aSQL.Add('    d.id ');
    aSQL.Add('  , d.descricao  ');
    aSQL.Add('  , d.local_tipo ');
    aSQL.Add('  , (Select CNPJ from CONFIG_ORGAO c where c.id = 1) as CNPJ ');
    aSQL.Add('from DEPTO d ');
    aSQL.Add('where (d.id > 0)   ');

    case aModoLancamento of
      mlInclusao  : aSQL.Add('  and d.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_INSERIR));
      mlAlteracao : aSQL.Add('  and d.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_ALTERAR));
      mlExclusao  : aSQL.Add('  and d.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_EXCLUIR));
    end;

    aSQL.EndUpdate;
    aSQL.SaveToFile('.\log\eS1060.sql');
    SetSQL(aSQL);

    I := 1;

    aProcesso.MaxValue := cdsTabela.RecordCount;
    aProcesso.Progress := 0;
    Application.ProcessMessages;

    cdsTabela.First;
    while not cdsTabela.Eof do
    begin
      with ACBrESocial.Eventos.Tabelas.S1060.Add, EvtTabAmbiente do
      begin
        aEventoID := StrToInt(IncrementGenerator('GEN_ESOCIAL_EVENTO_S1060', 1));
        Sequencial:= aEventoID;

        if AmbienteWebServiceProducao then
          IdeEvento.TpAmb := TpTpAmb(0) //taProducao
        else
          IdeEvento.TpAmb := taProducaoRestrita;

        IdeEvento.ProcEmi := peAplicEmpregador;
        IdeEvento.VerProc := Versao_Executavel(ParamStr(0));

        IdeEmpregador.TpInsc := tiCNPJ;
        IdeEmpregador.NrInsc := Criptografa(cdsTabela.FieldByName('CNPJ').AsString, '2', 14);

        with ACBrESocial.Configuracoes do
          Geral.IdEmpregador := EvtTabAmbiente.IdeEmpregador.NrInsc;

        ModoLancamento := aModoLancamento;

        infoAmbiente.ideAmbiente.codAmb   := Trim(cdsTabela.FieldByName('id').AsString);
        infoAmbiente.ideAmbiente.IniValid := aCompetencia;
        infoAmbiente.ideAmbiente.FimValid := '2099-12';

        with infoAmbiente.dadosAmbiente do
        begin
          dscAmb   := Trim(cdsTabela.FieldByName('descricao').AsString);
          localAmb := eSStrToLocalAmb(ok, Trim(cdsTabela.FieldByName('local_tipo').AsString));

          if (localAmb = laEstabProprioEmpregador) then
          begin
            TpInsc := atCNPJ;
            NrInsc := Criptografa(cdsTabela.FieldByName('CNPJ').AsString, '2', 14);
          end;

          fatorRisco.Clear;

          aSQL.BeginUpdate;
          aSQL.Clear;
          aSQL.Add('Select ');
          aSQL.Add('    f.id_fator_risco as codigo ');
          aSQL.Add('from DEPTO_FATOR_RISCO f ');
          aSQL.Add('where (f.id_depto = ' + Trim(cdsTabela.FieldByName('id').AsString) + ') ');

          aSQL.EndUpdate;
          SetSQL_Detalhe(aSQL);

          cdsDetalhe.First;
          if (cdsDetalhe.RecordCount > 0) then
          begin
            while not cdsDetalhe.Eof do
            begin
              with fatorRisco.Add do
                codFatRis := Trim(cdsDetalhe.FieldByName('codigo').AsString);

              cdsDetalhe.Next;
            end;
          end
          else
            with fatorRisco.Add do
              codFatRis := '0901001'; // Ausência de Fator de Risco

          cdsDetalhe.Close;
        end;

        infoAmbiente.NovaValidade.IniValid := aCompetencia;
        infoAmbiente.NovaValidade.FimValid := '2099-12';
      end;

      aLabel.Caption     := Trim(cdsTabela.FieldByName('descricao').AsString);
      aProcesso.Progress := I;
      Application.ProcessMessages;
      Inc(I);

      cdsTabela.Next;
    end;

    aRetorno := True;
    aProtocolo.S1060 := aRetorno;
  finally
    aSQL.Free;
    Result := aRetorno;
  end;
end;

function TdmESocial.Gerar_eSocial2200(aCompetencia: TCompetencia; aZerarBase: Boolean; aModoLancamento: TModoLancamento;
  aLabel: TLabel; aProcesso: TGauge; var aProtocolo: TProtocoloESocial): Boolean;
var
  aRetorno : Boolean;
  aSQL : TStringList;
  ok   : Boolean;
  aEventoID,
  I    : Integer;
  aDataInicial,
  aDataFinal  : TDateTime;
begin
  aDataInicial := aCompetencia.DataInicial; // StrToDate('01/' + Copy(aCompetencia, 6, 2) + '/' + Copy(aCompetencia, 1, 4));
  aDataFinal   := aCompetencia.DataFinal;   // StrToDate(FormatFloat('00', DaysInMonth(aDataInicial)) + FormatDateTime('/mm/yyyy', aDataInicial));

  aRetorno := False;
  aSQL := TStringList.Create;
  ok   := True;
  try
    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Select ');
    aSQL.Add('    p.* ');
    aSQL.Add('  , s.id as id_servidor ');
    aSQL.Add('  , coalesce(p.cnh_categ, ''B'') as cnh_categoria');

    aSQL.Add('  , coalesce(nullif(trim(p.apelido), ''''), p.nome) as nome_social ');
    aSQL.Add('  , left(replace(replace(trim(p.telefone), ''-'', ''''), '' '', ''''), 10) as nr_telefone');
    aSQL.Add('  , coalesce(nullif(nullif(trim(p.ender_num), ''''), ''0''), ''S/N'') as ender_numero');

    aSQL.Add('  , coalesce(r.id_esocial, 6) as id_raca ');
    aSQL.Add('  , coalesce(e.id_esocial, 1) as id_estado_civil ');
    aSQL.Add('  , coalesce(c.id_esocial, ''01'') as id_escola  ');
    aSQL.Add('  , cast((Select first 1 idade.r_qtd_anos || ''.'' || idade.r_qtd_meses from SP_CALC_IDADE(current_date, p.dt_nascimento) idade) as NUMERIC(15,2)) as nr_idade');

    aSQL.Add('  , ''N'' as primeiro_emprego ');
    aSQL.Add('  , ''N'' as serv_aposentado ');
    aSQL.Add('  , u.tipo_previd ');
    aSQL.Add('  , coalesce(s.matricula, substring(s.id from 1 for char_length(s.id) - 1)) as matricula');
    aSQL.Add('  , s.dt_admissao ');
    aSQL.Add('  , a.cnpj as cnpj_sindicato');
    aSQL.Add('  , s.id_situacao_tcm');
    aSQL.Add('  , s.id_cargo_origem');
    aSQL.Add('  , s.id_cargo_atual');
    aSQL.Add('  , f.id_tipo_cargo_tcm');
    aSQL.Add('  , coalesce(s.vencto_base, f.vencto_base) as vencto_base');
    aSQL.Add('  , s.observacao');
    aSQL.Add('  , coalesce(nullif(trim(s.pis_pasep_pf), ''''), nullif(trim(p.pis_pasep), ''''), ''00000000000'') as nis_trabalhador');

    aSQL.Add('  , coalesce(s.dt_readmissao, s.dt_admissao, current_date) as dt_nomeacao');
    aSQL.Add('  , coalesce(s.dt_readmissao, s.dt_admissao, current_date) as dt_posse');
    aSQL.Add('  , coalesce(s.dt_readmissao, s.dt_admissao, current_date) as dt_exercicio');

    aSQL.Add('  , coalesce(n.id_esocial, ''105'') as id_pais_nascimento   ');
    aSQL.Add('  , coalesce(n.id_esocial, ''105'') as id_pais_naturalidade ');
    aSQL.Add('  , coalesce(p.ender_tipo, ''IND'') as ender_tipo_lograd');

    aSQL.Add('  , null as ctps_num ');
    aSQL.Add('  , null as ctps_serie ');
    aSQL.Add('  , null as ctps_uf ');

    aSQL.Add('  , null as rne_num ');
    aSQL.Add('  , null as rne_orgao ');
    aSQL.Add('  , null as rne_uf ');
    aSQL.Add('  , null as rne_dt_emissao ');


    aSQL.Add('  , s.conselho_registro ');
    aSQL.Add('  , s.conselho_orgao    ');
    aSQL.Add('  , s.conselho_uf       ');
    aSQL.Add('  , s.conselho_dt_emissao  ');
    aSQL.Add('  , s.conselho_dt_validade ');

    aSQL.Add('  , coalesce(s.id_horario, 0) as id_horario');
    aSQL.Add('  , (cast(coalesce(cast(nullif(trim(h.duracao_jornada), '''') as integer), 0) / 60 as integer) * 5) as jornada_semanal');

    aSQL.Add('from SERVIDOR s');
    aSQL.Add('  inner join PESSOA_FISICA p on (p.id = s.id_pessoa_fisica)');
    aSQL.Add('  left join TAB_RACA_COR r on (r.id = p.id_raca_cor)');
    aSQL.Add('  left join ESTADO_CIVIL e on (e.id = p.id_estado_civil)');
    aSQL.Add('  left join ESCOLARIDADE c on (c.id = p.id_escolaridade)');
    aSQL.Add('  left join NACIONALIDADE n on (n.id = p.id_nacionalidade)');
    aSQL.Add('  left join SUB_UNID_ORCAMENT u on (u.id = s.id_sub_unid_orcament)');
    aSQL.Add('  left join CARGO_FUNCAO f on (f.id = coalesce(s.id_cargo_origem, s.id_cargo_atual))');
    aSQL.Add('  left join ENTID_SINDICAL a on (a.id = s.id_entid_sindical)');
    aSQL.Add('  left join TAB_HORARIO h on (h.id = s.id_horario)');
    aSQL.Add('where (s.id > 0)   ');
    aSQL.Add('  and (p.dt_nascimento is not null)');                // Sem Data de Nascimento
    aSQL.Add('  and (coalesce(trim(p.ender_cep), '''') <> '''')');  // Sem Número de CEP

    if ( StrToIntDef(OnlyNumber(aCompetencia.Codigo), 0) < (StrToInt(FormatDateTime('YYYYMM', Date)) - 1) ) then
      // Carga inicial
      aSQL.Add('  and (coalesce(s.dt_readmissao, s.dt_admissao) <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', aDataFinal)) + ')')
    else
      // Admissões do mês
      aSQL.Add('  and (coalesce(s.dt_readmissao, s.dt_admissao) between ' + QuotedStr(FormatDateTime('yyyy.mm.dd', aDataInicial)) + ' and ' + QuotedStr(FormatDateTime('yyyy.mm.dd', aDataFinal)) + ')');

    case aModoLancamento of
      mlInclusao  : aSQL.Add('  and s.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_INSERIR));
      mlAlteracao : aSQL.Add('  and s.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_ALTERAR));
      mlExclusao  : aSQL.Add('  and s.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_EXCLUIR));
    end;

    aSQL.EndUpdate;
    aSQL.SaveToFile('.\log\eS2200.sql');
    SetSQL(aSQL);

    I := 1;

    aProcesso.MaxValue := cdsTabela.RecordCount;
    aProcesso.Progress := 0;
    Application.ProcessMessages;

    ACBrESocial.Eventos.NaoPeriodicos.S2200.Clear;

    cdsTabela.First;
    while not cdsTabela.Eof do
    begin
      with ACBrESocial.Eventos.NaoPeriodicos.S2200.Add, EvtAdmissao do
      begin
        aEventoID := StrToInt(IncrementGenerator('GEN_ESOCIAL_EVENTO_S2200', 1));
        Sequencial:= aEventoID;

        if AmbienteWebServiceProducao then
          IdeEvento.TpAmb := TpTpAmb(0) //taProducao
        else
          IdeEvento.TpAmb := taProducaoRestrita;

        IdeEvento.indRetif := ireOriginal; // (ireOriginal, ireRetificacao);

        if (IdeEvento.indRetif = ireRetificacao) then
          IdeEvento.NrRecibo := '65.5454.987798798798' // Preencher com o número do recibo do arquivo a ser retificado.
        else
          IdeEvento.NrRecibo := EmptyStr;

        IdeEvento.ProcEmi  := peAplicEmpregador;
        IdeEvento.VerProc  := Versao_Executavel(ParamStr(0));

        IdeEmpregador.TpInsc := tiCNPJ;
        IdeEmpregador.NrInsc := Criptografa(Pesquisa('CONFIG_ORGAO', 'ID', '1', 'CNPJ', ''),'2', 14); //Criptografa(cdsTabela.FieldByName('CNPJ').AsString, '2', 14);

        with ACBrESocial.Configuracoes do
          Geral.IdEmpregador := EvtAdmissao.IdeEmpregador.NrInsc;

//        ModoLancamento := aModoLancamento;
//
//        infoAmbiente.ideAmbiente.codAmb   := Trim(cdsTabela.FieldByName('id').AsString);
//        infoAmbiente.ideAmbiente.IniValid := aCompetencia;
//        infoAmbiente.ideAmbiente.FimValid := '2099-12';

        with Trabalhador do
        begin
          CpfTrab    := OnlyNumber(Trim(cdsTabela.FieldByName('cpf').AsString));
          NisTrab    := Trim(cdsTabela.FieldByName('nis_trabalhador').AsString);
          NmTrab     := Trim(cdsTabela.FieldByName('nome').AsString);
          Sexo       := Trim(cdsTabela.FieldByName('sexo').AsString);
          RacaCor    := cdsTabela.FieldByName('id_raca').AsInteger;
          EstCiv     := cdsTabela.FieldByName('id_estado_civil').AsInteger;
          GrauInstr  := Trim(cdsTabela.FieldByName('id_escola').AsString);
          IndPriEmpr := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('primeiro_emprego').AsString));
          nmSoc      := Trim(cdsTabela.FieldByName('nome_social').AsString);

          with Nascimento do
          begin
            DtNascto   := cdsTabela.FieldByName('dt_nascimento').AsDateTime;
            codMunic   := cdsTabela.FieldByName('id_natural_cidade').AsInteger;
            uf         := Trim(cdsTabela.FieldByName('natural_uf').AsString);
            PaisNascto := Trim(cdsTabela.FieldByName('id_pais_nascimento').AsString);
            PaisNac    := Trim(cdsTabela.FieldByName('id_pais_naturalidade').AsString);
            NmMae      := Trim(cdsTabela.FieldByName('filiacao_pai').AsString);
            NmPai      := Trim(cdsTabela.FieldByName('filiacao_mae').AsString);
          end;

          with Documentos do
          begin
            // Informações da Carteira de Trabalho e Previdência Social
            if (Trim(cdsTabela.FieldByName('ctps_num').AsString) <> EmptyStr) then
            begin
              CTPS.NrCtps    := Trim(cdsTabela.FieldByName('ctps_num').AsString);
              CTPS.SerieCtps := Trim(cdsTabela.FieldByName('ctps_serie').AsString);
              CTPS.UfCtps    := Trim(cdsTabela.FieldByName('ctps_uf').AsString);
            end;

//            // Informações do Documento Nacional de Identidade - DNI (Registro de Identificação Civil - RIC)
//            RIC.NrRic        := '123123';
//            RIC.OrgaoEmissor := 'SSP';
//            RIC.DtExped      := date;
//
            if (Trim(cdsTabela.FieldByName('rg_num').AsString) <> EmptyStr) and (Trim(cdsTabela.FieldByName('rg_orgao_emissor').AsString) <> EmptyStr) then
            begin
              RG.NrRg         := OnlyNumber(Trim(cdsTabela.FieldByName('rg_num').AsString));
              RG.OrgaoEmissor := Trim(cdsTabela.FieldByName('rg_orgao_emissor').AsString) + '/' + Trim(cdsTabela.FieldByName('rg_uf').AsString);
              RG.DtExped      := cdsTabela.FieldByName('rg_dt_emissao').AsDateTime;
            end;

            // Informações do Registro Nacional de Estrangeiro
            if (Nascimento.PaisNac <> ID_NACIONALIDADE_BRASIL) then
            begin
              RNE.NrRne        := OnlyNumber(Trim(cdsTabela.FieldByName('rne_num').AsString));
              RNE.OrgaoEmissor := Trim(cdsTabela.FieldByName('rne_orgao').AsString) + '/' + Trim(cdsTabela.FieldByName('rne_uf').AsString);
              RNE.DtExped      := cdsTabela.FieldByName('rne_dt_emissao').AsDateTime;
            end;

            // Informações do número de registro em Órgão de Classe (OC)
            if (Trim(cdsTabela.FieldByName('conselho_registro').AsString) <> EmptyStr) and (Trim(cdsTabela.FieldByName('conselho_orgao').AsString) <> EmptyStr) then
            begin
              OC.NrOc         := OnlyNumber(Trim(cdsTabela.FieldByName('conselho_registro').AsString));
              OC.OrgaoEmissor := Trim(cdsTabela.FieldByName('conselho_orgao').AsString) + '/' + Trim(cdsTabela.FieldByName('conselho_uf').AsString);
              if not cdsTabela.FieldByName('conselho_dt_emissao').IsNull then
                OC.DtExped    := cdsTabela.FieldByName('conselho_dt_emissao').AsDateTime;
              if not cdsTabela.FieldByName('conselho_dt_validade').IsNull then
                OC.DtValid    := cdsTabela.FieldByName('conselho_dt_validade').AsDateTime;
            end;

            // Informações da Carteira Nacional de Habilitação (CNH)
            if (Trim(cdsTabela.FieldByName('cnh_num').AsString) <> EmptyStr) and (not cdsTabela.FieldByName('cnh_dt_vencto').IsNull) and (cdsTabela.FieldByName('cnh_dt_vencto').AsDateTime <> StrToDate(EMPTY_DATE)) then
            begin
              CNH.nrRegCnh     := OnlyNumber(Trim(cdsTabela.FieldByName('cnh_num').AsString));
              CNH.DtExped      := cdsTabela.FieldByName('cnh_dt_emissao').AsDateTime;
              CNH.ufCnh        := tpuf(ufPR);
              CNH.DtValid      := cdsTabela.FieldByName('cnh_dt_vencto').AsDateTime;
              CNH.categoriaCnh := eSStrToCnh(ok, Trim(cdsTabela.FieldByName('cnh_categoria').AsString));
              //CNH.dtPriHab     := date;
            end;
          end;

          with Endereco do
          begin
            with Brasil do
            begin
              TpLograd    := IfThen(Trim(cdsTabela.FieldByName('ender_tipo_lograd').AsString) = EmptyStr, 'IND', Trim(cdsTabela.FieldByName('ender_tipo_lograd').AsString));
              DscLograd   := IfThen(Trim(cdsTabela.FieldByName('ender_lograd').AsString) = EmptyStr, 'NAO INFORMADO', Trim(cdsTabela.FieldByName('ender_lograd').AsString));
              NrLograd    := Trim(cdsTabela.FieldByName('ender_numero').AsString);
              Complemento := Trim(cdsTabela.FieldByName('ender_complem').AsString);
              Bairro      := IfThen(Trim(cdsTabela.FieldByName('ender_bairro').AsString) = EmptyStr, 'NAO INFORMADO', Trim(cdsTabela.FieldByName('ender_bairro').AsString));
              Cep         := Copy(Trim(cdsTabela.FieldByName('ender_cep').AsString) + '000', 1, 8);
              codMunic    := cdsTabela.FieldByName('id_ender_cidade').AsInteger;
              uf          := eSStrTouf(ok, Trim(cdsTabela.FieldByName('ender_uf').AsString));
            end;
//
//            with Exterior do
//            begin
//              PaisResid   := '545';
//              DscLograd   := 'TESTE';
//              NrLograd    := '777';
//              Complemento := 'AP 101';
//              Bairro      := 'CENTRO';
//              NmCid       := 'CIDADE EXTERIOR';
//              CodPostal   := '50000';
//            end;
          end;

//          with TrabEstrangeiro do
//          begin
//            DtChegada        := date;
//            ClassTrabEstrang := tpClassTrabEstrang(ctVistoPermanente);
//            CasadoBr := 'N';
//            FilhosBr := 'N';
//          end;

          with InfoDeficiencia do
          begin
            DefFisica      := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('deficiente_fisico').AsString));
            DefVisual      := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('deficiente_visual').AsString));
            DefAuditiva    := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('deficiente_auditivo').AsString));
            DefMental      := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('deficiente_mental').AsString));
            DefIntelectual := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('deficiente_intelectual').AsString));
            ReabReadap     := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('deficiente_readaptado').AsString));
            infoCota       := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('deficiente_cota').AsString));
            observacao     := Trim(cdsTabela.FieldByName('deficiente_obs').AsString);
          end;

          Dependente.Clear;

          aSQL.BeginUpdate;
          aSQL.Clear;
          aSQL.Add('Select');
          aSQL.Add('    coalesce(p.id_tipo_dependente, d.id_tipo_dependente, ''99'') as tipo_dependente');
          aSQL.Add('  , d.nome');
          aSQL.Add('  , d.dt_nascimento');
          aSQL.Add('  , p.cpf');
          aSQL.Add('  , d.ativo_irrf');
          aSQL.Add('  , d.ativo_sal_familia');
          aSQL.Add('  , d.deficiente');
          aSQL.Add('from SERVIDOR_DEPENDENTE d');
          aSQL.Add('  inner join PESSOA_FISICA_DEPENDENTE p on (p.id = d.id)');
          aSQL.Add('where (d.id_servidor   = ' + Trim(cdsTabela.FieldByName('id_servidor').AsString) + ') ');
          aSQL.Add('  and (d.dt_nascimento < current_date)');
          aSQL.Add('order by');
          aSQL.Add('    d.nome');
          aSQL.EndUpdate;
          SetSQL_Detalhe(aSQL);

          cdsDetalhe.First;
          if (cdsDetalhe.RecordCount > 0) then
          begin
            while not cdsDetalhe.Eof do
            begin
              with Dependente.Add do
              begin
                tpDep    := eSStrToTpDep(ok, Trim(cdsDetalhe.FieldByName('tipo_dependente').AsString));
                nmDep    := Trim(cdsDetalhe.FieldByName('nome').AsString);
                DtNascto := cdsDetalhe.FieldByName('dt_nascimento').AsDateTime;
                cpfDep   := Trim(cdsDetalhe.FieldByName('cpf').AsString);
                depIRRF  := eSStrToSimNao(ok, Trim(cdsDetalhe.FieldByName('ativo_irrf').AsString));
                depSF    := eSStrToSimNao(ok, Trim(cdsDetalhe.FieldByName('ativo_sal_familia').AsString));
                incTrab  := eSStrToSimNao(ok, Trim(cdsDetalhe.FieldByName('deficiente').AsString));
              end;

              cdsDetalhe.Next;
            end;
          end;
          cdsDetalhe.Close;

          Aposentadoria.TrabAposent := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('serv_aposentado').AsString));

          with Contato do
          begin
            FonePrinc     := OnlyNumber(Trim(cdsTabela.FieldByName('nr_telefone').AsString));
            FoneAlternat  := EmptyStr;
            EmailPrinc    := AnsiLowerCase(Trim(cdsTabela.FieldByName('e_mail').AsString));
            EmailAlternat := EmptyStr
          end;
        end;

        with Vinculo do
        begin
          Matricula      := Trim(cdsTabela.FieldByName('matricula').AsString);
          TpRegTrab      := trEstatutario; // Servidor Público

          if (StrToIntDef(Trim(cdsTabela.FieldByName('tipo_previd').AsString), 0) < 2) then
            TpRegPrev    := rpRGPS  // Regime Geral da Previdência Social - RGPS
          else
            TpRegPrev    := rpRPPS; // Regime Próprio de Previdência Social - RPPS

          NrRecInfPrelim := EmptyStr;

          if ( StrToIntDef(OnlyNumber(aCompetencia.Codigo), 0) < (StrToInt(FormatDateTime('YYYYMM', Date)) - 1) ) then
            cadIni := tpSim
          else
            cadIni := tpNao;

          with InfoRegimeTrab do
          begin
            with InfoCeletista do
            begin
              DtAdm             := cdsTabela.FieldByName('dt_admissao').AsDateTime;
              TpAdmissao        := taAdmissao;
              IndAdmissao       := iaNormal;
              TpRegJor          := rjSubmetidosHorarioTrabalho;
              NatAtividade      := navNaoInformar;
              dtBase            := 01;               // JANEIRO
              cnpjSindCategProf := Trim(cdsTabela.FieldByName('cnpj_sindicato').AsString);

              FGTS.OpcFGTS   := ofNaoOptante;
              FGTS.DtOpcFGTS := StrToDate(EMPTY_DATE);

//              with TrabTemporario do
//              begin
//                hipLeg      := 1;
//                justContr   := 'teste';
//                tpinclContr := icLocaisSemFiliais;
//
//                with IdeTomadorServ do
//                begin
//                  TpInsc := tiCNPJ;
//                  NrInsc := '12345678901234';
//                  ideEstabVinc.TpInsc := tiCNPJ;
//                  ideEstabVinc.NrInsc := '12345678901234';
//                end;
//
//                IdeTrabSubstituido.Clear;
//
//                with IdeTrabSubstituido.Add do
//                  CpfTrabSubst := '12345678912';
//              end;
//
//              aprend.TpInsc := tpTpInsc(1);
//              aprend.NrInsc := '98765432109';
            end;

            // Enviar apenas um tipo de admissao, que no caso de órgãos públicos é esta abaixo
            with InfoEstatutario do
            begin
              IndProvim := ipNormal;

              Case cdsTabela.FieldByName('id_situacao_tcm').AsInteger of
                10:
                  TpProv := tpNomeacaoCargoComissao;
                20..35:
                  TpProv := tpNomeacaoCargoEfetivo;
                else
                  TpProv := tpTpProv(6); //tpOutros;
              end;

              DtNomeacao  := cdsTabela.FieldByName('dt_nomeacao').AsDateTime;  // StrToDate(EMPTY_DATE);
              DtPosse     := cdsTabela.FieldByName('dt_posse').AsDateTime;     // StrToDate(EMPTY_DATE);
              DtExercicio := cdsTabela.FieldByName('dt_exercicio').AsDateTime; // StrToDate(EMPTY_DATE);
            end;
          end;

          with InfoContrato do
          begin
            CodCargo    := cdsTabela.FieldByName('id_cargo_origem').AsString;
            CodFuncao   := IfThen(cdsTabela.FieldByName('id_tipo_cargo_tcm').AsInteger = 10, cdsTabela.FieldByName('id_cargo_origem').AsString, EmptyStr);
            CodCateg    := 309; // Agente Público - Outros
            codCarreira := EmptyStr;
            dtIngrCarr  := StrToDate(EMPTY_DATE);

            Remuneracao.VrSalFx    := cdsTabela.FieldByName('vencto_base').AsCurrency;
            Remuneracao.UndSalFixo := sfPorMes;
            Remuneracao.DscSalVar  := 'NADA A DECLARAR';

            Duracao.TpContr := PrazoIndeterminado;
            Duracao.dtTerm  := StrToDate(EMPTY_DATE);

            with LocalTrabalho do
            begin
              LocalTrabGeral.TpInsc   := tiCNPJ;
              LocalTrabGeral.NrInsc   := Criptografa(Pesquisa('CONFIG_ORGAO', 'ID', '1', 'CNPJ', ''),'2', 14);
              LocalTrabGeral.DescComp := Criptografa(Pesquisa('CONFIG_ORGAO', 'ID', '1', 'RAZAO_SOCIAL', ''),'2', 60);

//              with LocalTrabDom do
//              begin
//                TpLograd    := '123';
//                DscLograd   := 'LOCAL DOMESTICO';
//                NrLograd    := '111';
//                Complemento := 'Complemento';
//                Bairro      := 'Bairro';
//                Cep         := '85202630';
//                CodMunic    := 123;
//                Uf          := tpuf(ufPR);
//              end;
            end;

            if (cdsTabela.FieldByName('jornada_semanal').AsInteger > 0) and (cdsTabela.FieldByName('id_horario').AsInteger > 0) then
              with HorContratual do
              begin
                QtdHrsSem := cdsTabela.FieldByName('jornada_semanal').AsInteger;
                TpJornada := tjJornadaComHorarioDiarioFolgaFixos;
                DscTpJorn := EmptyStr;
                tmpParc   := tpNaoeTempoParcial;

                horario.Clear;

                with horario.Add do
                begin
                  Dia := tpTpDia(diSegundaFeira);
                  codHorContrat := cdsTabela.FieldByName('id_horario').AsString;
                end;

                with horario.Add do
                begin
                  Dia := tpTpDia(diTercaFeira);
                  codHorContrat := cdsTabela.FieldByName('id_horario').AsString;
                end;

                with horario.Add do
                begin
                  Dia := tpTpDia(diQuartaFeira);
                  codHorContrat := cdsTabela.FieldByName('id_horario').AsString;
                end;

                with horario.Add do
                begin
                  Dia := tpTpDia(diQuintaFeira);
                  codHorContrat := cdsTabela.FieldByName('id_horario').AsString;
                end;

                with horario.Add do
                begin
                  Dia := tpTpDia(diSextaFeira);
                  codHorContrat := cdsTabela.FieldByName('id_horario').AsString;
                end;
              end;

            FiliacaoSindical.Clear;

            if (Trim(cdsTabela.FieldByName('cnpj_sindicato').AsString) <> EmptyStr) then
              with FiliacaoSindical.Add do
                CnpjSindTrab := cdsTabela.FieldByName('cnpj_sindicato').AsString;

            // Informações do alvará judicial em caso de contratação de menores de 14 anos,
            // em qualquer categoria, e de maiores de 14 e menores de 16, em categoria diferente de "Aprendiz".

            if (cdsTabela.FieldByName('nr_idade').AsCurrency > 0) and (cdsTabela.FieldByName('nr_idade').AsCurrency < 14) then
              AlvaraJudicial.nrProcJud := EmptyStr
            else
            if (cdsTabela.FieldByName('nr_idade').AsCurrency > 14) and (cdsTabela.FieldByName('nr_idade').AsCurrency < 16) then
              AlvaraJudicial.nrProcJud := EmptyStr
            else
              AlvaraJudicial.nrProcJud := EmptyStr;

            observacoes.Clear;
//
//            if (Trim(cdsTabela.FieldByName('observacao').AsString) <> EmptyStr) then
//              with observacoes.Add do
//                observacao := cdsTabela.FieldByName('observacao').AsString;
          end;

//          // Grupo de informações da sucessão de vínculo trabalhista/estatutário
//          with SucessaoVinc do
//          begin
//            cnpjEmpregAnt := '12345678901234';
//            MatricAnt     := '123';
//            dtTransf      := date;
//            observacao    := 'transferido';
//          end;

//          // Informações do empregado doméstico transferido de outro representante da mesma unidade familiar
//          transfDom.cpfSubstituido := '12345678901';
//          transfDom.MatricAnt      := '123';
//          transfDom.dtTransf       := date;

//          Afastamento.DtIniAfast  := StrToDate(EMPTY_DATE);
//          Afastamento.codMotAfast := mtvAcidenteDoencaTrabalho;
//
//          Desligamento.DtDeslig := StrToDate(EMPTY_DATE);
        end;
      end;

      aLabel.Caption     := Trim(cdsTabela.FieldByName('nome').AsString);
      aProcesso.Progress := I;
      Application.ProcessMessages;
      Inc(I);

      cdsTabela.Next;
    end;

    aRetorno := True;
    aProtocolo.S2200 := aRetorno;
  finally
    aSQL.Free;
    Result := aRetorno;
  end;
end;

function TdmESocial.Gerar_eSocial2205(aCompetencia: TCompetencia; aZerarBase: Boolean; aModoLancamento: TModoLancamento;
  aLabel: TLabel; aProcesso: TGauge; var aProtocolo: TProtocoloESocial): Boolean;
var
  aRetorno : Boolean;
  aSQL : TStringList;
  ok   : Boolean;
  aEventoID,
  I    : Integer;
  aDataInicial,
  aDataFinal  : TDateTime;
begin
  aDataInicial := aCompetencia.DataInicial;
  aDataFinal   := aCompetencia.DataFinal;

  aRetorno := False;
  aSQL := TStringList.Create;
  ok   := True;
  try
    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Select ');
    aSQL.Add('    p.* ');
    aSQL.Add('  , s.id as id_servidor ');
    aSQL.Add('  , coalesce(p.cnh_categ, ''B'') as cnh_categoria');

    aSQL.Add('  , coalesce(nullif(trim(p.apelido), ''''), p.nome) as nome_social ');
    aSQL.Add('  , left(replace(replace(trim(p.telefone), ''-'', ''''), '' '', ''''), 10) as nr_telefone');
    aSQL.Add('  , coalesce(nullif(nullif(trim(p.ender_num), ''''), ''0''), ''S/N'') as ender_numero');

    aSQL.Add('  , coalesce(r.id_esocial, 6) as id_raca ');
    aSQL.Add('  , coalesce(e.id_esocial, 1) as id_estado_civil ');
    aSQL.Add('  , coalesce(c.id_esocial, ''01'') as id_escola  ');
    aSQL.Add('  , cast((Select first 1 idade.r_qtd_anos || ''.'' || idade.r_qtd_meses from SP_CALC_IDADE(current_date, p.dt_nascimento) idade) as NUMERIC(15,2)) as nr_idade');

    aSQL.Add('  , ''N'' as primeiro_emprego ');
    aSQL.Add('  , ''N'' as serv_aposentado ');
    aSQL.Add('  , u.tipo_previd ');
    aSQL.Add('  , coalesce(s.matricula, substring(s.id from 1 for char_length(s.id) - 1)) as matricula');
    aSQL.Add('  , s.dt_admissao ');
    aSQL.Add('  , a.cnpj as cnpj_sindicato');
    aSQL.Add('  , s.id_situacao_tcm');
    aSQL.Add('  , s.id_cargo_origem');
    aSQL.Add('  , s.id_cargo_atual');
    aSQL.Add('  , f.id_tipo_cargo_tcm');
    aSQL.Add('  , coalesce(s.vencto_base, f.vencto_base) as vencto_base');
    aSQL.Add('  , s.observacao');
    aSQL.Add('  , coalesce(nullif(trim(s.pis_pasep_pf), ''''), nullif(trim(p.pis_pasep), ''''), ''00000000000'') as nis_trabalhador');

    aSQL.Add('  , coalesce(s.dt_readmissao, s.dt_admissao, current_date) as dt_nomeacao');
    aSQL.Add('  , coalesce(s.dt_readmissao, s.dt_admissao, current_date) as dt_posse');
    aSQL.Add('  , coalesce(s.dt_readmissao, s.dt_admissao, current_date) as dt_exercicio');

    aSQL.Add('  , coalesce(n.id_esocial, ''105'') as id_pais_nascimento   ');
    aSQL.Add('  , coalesce(n.id_esocial, ''105'') as id_pais_naturalidade ');
    aSQL.Add('  , coalesce(p.ender_tipo, ''IND'') as ender_tipo_lograd');

    aSQL.Add('  , null as ctps_num ');
    aSQL.Add('  , null as ctps_serie ');
    aSQL.Add('  , null as ctps_uf ');

    aSQL.Add('  , null as rne_num ');
    aSQL.Add('  , null as rne_orgao ');
    aSQL.Add('  , null as rne_uf ');
    aSQL.Add('  , null as rne_dt_emissao ');


    aSQL.Add('  , s.conselho_registro ');
    aSQL.Add('  , s.conselho_orgao    ');
    aSQL.Add('  , s.conselho_uf       ');
    aSQL.Add('  , s.conselho_dt_emissao  ');
    aSQL.Add('  , s.conselho_dt_validade ');

    aSQL.Add('  , coalesce(s.id_horario, 0) as id_horario');
    aSQL.Add('  , (cast(coalesce(cast(nullif(trim(h.duracao_jornada), '''') as integer), 0) / 60 as integer) * 5) as jornada_semanal');

    aSQL.Add('from SERVIDOR s');
    aSQL.Add('  inner join PESSOA_FISICA p on (p.id = s.id_pessoa_fisica)');
    aSQL.Add('  left join TAB_RACA_COR r on (r.id = p.id_raca_cor)');
    aSQL.Add('  left join ESTADO_CIVIL e on (e.id = p.id_estado_civil)');
    aSQL.Add('  left join ESCOLARIDADE c on (c.id = p.id_escolaridade)');
    aSQL.Add('  left join NACIONALIDADE n on (n.id = p.id_nacionalidade)');
    aSQL.Add('  left join SUB_UNID_ORCAMENT u on (u.id = s.id_sub_unid_orcament)');
    aSQL.Add('  left join CARGO_FUNCAO f on (f.id = coalesce(s.id_cargo_origem, s.id_cargo_atual))');
    aSQL.Add('  left join ENTID_SINDICAL a on (a.id = s.id_entid_sindical)');
    aSQL.Add('  left join TAB_HORARIO h on (h.id = s.id_horario)');
    aSQL.Add('where (s.id > 0)   ');
    aSQL.Add('  and (p.dt_nascimento is not null)');                // Sem Data de Nascimento
    aSQL.Add('  and (coalesce(trim(p.ender_cep), '''') <> '''')');  // Sem Número de CEP

    if ( StrToIntDef(OnlyNumber(aCompetencia.Codigo), 0) < (StrToInt(FormatDateTime('YYYYMM', Date)) - 1) ) then
      // Carga inicial
      aSQL.Add('  and (p.data_operacao <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', aDataFinal)) + ')')
    else
      // Aletrações do mês
      aSQL.Add('  and (p.data_operacao between ' + QuotedStr(FormatDateTime('yyyy.mm.dd', aDataInicial)) + ' and ' + QuotedStr(FormatDateTime('yyyy.mm.dd', aDataFinal)) + ')');

    case aModoLancamento of
      mlInclusao  : aSQL.Add('  and p.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_INSERIR));
      mlAlteracao : aSQL.Add('  and p.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_ALTERAR));
      mlExclusao  : aSQL.Add('  and p.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_EXCLUIR));
    end;

    aSQL.EndUpdate;
    aSQL.SaveToFile('.\log\eS2205.sql');
    SetSQL(aSQL);

    I := 1;

    aProcesso.MaxValue := cdsTabela.RecordCount;
    aProcesso.Progress := 0;
    Application.ProcessMessages;

    ACBrESocial.Eventos.NaoPeriodicos.S2205.Clear;

    cdsTabela.First;
    while not cdsTabela.Eof do
    begin
      with ACBrESocial.Eventos.NaoPeriodicos.S2205.Add, EvtAltCadastral do
      begin
        aEventoID   := StrToInt(IncrementGenerator('GEN_ESOCIAL_EVENTO_S2205', 1));
        Sequencial  := aEventoID;
        dtAlteracao := Now;

        if AmbienteWebServiceProducao then
          IdeEvento.TpAmb := TpTpAmb(0) //taProducao
        else
          IdeEvento.TpAmb := taProducaoRestrita;

        IdeEvento.indRetif := ireOriginal; // (ireOriginal, ireRetificacao);

        if (IdeEvento.indRetif = ireRetificacao) then
          IdeEvento.NrRecibo := '65.5454.987798798798' // Preencher com o número do recibo do arquivo a ser retificado.
        else
          IdeEvento.NrRecibo := EmptyStr;

        IdeEvento.ProcEmi  := peAplicEmpregador;
        IdeEvento.VerProc  := Versao_Executavel(ParamStr(0));

        IdeEmpregador.TpInsc := tiCNPJ;
        IdeEmpregador.NrInsc := Criptografa(Pesquisa('CONFIG_ORGAO', 'ID', '1', 'CNPJ', ''),'2', 14); //Criptografa(cdsTabela.FieldByName('CNPJ').AsString, '2', 14);

        with ACBrESocial.Configuracoes do
          Geral.IdEmpregador := EvtAltCadastral.IdeEmpregador.NrInsc;

        ideTrabalhador.CpfTrab := OnlyNumber(Trim(cdsTabela.FieldByName('cpf').AsString));

        with Trabalhador do
        begin
          NisTrab    := Trim(cdsTabela.FieldByName('nis_trabalhador').AsString);
          NmTrab     := Trim(cdsTabela.FieldByName('nome').AsString);
          Sexo       := Trim(cdsTabela.FieldByName('sexo').AsString);
          RacaCor    := cdsTabela.FieldByName('id_raca').AsInteger;
          EstCiv     := cdsTabela.FieldByName('id_estado_civil').AsInteger;
          GrauInstr  := Trim(cdsTabela.FieldByName('id_escola').AsString);
          IndPriEmpr := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('primeiro_emprego').AsString));
          nmSoc      := Trim(cdsTabela.FieldByName('nome_social').AsString);

          with Nascimento do
          begin
            DtNascto   := cdsTabela.FieldByName('dt_nascimento').AsDateTime;
            codMunic   := cdsTabela.FieldByName('id_natural_cidade').AsInteger;
            uf         := Trim(cdsTabela.FieldByName('natural_uf').AsString);
            PaisNascto := Trim(cdsTabela.FieldByName('id_pais_nascimento').AsString);
            PaisNac    := Trim(cdsTabela.FieldByName('id_pais_naturalidade').AsString);
            NmMae      := Trim(cdsTabela.FieldByName('filiacao_pai').AsString);
            NmPai      := Trim(cdsTabela.FieldByName('filiacao_mae').AsString);
          end;

          with Documentos do
          begin
            // Informações da Carteira de Trabalho e Previdência Social
            if (Trim(cdsTabela.FieldByName('ctps_num').AsString) <> EmptyStr) then
            begin
              CTPS.NrCtps    := Trim(cdsTabela.FieldByName('ctps_num').AsString);
              CTPS.SerieCtps := Trim(cdsTabela.FieldByName('ctps_serie').AsString);
              CTPS.UfCtps    := Trim(cdsTabela.FieldByName('ctps_uf').AsString);
            end;

//            // Informações do Documento Nacional de Identidade - DNI (Registro de Identificação Civil - RIC)
//            RIC.NrRic        := '123123';
//            RIC.OrgaoEmissor := 'SSP';
//            RIC.DtExped      := date;
//
            if (Trim(cdsTabela.FieldByName('rg_num').AsString) <> EmptyStr) and (Trim(cdsTabela.FieldByName('rg_orgao_emissor').AsString) <> EmptyStr) then
            begin
              RG.NrRg         := OnlyNumber(Trim(cdsTabela.FieldByName('rg_num').AsString));
              RG.OrgaoEmissor := Trim(cdsTabela.FieldByName('rg_orgao_emissor').AsString) + '/' + Trim(cdsTabela.FieldByName('rg_uf').AsString);
              RG.DtExped      := cdsTabela.FieldByName('rg_dt_emissao').AsDateTime;
            end;

            // Informações do Registro Nacional de Estrangeiro
            if (Nascimento.PaisNac <> ID_NACIONALIDADE_BRASIL) then
            begin
              RNE.NrRne        := OnlyNumber(Trim(cdsTabela.FieldByName('rne_num').AsString));
              RNE.OrgaoEmissor := Trim(cdsTabela.FieldByName('rne_orgao').AsString) + '/' + Trim(cdsTabela.FieldByName('rne_uf').AsString);
              RNE.DtExped      := cdsTabela.FieldByName('rne_dt_emissao').AsDateTime;
            end;

            // Informações do número de registro em Órgão de Classe (OC)
            if (Trim(cdsTabela.FieldByName('conselho_registro').AsString) <> EmptyStr) and (Trim(cdsTabela.FieldByName('conselho_orgao').AsString) <> EmptyStr) then
            begin
              OC.NrOc         := OnlyNumber(Trim(cdsTabela.FieldByName('conselho_registro').AsString));
              OC.OrgaoEmissor := Trim(cdsTabela.FieldByName('conselho_orgao').AsString) + '/' + Trim(cdsTabela.FieldByName('conselho_uf').AsString);
              if not cdsTabela.FieldByName('conselho_dt_emissao').IsNull then
                OC.DtExped    := cdsTabela.FieldByName('conselho_dt_emissao').AsDateTime;
              if not cdsTabela.FieldByName('conselho_dt_validade').IsNull then
                OC.DtValid    := cdsTabela.FieldByName('conselho_dt_validade').AsDateTime;
            end;

            // Informações da Carteira Nacional de Habilitação (CNH)
            if (Trim(cdsTabela.FieldByName('cnh_num').AsString) <> EmptyStr) and (not cdsTabela.FieldByName('cnh_dt_vencto').IsNull) and (cdsTabela.FieldByName('cnh_dt_vencto').AsDateTime <> StrToDate(EMPTY_DATE)) then
            begin
              CNH.nrRegCnh     := OnlyNumber(Trim(cdsTabela.FieldByName('cnh_num').AsString));
              CNH.DtExped      := cdsTabela.FieldByName('cnh_dt_emissao').AsDateTime;
              CNH.ufCnh        := tpuf(ufPR);
              CNH.DtValid      := cdsTabela.FieldByName('cnh_dt_vencto').AsDateTime;
              CNH.categoriaCnh := eSStrToCnh(ok, Trim(cdsTabela.FieldByName('cnh_categoria').AsString));
              //CNH.dtPriHab     := date;
            end;
          end;

          with Endereco do
          begin
            with Brasil do
            begin
              TpLograd    := IfThen(Trim(cdsTabela.FieldByName('ender_tipo_lograd').AsString) = EmptyStr, 'IND', Trim(cdsTabela.FieldByName('ender_tipo_lograd').AsString));
              DscLograd   := IfThen(Trim(cdsTabela.FieldByName('ender_lograd').AsString) = EmptyStr, 'NAO INFORMADO', Trim(cdsTabela.FieldByName('ender_lograd').AsString));
              NrLograd    := Trim(cdsTabela.FieldByName('ender_numero').AsString);
              Complemento := Trim(cdsTabela.FieldByName('ender_complem').AsString);
              Bairro      := IfThen(Trim(cdsTabela.FieldByName('ender_bairro').AsString) = EmptyStr, 'NAO INFORMADO', Trim(cdsTabela.FieldByName('ender_bairro').AsString));
              Cep         := Copy(Trim(cdsTabela.FieldByName('ender_cep').AsString) + '000', 1, 8);
              codMunic    := cdsTabela.FieldByName('id_ender_cidade').AsInteger;
              uf          := eSStrTouf(ok, Trim(cdsTabela.FieldByName('ender_uf').AsString));
            end;
//
//            with Exterior do
//            begin
//              PaisResid   := '545';
//              DscLograd   := 'TESTE';
//              NrLograd    := '777';
//              Complemento := 'AP 101';
//              Bairro      := 'CENTRO';
//              NmCid       := 'CIDADE EXTERIOR';
//              CodPostal   := '50000';
//            end;
          end;

//          with TrabEstrangeiro do
//          begin
//            DtChegada        := date;
//            ClassTrabEstrang := tpClassTrabEstrang(ctVistoPermanente);
//            CasadoBr := 'N';
//            FilhosBr := 'N';
//          end;

          with InfoDeficiencia do
          begin
            DefFisica      := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('deficiente_fisico').AsString));
            DefVisual      := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('deficiente_visual').AsString));
            DefAuditiva    := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('deficiente_auditivo').AsString));
            DefMental      := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('deficiente_mental').AsString));
            DefIntelectual := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('deficiente_intelectual').AsString));
            ReabReadap     := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('deficiente_readaptado').AsString));
            infoCota       := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('deficiente_cota').AsString));
            observacao     := Trim(cdsTabela.FieldByName('deficiente_obs').AsString);
          end;

          Dependente.Clear;

          aSQL.BeginUpdate;
          aSQL.Clear;
          aSQL.Add('Select');
          aSQL.Add('    coalesce(p.id_tipo_dependente, d.id_tipo_dependente, ''99'') as tipo_dependente');
          aSQL.Add('  , d.nome');
          aSQL.Add('  , d.dt_nascimento');
          aSQL.Add('  , p.cpf');
          aSQL.Add('  , d.ativo_irrf');
          aSQL.Add('  , d.ativo_sal_familia');
          aSQL.Add('  , d.deficiente');
          aSQL.Add('from SERVIDOR_DEPENDENTE d');
          aSQL.Add('  inner join PESSOA_FISICA_DEPENDENTE p on (p.id = d.id)');
          aSQL.Add('where (d.id_servidor   = ' + Trim(cdsTabela.FieldByName('id_servidor').AsString) + ') ');
          aSQL.Add('  and (d.dt_nascimento < current_date)');
          aSQL.Add('order by');
          aSQL.Add('    d.nome');
          aSQL.EndUpdate;
          SetSQL_Detalhe(aSQL);

          cdsDetalhe.First;
          if (cdsDetalhe.RecordCount > 0) then
          begin
            while not cdsDetalhe.Eof do
            begin
              with Dependente.Add do
              begin
                tpDep    := eSStrToTpDep(ok, Trim(cdsDetalhe.FieldByName('tipo_dependente').AsString));
                nmDep    := Trim(cdsDetalhe.FieldByName('nome').AsString);
                DtNascto := cdsDetalhe.FieldByName('dt_nascimento').AsDateTime;
                cpfDep   := Trim(cdsDetalhe.FieldByName('cpf').AsString);
                depIRRF  := eSStrToSimNao(ok, Trim(cdsDetalhe.FieldByName('ativo_irrf').AsString));
                depSF    := eSStrToSimNao(ok, Trim(cdsDetalhe.FieldByName('ativo_sal_familia').AsString));
                incTrab  := eSStrToSimNao(ok, Trim(cdsDetalhe.FieldByName('deficiente').AsString));
              end;

              cdsDetalhe.Next;
            end;
          end;
          cdsDetalhe.Close;

          Aposentadoria.TrabAposent := eSStrToSimNao(ok, Trim(cdsTabela.FieldByName('serv_aposentado').AsString));

          with Contato do
          begin
            FonePrinc     := OnlyNumber(Trim(cdsTabela.FieldByName('nr_telefone').AsString));
            FoneAlternat  := EmptyStr;
            EmailPrinc    := AnsiLowerCase(Trim(cdsTabela.FieldByName('e_mail').AsString));
            EmailAlternat := EmptyStr
          end;
        end;
      end;

      aLabel.Caption     := Trim(cdsTabela.FieldByName('nome').AsString);
      aProcesso.Progress := I;
      Application.ProcessMessages;
      Inc(I);

      cdsTabela.Next;
    end;

    aRetorno := True;
    aProtocolo.S2205 := aRetorno;
  finally
    aSQL.Free;
    Result := aRetorno;
  end;
end;

function TdmESocial.Gerar_eSocial2206(aCompetencia: TCompetencia; aZerarBase: Boolean; aModoLancamento: TModoLancamento;
  aLabel: TLabel; aProcesso: TGauge; var aProtocolo: TProtocoloESocial): Boolean;
var
  aRetorno : Boolean;
  aSQL : TStringList;
  ok   : Boolean;
  aEventoID,
  I    : Integer;
  aDataInicial,
  aDataFinal  : TDateTime;
begin
  aDataInicial := aCompetencia.DataInicial;
  aDataFinal   := aCompetencia.DataFinal;

  aRetorno := False;
  aSQL := TStringList.Create;
  ok   := True;
  try
    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Select ');
    aSQL.Add('    p.* ');
    aSQL.Add('  , s.id as id_servidor ');
    aSQL.Add('  , coalesce(p.cnh_categ, ''B'') as cnh_categoria');

    aSQL.Add('  , coalesce(nullif(trim(p.apelido), ''''), p.nome) as nome_social ');
    aSQL.Add('  , left(replace(replace(trim(p.telefone), ''-'', ''''), '' '', ''''), 10) as nr_telefone');
    aSQL.Add('  , coalesce(nullif(nullif(trim(p.ender_num), ''''), ''0''), ''S/N'') as ender_numero');

    aSQL.Add('  , coalesce(r.id_esocial, 6) as id_raca ');
    aSQL.Add('  , coalesce(e.id_esocial, 1) as id_estado_civil ');
    aSQL.Add('  , coalesce(c.id_esocial, ''01'') as id_escola  ');
    aSQL.Add('  , cast((Select first 1 idade.r_qtd_anos || ''.'' || idade.r_qtd_meses from SP_CALC_IDADE(current_date, p.dt_nascimento) idade) as NUMERIC(15,2)) as nr_idade');

    aSQL.Add('  , ''N'' as primeiro_emprego ');
    aSQL.Add('  , ''N'' as serv_aposentado ');
    aSQL.Add('  , u.tipo_previd ');
    aSQL.Add('  , coalesce(s.matricula, substring(s.id from 1 for char_length(s.id) - 1)) as matricula');
    aSQL.Add('  , s.dt_admissao ');
    aSQL.Add('  , a.cnpj as cnpj_sindicato');
    aSQL.Add('  , s.id_situacao_tcm');
    aSQL.Add('  , s.id_cargo_origem');
    aSQL.Add('  , s.id_cargo_atual');
    aSQL.Add('  , f.id_tipo_cargo_tcm');
    aSQL.Add('  , coalesce(s.vencto_base, f.vencto_base) as vencto_base');
    aSQL.Add('  , s.observacao');
    aSQL.Add('  , coalesce(nullif(trim(s.pis_pasep_pf), ''''), nullif(trim(p.pis_pasep), ''''), ''00000000000'') as nis_trabalhador');

    aSQL.Add('  , coalesce(s.dt_readmissao, s.dt_admissao, current_date) as dt_nomeacao');
    aSQL.Add('  , coalesce(s.dt_readmissao, s.dt_admissao, current_date) as dt_posse');
    aSQL.Add('  , coalesce(s.dt_readmissao, s.dt_admissao, current_date) as dt_exercicio');

    aSQL.Add('  , coalesce(n.id_esocial, ''105'') as id_pais_nascimento   ');
    aSQL.Add('  , coalesce(n.id_esocial, ''105'') as id_pais_naturalidade ');
    aSQL.Add('  , coalesce(p.ender_tipo, ''IND'') as ender_tipo_lograd');

    aSQL.Add('  , null as ctps_num ');
    aSQL.Add('  , null as ctps_serie ');
    aSQL.Add('  , null as ctps_uf ');

    aSQL.Add('  , null as rne_num ');
    aSQL.Add('  , null as rne_orgao ');
    aSQL.Add('  , null as rne_uf ');
    aSQL.Add('  , null as rne_dt_emissao ');

    aSQL.Add('  , s.conselho_registro ');
    aSQL.Add('  , s.conselho_orgao    ');
    aSQL.Add('  , s.conselho_uf       ');
    aSQL.Add('  , s.conselho_dt_emissao  ');
    aSQL.Add('  , s.conselho_dt_validade ');

    aSQL.Add('  , coalesce(s.id_horario, 0) as id_horario');
    aSQL.Add('  , (cast(coalesce(cast(nullif(trim(h.duracao_jornada), '''') as integer), 0) / 60 as integer) * 5) as jornada_semanal');
    aSQL.Add('from SERVIDOR s');
    aSQL.Add('  inner join PESSOA_FISICA p on (p.id = s.id_pessoa_fisica)');
    aSQL.Add('  left join TAB_RACA_COR r on (r.id = p.id_raca_cor)');
    aSQL.Add('  left join ESTADO_CIVIL e on (e.id = p.id_estado_civil)');
    aSQL.Add('  left join ESCOLARIDADE c on (c.id = p.id_escolaridade)');
    aSQL.Add('  left join NACIONALIDADE n on (n.id = p.id_nacionalidade)');
    aSQL.Add('  left join SUB_UNID_ORCAMENT u on (u.id = s.id_sub_unid_orcament)');
    aSQL.Add('  left join CARGO_FUNCAO f on (f.id = coalesce(s.id_cargo_origem, s.id_cargo_atual))');
    aSQL.Add('  left join ENTID_SINDICAL a on (a.id = s.id_entid_sindical)');
    aSQL.Add('  left join TAB_HORARIO h on (h.id = s.id_horario)');
    aSQL.Add('where (s.id > 0)   ');
    aSQL.Add('  and (p.dt_nascimento is not null)');                // Sem Data de Nascimento
    aSQL.Add('  and (coalesce(trim(p.ender_cep), '''') <> '''')');  // Sem Número de CEP

    if ( StrToIntDef(OnlyNumber(aCompetencia.Codigo), 0) < (StrToInt(FormatDateTime('YYYYMM', Date)) - 1) ) then
      // Carga inicial
      aSQL.Add('  and (s.data_operacao <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', aDataFinal)) + ')')
    else
      // Aletrações do mês
      aSQL.Add('  and (s.data_operacao between ' + QuotedStr(FormatDateTime('yyyy.mm.dd', aDataInicial)) + ' and ' + QuotedStr(FormatDateTime('yyyy.mm.dd', aDataFinal)) + ')');

    case aModoLancamento of
      mlInclusao  : aSQL.Add('  and s.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_INSERIR));
      mlAlteracao : aSQL.Add('  and s.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_ALTERAR));
      mlExclusao  : aSQL.Add('  and s.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_EXCLUIR));
    end;

    aSQL.EndUpdate;
    aSQL.SaveToFile('.\log\eS2206.sql');
    SetSQL(aSQL);

    I := 1;

    aProcesso.MaxValue := cdsTabela.RecordCount;
    aProcesso.Progress := 0;
    Application.ProcessMessages;

    ACBrESocial.Eventos.NaoPeriodicos.S2206.Clear;

    cdsTabela.First;
    while not cdsTabela.Eof do
    begin
      with ACBrESocial.Eventos.NaoPeriodicos.S2206.Add, EvtAltContratual, AltContratual do
      begin
        aEventoID := StrToInt(IncrementGenerator('GEN_ESOCIAL_EVENTO_S2206', 1));
        Sequencial:= aEventoID;

        AltContratual.dtAlteracao := Date;
        AltContratual.dtEf        := Now;
        AltContratual.dscAlt      := 'ALTERAÇÕES CONTRATUAIS DE ' + aCompetencia.Descricao;

        if AmbienteWebServiceProducao then
          IdeEvento.TpAmb := TpTpAmb(0) //taProducao
        else
          IdeEvento.TpAmb := taProducaoRestrita;

        IdeEvento.indRetif := ireOriginal; // (ireOriginal, ireRetificacao);

        if (IdeEvento.indRetif = ireRetificacao) then
          IdeEvento.NrRecibo := '65.5454.987798798798' // Preencher com o número do recibo do arquivo a ser retificado.
        else
          IdeEvento.NrRecibo := EmptyStr;

        IdeEvento.ProcEmi  := peAplicEmpregador;
        IdeEvento.VerProc  := Versao_Executavel(ParamStr(0));

        IdeEmpregador.TpInsc := tiCNPJ;
        IdeEmpregador.NrInsc := Criptografa(Pesquisa('CONFIG_ORGAO', 'ID', '1', 'CNPJ', ''),'2', 14); //Criptografa(cdsTabela.FieldByName('CNPJ').AsString, '2', 14);

        IdeVinculo.cpfTrab   := OnlyNumber(Trim(cdsTabela.FieldByName('cpf').AsString));
        IdeVinculo.Matricula := Trim(cdsTabela.FieldByName('matricula').AsString);
        IdeVinculo.NisTrab   := Trim(cdsTabela.FieldByName('nis_trabalhador').AsString);

        with ACBrESocial.Configuracoes do
          Geral.IdEmpregador := EvtAltContratual.IdeEmpregador.NrInsc;

        with Vinculo do
        begin
          Matricula   := Trim(cdsTabela.FieldByName('matricula').AsString);
          TpRegTrab   := trEstatutario; // Servidor Público

          if (StrToIntDef(Trim(cdsTabela.FieldByName('tipo_previd').AsString), 0) < 2) then
            TpRegPrev := rpRGPS  // Regime Geral da Previdência Social - RGPS
          else
            TpRegPrev := rpRPPS; // Regime Próprio de Previdência Social - RPPS
        end;

        with InfoRegimeTrab do
        begin
          with InfoCeletista do
          begin
            DtAdm             := cdsTabela.FieldByName('dt_admissao').AsDateTime;
            TpAdmissao        := taAdmissao;
            IndAdmissao       := iaNormal;
            TpRegJor          := rjSubmetidosHorarioTrabalho;
            NatAtividade      := navNaoInformar;
            dtBase            := 01;               // JANEIRO
            cnpjSindCategProf := Trim(cdsTabela.FieldByName('cnpj_sindicato').AsString);

            FGTS.OpcFGTS   := ofNaoOptante;
            FGTS.DtOpcFGTS := StrToDate(EMPTY_DATE);

//              with TrabTemporario do
//              begin
//                hipLeg      := 1;
//                justContr   := 'teste';
//                tpinclContr := icLocaisSemFiliais;
//
//                with IdeTomadorServ do
//                begin
//                  TpInsc := tiCNPJ;
//                  NrInsc := '12345678901234';
//                  ideEstabVinc.TpInsc := tiCNPJ;
//                  ideEstabVinc.NrInsc := '12345678901234';
//                end;
//
//                IdeTrabSubstituido.Clear;
//
//                with IdeTrabSubstituido.Add do
//                  CpfTrabSubst := '12345678912';
//              end;
//
//              aprend.TpInsc := tpTpInsc(1);
//              aprend.NrInsc := '98765432109';
          end;

          // Enviar apenas um tipo de admissao, que no caso de órgãos públicos é esta abaixo
          with InfoEstatutario do
          begin
            IndProvim := ipNormal;

            Case cdsTabela.FieldByName('id_situacao_tcm').AsInteger of
              10:
                TpProv := tpNomeacaoCargoComissao;
              20..35:
                TpProv := tpNomeacaoCargoEfetivo;
              else
                TpProv := tpTpProv(6); //tpOutros;
            end;

            DtNomeacao  := cdsTabela.FieldByName('dt_nomeacao').AsDateTime;  // StrToDate(EMPTY_DATE);
            DtPosse     := cdsTabela.FieldByName('dt_posse').AsDateTime;     // StrToDate(EMPTY_DATE);
            DtExercicio := cdsTabela.FieldByName('dt_exercicio').AsDateTime; // StrToDate(EMPTY_DATE);
          end;
        end;

        with InfoContrato do
        begin
          CodCargo    := cdsTabela.FieldByName('id_cargo_origem').AsString;
          CodFuncao   := IfThen(cdsTabela.FieldByName('id_tipo_cargo_tcm').AsInteger = 10, cdsTabela.FieldByName('id_cargo_origem').AsString, EmptyStr);
          CodCateg    := 309; // Agente Público - Outros
          codCarreira := EmptyStr;
          dtIngrCarr  := StrToDate(EMPTY_DATE);

          Remuneracao.VrSalFx    := cdsTabela.FieldByName('vencto_base').AsCurrency;
          Remuneracao.UndSalFixo := sfPorMes;
          Remuneracao.DscSalVar  := 'NADA A DECLARAR';

          Duracao.TpContr := PrazoIndeterminado;
          Duracao.dtTerm  := StrToDate(EMPTY_DATE);

          with LocalTrabalho do
          begin
            LocalTrabGeral.TpInsc   := tiCNPJ;
            LocalTrabGeral.NrInsc   := Criptografa(Pesquisa('CONFIG_ORGAO', 'ID', '1', 'CNPJ', ''),'2', 14);
            LocalTrabGeral.DescComp := Criptografa(Pesquisa('CONFIG_ORGAO', 'ID', '1', 'RAZAO_SOCIAL', ''),'2', 60);
          end;

          if (cdsTabela.FieldByName('jornada_semanal').AsInteger > 0) and (cdsTabela.FieldByName('id_horario').AsInteger > 0) then
            with HorContratual do
            begin
              QtdHrsSem := cdsTabela.FieldByName('jornada_semanal').AsInteger;
              TpJornada := tjJornadaComHorarioDiarioFolgaFixos;
              DscTpJorn := EmptyStr;
              tmpParc   := tpNaoeTempoParcial;

              horario.Clear;

              with horario.Add do
              begin
                Dia := tpTpDia(diSegundaFeira);
                codHorContrat := cdsTabela.FieldByName('id_horario').AsString;
              end;

              with horario.Add do
              begin
                Dia := tpTpDia(diTercaFeira);
                codHorContrat := cdsTabela.FieldByName('id_horario').AsString;
              end;

              with horario.Add do
              begin
                Dia := tpTpDia(diQuartaFeira);
                codHorContrat := cdsTabela.FieldByName('id_horario').AsString;
              end;

              with horario.Add do
              begin
                Dia := tpTpDia(diQuintaFeira);
                codHorContrat := cdsTabela.FieldByName('id_horario').AsString;
              end;

              with horario.Add do
              begin
                Dia := tpTpDia(diSextaFeira);
                codHorContrat := cdsTabela.FieldByName('id_horario').AsString;
              end;
            end;

          FiliacaoSindical.Clear;

          if (Trim(cdsTabela.FieldByName('cnpj_sindicato').AsString) <> EmptyStr) then
            with FiliacaoSindical.Add do
              CnpjSindTrab := cdsTabela.FieldByName('cnpj_sindicato').AsString;

          // Informações do alvará judicial em caso de contratação de menores de 14 anos,
          // em qualquer categoria, e de maiores de 14 e menores de 16, em categoria diferente de "Aprendiz".

          if (cdsTabela.FieldByName('nr_idade').AsCurrency > 0) and (cdsTabela.FieldByName('nr_idade').AsCurrency < 14) then
            AlvaraJudicial.nrProcJud := EmptyStr
          else
          if (cdsTabela.FieldByName('nr_idade').AsCurrency > 14) and (cdsTabela.FieldByName('nr_idade').AsCurrency < 16) then
            AlvaraJudicial.nrProcJud := EmptyStr
          else
            AlvaraJudicial.nrProcJud := EmptyStr;

          servPubl.mtvAlter := maOutros;
        end;

      end;

      aLabel.Caption     := Trim(cdsTabela.FieldByName('nome').AsString);
      aProcesso.Progress := I;
      Application.ProcessMessages;
      Inc(I);

      cdsTabela.Next;
    end;

    aRetorno := True;
    aProtocolo.S2206 := aRetorno;
  finally
    aSQL.Free;
    Result := aRetorno;
  end;
end;

function TdmESocial.Gerar_eSocial2240(aCompetencia: TCompetencia; aZerarBase: Boolean; aModoLancamento: TModoLancamento;
  aLabel: TLabel; aProcesso: TGauge; var aProtocolo: TProtocoloESocial): Boolean;
var
  aRetorno : Boolean;
  aSQL : TStringList;
  ok   : Boolean;
  aEventoID,
  I : Integer;
  aDataInicial ,
  aDataFinal   : TDateTime;
  aResponsavel : TResponsavel;
begin
  aDataInicial := aCompetencia.DataInicial;
  aDataFinal   := aCompetencia.DataFinal;

  aRetorno := False;
  aSQL := TStringList.Create;
  ok   := True;
  try
    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Select');
    aSQL.Add('    c.id_servid_fiscal as id_servidor');
    aSQL.Add('  , s.nome_servidor');
    aSQL.Add('  , coalesce(nullif(trim(s.pis_pasep_pf), ''''), nullif(trim(p.pis_pasep), ''''), ''00000000000'') as nis_trabalhador');
    aSQL.Add('  , s.conselho_registro');
    aSQL.Add('  , s.conselho_orgao');
    aSQL.Add('  , s.conselho_uf');
    aSQL.Add('  , s.conselho_dt_emissao');
    aSQL.Add('  , s.conselho_dt_validade');
    aSQL.Add('from CONFIG_ORGAO c');
    aSQL.Add('  inner join SERVIDOR s on (s.id = c.id_servid_fiscal)');
    aSQL.Add('  inner join PESSOA_FISICA p on (p.id = s.id_pessoa_fisica)');
    aSQL.Add('where c.id = 1');
    aSQL.EndUpdate;
    SetSQL_Geral(aSQL);

    with aResponsavel, Conselho do
    begin
      ID       := cdsGeral.FieldByName('id_servidor').AsInteger;
      Nome     := Trim(cdsGeral.FieldByName('nome_servidor').AsString);
      NIS      := Trim(cdsGeral.FieldByName('nis_trabalhador').AsString);
      Numero   := Trim(cdsGeral.FieldByName('conselho_registro').AsString);
      Orgao    := Trim(cdsGeral.FieldByName('conselho_orgao').AsString);
      UF       := Trim(cdsGeral.FieldByName('conselho_uf').AsString);
      Emissao  := cdsGeral.FieldByName('conselho_dt_emissao').AsDateTime;
      Validade := cdsGeral.FieldByName('conselho_dt_validade').AsDateTime;
    end;

    cdsGeral.Close;

    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Select ');
    aSQL.Add('    s.* ');
    aSQL.Add('  , p.cpf');
    aSQL.Add('  , coalesce(nullif(trim(s.pis_pasep_pf), ''''), nullif(trim(p.pis_pasep), ''''), ''00000000000'') as nis_trabalhador');
    aSQL.Add('  , d.descricao as dep_descricao');
    aSQL.Add('  , c.descricao as fun_descricao');
    aSQL.Add('from SERVIDOR s');
    aSQL.Add('  inner join PESSOA_FISICA p on (p.id = s.id_pessoa_fisica)');
    aSQL.Add('  inner join DEPTO d on (d.id = s.id_depto)');
    aSQL.Add('  inner join CARGO_FUNCAO c on (c.id = coalesce(s.id_cargo_atual, s.id_cargo_origem))');
    aSQL.Add('where (s.id > 0)   ');

    if ( StrToIntDef(OnlyNumber(aCompetencia.Codigo), 0) < (StrToInt(FormatDateTime('YYYYMM', Date)) - 1) ) then
      // Carga inicial
      aSQL.Add('  and (s.data_operacao <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', aDataFinal)) + ')')
    else
      // Aletrações do mês
      aSQL.Add('  and (s.data_operacao between ' + QuotedStr(FormatDateTime('yyyy.mm.dd', aDataInicial)) + ' and ' + QuotedStr(FormatDateTime('yyyy.mm.dd', aDataFinal)) + ')');

    case aModoLancamento of
      mlInclusao  : aSQL.Add('  and (s.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_INSERIR) + ')');
      mlAlteracao : aSQL.Add('  and (s.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_ALTERAR) + ')');
      mlExclusao  : aSQL.Add('  and (s.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_EXCLUIR) + ')');
    end;

    aSQL.EndUpdate;
    aSQL.SaveToFile('.\log\eS2240.sql');
    SetSQL(aSQL);

    I := 1;

    aProcesso.MaxValue := cdsTabela.RecordCount;
    aProcesso.Progress := 0;
    Application.ProcessMessages;

    ACBrESocial.Eventos.NaoPeriodicos.S2240.Clear;

    cdsTabela.First;
    while not cdsTabela.Eof do
    begin
      with ACBrESocial.Eventos.NaoPeriodicos.S2240.Add, EvtExpRisco do
      begin
        aEventoID := StrToInt(IncrementGenerator('GEN_ESOCIAL_EVENTO_S2240', 1));
        Sequencial:= aEventoID;

        if AmbienteWebServiceProducao then
          IdeEvento.TpAmb := TpTpAmb(0) //taProducao
        else
          IdeEvento.TpAmb := taProducaoRestrita;

        IdeEvento.indRetif := ireOriginal; // (ireOriginal, ireRetificacao);

        if (IdeEvento.indRetif = ireRetificacao) then
          IdeEvento.NrRecibo := '65.5454.987798798798' // Preencher com o número do recibo do arquivo a ser retificado.
        else
          IdeEvento.NrRecibo := EmptyStr;

        IdeEvento.ProcEmi  := peAplicEmpregador;
        IdeEvento.VerProc  := Versao_Executavel(ParamStr(0));

        IdeEmpregador.TpInsc := tiCNPJ;
        IdeEmpregador.NrInsc := Criptografa(Pesquisa('CONFIG_ORGAO', 'ID', '1', 'CNPJ', ''),'2', 14); //Criptografa(cdsTabela.FieldByName('CNPJ').AsString, '2', 14);

        IdeVinculo.cpfTrab   := OnlyNumber(Trim(cdsTabela.FieldByName('cpf').AsString));
        IdeVinculo.Matricula := Trim(cdsTabela.FieldByName('matricula').AsString);
        IdeVinculo.NisTrab   := Trim(cdsTabela.FieldByName('nis_trabalhador').AsString);

        with ACBrESocial.Configuracoes do
          Geral.IdEmpregador := EvtExpRisco.IdeEmpregador.NrInsc;

        with infoExpRisco do
        begin
          if (aModoLancamento in [mlInclusao, mlAlteracao]) then
            with iniExpRisco do
            begin
              dtCondicao := Date;

              InfoAmb.Clear;

              with InfoAmb.Add do
              begin
                codAmb              := Trim(cdsTabela.FieldByName('id_depto').AsString);
                InfoAtiv.dscAtivDes := Trim(cdsTabela.FieldByName('fun_descricao').AsString);

                FatRisco.Clear;

                aSQL.BeginUpdate;
                aSQL.Clear;
                aSQL.Add('Select ');
                aSQL.Add('    f.id_fator_risco as codigo ');
                aSQL.Add('from DEPTO_FATOR_RISCO f ');
                aSQL.Add('where (f.id_depto = ' + Trim(cdsTabela.FieldByName('id').AsString) + ') ');

                aSQL.EndUpdate;
                SetSQL_Detalhe(aSQL);

                cdsDetalhe.First;
                if (cdsDetalhe.RecordCount > 0) then
                begin

                  while not cdsDetalhe.Eof do
                  begin
                    with FatRisco.Add do
                    begin
                      codFatRis  := Trim(cdsDetalhe.FieldByName('codigo').AsString);
                      intConc    := 'N/A';
                      tecMedicao := EmptyStr;

                      with epcEpi do
                      begin
                        utilizEPC := uEPCNaoAplica;
                        utilizEPI := uEPINaoAplica;

                        epc.Clear;
      //
      //                  with epc.Add do
      //                  begin
      //                    dscEpc  := 'Descrição do EPC 1';
      //                    eficEpc := tpSim;
      //                  end;

                        epi.Clear;
      //
      //                  with epi.Add do
      //                  begin
      //                    caEPI         := '321654';
      //                    eficEpi       := tpSim;
      //                    medProtecao   := tpSim;
      //                    condFuncto    := tpSim;
      //                    przValid      := tpSim;
      //                    periodicTroca := tpSim;
      //                    higienizacao  := tpSim;
      //                  end;
                      end;
                    end;

                    cdsDetalhe.Next;
                  end;

                end
                else
                  with FatRisco.Add do
                  begin
                    codFatRis := '0901001'; // Ausência de Fator de Risco
                    with epcEpi do
                    begin
                      utilizEPC := uEPCNaoAplica;
                      utilizEPI := uEPINaoAplica;

                      epc.Clear;
                      epi.Clear;
                    end;
                  end;

                cdsDetalhe.Close;
              end;
            end;

          // Alteração das informações de condições de ambiente de trabalho, opcional
          if (aModoLancamento = mlAlteracao) then
            with altExpRisco do
            begin
              dtCondicao := Date;

              InfoAmb.Clear;

              with InfoAmb.Add do
              begin
                codAmb              := Trim(cdsTabela.FieldByName('id_depto').AsString);
                InfoAtiv.dscAtivDes := Trim(cdsTabela.FieldByName('fun_descricao').AsString);

                FatRisco.Clear;

                aSQL.BeginUpdate;
                aSQL.Clear;
                aSQL.Add('Select ');
                aSQL.Add('    f.id_fator_risco as codigo ');
                aSQL.Add('from DEPTO_FATOR_RISCO f ');
                aSQL.Add('where (f.id_depto = ' + Trim(cdsTabela.FieldByName('id_depto').AsString) + ') ');

                aSQL.EndUpdate;
                SetSQL_Detalhe(aSQL);

                cdsDetalhe.First;
                if (cdsDetalhe.RecordCount > 0) then
                begin

                  while not cdsDetalhe.Eof do
                  begin
                    with FatRisco.Add do
                    begin
                      codFatRis  := Trim(cdsDetalhe.FieldByName('codigo').AsString);
                      intConc    := 'N/A';
                      tecMedicao := EmptyStr;

                      with epcEpi do
                      begin
                        utilizEPC := uEPCNaoAplica;
                        utilizEPI := uEPINaoAplica;

                        epc.Clear;
      //
      //                  with epc.Add do
      //                  begin
      //                    dscEpc  := 'Descrição do EPC 1';
      //                    eficEpc := tpSim;
      //                  end;

                        epi.Clear;
      //
      //                  with epi.Add do
      //                  begin
      //                    caEPI         := '321654';
      //                    eficEpi       := tpSim;
      //                    medProtecao   := tpSim;
      //                    condFuncto    := tpSim;
      //                    przValid      := tpSim;
      //                    periodicTroca := tpSim;
      //                    higienizacao  := tpSim;
      //                  end;
                      end;
                    end;

                    cdsDetalhe.Next;
                  end;

                end
                else
                  with FatRisco.Add do
                  begin
                    codFatRis := '0901001'; // Ausência de Fator de Risco
                    with epcEpi do
                    begin
                      utilizEPC := uEPCNaoAplica;
                      utilizEPI := uEPINaoAplica;

                      epc.Clear;
                      epi.Clear;
                    end;
                  end;

                cdsDetalhe.Close;
              end;
            end;

          // FimExpRisco - opcional, informar quando o trabalhador não se sujeitar mais as condições de ambiente informadas anteriormente
          if (aModoLancamento = mlExclusao) then
            with fimExpRisco do
            begin
              dtFimCondicao := Date;

              infoAmb.Clear;

              with InfoAmb.Add do
                codAmb := Trim(cdsTabela.FieldByName('id_depto').AsString);
            end;

          respReg.Clear;

          // Informações relativas ao responsável pelos registros ambientais
          with respReg.Add, aResponsavel do
          begin
            dtIni   := Conselho.Emissao;
            dtFim   := Conselho.Validade;
            NisResp := NIS;
            NrOc    := Conselho.Numero;
            ufOC    := eSStrTouf(ok, Conselho.UF);
          end;
        end;
      end;

      aLabel.Caption     := Trim(cdsTabela.FieldByName('nome_servidor').AsString);
      aProcesso.Progress := I;
      Application.ProcessMessages;
      Inc(I);

      cdsTabela.Next;
    end;

    aRetorno := True;
    aProtocolo.S2240 := aRetorno;
  finally
    aSQL.Free;
    Result := aRetorno;
  end;
end;

function TdmESocial.Gerar_eSocial2241(aCompetencia: TCompetencia; aZerarBase: Boolean; aModoLancamento: TModoLancamento;
  aLabel: TLabel; aProcesso: TGauge; var aProtocolo: TProtocoloESocial): Boolean;
var
  aRetorno : Boolean;
  aSQL : TStringList;
  ok   : Boolean;
  aEventoID,
  I : Integer;
  aDataInicial ,
  aDataFinal   : TDateTime;
  aResponsavel : TResponsavel;
begin
  aDataInicial := aCompetencia.DataInicial;
  aDataFinal   := aCompetencia.DataFinal;

  aRetorno := False;
  aSQL := TStringList.Create;
  ok   := True;
  try
    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Select ');
    aSQL.Add('    s.* ');
    aSQL.Add('  , coalesce(s.matricula, substring(s.id from 1 for char_length(s.id) - 1)) as matricula_servidor');
    aSQL.Add('  , p.cpf');
    aSQL.Add('  , coalesce(nullif(trim(s.pis_pasep_pf), ''''), nullif(trim(p.pis_pasep), ''''), ''00000000000'') as nis_trabalhador');
    aSQL.Add('  , d.descricao as dep_descricao');
    aSQL.Add('  , c.descricao as fun_descricao');
    aSQL.Add('  , coalesce(s.dt_readmissao, s.dt_admissao) as dt_inicio_condicao');
    aSQL.Add('  , x.ini_validade');
    aSQL.Add('  , x.fim_validade');
    aSQL.Add('from SERVIDOR s');
    aSQL.Add('  inner join PESSOA_FISICA p on (p.id = s.id_pessoa_fisica)');
    aSQL.Add('  inner join DEPTO d on (d.id = s.id_depto)');
    aSQL.Add('  inner join CARGO_FUNCAO c on (c.id = coalesce(s.id_cargo_atual, s.id_cargo_origem))');
    aSQL.Add('  inner join (');
    aSQL.Add('    Select');
    aSQL.Add('        se.id_servidor');
    aSQL.Add('      , cast(coalesce(nullif(nullif(trim(se.ini_validade), ''''), ''/''), extract(year from current_date) || right(''0'' || extract(month from current_date), 2)) as Integer) as ini_validade');
    aSQL.Add('      , cast(coalesce(nullif(nullif(trim(se.fim_validade), ''''), ''/''), ''209912'') as Integer) as fim_validade');
    aSQL.Add('    from SERVIDOR_EVENTO_FIXO se');
    aSQL.Add('    where se.id_evento in (');
    aSQL.Add('      Select');
    aSQL.Add('        e.id');
    aSQL.Add('      from EVENTO e');
    aSQL.Add('      where e.id_categ_tcm = 4'); // Remunetação por Insalubridade (TIPO_REMUN_TCM)
    aSQL.Add('    )');
    aSQL.Add('  ) x on (x.id_servidor = s.id)');
    aSQL.Add('where (s.id > 0)');

    if ( StrToIntDef(OnlyNumber(aCompetencia.Codigo), 0) < (StrToInt(FormatDateTime('YYYYMM', Date)) - 1) ) then
      // Carga inicial
      aSQL.Add('  and (s.data_operacao <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', aDataFinal)) + ')')
    else
      // Aletrações do mês
      aSQL.Add('  and (s.data_operacao between ' + QuotedStr(FormatDateTime('yyyy.mm.dd', aDataInicial)) + ' and ' + QuotedStr(FormatDateTime('yyyy.mm.dd', aDataFinal)) + ')');

    case aModoLancamento of
      mlInclusao  : aSQL.Add('  and (s.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_INSERIR) + ')');
      mlAlteracao : aSQL.Add('  and (s.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_ALTERAR) + ')');
      mlExclusao  : aSQL.Add('  and (s.tipo_operacao = ' + QuotedStr(FLAG_OPERACAO_EXCLUIR) + ')');
    end;

    if (aModoLancamento = mlAlteracao) then
      aSQL.Add('  and (x.ini_validade >= ' + IntToStr(aCompetencia.ID - 1) + ')');

    aSQL.EndUpdate;
    aSQL.SaveToFile('.\log\eS2241.sql');
    SetSQL(aSQL);

    I := 1;

    aProcesso.MaxValue := cdsTabela.RecordCount;
    aProcesso.Progress := 0;
    Application.ProcessMessages;

    ACBrESocial.Eventos.NaoPeriodicos.S2241.Clear;

    cdsTabela.First;
    while not cdsTabela.Eof do
    begin
      with ACBrESocial.Eventos.NaoPeriodicos.S2241.Add, EvtInsApo do
      begin
        aEventoID := StrToInt(IncrementGenerator('GEN_ESOCIAL_EVENTO_S2241', 1));
        Sequencial:= aEventoID;

        if AmbienteWebServiceProducao then
          IdeEvento.TpAmb := TpTpAmb(0) //taProducao
        else
          IdeEvento.TpAmb := taProducaoRestrita;

        IdeEvento.indRetif := ireOriginal; // (ireOriginal, ireRetificacao);

        if (IdeEvento.indRetif = ireRetificacao) then
          IdeEvento.NrRecibo := '65.5454.987798798798' // Preencher com o número do recibo do arquivo a ser retificado.
        else
          IdeEvento.NrRecibo := EmptyStr;

        IdeEvento.ProcEmi  := peAplicEmpregador;
        IdeEvento.VerProc  := Versao_Executavel(ParamStr(0));

        IdeEmpregador.TpInsc := tiCNPJ;
        IdeEmpregador.NrInsc := Criptografa(Pesquisa('CONFIG_ORGAO', 'ID', '1', 'CNPJ', ''),'2', 14); //Criptografa(cdsTabela.FieldByName('CNPJ').AsString, '2', 14);

        IdeVinculo.cpfTrab   := OnlyNumber(Trim(cdsTabela.FieldByName('cpf').AsString));
        IdeVinculo.Matricula := Trim(cdsTabela.FieldByName('matricula_servidor').AsString);
        IdeVinculo.NisTrab   := Trim(cdsTabela.FieldByName('nis_trabalhador').AsString);

        with ACBrESocial.Configuracoes do
          Geral.IdEmpregador := EvtInsApo.IdeEmpregador.NrInsc;

        // InsalPeric - Informações de insalubridade e periculosidade
        with InsalPeric do
        begin
          if (aModoLancamento = mlInclusao) then
            with iniInsalPeric do
            begin
              DtiniCondicao := cdsTabela.FieldByName('dt_inicio_condicao').AsDateTime;

              InfoAmb.Clear;

              with InfoAmb.Add do
              begin
                codAmb              := Trim(cdsTabela.FieldByName('id_depto').AsString);
                InfoAtiv.dscAtivDes := Trim(cdsTabela.FieldByName('fun_descricao').AsString);

                FatRisco.Clear;

                aSQL.BeginUpdate;
                aSQL.Clear;
                aSQL.Add('Select ');
                aSQL.Add('    f.id_fator_risco as codigo ');
                aSQL.Add('from DEPTO_FATOR_RISCO f ');
                aSQL.Add('where (f.id_depto = ' + Trim(cdsTabela.FieldByName('id_depto').AsString) + ') ');

                aSQL.EndUpdate;
                SetSQL_Detalhe(aSQL);

                cdsDetalhe.First;
                if (cdsDetalhe.RecordCount > 0) then
                begin

                  while not cdsDetalhe.Eof do
                  begin
                    with FatRisco.Add do
                    begin
                      codFatRis  := Trim(cdsDetalhe.FieldByName('codigo').AsString);
  //                    intConc    := 'N/A';
  //                    tecMedicao := EmptyStr;
                    end;

                    cdsDetalhe.Next;
                  end;

                end
                else
                  with FatRisco.Add do
                  begin
                    codFatRis := '0901001'; // Ausência de Fator de Risco
                  end;

                cdsDetalhe.Close;
              end;
            end;

          // Opcional - usado para alterações nas condições de trabalho previamente informadas
          // so sera enviado posteriormente quando for alterar um registro
          if (aModoLancamento = mlAlteracao) then
            with altInsalPeric do
            begin
              DtaltCondicao := Date;

              InfoAmb.Clear;

              with InfoAmb.Add do
              begin
                codAmb              := Trim(cdsTabela.FieldByName('id_depto').AsString);
                InfoAtiv.dscAtivDes := Trim(cdsTabela.FieldByName('fun_descricao').AsString);

                FatRisco.Clear;

                aSQL.BeginUpdate;
                aSQL.Clear;
                aSQL.Add('Select ');
                aSQL.Add('    f.id_fator_risco as codigo ');
                aSQL.Add('from DEPTO_FATOR_RISCO f ');
                aSQL.Add('where (f.id_depto = ' + Trim(cdsTabela.FieldByName('id_depto').AsString) + ') ');

                aSQL.EndUpdate;
                SetSQL_Detalhe(aSQL);

                cdsDetalhe.First;
                if (cdsDetalhe.RecordCount > 0) then
                begin

                  while not cdsDetalhe.Eof do
                  begin
                    with FatRisco.Add do
                    begin
                      codFatRis  := Trim(cdsDetalhe.FieldByName('codigo').AsString);
                      intConc    := 'N/A';
                      tecMedicao := EmptyStr;
                    end;

                    cdsDetalhe.Next;
                  end;

                end
                else
                  with FatRisco.Add do
                  begin
                    codFatRis  := '0901001'; // Ausência de Fator de Risco
                    intConc    := 'N/A';
                    tecMedicao := EmptyStr;
                  end;

                cdsDetalhe.Close;
              end;
            end;

          // Opcional - usado quando cessarem as condições de trabalho previamente informadas
          if (aModoLancamento = mlExclusao)
            or (cdsTabela.FieldByName('fim_validade').AsInteger <= aCompetencia.ID)
            //or ((cdsTabela.FieldByName('id_est_funcional').AsInteger = ID_ESTADO_FUNCIONAL_DEMITIDO))
            or (Trim(cdsTabela.FieldByName('efetivo').AsString) = FLAG_NAO) then
            with fimInsalPeric do
            begin
              DtfimCondicao := Date;

              InfoAmb.Clear;
              with InfoAmb.Add do
                codAmb := Trim(cdsTabela.FieldByName('id_depto').AsString);
            end;
        end;

        // Estado Funcional "APOSENTADO" (ESTADO_FUNCIONAL)
        if (cdsTabela.FieldByName('id_est_funcional').AsInteger = ID_ESTADO_FUNCIONAL_APOSENTADO) then
          ;
//        // AposentEsp - Infomações de condições que ensejam aposentadoria especial
//        with AposentEsp do
//        begin
//          with iniAposentEsp do
//          begin
//            DtiniCondicao := date - 60;
//
//            InfoAmb.Clear;
//
//            with InfoAmb.Add do
//            begin
//              codAmb := '654';
//
//              InfoAtiv.dscAtivDes := 'dscAtivDes';
//
//              FatRisco.Clear;
//
//              with FatRisco.Add do
//                codFatRis := '1234567890';
//            end;
//          end;
//
//          // Opcional - usado para alterações nas condições de trabalho previamente informadas
//          // so sera enviado posteriormente quando for alterar um registro
//          with altAposentEsp do
//          begin
//            DtaltCondicao := Date;
//
//            InfoAmb.Clear;
//
//            with InfoAmb.Add do
//            begin
//              codAmb := '456';
//
//              InfoAtiv.dscAtivDes := 'dscAtivDes';
//
//              FatRisco.Clear;
//
//              with FatRisco.Add do
//              begin
//                codFatRis  := '321';
//                intConc    := 'N/A';
//                tecMedicao := 'Técnica de medição';
//              end;
//            end;
//          end;
//
//          // Opcional - usado quando cessarem as condições de trabalho previamente informadas
//          with fimAposentEsp do
//          begin
//            DtfimCondicao := Date;
//
//            InfoAmb.Clear;
//
//            with InfoAmb.Add do
//              codAmb := '654321';
//          end;
//        end;
      end;

      aLabel.Caption     := Trim(cdsTabela.FieldByName('nome_servidor').AsString);
      aProcesso.Progress := I;
      Application.ProcessMessages;
      Inc(I);

      cdsTabela.Next;
    end;

    aRetorno := True;
    aProtocolo.S2241 := aRetorno;
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

procedure TdmESocial.GravarProtocoloRetorno(aProtocolo: TProtocoloESocial);
begin
  with cdsProtocolo do
  begin
    Close;
    ParamByName('numero').AsString := aProtocolo.Numero;
    OPen;
    if IsEmpty then
    begin
      Append;

      cdsProtocoloID.Value             := StrToInt64(IncrementGenerator('GEN_ESOCIAL_PROTOCOLO_ID', 1));
      cdsProtocoloNUMERO.AsString      := aProtocolo.Numero;
      cdsProtocoloINSCRICAO.AsString   := aProtocolo.NumeroInscricao;
      cdsProtocoloDATA_HORA.AsDateTime := aProtocolo.DataHora;
      cdsProtocoloVERSAO.AsString      := aProtocolo.Versao;
      cdsProtocoloARQUIVO_ENVIADO.LoadFromFile(aProtocolo.Arquivos.Strings[0]);
      cdsProtocoloARQUIVO_RETORNO.LoadFromFile(aProtocolo.Arquivos.Strings[1]);

      Post;
      ApplyUpdates(0);
    end;
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
  c : TCompetencia;
begin
  x := 0;
  s := FormatDateTime('YYYY', Date);
  aLista.Items.BeginUpdate;
  aLista.Items.Clear;
  try
    for I := 1 to 12 do
    begin
      c := TCompetencia.Criar;
      c.DataInicial := StrToDate('01/' + FormatFloat('00', I) + '/' + s);
      c.DataFinal   := StrToDate(FormatFloat('00', DaysInMonth(c.DataInicial)) + FormatDateTime('/mm/yyyy', c.DataInicial));
      c.Codigo      := s + '-' + FormatFloat('00', I);
      c.Descricao   := FormatDateTime('mmmm"/"yyyy', c.DataInicial);

      aLista.Items.AddObject(c.Codigo, c);
      //aLista.Items.Add(s + '-' + FormatFloat('00', I));
      if (I = StrToInt(FormatDateTime('mm', Date)) ) then
        x := aLista.Items.Count - 1;
    end;
  finally
    aLista.Items.EndUpdate;
    aLista.ItemIndex := x;
  end;
end;

procedure TdmESocial.ListarCompetenciasAdmissao(aLista: TComboBox);
var
  aSQL : TStringList;
  x ,
  i : Integer;
  s : String;
  c : TCompetencia;
begin
  aLista.Items.BeginUpdate;
  aLista.Items.Clear;

  aSQL := TStringList.Create;
  try
    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Select distinct');
    aSQL.Add('    extract(year from coalesce(s.dt_readmissao, s.dt_admissao)) || ''-'' ||');
    aSQL.Add('    right(''00'' || extract(month from coalesce(s.dt_readmissao, s.dt_admissao)), 2) as cmp_admissao');
    aSQL.Add('  , extract(year from coalesce(s.dt_readmissao, s.dt_admissao))                      as ano_admissao');
    aSQL.Add('  , right(''00'' || extract(month from coalesce(s.dt_readmissao, s.dt_admissao)), 2) as mes_admissao');
    aSQL.Add('from SERVIDOR s');
    aSQL.Add('where extract(year from coalesce(s.dt_readmissao, s.dt_admissao)) <>  extract(year from current_date)');
    aSQL.Add('order by');
    aSQL.Add('1');
    aSQL.EndUpdate;

    SetSQL_Geral(aSQL);

    cdsGeral.First;
    while not cdsGeral.Eof do
    begin
      c := TCompetencia.Criar;
      c.DataInicial := StrToDate('01/' + cdsGeral.FieldByName('mes_admissao').AsString + '/' + cdsGeral.FieldByName('ano_admissao').AsString);
      c.DataFinal   := StrToDate(FormatFloat('00', DaysInMonth(c.DataInicial)) + FormatDateTime('/mm/yyyy', c.DataInicial));
      c.Codigo      := cdsGeral.FieldByName('ano_admissao').AsString + '-' + cdsGeral.FieldByName('mes_admissao').AsString;
      c.Descricao   := FormatDateTime('mmmm"/"yyyy', c.DataInicial);

      aLista.Items.AddObject(c.Codigo, c);
      cdsGeral.Next;
    end;
    cdsGeral.Close;

    x := 0;
    s := FormatDateTime('YYYY', Date);
    I := 1;

    for I := 1 to 12 do
    begin
      c := TCompetencia.Criar;
      c.DataInicial := StrToDate('01/' + FormatFloat('00', I) + '/' + s);
      c.DataFinal   := StrToDate(FormatFloat('00', DaysInMonth(c.DataInicial)) + FormatDateTime('/mm/yyyy', c.DataInicial));
      c.Codigo      := s + '-' + FormatFloat('00', I);
      c.Descricao   := FormatDateTime('mmmm"/"yyyy', c.DataInicial);

      aLista.Items.AddObject(c.Codigo, c);
      if (I = StrToInt(FormatDateTime('mm', Date)) ) then
        x := aLista.Items.Count - 1;
    end;
  finally
    aLista.Items.EndUpdate;
    aLista.ItemIndex := x;

    aSQL.Free;
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

procedure TdmESocial.SetSQL_Detalhe(aSQL: TStringList);
begin
  if cdsDetalhe.Active then
    cdsDetalhe.Close;

  qryDetalhe.SQL.BeginUpdate;
  qryDetalhe.SQL.Clear;
  try
    qryDetalhe.SQL.AddStrings(aSQL);
  finally
    qryDetalhe.SQL.EndUpdate;
    cdsDetalhe.FetchParams;
    cdsDetalhe.Open;
  end;
end;

procedure TdmESocial.SetSQL_Geral(aSQL: TStringList);
begin
  if cdsGeral.Active then
    cdsGeral.Close;

  qryGeral.SQL.BeginUpdate;
  qryGeral.SQL.Clear;
  try
    qryGeral.SQL.AddStrings(aSQL);
  finally
    qryGeral.SQL.EndUpdate;
    cdsGeral.FetchParams;
    cdsGeral.Open;
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

  aS1000 := False;
  aS1005 := False;
  aS1010 := False;
  aS1020 := False;
  aS1030 := False;
  aS1035 := False;
  aS1040 := False;
  aS1050 := False;
  aS1060 := False;
  aS1070 := False;
  aS1080 := False;
  aS2200 := False;
  aS2205 := False;
  aS2206 := False;
  aS2210 := False;
  aS2220 := False;
  aS2230 := False;
  aS2240 := False;
  aS2241 := False;
  aS2250 := False;
  aS2260 := False;
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
