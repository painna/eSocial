unit eSocial.Models.Components.Connections.Interfaces;

interface

uses
  Data.DB;

type
  iModelComponentConnection = interface
    ['{E14316CA-4550-4273-BCD0-109F08BCE77B}']
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

end.
