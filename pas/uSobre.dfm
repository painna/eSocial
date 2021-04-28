inherited frmSobre: TfrmSobre
  Left = 219
  Top = 139
  Caption = 'SOBRE O SISTEMA ...'
  ClientHeight = 560
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitHeight = 589
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 560
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    BorderWidth = 2
    Color = clSilver
    TabOrder = 0
    ExplicitHeight = 550
    object Panel2: TPanel
      Left = 2
      Top = 415
      Width = 676
      Height = 143
      Align = alBottom
      BevelOuter = bvNone
      Color = 11528698
      TabOrder = 0
      ExplicitLeft = 4
      ExplicitTop = 402
      ExplicitWidth = 672
      object Label1: TLabel
        Left = 393
        Top = 8
        Width = 274
        Height = 23
        Alignment = taRightJustify
        Caption = 'Gerson Farias - Programador'
        Font.Charset = ANSI_CHARSET
        Font.Color = 4227200
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object lblCelular1: TLabel
        Left = 564
        Top = 50
        Width = 102
        Height = 16
        Alignment = taRightJustify
        Caption = '(94) 8119-4915'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 6
        Top = 85
        Width = 661
        Height = 28
        Alignment = taCenter
        AutoSize = False
        Caption = 
          'Copyright '#169' 2021 GERASYS TECNOINFO. Todos os direitos reservados' +
          '.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 491
        Top = 34
        Width = 67
        Height = 16
        Caption = 'Telefones:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCelular2: TLabel
        Left = 564
        Top = 68
        Width = 102
        Height = 16
        Alignment = taRightJustify
        Caption = '(94) 9129-1158'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTelFixo: TLabel
        Left = 564
        Top = 34
        Width = 102
        Height = 16
        Alignment = taRightJustify
        Caption = '(91) 3729-5766'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblAguarde: TLabel
        Left = 6
        Top = 113
        Width = 186
        Height = 16
        Caption = 'Gerson Farias - Programador'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnOk: TBitBtn
        Left = 585
        Top = 105
        Width = 82
        Height = 30
        Caption = '&Ok'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Kind = bkOK
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 0
        Visible = False
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 676
      Height = 413
      Align = alClient
      BevelOuter = bvNone
      Color = 14013866
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 4
      ExplicitTop = 4
      ExplicitWidth = 672
      ExplicitHeight = 398
      object Image2: TImage
        Left = 0
        Top = 0
        Width = 676
        Height = 176
        Align = alTop
        Stretch = True
        Transparent = True
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 670
      end
      object Memo1: TMemo
        Left = 0
        Top = 176
        Width = 676
        Height = 78
        TabStop = False
        Align = alTop
        Alignment = taCenter
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 16512
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Memo1')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        ExplicitTop = 170
      end
      object Memo3: TMemo
        Left = 0
        Top = 352
        Width = 676
        Height = 61
        TabStop = False
        Align = alBottom
        Alignment = taCenter
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Memo2')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object Memo2: TMemo
        Left = 0
        Top = 254
        Width = 676
        Height = 98
        TabStop = False
        Align = alClient
        Alignment = taCenter
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 8404992
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Memo2')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        ExplicitLeft = 1
        ExplicitTop = 255
        ExplicitWidth = 670
        ExplicitHeight = 84
      end
    end
  end
end
