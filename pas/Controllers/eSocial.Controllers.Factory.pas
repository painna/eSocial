unit eSocial.Controllers.Factory;

interface

uses
  eSocial.Controllers.Interfaces,
  eSocial.Controllers.Competencia;

type
  TControllerFactory = class
    private
    public
      class function Competencia : IControllerCompetencia;
  end;

implementation

{ TControllerFactory }

class function TControllerFactory.Competencia: IControllerCompetencia;
begin
  Result := TControllerCompetencia.GetInstance;
end;

end.
