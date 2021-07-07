unit eSocial.Models.Entities.Operacao;

interface

uses
  eSocial.Models.DAO.Interfaces;

type
  TOperacao = class
    private
      [weak]
      FParent : iModelDAOEntity<TOperacao>;
      FCompetencia : String;
      FInsercao ,
      FAlteracao,
      FExclusao : Boolean;
    public
      constructor Create(aParent : iModelDAOEntity<TOperacao>);
      destructor Destroy; override;

      function Competencia(Value : String) : TOperacao; overload;
      function Competencia : String; overload;
      function Insercao(Value : Boolean) : TOperacao; overload;
      function Insercao : Boolean; overload;
      function Alteracao(Value : Boolean) : TOperacao; overload;
      function Alteracao : Boolean; overload;
      function Exclusao(Value : Boolean) : TOperacao; overload;
      function Exclusao : Boolean; overload;
      function Processar : Boolean; overload;

      function &End : iModelDAOEntity<TOperacao>;
  end;

implementation

uses
  System.SysUtils;

{ TOperacao }

constructor TOperacao.Create(aParent: iModelDAOEntity<TOperacao>);
begin
  FParent      := aParent;
  FCompetencia := FormatDaTeTime('yyyymm', Date);
  FInsercao    := False;
  FAlteracao   := False;
  FExclusao    := False;
end;

destructor TOperacao.Destroy;
begin
  inherited;
end;

function TOperacao.Alteracao(Value: Boolean): TOperacao;
begin
  Result := Self;
  FAlteracao := Value;
end;

function TOperacao.Alteracao: Boolean;
begin
  Result := FAlteracao;
end;

function TOperacao.Competencia: String;
begin
  Result := FCompetencia;
end;

function TOperacao.Competencia(Value: String): TOperacao;
begin
  Result := Self;
  FCompetencia := Copy(Value.Trim, 1, 6);
end;

function TOperacao.Exclusao: Boolean;
begin
  Result := FExclusao;
end;

function TOperacao.Exclusao(Value: Boolean): TOperacao;
begin
  Result := Self;
  FExclusao := Value;
end;

function TOperacao.Insercao(Value: Boolean): TOperacao;
begin
  Result := Self;
  FInsercao := Value;
end;

function TOperacao.Insercao: Boolean;
begin
  Result := FInsercao;
end;

function TOperacao.Processar: Boolean;
begin
  Result := FInsercao or FAlteracao or FExclusao;
end;

function TOperacao.&End: iModelDAOEntity<TOperacao>;
begin
  Result := FParent;
end;

end.
