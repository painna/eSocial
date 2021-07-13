unit eSocial.Views.Default;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Router4D,
  Router4D.Props,
  Router4D.Interfaces,
  Bind4D,
  Bind4D.Interfaces,
  Bind4D.Attributes,
  Bind4D.Types,
  eSocial.Classes.Events;

type
  TViewDefault = class(TForm, iRouter4DComponent)
    PanelView: TPanel;
    PanelHeader: TPanel;
    PanelContent: TPanel;
    PanelTitle: TPanel;
    lblTitle: TLabel;
    lblSubtitle: TLabel;
    PanelBody: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FTitle : String;
    procedure ApplyStyleDefault;
  public
    { Public declarations }
    procedure UnRender; virtual;
    procedure BackToHome;
    procedure CloseMenu;

    function Render : TForm;
  end;

var
  ViewDefault: TViewDefault;

implementation

uses
  eSocial.Views.Styles,
  eSocial.Views.Styles.Colors;

{$R *.dfm}

{ TViewDefault }

procedure TViewDefault.ApplyStyleDefault;
begin
  Self.Color := BACKGROUD_COLOR_WHITE;
  PanelHeader.Color  := BACKGROUD_COLOR_SECONDARY;
  PanelContent.Color := BACKGROUD_COLOR_WHITE;
  PanelBody.Color    := BACKGROUD_COLOR_WHITE;

  // Fonte geral do Form
  with Self do
  begin
    Font.Name  := FONT_NAME;
    Font.Size  := FONT_SIZE_NORMAL;
    Font.Color := BACKGROUD_COLOR_DARK;
  end;

  // Fonte do título/subtítulo

  with lblTitle do
  begin
    Font.Name  := FONT_NAME;
    Font.Size  := FONT_SIZE_H1;
    Font.Color := FONT_COLOR_WHITE;
  end;

  with lblSubtitle do
  begin
    Font.Name  := FONT_NAME;
    Font.Size  := FONT_SIZE_H5;
    Font.Color := FONT_COLOR_WHITE;
  end;
end;

procedure TViewDefault.BackToHome;
begin
  ; //TRouter4D.Link.&To('ViewHome');
end;

procedure TViewDefault.CloseMenu;
var
  aEvent : TEventsSplitViewChangeEvent;
begin
  aEvent := TEventsSplitViewChangeEvent.Create;
  aEvent.Opened := False;
  GlobalEventBus.Post(aEvent);
end;

procedure TViewDefault.FormCreate(Sender: TObject);
begin
  TBind4D
    .New
    .Form(Self)
    .BindFormDefault(FTitle)
    .SetStyleComponents;

  Self.Caption     := FTitle;
  lblTitle.Caption := FTitle;

  ApplyStyleDefault;
end;

function TViewDefault.Render: TForm;
begin
  Result := Self;
  Self.CloseMenu;
end;

procedure TViewDefault.UnRender;
begin
  ;
end;

end.
