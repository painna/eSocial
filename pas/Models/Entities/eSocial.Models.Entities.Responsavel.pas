unit eSocial.Models.Entities.Responsavel;

interface

uses
  System.SysUtils,
  eSocial.Models.Entities.Interfaces;

type
  TResponsavel<T> = class(TInterfacedObject, IResponsavel<T>)
    private
      FParent  : T;
      FNome    ,
      FCPF     ,
      FTelefone,
      FCelular ,
      FEmail   : String;
    public
      constructor Create(aParent : T);
      destructor Destroy; override;
      class function New(aParent : T) : IResponsavel<T>;

      function Nome(Value : String) : IResponsavel<T>; overload;
      function Nome : String; overload;
      function CPF(Value : String) : IResponsavel<T>; overload;
      function CPF : String; overload;
      function Telefone(Value : String) : IResponsavel<T>; overload;
      function Telefone : String; overload;
      function Celular(Value : String) : IResponsavel<T>; overload;
      function Celular : String; overload;
      function Email(Value : String) : IResponsavel<T>; overload;
      function Email : String; overload;
      function DadosCompletos : Boolean;

      function &End : T;
  end;

implementation

{ TResponsavel<T> }

constructor TResponsavel<T>.Create(aParent: T);
begin
  FParent   := aParent;
  FNome     := EmptyStr;
  FCPF      := EmptyStr;
  FTelefone := EmptyStr;
  FCelular  := EmptyStr;
  FEmail    := EmptyStr;
end;

function TResponsavel<T>.DadosCompletos: Boolean;
begin
  Result :=
         (not FNome.IsEmpty)
     and (not FCPF.IsEmpty)
     and (not FCelular.IsEmpty)
     and (not FEmail.IsEmpty);
end;

destructor TResponsavel<T>.Destroy;
begin
  inherited;
end;

class function TResponsavel<T>.New(aParent: T): IResponsavel<T>;
begin
  Result := Self.Create(aParent);
end;

function TResponsavel<T>.Celular(Value: String): IResponsavel<T>;
begin
  Result   := Self;
  FCelular := Value.Trim;
end;

function TResponsavel<T>.Celular: String;
begin
  Result := FCelular;
end;

function TResponsavel<T>.CPF(Value: String): IResponsavel<T>;
begin
  Result := Self;
  FCPF   := Value.Trim;
end;

function TResponsavel<T>.CPF: String;
begin
  Result := FCPF;
end;

function TResponsavel<T>.Email: String;
begin
  Result := FEmail;
end;

function TResponsavel<T>.Email(Value: String): IResponsavel<T>;
begin
  Result := Self;
  FEmail := Value.Trim.ToLower;
end;

function TResponsavel<T>.Nome: String;
begin
  Result := FNome;
end;

function TResponsavel<T>.Nome(Value: String): IResponsavel<T>;
begin
  Result := Self;
  FNome  := Value.Trim;
end;

function TResponsavel<T>.Telefone(Value: String): IResponsavel<T>;
begin
  Result    := Self;
  FTelefone := Value.Trim;
end;

function TResponsavel<T>.Telefone: String;
begin
  Result := FTelefone;
end;

function TResponsavel<T>.&End: T;
begin
  Result := FParent;
end;

end.
