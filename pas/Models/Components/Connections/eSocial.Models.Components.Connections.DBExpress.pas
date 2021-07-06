unit eSocial.Models.Components.Connections.DBExpress;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SimpleDS,
  Data.DBXFirebird,
  Data.SqlExpr,
  Data.FMTBcd,
  Datasnap.Provider,
  Datasnap.DBClient,
  eSocial.Models.Components.Connections.Interfaces;

type
  TModelComponentConnectionDBExpress = class(TInterfacedObject, iModelComponentConnection)
    private
      FConnection : TSQLConnection;
      FQuery : TSQLQuery;
      FProvider : TDataSetProvider;
      FClient   : TClientDataSet;
      function ExistParam(aParamName : String) : Boolean;
    protected
      constructor Create(aDataBase : String);
    public
      destructor Destroy; override;
      class function New(aDataBase : String) : iModelComponentConnection;

      function Active(aValue : Boolean) : iModelComponentConnection;
      function AddParam (aParam : String; aValue : Smallint) : iModelComponentConnection; overload;
      function AddParam (aParam : String; aValue : Integer) : iModelComponentConnection; overload;
      function AddParam (aParam : String; aValue : String) : iModelComponentConnection; overload;
      function AddParam (aParam : String; aValue : TDateTime) : iModelComponentConnection; overload;
      function DataSet : TDataSet;
      function ExecSQL : iModelComponentConnection;
      function FetchParams : iModelComponentConnection;
      function Open : iModelComponentConnection;
      function SQL(aValue : String) : iModelComponentConnection;
      function SQLClear : iModelComponentConnection;
  end;

implementation

{ TModelComponentConnectionDBExpress }

constructor TModelComponentConnectionDBExpress.Create(aDataBase : String);
begin
  try
    FConnection := TSQLConnection.Create(nil);
    FConnection.ConnectionName := 'FBConnection';
    FConnection.DriverName     := 'Firebird';
    FConnection.LoginPrompt    := False;

    with FConnection do
    begin
      Params.Clear;
      Params.Values['DriverName']       := 'Firebird';
      Params.Values['RoleName']         := 'RoleName';
      Params.Values['User_Name']        := 'GERASYS.TI';
      Params.Values['Password']         := 'gsti2010';
      Params.Values['ServerCharSet']    := 'WIN1252';
      Params.Values['SQLDialect']       := '3';
      Params.Values['ErrorResourceFile']:= '';
      Params.Values['LocaleCode']       := '0000';
      Params.Values['BlobSize']         := '-1';
      Params.Values['CommitRetain']     := 'False';
      Params.Values['WaitOnLocks']      := 'True';
      Params.Values['IsolationLevel']   := 'ReadCommitted';
      Params.Values['Trim Char']        := 'False';
      Params.Values['DataBase']         := aDataBase;
    end;

    FQuery := TSQLQuery.Create(nil);
    FQuery.SQLConnection := FConnection;
    FQuery.SQL.Clear;

    FProvider := TDataSetProvider.Create(nil);
    FProvider.Options    := [poAllowCommandText, poUseQuoteChar];
    FProvider.UpdateMode := TUpdateMode.upWhereKeyOnly;
    FProvider.Exported   := False;
    FProvider.DataSet    := FQuery;

    FClient := TClientDataSet.Create(nil);
    FClient.SetProvider( FProvider );
    FClient.StoreDefs := True;

    FConnection.Connected := True; // Testa os parâmetros de conexão
    FConnection.Connected := False;
  except
    On E : Exception do
      raise Exception.Create('Erro na conexão!' + #13 + E.Message);
  end;
end;

destructor TModelComponentConnectionDBExpress.Destroy;
begin
  FClient.DisposeOf;
  FProvider.DisposeOf;
  FQuery.DisposeOf;
  FConnection.DisposeOf;
  inherited;
end;


class function TModelComponentConnectionDBExpress.New(aDataBase : String): iModelComponentConnection;
begin
  Result := Self.Create(aDataBase);
end;

function TModelComponentConnectionDBExpress.Active(aValue: Boolean): iModelComponentConnection;
begin
  Result := Self;
  FClient.Active := aValue;
end;

function TModelComponentConnectionDBExpress.AddParam(aParam: String; aValue: Integer): iModelComponentConnection;
begin
  Result := Self;
  if ExistParam(aParam) then
    FClient.ParamByName(aParam).AsInteger := aValue;
end;

function TModelComponentConnectionDBExpress.AddParam(aParam, aValue: String): iModelComponentConnection;
begin
  Result := Self;
  if ExistParam(aParam) then
    FClient.ParamByName(aParam).AsString := aValue;
end;

function TModelComponentConnectionDBExpress.DataSet: TDataSet;
begin
  Result := FClient;
end;

function TModelComponentConnectionDBExpress.ExecSQL: iModelComponentConnection;
begin
  Result := Self;

  try
    if FClient.Active then
      FClient.Close;

    if FQuery.Active then
      FQuery.Close;

    FQuery.ExecSQL;
  except
    On E : Exception do
      raise Exception.Create('Erro na execução do Script SQL.' + #13 + E.Message);
  end;
end;

function TModelComponentConnectionDBExpress.ExistParam(aParamName: String): Boolean;
begin
  Result := Assigned(FClient.Params.FindParam(aParamName));
end;

function TModelComponentConnectionDBExpress.FetchParams: iModelComponentConnection;
begin
  Result := Self;
  FClient.SetProvider( FProvider );
  FClient.FetchParams;
end;

function TModelComponentConnectionDBExpress.Open: iModelComponentConnection;
begin
  Result := Self;
  FClient.SetProvider( FProvider );
  FClient.Open;
end;

function TModelComponentConnectionDBExpress.SQL(aValue: String): iModelComponentConnection;
begin
  Result := Self;

  if FClient.Active then
    FClient.Close;

  if FQuery.Active then
    FQuery.Close;

  FQuery.SQL.Add(aValue);
end;

function TModelComponentConnectionDBExpress.SQLClear: iModelComponentConnection;
begin
  Result := Self;

  if FClient.Active then
    FClient.Close;

  if FQuery.Active then
    FQuery.Close;

  FClient.Params.Clear;
  FQuery.SQL.Clear;
end;

function TModelComponentConnectionDBExpress.AddParam(aParam: String; aValue: TDateTime): iModelComponentConnection;
begin
  Result := Self;
  if ExistParam(aParam) then
    FClient.ParamByName(aParam).AsDateTime := aValue;
end;

function TModelComponentConnectionDBExpress.AddParam(aParam: String; aValue: Smallint): iModelComponentConnection;
begin
  Result := Self;
  if ExistParam(aParam) then
    FClient.ParamByName(aParam).AsSmallInt := aValue;
end;

end.
