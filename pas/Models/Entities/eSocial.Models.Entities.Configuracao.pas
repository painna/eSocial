unit eSocial.Models.Entities.Configuracao;

interface

uses
  eSocial.Models.Entities.Interfaces,
  eSocial.Models.Entities.Responsavel,
  eSocial.Models.DAO.Interfaces;

type
  TConfiguracao = class
    private
      [weak]
      FParent : iModelDAOEntity<TConfiguracao>;
      FCodigoSIAFI : String;
      FUnidadeGestoraPrincipal : Integer;
      FNaturezaJuridica : String;
      FDataImplantacaoESocial : TDateTime;
      FResponsavel : IResponsavel<TConfiguracao>;
      FContador : IResponsavel<TConfiguracao>;
      FValorSubteto : Currency;
      FTipoSubteto  : String;
    public
      constructor Create(aPArent : iModelDAOEntity<TConfiguracao>);
      destructor Destroy; override;

      function CodigoSIAFI(Value : String) : TConfiguracao; overload;
      function CodigoSIAFI : String; overload;
      function UnidadeGestoraPrincipal(Value : Integer) : TConfiguracao; overload;
      function UnidadeGestoraPrincipal : Integer; overload;
      function NaturezaJuridica(Value : String) : TConfiguracao; overload;
      function NaturezaJuridica : String; overload;
      function DataImplantacaoESocial(Value : TDateTime) : TConfiguracao; overload;
      function DataImplantacaoESocial : TDateTime; overload;
      function Responsavel(Value : IResponsavel<TConfiguracao>) : TConfiguracao; overload;
      function Responsavel : IResponsavel<TConfiguracao>; overload;
      function Contador(Value : IResponsavel<TConfiguracao>) : TConfiguracao; overload;
      function Contador : IResponsavel<TConfiguracao>; overload;
      function ValorSubteto(Value : Currency) : TConfiguracao; overload;
      function ValorSubteto : Currency; overload;
      function TipoSubteto(Value : String) : TConfiguracao; overload;
      function TipoSubteto : String; overload;

      function &End : iModelDAOEntity<TConfiguracao>;
  end;

implementation

uses
  System.SysUtils,
  System.DateUtils;

{ TConfiguracao }

constructor TConfiguracao.Create(aPArent : iModelDAOEntity<TConfiguracao>);
begin
  FParent      := aPArent;
  FCodigoSIAFI := EmptyStr;
  FUnidadeGestoraPrincipal := 0;
  FNaturezaJuridica        := EmptyStr;
  FDataImplantacaoESocial  := EncodeDate(1899, 12, 30);
  FResponsavel  := TResponsavel<TConfiguracao>.Create(Self);
  FContador     := TResponsavel<TConfiguracao>.Create(Self);
  FValorSubteto := 0.0;
  FTipoSubteto  := EmptyStr;
end;

function TConfiguracao.&End: iModelDAOEntity<TConfiguracao>;
begin
  Result := FParent;
end;

function TConfiguracao.CodigoSIAFI: String;
begin
  Result := FCodigoSIAFI;
end;

function TConfiguracao.CodigoSIAFI(Value: String): TConfiguracao;
begin
  Result := Self;
  FCodigoSIAFI := Value.Trim;
end;

function TConfiguracao.Contador(Value: IResponsavel<TConfiguracao>): TConfiguracao;
begin
  Result := Self;
  FContador := Value;
end;

function TConfiguracao.Contador: IResponsavel<TConfiguracao>;
begin
  Result := FContador;
end;

function TConfiguracao.DataImplantacaoESocial(Value: TDateTime): TConfiguracao;
begin
  Result := Self;
  FDataImplantacaoESocial := Value;
end;

function TConfiguracao.DataImplantacaoESocial: TDateTime;
begin
  Result := FDataImplantacaoESocial;
end;

destructor TConfiguracao.Destroy;
begin
  inherited;
end;

function TConfiguracao.NaturezaJuridica: String;
begin
  Result := FNaturezaJuridica;
end;

function TConfiguracao.NaturezaJuridica(Value: String): TConfiguracao;
begin
  Result := Self;
  FNaturezaJuridica := Value.Trim;
end;

function TConfiguracao.Responsavel: IResponsavel<TConfiguracao>;
begin
  Result := FResponsavel;
end;

function TConfiguracao.TipoSubteto: String;
begin
  Result := FTipoSubteto;
end;

function TConfiguracao.TipoSubteto(Value: String): TConfiguracao;
begin
  Result := Self;
  FTipoSubteto := Value.Trim;
end;

function TConfiguracao.Responsavel(Value: IResponsavel<TConfiguracao>): TConfiguracao;
begin
  Result := Self;
  FResponsavel := Value;
end;

function TConfiguracao.UnidadeGestoraPrincipal(Value: Integer): TConfiguracao;
begin
  Result := Self;
  FUnidadeGestoraPrincipal := Value;
end;

function TConfiguracao.UnidadeGestoraPrincipal: Integer;
begin
  Result := FUnidadeGestoraPrincipal;
end;

function TConfiguracao.ValorSubteto: Currency;
begin
  Result := FValorSubteto;
end;

function TConfiguracao.ValorSubteto(Value: Currency): TConfiguracao;
begin
  Result := Self;
  FValorSubteto := Value;
end;

end.
