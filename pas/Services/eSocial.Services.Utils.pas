unit eSocial.Services.Utils;

interface

uses
  System.Classes,
  System.Types,
  Vcl.ExtCtrls;

type
  TServiceUtils = class
    class function ImageResource(aResourceName : String; aImage : TImage) : string;
  end;

implementation

{ TServiceUtils }

class function TServiceUtils.ImageResource(aResourceName: String; aImage: TImage): string;
var
  aResource : TResourceStream;
begin
  try
    aResource := TResourceStream.Create(HInstance, aResourceName, RT_RCDATA);
    aImage.Picture.LoadFromStream(aResource);
  finally
    aResource.DisposeOf;
  end;
end;

end.
