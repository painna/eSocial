unit eSocial.Models.DAO.Configuracao;

interface

uses
  Data.DB,
  System.Generics.Collections,
  eSocial.Models.DAO.Interfaces,
  eSocial.Models.ComplexTypes,
  eSocial.Models.Entities.ConfiguracaO,
  eSocial.Models.Components.Connections.Interfaces,
  eSocial.Models.Components.Connections.Factory;

type
  TModelDAOConfiguracaO = class(TInterfacedObject, iModelDAOEntity<TConfiguracaO>)
    private
      FConnection : iModelComponentConnection;
      FDataSet : TDataSource;
      FEntity  : TConfiguracaO;
      procedure ReadFields;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelDAOEntity<TConfiguracaO>;

      function DataSet(aValue : TDataSource) : iModelDAOEntity<TConfiguracaO>;
      function Delete : iModelDAOEntity<TConfiguracaO>; virtual; abstract;
      function Get    : iModelDAOEntity<TConfiguracaO>; overload;
      function Get(aID : String)    : iModelDAOEntity<TConfiguracaO>; overload; virtual; abstract;
      function Get(aParams : TDictionary<String, String>) : iModelDAOEntity<TConfiguracaO>; overload; virtual; abstract;
      function Get(aParams : TArrayStrings) : iModelDAOEntity<TConfiguracaO>; overload; virtual; abstract;
      function Insert : iModelDAOEntity<TConfiguracaO>; virtual; abstract;
      function This   : TConfiguracaO;
      function Update : iModelDAOEntity<TConfiguracaO>; virtual; abstract;
  end;

implementation

uses
  System.SysUtils;

{ TModelDAOConfiguracaO }

constructor TModelDAOConfiguracaO.Create;
begin
  FConnection := TModelComponentConnectionFactory.Connection;

  FDataSet := TDataSource.Create(nil);
  FDataSet.DataSet := FConnection.DataSet;

  FEntity := TConfiguracao.Create(Self);
end;

destructor TModelDAOConfiguracaO.Destroy;
begin
  if Assigned(FDataSet) then
    FDataSet.DisposeOf;

  if Assigned(FEntity) then
    FEntity.DisposeOf;

  inherited;
end;

class function TModelDAOConfiguracaO.New: iModelDAOEntity<TConfiguracaO>;
begin
  Result := Self.Create;
end;

function TModelDAOConfiguracaO.Get: iModelDAOEntity<TConfiguracaO>;
begin
  Result := Self;
  try
    FConnection
      .SQLClear
      .SQL('Select ')
      .SQL('    e.id_config_orgao ')
      .SQL('  , e.id_unid_gestora ')
      .SQL('  , e.contador_nome   ')
      .SQL('  , e.contador_cpf    ')
      .SQL('  , e.contador_fonefixo    ')
      .SQL('  , e.contador_fonecelular ')
      .SQL('  , e.contador_email   ')
      .SQL('  , e.responsavel_nome ')
      .SQL('  , e.responsavel_cpf  ')
      .SQL('  , e.responsavel_fonefixo    ')
      .SQL('  , e.responsavel_fonecelular ')
      .SQL('  , e.responsavel_email       ')
      .SQL('  , e.nat_juridica ')
      .SQL('  , e.nro_siafi    ')
      .SQL('  , e.subteto_vencto_tipo  ')
      .SQL('  , e.subteto_vencto_valor ')
      .SQL('  , e.possui_rpps ')
      .SQL('  , e.possui_tabela_carreira ')
      .SQL('  , e.data_implantacao ')
      .SQL('from CONFIG_ESOCIAL e  ')
      .SQL('  inner join CONFIG_ORGAO o on (o.id = e.id_config_orgao) ')
      .SQL('  inner join UNID_GESTORA u on (u.id = e.id_unid_gestora) ')
      .SQL('where (e.id_config_orgao = 1) ')
    .Open;

    ReadFields;
  except
    on E : Exception do
      raise Exception.Create('Erro ao consultar as configurações do sistema : ' + #13#13 + E.Message);
  end;
end;

function TModelDAOConfiguracaO.DataSet(aValue: TDataSource): iModelDAOEntity<TConfiguracaO>;
begin
  Result   := Self;
  FDataSet := aValue;
  FDataSet.DataSet := FConnection.DataSet;
end;

procedure TModelDAOConfiguracaO.ReadFields;
begin
  FEntity
    .CodigoSIAFI( FDataSet.DataSet.FieldByName('nro_siafi').AsString )
    .UnidadeGestoraPrincipal( FDataSet.DataSet.FieldByName('id_unid_gestora').AsInteger )
    .NaturezaJuridica( FDataSet.DataSet.FieldByName('nat_juridica').AsString )
    .DataImplantacaoESocial( FDataSet.DataSet.FieldByName('data_implantacao').AsDateTime )
      .Responsavel
        .Nome( FDataSet.DataSet.FieldByName('responsavel_nome').AsString )
        .CPF( FDataSet.DataSet.FieldByName('responsavel_cpf').AsString )
        .Telefone( FDataSet.DataSet.FieldByName('responsavel_fonefixo').AsString )
        .Celular( FDataSet.DataSet.FieldByName('responsavel_fonecelular').AsString )
        .Email( FDataSet.DataSet.FieldByName('responsavel_email').AsString )
      .&End
      .Contador
        .Nome( FDataSet.DataSet.FieldByName('contador_nome').AsString )
        .CPF( FDataSet.DataSet.FieldByName('contador_cpf').AsString )
        .Telefone( FDataSet.DataSet.FieldByName('contador_fonefixo').AsString )
        .Celular( FDataSet.DataSet.FieldByName('contador_fonecelular').AsString )
        .Email( FDataSet.DataSet.FieldByName('contador_email').AsString )
      .&End
    .ValorSubteto( FDataSet.DataSet.FieldByName('subteto_vencto_valor').AsCurrency )
    .TipoSubteto( FDataSet.DataSet.FieldByName('subteto_vencto_tipo').AsString );
end;

function TModelDAOConfiguracaO.This: TConfiguracaO;
begin
  Result := FEntity;
end;

end.
