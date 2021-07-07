unit eSocial.Controllers.Operacao;

interface

uses
  eSocial.Controllers.Interfaces,
  eSocial.Models.DAO.Interfaces,
  eSocial.Models.DAO.Factory,
  eSocial.Models.Entities.Operacao;

type
  TControllerOperacao = class(TInterfacedObject, IControllerOperacao)
    strict private
      class var _instance : IControllerOperacao;
    private
      FDAO : iModelDAOEntity<TOperacao>;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function GetInstance : IControllerOperacao;

      function DAO : iModelDAOEntity<TOperacao>;
  end;

implementation

{ TControllerOperacao }

constructor TControllerOperacao.Create;
begin
  FDAO := _ModelDAOFactory.Operacao;
end;

function TControllerOperacao.DAO: iModelDAOEntity<TOperacao>;
begin
  Result := FDAO;
end;

destructor TControllerOperacao.Destroy;
begin
  inherited;
end;

class function TControllerOperacao.GetInstance: IControllerOperacao;
begin
  if not Assigned(_instance) then
    _instance := TControllerOperacao.Create;

  Result := _instance;
end;

end.
