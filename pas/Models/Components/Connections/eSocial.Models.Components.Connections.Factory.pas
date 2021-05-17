unit eSocial.Models.Components.Connections.Factory;

interface

uses
  eSocial.Models.Components.Connections.Interfaces,
  eSocial.Models.Components.Connections.DBExpress;

type
  TModelComponentConnectionFactory = class
    public
      class function Connection : iModelComponentConnection;
  end;

implementation

uses
  gsLib;

{ TModelComponentConnectionFactory }

class function TModelComponentConnectionFactory.Connection: iModelComponentConnection;
var
  aDataBase : String;
begin
  aDataBase := GetPathDataBase;
  Result    := TModelComponentConnectionDBExpress.New(aDataBase);
end;

end.
