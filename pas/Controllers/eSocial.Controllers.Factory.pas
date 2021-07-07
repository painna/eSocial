unit eSocial.Controllers.Factory;

interface

uses
  eSocial.Controllers.Interfaces,
  eSocial.Controllers.Competencia,
  eSocial.Controllers.Operacao;

type
  TControllerFactory = class
    private
    public
      class function Competencia : IControllerCompetencia;
      class function Operacao : IControllerOperacao;
  end;

implementation

{ TControllerFactory }

class function TControllerFactory.Competencia: IControllerCompetencia;
begin
  Result := TControllerCompetencia.GetInstance;
end;

class function TControllerFactory.Operacao: IControllerOperacao;
begin
  Result := TControllerOperacao.GetInstance;
end;

end.
