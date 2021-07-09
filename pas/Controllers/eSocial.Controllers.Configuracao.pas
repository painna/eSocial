unit eSocial.Controllers.Configuracao;

interface

uses
  System.SysUtils,
  System.Classes,
  eSocial.Controllers.Interfaces,
  eSocial.Models.DAO.Interfaces,
  eSocial.Models.DAO.Factory,
  eSocial.Models.Entities.Configuracao;

type
  TControllerConfiguracao = class(TInterfacedObject, IControllerConfiguracao)
    strict private
      class var _instance : IControllerConfiguracao;
    private
      FDAO   : iModelDAOEntity<TConfiguracao>;
      FErros : TStringList;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function GetInstance : IControllerConfiguracao;

      function DAO : iModelDAOEntity<TConfiguracao>;
      function ValidarConfiguracao : Boolean;
      function Erros : String;
  end;

implementation

{ TControllerConfiguracao }

constructor TControllerConfiguracao.Create;
begin
  FDAO := _ModelDAOFactory.Configuracao;
  FErros := TStringList.Create;

  FErros.BeginUpdate;
  FErros.Clear;
  FErros.EndUpdate;
end;

function TControllerConfiguracao.DAO: iModelDAOEntity<TConfiguracao>;
begin
  Result := FDAO;
end;

destructor TControllerConfiguracao.Destroy;
begin
  inherited;
end;

function TControllerConfiguracao.Erros: String;
begin
  Result := FErros.Text;
end;

class function TControllerConfiguracao.GetInstance: IControllerConfiguracao;
begin
  if not Assigned(_instance) then
    _instance := TControllerConfiguracao.Create;

  Result := _instance;
end;

function TControllerConfiguracao.ValidarConfiguracao: Boolean;
begin
  FErros.BeginUpdate;
  FErros.Clear;

  if (FDAO.This.CodigoSIAFI = EmptyStr) then
    FErros.Add(FormatFloat('#00" - "', FErros.Count + 1) + 'O código SIAFI do órgão');

  if (FDAO.This.UnidadeGestoraPrincipal = 0) then
    FErros.Add(FormatFloat('#00" - "', FErros.Count + 1) + 'A Unidade Gestora Principal');

  if (FDAO.This.NaturezaJuridica = EmptyStr) then
    FErros.Add(FormatFloat('#00" - "', FErros.Count + 1) + 'A Natureza Jurídíca do órgão');

  if (FDAO.This.ValorSubteto <= 0.0) then
    FErros.Add(FormatFloat('#00" - "', FErros.Count + 1) + 'O valor do subteto salarial');

  if (FDAO.This.TipoSubteto = EmptyStr) then
    FErros.Add(FormatFloat('#00" - "', FErros.Count + 1) + 'O tipo do subteto salarial');

  if (FDAO.This.DataImplantacaoESocial = EncodeDate(1899, 12, 30)) then
    FErros.Add(FormatFloat('#00" - "', FErros.Count + 1) + 'A Data de Implatação do eSocial no órgão');

  if (not FDAO.This.Responsavel.DadosCompletos) then
    FErros.Add(FormatFloat('#00" - "', FErros.Count + 1) + 'Os dados completos do responsável pelo e-Social');

  FErros.EndUpdate;

  Result := (FErros.Count = 0);
end;

end.
