unit eSocial.Models.Entities.Interfaces;

interface

type
  IResponsavel<T> = interface
    ['{DABE198A-8880-4230-8ACD-C488C55C1376}']
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

end.
