unit eSocial.Classes.Events;

interface

type
  TEventsSplitViewChangeEvent = class
  private
    FOpened: Boolean;
    procedure SetOpened(const Value: Boolean);
  public
    property Opened : Boolean read FOpened write SetOpened;
  end;

implementation

{ TEventsSplitViewChangeEvent }

procedure TEventsSplitViewChangeEvent.SetOpened(const Value: Boolean);
begin
  FOpened := Value;
end;

end.
