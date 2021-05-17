unit eSocial.Models.Entities.Competencia;

interface

uses
  eSocial.Models.DAO.Interfaces,
  eSocial.Models.ComplexTypes;

type
  TCompetencia = class
    private
      [weak]
      FParent : iModelDAOEntity<TCompetencia>;
      FAno    : String;
      FCodigo : String;
      FDescricao : String;
      FEncerrado : Boolean;
      FMes    : String;
      FOrigem : TOrigemDados;
    public
      constructor Create(aParent : iModelDAOEntity<TCompetencia>);
      destructor Destroy; override;

      function Ano(Value : String) : TCompetencia; overload;
      function Ano : String; overload;
      function Codigo(Value : String) : TCompetencia; overload;
      function Codigo : String; overload;
      function Descricao(Value : String) : TCompetencia; overload;
      function Descricao : String; overload;
      function Encerrado(Value : String) : TCompetencia; overload;
      function Encerrado : Boolean; overload;
      function Mes(Value : String) : TCompetencia; overload;
      function Mes : String; overload;
      function Origem(Value : TOrigemDados) : TCompetencia; overload;
      function Origem : TOrigemDados; overload;

      function &End : iModelDAOEntity<TCompetencia>;
  end;

implementation

uses
  System.SysUtils;

{ TCompetencia }

constructor TCompetencia.Create(aParent: iModelDAOEntity<TCompetencia>);
begin
  FParent := aParent;
end;

destructor TCompetencia.Destroy;
begin
  inherited;
end;

function TCompetencia.Ano(Value: String): TCompetencia;
begin
  Result := Self;
  FAno   := Value.Trim;
end;

function TCompetencia.Ano: String;
begin
  Result := FAno;
end;

function TCompetencia.Codigo(Value: String): TCompetencia;
begin
  Result  := Self;
  FCodigo := Value.Trim;
end;

function TCompetencia.Codigo: String;
begin
  Result := FCodigo;
end;

function TCompetencia.Descricao: String;
begin
  Result := FDescricao;
end;

function TCompetencia.Descricao(Value: String): TCompetencia;
begin
  Result     := Self;
  FDescricao := Value.Trim;
end;

function TCompetencia.Encerrado(Value: String): TCompetencia;
begin
  Result     := Self;
  FEncerrado := (Value.Trim.ToUpper = 'S');
end;

function TCompetencia.Encerrado: Boolean;
begin
  Result := FEncerrado;
end;

function TCompetencia.Mes: String;
begin
  Result := FMes;
end;

function TCompetencia.Mes(Value: String): TCompetencia;
begin
  Result := Self;
  FMes   := Value.Trim
end;

function TCompetencia.Origem(Value: TOrigemDados): TCompetencia;
begin
  Result  := Self;
  FOrigem := Value;
end;

function TCompetencia.Origem: TOrigemDados;
begin
  Result := FOrigem;
end;

function TCompetencia.&End: iModelDAOEntity<TCompetencia>;
begin
  Result := FParent;
end;

end.
