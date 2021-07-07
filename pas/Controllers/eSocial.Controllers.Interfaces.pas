unit eSocial.Controllers.Interfaces;

interface

uses
  eSocial.Models.DAO.Interfaces,
  eSocial.Models.Entities.Competencia,
  eSocial.Models.Entities.Operacao;

type
  IControllerCompetencia = interface
    ['{D0B306D9-C0AC-483D-9AE4-EF68784F8711}']
    function DAO : iModelDAOEntity<TCompetencia>;
  end;

  IControllerOperacao = interface
    ['{1D8FFED2-A3F5-456D-A0CC-CFD09D8A5363}']
    function DAO : iModelDAOEntity<TOperacao>;
  end;

implementation

end.
