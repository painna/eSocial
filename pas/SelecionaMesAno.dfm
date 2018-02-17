inherited frmSelecionaMesAno: TfrmSelecionaMesAno
  Left = 288
  Top = 149
  Caption = 'SELECIONA M'#202'S/ANO  ...'
  ClientHeight = 225
  ClientWidth = 267
  OnShow = FormShow
  ExplicitWidth = 273
  ExplicitHeight = 254
  PixelsPerInch = 96
  TextHeight = 13
  object gbMes: TcxGroupBox
    Left = 8
    Top = 8
    Caption = ' Selecione o M'#234's:  '
    ParentFont = False
    Style.TextColor = clBlue
    Style.TextStyle = [fsBold]
    TabOrder = 0
    Height = 51
    Width = 249
    object cbMes: TcxComboBox
      Left = 10
      Top = 16
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.Items.Strings = (
        'JANEIRO'
        'FEVEREIRO'
        'MAR'#199'O'
        'ABRIL'
        'MAIO'
        'JUNHO'
        'JULHO'
        'AGOSTO'
        'SETEMBRO'
        'OUTUBRO'
        'NOVEMBRO'
        'DEZEMBRO'
        'DEC. TERC. 1'#170' PARC.'
        'DEC. TERC.  PARC. FINAL'
        'ABONO FUNDEB/OUTRO'
        'ABONO PASEP'
        'SIMULA'#199#195'O')
      Properties.ReadOnly = False
      Properties.OnCloseUp = cbMesPropertiesCloseUp
      Properties.OnPopup = cbMesPropertiesPopup
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -16
      Style.Font.Name = 'Calibri'
      Style.Font.Style = [fsBold]
      Style.StyleController = dmPrincipal.cxEditStyleNormal
      Style.IsFontAssigned = True
      TabOrder = 0
      Text = 'JANEIRO'
      Width = 227
    end
  end
  object gbParcela: TcxGroupBox
    Left = 8
    Top = 122
    Caption = ' Parcela:  '
    ParentFont = False
    Style.TextColor = clBlue
    Style.TextStyle = [fsBold]
    TabOrder = 2
    Visible = False
    Height = 55
    Width = 249
    object cbParcela: TcxComboBox
      Left = 10
      Top = 16
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.Items.Strings = (
        'NORMAL'
        'COMPLEMENTAR'
        'AUX'#205'LIO ALIMENTA'#199#195'O')
      Properties.OnCloseUp = cbMesPropertiesCloseUp
      Properties.OnPopup = cbMesPropertiesPopup
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -16
      Style.Font.Name = 'Calibri'
      Style.Font.Style = [fsBold]
      Style.StyleController = dmPrincipal.cxEditStyleNormal
      Style.IsFontAssigned = True
      TabOrder = 0
      Text = 'NORMAL'
      Visible = False
      OnExit = cbParcelaExit
      Width = 227
    end
  end
  object gbAno: TcxGroupBox
    Left = 8
    Top = 61
    Caption = ' Ano:  '
    ParentFont = False
    Style.TextColor = clBlue
    Style.TextStyle = [fsBold]
    TabOrder = 1
    Height = 59
    Width = 249
    object edAno: TcxSpinEdit
      Left = 74
      Top = 13
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.MaxValue = 2099.000000000000000000
      Properties.MinValue = 1994.000000000000000000
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -23
      Style.Font.Name = 'Calibri'
      Style.Font.Style = [fsBold]
      Style.StyleController = dmPrincipal.cxEditStyleNormal
      Style.IsFontAssigned = True
      TabOrder = 0
      Value = 1994
      Width = 100
    end
  end
  object btnOk_: TBitBtn
    Left = 35
    Top = 184
    Width = 96
    Height = 30
    Caption = '&OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    ModalResult = 1
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 3
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 133
    Top = 184
    Width = 96
    Height = 30
    Caption = '&Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Kind = bkCancel
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 4
  end
end
