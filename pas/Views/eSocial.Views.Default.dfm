object ViewDefault: TViewDefault
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'ViewDefault'
  ClientHeight = 497
  ClientWidth = 779
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelView: TPanel
    Left = 0
    Top = 0
    Width = 779
    Height = 497
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelHeader: TPanel
      Left = 0
      Top = 0
      Width = 779
      Height = 120
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object PanelTitle: TPanel
        Left = 0
        Top = 0
        Width = 441
        Height = 120
        Align = alLeft
        BevelOuter = bvNone
        Padding.Left = 30
        Padding.Right = 30
        TabOrder = 0
        object lblTitle: TLabel
          Left = 30
          Top = 0
          Width = 381
          Height = 64
          Align = alClient
          AutoSize = False
          Caption = 'Formul'#225'rio Padr'#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Layout = tlBottom
          StyleElements = []
          ExplicitLeft = 0
          ExplicitWidth = 561
          ExplicitHeight = 60
        end
        object lblSubtitle: TLabel
          Left = 30
          Top = 64
          Width = 381
          Height = 56
          Align = alBottom
          AutoSize = False
          Caption = 'Descri'#231#227'o do formul'#225'rio padr'#227'o....'
          WordWrap = True
          StyleElements = []
          ExplicitTop = 60
        end
      end
    end
    object PanelContent: TPanel
      Left = 0
      Top = 120
      Width = 779
      Height = 377
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      Padding.Left = 20
      Padding.Top = 20
      Padding.Right = 20
      Padding.Bottom = 20
      ParentBackground = False
      TabOrder = 1
      object PanelBody: TPanel
        Left = 20
        Top = 20
        Width = 739
        Height = 337
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
      end
    end
  end
end
