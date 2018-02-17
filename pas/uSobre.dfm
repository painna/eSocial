inherited frmSobre: TfrmSobre
  Left = 219
  Top = 139
  Caption = 'SOBRE O SISTEMA ...'
  ClientHeight = 550
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitHeight = 579
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 550
    Align = alClient
    BevelWidth = 2
    BorderWidth = 2
    Color = clSilver
    TabOrder = 0
    object Panel2: TPanel
      Left = 4
      Top = 402
      Width = 672
      Height = 239
      Align = alTop
      Color = 11528698
      TabOrder = 0
      object Label1: TLabel
        Left = 391
        Top = 8
        Width = 276
        Height = 24
        Alignment = taRightJustify
        Caption = 'Gerson Farias - Programador'
        Font.Charset = ANSI_CHARSET
        Font.Color = 4227200
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object lblCelular1: TLabel
        Left = 558
        Top = 50
        Width = 108
        Height = 19
        Alignment = taRightJustify
        Caption = '(94) 8119-4915'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 6
        Top = 88
        Width = 661
        Height = 28
        Alignment = taCenter
        AutoSize = False
        Caption = 'Copyright (c) 1997 a 2014 - Todos os direitos reservados.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 472
        Top = 34
        Width = 80
        Height = 19
        Caption = 'Telefones:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCelular2: TLabel
        Left = 558
        Top = 68
        Width = 108
        Height = 19
        Alignment = taRightJustify
        Caption = '(94) 9129-1158'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTelFixo: TLabel
        Left = 557
        Top = 34
        Width = 109
        Height = 19
        Alignment = taRightJustify
        Caption = '(91) 3729-5766'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblAguarde: TLabel
        Left = 5
        Top = 113
        Width = 231
        Height = 19
        Caption = 'Gerson Farias - Programador'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -17
        Font.Name = 'Arial'
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
      Left = 4
      Top = 4
      Width = 672
      Height = 398
      Align = alTop
      Color = 14013866
      ParentBackground = False
      TabOrder = 1
      object Image2: TImage
        Left = 1
        Top = 1
        Width = 670
        Height = 176
        Align = alTop
        Stretch = True
        Transparent = True
      end
      object Memo1: TMemo
        Left = 1
        Top = 177
        Width = 670
        Height = 78
        Align = alTop
        Alignment = taCenter
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 16512
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Memo1')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        ExplicitTop = 188
      end
      object Memo3: TMemo
        Left = 1
        Top = 339
        Width = 670
        Height = 54
        Align = alTop
        Alignment = taCenter
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8404992
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Memo2')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
      object Memo2: TMemo
        Left = 1
        Top = 255
        Width = 670
        Height = 84
        Align = alTop
        Alignment = taCenter
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8404992
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Memo2')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        ExplicitTop = 266
      end
    end
  end
end
