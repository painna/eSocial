unit eSocial.Controllers.Interfaces;

interface

uses
  eSocial.Models.DAO.Interfaces,
  eSocial.Models.Entities.Competencia;

type
  IControllerCompetencia = interface
    ['{D0B306D9-C0AC-483D-9AE4-EF68784F8711}']
    function DAO : iModelDAOEntity<TCompetencia>;
  end;

implementation

end.
