unit eSocial.Models.DAO.Operacao;

interface

uses
  Data.DB,
  System.Generics.Collections,
  eSocial.Models.DAO.Interfaces,
  eSocial.Models.ComplexTypes,
  eSocial.Models.Entities.Operacao,
  eSocial.Models.Components.Connections.Interfaces,
  eSocial.Models.Components.Connections.Factory;

type
  TModelDAOOperacao = class(TInterfacedObject, iModelDAOEntity<TOperacao>)
    private
      FConnection : iModelComponentConnection;
      FDataSet : TDataSource;
      FEntity  : TOperacao;
      procedure ReadFields;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelDAOEntity<TOperacao>;

      function DataSet(aValue : TDataSource) : iModelDAOEntity<TOperacao>;
      function Delete : iModelDAOEntity<TOperacao>; virtual; abstract;
      function Get    : iModelDAOEntity<TOperacao>; overload;
      function Get(aID : String)    : iModelDAOEntity<TOperacao>; overload;
      function Get(aParams : TDictionary<String, String>) : iModelDAOEntity<TOperacao>; overload;
      function Get(aParams : TArrayStrings) : iModelDAOEntity<TOperacao>; overload;
      function Insert : iModelDAOEntity<TOperacao>; virtual; abstract;
      function This   : TOperacao;
      function Update : iModelDAOEntity<TOperacao>; virtual; abstract;
  end;

implementation

uses
  System.SysUtils;

{ TModelDAOOperacao }

constructor TModelDAOOperacao.Create;
begin
  FConnection := TModelComponentConnectionFactory.Connection;

  FDataSet := TDataSource.Create(nil);
  FDataSet.DataSet := FConnection.DataSet;

  FEntity := TOperacao.Create(Self);
end;

destructor TModelDAOOperacao.Destroy;
begin
  if Assigned(FDataSet) then
    FDataSet.DisposeOf;

  if Assigned(FEntity) then
    FEntity.DisposeOf;

  inherited;
end;

function TModelDAOOperacao.Get(aParams: TDictionary<String, String>): iModelDAOEntity<TOperacao>;
begin
  Result := Self;
  try
    FConnection
      .SQLClear
      .SQL('Select')
      .SQL('    e.competencia')
