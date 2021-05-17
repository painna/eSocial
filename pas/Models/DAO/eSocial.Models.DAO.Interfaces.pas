unit eSocial.Models.DAO.Interfaces;

interface

uses
  Data.DB;

type
  iModelDAOEntity<T> = interface
    ['{0F94E84A-3A6E-4B21-9E2D-A4788AB30051}']
    function DataSet(aValue : TDataSource) : iModelDAOEntity<T>;
    function Delete : iModelDAOEntity<T>;
    function Get    : iModelDAOEntity<T>; overload;
    function Get(aID : String)    : iModelDAOEntity<T>; overload;
    function Insert : iModelDAOEntity<T>;
    function This   : T;
    function Update : iModelDAOEntity<T>;
  end;

implementation

end.
