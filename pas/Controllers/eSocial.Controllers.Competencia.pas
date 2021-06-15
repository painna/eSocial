unit eSocial.Controllers.Competencia;

interface

uses
  eSocial.Controllers.Interfaces,
  eSocial.Models.DAO.Interfaces,
  eSocial.Models.DAO.Factory,
  eSocial.Models.Entities.Competencia;

type
  TControllerCompetencia = class(TInterfacedObject, IControllerCompetencia)
    strict private
      class var _instance : IControllerCompetencia;
    private
      FDAO : iModelDAOEntity<TCompetencia>;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function GetInstance : IControllerCompetencia;

      function DAO : iModelDAOEntity<TCompetencia>;
  end;

implementation

{ TControllerCompetencia }

constructor TControllerCompetencia.Create;
begin
  FDAO := _ModelDAOFactory.Competencia;
end;

function TControllerCompetencia.DAO: iModelDAOEntity<TCompetencia>;
begin
  Result := FDAO;
end;

destructor TControllerCompetencia.Destroy;
begin
  inherited;
end;

class function TControllerCompetencia.GetInstance : IControllerCompetencia;
begin
  if not Assigned(_instance) then
    _instance := TControllerCompetencia.Create;

  Result := _instance;
end;

end.
