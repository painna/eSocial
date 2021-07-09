unit eSocial.Models.DAO.Factory;

interface

uses
  eSocial.Models.DAO.Interfaces,
  eSocial.Models.DAO.Competencia,
  eSocial.Models.DAO.Operacao,
  eSocial.Models.DAO.Configuracao,
  eSocial.Models.Entities.Competencia,
  eSocial.Models.Entities.Operacao,
  eSocial.Models.Entities.Configuracao;

type
  TModelDAOFactory = class
    strict private
      class var _instance : TModelDAOFactory;
    private
      FCompetencia  : iModelDAOEntity<TCompetencia>;
      FOperacao     : iModelDAOEntity<TOperacao>;
      FConfiguracao : iModelDAOEntity<TConfiguracao>;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function GetInstance : TModelDAOFactory;

      function Competencia  : iModelDAOEntity<TCompetencia>;
      function Operacao     : iModelDAOEntity<TOperacao>;
      function Configuracao : iModelDAOEntity<TConfiguracao>;
  end;

var
  _ModelDAOFactory : TModelDAOFactory;

implementation

{ TModelDAOFactory }

constructor TModelDAOFactory.Create;
begin
  ;
end;

destructor TModelDAOFactory.Destroy;
begin
  inherited;
end;

function TModelDAOFactory.Configuracao: iModelDAOEntity<TConfiguracao>;
begin
  if not Assigned(FConfiguracao) then
    FConfiguracao := TModelDAOConfiguracao.New;

  Result := FConfiguracao;
end;

class function TModelDAOFactory.GetInstance: TModelDAOFactory;
begin
  if not Assigned(_instance) then
    _instance := TModelDAOFactory.Create;

  Result := _instance;
end;

function TModelDAOFactory.Operacao: iModelDAOEntity<TOperacao>;
begin
  if not Assigned(FOperacao) then
    FOperacao := TModelDAOOperacao.New;

  Result := FOperacao;
end;

function TModelDAOFactory.Competencia: iModelDAOEntity<TCompetencia>;
begin
  if not Assigned(FCompetencia) then
    FCompetencia := TModelDAOCompetencia.New;

  Result := FCompetencia;
end;

initialization
  _ModelDAOFactory := TModelDAOFactory.GetInstance;

finalization
  _ModelDAOFactory.DisposeOf;

end.