//      .SQL('  , sum(Case when (e.insercao  = ''S'') and (coalesce(pI.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, ''I'')), 0) > 0) then 1 else 0 end) as insercao ')
//      .SQL('  , sum(Case when (e.alteracao = ''S'') and (coalesce(pA.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, ''A'')), 0) > 0) then 1 else 0 end) as alteracao')
//      .SQL('  , sum(Case when (e.exclusao  = ''S'') and (coalesce(pE.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, ''E'')), 0) > 0) then 1 else 0 end) as exclusao ')
      .SQL('  , sum(Case when (e.insercao  = ''S'') and (coalesce(pI.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, pI.operacao)), 0) > 0) then 1 else 0 end) as insercao ')
      .SQL('  , sum(Case when (e.alteracao = ''S'') and (coalesce(pA.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, pA.operacao)), 0) > 0) then 1 else 0 end) as alteracao')
      .SQL('  , sum(Case when (e.exclusao  = ''S'') and (coalesce(pE.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, pE.operacao)), 0) > 0) then 1 else 0 end) as exclusao ')
      .SQL('from ESOCIAL_GERAR_EVENTOS e')
      .SQL('  left join ESOCIAL_EVENTO pI on (pI.evento = e.evento and pI.competencia = e.competencia and pI.operacao = ''I'') ')
      .SQL('  left join ESOCIAL_EVENTO pA on (pA.evento = e.evento and pA.competencia = e.competencia and pA.operacao = ''A'') ')
      .SQL('  left join ESOCIAL_EVENTO pE on (pE.evento = e.evento and pE.competencia = e.competencia and pE.operacao = ''E'') ')
      .SQL('where (e.competencia = :competencia)')
      .SQL('  and (e.evento      = :evento)')
      .FetchParams
      .AddParam('competencia', aParams.Items['competencia'])
      .AddParam('evento', aParams.Items['evento'])
      .SQL('group by')
      .SQL('    e.competencia')
      .Open;

    ReadFields;
    aParams.DisposeOf;
  except
    on E : Exception do
      raise Exception.Create('Erro ao consultar a operação : ' + #13#13 + E.Message);
  end;
end;

class function TModelDAOOperacao.New: iModelDAOEntity<TOperacao>;
begin
  Result := Self.Create;
end;

function TModelDAOOperacao.DataSet(aValue: TDataSource): iModelDAOEntity<TOperacao>;
begin
  Result   := Self;
  FDataSet := aValue;
end;

function TModelDAOOperacao.Get(aID: String): iModelDAOEntity<TOperacao>;
begin
  Result := Self;
  try
    FConnection
      .SQLClear
      .SQL('Select')
      .SQL('    e.competencia')
//      .SQL('  , sum(Case when (e.insercao  = ''S'') and (coalesce(pI.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, ''I'')), 0) > 0) then 1 else 0 end) as insercao ')
//      .SQL('  , sum(Case when (e.alteracao = ''S'') and (coalesce(pA.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, ''A'')), 0) > 0) then 1 else 0 end) as alteracao')
//      .SQL('  , sum(Case when (e.exclusao  = ''S'') and (coalesce(pE.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, ''E'')), 0) > 0) then 1 else 0 end) as exclusao ')
      .SQL('  , sum(Case when (e.insercao  = ''S'') and (coalesce(pI.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, pI.operacao)), 0) > 0) then 1 else 0 end) as insercao ')
      .SQL('  , sum(Case when (e.alteracao = ''S'') and (coalesce(pA.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, pA.operacao)), 0) > 0) then 1 else 0 end) as alteracao')
      .SQL('  , sum(Case when (e.exclusao  = ''S'') and (coalesce(pE.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, pE.operacao)), 0) > 0) then 1 else 0 end) as exclusao ')
      .SQL('from ESOCIAL_GERAR_EVENTOS e')
      .SQL('  left join ESOCIAL_EVENTO pI on (pI.evento = e.evento and pI.competencia = e.competencia and pI.operacao = ''I'') ')
      .SQL('  left join ESOCIAL_EVENTO pA on (pA.evento = e.evento and pA.competencia = e.competencia and pA.operacao = ''A'') ')
      .SQL('  left join ESOCIAL_EVENTO pE on (pE.evento = e.evento and pE.competencia = e.competencia and pE.operacao = ''E'') ');

    if not aID.Trim.IsEmpty then
    begin
      FConnection
        .SQL('where (e.competencia = :competencia)')
        .FetchParams
        .AddParam('competencia', aID);
    end;

    FConnection
      .SQL('group by')
      .SQL('    e.competencia')
      .Open;

    ReadFields;
  except
    on E : Exception do
      raise Exception.Create('Erro ao consultar a operação : ' + #13#13 + E.Message);
  end;
end;

function TModelDAOOperacao.Get: iModelDAOEntity<TOperacao>;
begin
  Result := Self;
  try
    FConnection
      .SQLClear
      .SQL('Select')
      .SQL('    e.competencia')
//      .SQL('  , sum(Case when (e.insercao  = ''S'') and (coalesce(pI.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, ''I'')), 0) > 0) then 1 else 0 end) as insercao ')
//      .SQL('  , sum(Case when (e.alteracao = ''S'') and (coalesce(pA.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, ''A'')), 0) > 0) then 1 else 0 end) as alteracao')
//      .SQL('  , sum(Case when (e.exclusao  = ''S'') and (coalesce(pE.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, ''E'')), 0) > 0) then 1 else 0 end) as exclusao ')
      .SQL('  , sum(Case when (e.insercao  = ''S'') and (coalesce(pI.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, pI.operacao)), 0) > 0) then 1 else 0 end) as insercao ')
      .SQL('  , sum(Case when (e.alteracao = ''S'') and (coalesce(pA.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, pA.operacao)), 0) > 0) then 1 else 0 end) as alteracao')
      .SQL('  , sum(Case when (e.exclusao  = ''S'') and (coalesce(pE.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, pE.operacao)), 0) > 0) then 1 else 0 end) as exclusao ')
      .SQL('from ESOCIAL_GERAR_EVENTOS e')
      .SQL('  left join ESOCIAL_EVENTO pI on (pI.evento = e.evento and pI.competencia = e.competencia and pI.operacao = ''I'') ')
      .SQL('  left join ESOCIAL_EVENTO pA on (pA.evento = e.evento and pA.competencia = e.competencia and pA.operacao = ''A'') ')
      .SQL('  left join ESOCIAL_EVENTO pE on (pE.evento = e.evento and pE.competencia = e.competencia and pE.operacao = ''E'') ')
      .SQL('where (e.competencia = :competencia)')
      .SQL('group by')
      .SQL('    e.competencia')
      .FetchParams
      .AddParam('competencia', FEntity.Competencia)
      .Open;

    ReadFields;
  except
    on E : Exception do
      raise Exception.Create('Erro ao consultar a operação : ' + #13#13 + E.Message);
  end;
end;

procedure TModelDAOOperacao.ReadFields;
begin
  with FDataSet.DataSet do
  begin
    FEntity
      .Competencia( FieldByName('competencia').AsString )
      .Insercao( FieldByName('insercao').AsInteger   > 0 )
      .Alteracao( FieldByName('alteracao').AsInteger > 0 )
      .Exclusao( FieldByName('exclusao').AsInteger   > 0 );
  end;
end;

function TModelDAOOperacao.This: TOperacao;
begin
  Result := FEntity;
end;

function TModelDAOOperacao.Get(aParams: TArrayStrings): iModelDAOEntity<TOperacao>;
begin
  Result := Self;
  try
    FConnection
      .SQLClear
      .SQL('Select')
      .SQL('    e.competencia')
//      .SQL('  , sum(Case when (e.insercao  = ''S'') and (coalesce(pI.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, ''I'')), 0) > 0) then 1 else 0 end) as insercao ')
//      .SQL('  , sum(Case when (e.alteracao = ''S'') and (coalesce(pA.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, ''A'')), 0) > 0) then 1 else 0 end) as alteracao')
//      .SQL('  , sum(Case when (e.exclusao  = ''S'') and (coalesce(pE.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, ''E'')), 0) > 0) then 1 else 0 end) as exclusao ')
      .SQL('  , sum(Case when (e.insercao  = ''S'') and (coalesce(pI.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, pI.operacao)), 0) > 0) then 1 else 0 end) as insercao ')
      .SQL('  , sum(Case when (e.alteracao = ''S'') and (coalesce(pA.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, pA.operacao)), 0) > 0) then 1 else 0 end) as alteracao')
      .SQL('  , sum(Case when (e.exclusao  = ''S'') and (coalesce(pE.enviado, ''N'') = ''N'') or (coalesce((Select pendencias from GET_ESOCIAL_PENDENCIA(e.evento, pE.operacao)), 0) > 0) then 1 else 0 end) as exclusao ')
      .SQL('from ESOCIAL_GERAR_EVENTOS e')
      .SQL('  left join ESOCIAL_EVENTO pI on (pI.evento = e.evento and pI.competencia = e.competencia and pI.operacao = ''I'') ')
      .SQL('  left join ESOCIAL_EVENTO pA on (pA.evento = e.evento and pA.competencia = e.competencia and pA.operacao = ''A'') ')
      .SQL('  left join ESOCIAL_EVENTO pE on (pE.evento = e.evento and pE.competencia = e.competencia and pE.operacao = ''E'') ')
      .SQL('where (e.competencia = :competencia)')
      .SQL('  and (e.evento      = :evento)')
      .FetchParams
      .AddParam('competencia', aParams[0])
      .AddParam('evento', aParams[1]);

    if (aParams[2] = 'I') then
      FConnection
        .SQL('  and (e.insercao  = ''S'')')
    else
    if (aParams[2] = 'A') then
      FConnection
        .SQL('  and (e.alteracao = ''S'')')
    else
    if (aParams[2] = 'E') then
      FConnection
        .SQL('  and (e.exclusao  = ''S'')');

    FConnection
      .SQL('group by')
      .SQL('    e.competencia')
      .Open;

    ReadFields;
  except
    on E : Exception do
      raise Exception.Create('Erro ao consultar a operação : ' + #13#13 + E.Message);
  end;
end;

end.
