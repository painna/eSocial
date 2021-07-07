unit eSocial.Models.DAO.Competencia;

interface

uses
  Data.DB,
  System.Generics.Collections,
  eSocial.Models.DAO.Interfaces,
  eSocial.Models.ComplexTypes,
  eSocial.Models.Entities.Competencia,
  eSocial.Models.Components.Connections.Interfaces;

type
  TModelDAOCompetencia = class(TInterfacedObject, iModelDAOEntity<TCompetencia>)
    private
      FConnection : iModelComponentConnection;
      FDataSet : TDataSource;
      FEntity  : TCompetencia;
      procedure ReadFields;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelDAOEntity<TCompetencia>;

      function DataSet(aValue : TDataSource) : iModelDAOEntity<TCompetencia>;
      function Delete : iModelDAOEntity<TCompetencia>; virtual; abstract;
      function Get    : iModelDAOEntity<TCompetencia>; overload;
      function Get(aID : String)    : iModelDAOEntity<TCompetencia>; overload;
      function Get(aParams : TDictionary<String, String>) : iModelDAOEntity<TCompetencia>; overload;
      function Get(aParams : TArrayStrings) : iModelDAOEntity<TCompetencia>; overload;
      function Insert : iModelDAOEntity<TCompetencia>; virtual; abstract;
      function This   : TCompetencia;
      function Update : iModelDAOEntity<TCompetencia>; virtual; abstract;
  end;

implementation

{ TModelDAOCompetencia }

uses
  System.SysUtils,
  eSocial.Models.Components.Connections.Factory;

constructor TModelDAOCompetencia.Create;
begin
  FConnection := TModelComponentConnectionFactory.Connection;

  FDataSet := TDataSource.Create(nil);
  FDataSet.DataSet := FConnection.DataSet;

  FEntity     := TCompetencia.Create(Self);
end;

destructor TModelDAOCompetencia.Destroy;
begin
  if Assigned(FDataSet) then
    FDataSet.DisposeOf;

  if Assigned(FEntity) then
    FEntity.DisposeOf;

  inherited;
end;

function TModelDAOCompetencia.Get(aParams: TDictionary<String, String>): iModelDAOEntity<TCompetencia>;
begin
  Result := Self;
  try
    FConnection
      .SQLClear
      .SQL('Select')
      .SQL('    c.competencia')
      .SQL('  , c.ano')
      .SQL('  , c.mes')
      .SQL('  , c.descricao')
      .SQL('  , c.encerrado')
      .SQL('  , c.origem')
      .SQL('from VW_ESOCIAL_COMPETENCIA c')
      .SQL('  and (c.competencia = :competencia)')
      .FetchParams
      .AddParam('competencia', aParams.Items['competencia'])
      .Open;

    ReadFields;
    aParams.DisposeOf;
  except
    on E : Exception do
      raise Exception.Create('Erro ao consultar a competência : ' + #13#13 + E.Message);
  end;
end;

function TModelDAOCompetencia.Get(aID: String): iModelDAOEntity<TCompetencia>;
begin
  Result := Self;
  try
    FConnection
      .SQLClear
      .SQL('Select')
      .SQL('    c.competencia')
      .SQL('  , c.ano')
      .SQL('  , c.mes')
      .SQL('  , c.descricao')
      .SQL('  , c.encerrado')
      .SQL('  , c.origem')
      .SQL('from VW_ESOCIAL_COMPETENCIA c')
      .SQL('where (c.origem = 1)');

    if not aID.Trim.IsEmpty then
    begin
      FConnection
        .SQL('  and (c.competencia = :id)')
        .FetchParams
        .AddParam('id', aID);
    end;

    FConnection.Open;

    ReadFields;
  except
    on E : Exception do
      raise Exception.Create('Erro ao consultar a competência : ' + #13#13 + E.Message);
  end;
end;

class function TModelDAOCompetencia.New: iModelDAOEntity<TCompetencia>;
begin
  Result := Self.Create;
end;

procedure TModelDAOCompetencia.ReadFields;
begin
  with FDataSet.DataSet do
  begin
    FEntity
      .Ano( FieldByName('ano').AsString )
      .Codigo( FieldByName('competencia').AsString )
      .Descricao( FieldByName('descricao').AsString )
      .Encerrado( FieldByName('encerrado').AsString )
      .Mes( FieldByName('mes').AsString )
      .Origem( TOrigemDados(FieldByName('origem').AsInteger) );
  end;
end;

function TModelDAOCompetencia.Get: iModelDAOEntity<TCompetencia>;
begin
  Result := Self;
  try
    FConnection
      .SQLClear
      .SQL('Select')
      .SQL('    c.competencia')
      .SQL('  , c.ano')
      .SQL('  , c.mes')
      .SQL('  , c.descricao')
      .SQL('  , c.encerrado')
      .SQL('  , c.origem')
      .SQL('from VW_ESOCIAL_COMPETENCIA c')
      .SQL('  inner join GET_ESOCIAL_COMPETENCIA_ATIVA g on (g.competencia = c.competencia)')
      .SQL('where (c.origem = 1)')
    .Open;

    FConnection.DataSet.Last; // último registro que corresponde ao eSocial

    ReadFields;
  except
    on E : Exception do
      raise Exception.Create('Erro ao consultar a competência : ' + #13#13 + E.Message);
  end;
end;

function TModelDAOCompetencia.DataSet(aValue: TDataSource): iModelDAOEntity<TCompetencia>;
begin
  Result   := Self;
  FDataSet := aValue;
  FDataSet.DataSet := FConnection.DataSet;
end;

function TModelDAOCompetencia.This: TCompetencia;
begin
  Result := FEntity;
end;

function TModelDAOCompetencia.Get(aParams: TArrayStrings): iModelDAOEntity<TCompetencia>;
begin
  Result := Self;
  try
    FConnection
      .SQLClear
      .SQL('Select')
      .SQL('    c.competencia')
      .SQL('  , c.ano')
      .SQL('  , c.mes')
      .SQL('  , c.descricao')
      .SQL('  , c.encerrado')
      .SQL('  , c.origem')
      .SQL('from VW_ESOCIAL_COMPETENCIA c')
      .SQL('  and (c.competencia = :competencia)')
      .FetchParams
      .AddParam('competencia', aParams[0])
      .Open;

    ReadFields;
  except
    on E : Exception do
      raise Exception.Create('Erro ao consultar a competência : ' + #13#13 + E.Message);
  end;
end;

end.
