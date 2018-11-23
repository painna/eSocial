inherited frmEnvioEventoPeriodico: TfrmEnvioEventoPeriodico
  Caption = 'eSocial - Enviar Eventos Peri'#243'dicos'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlControle: TPanel
    inherited btnCancelar: TBitBtn
      ExplicitLeft = 584
    end
    inherited btnOk: TBitBtn
      OnClick = btnOkClick
      ExplicitLeft = 490
    end
    object pnlProcesso: TPanel
      Left = 0
      Top = 6
      Width = 484
      Height = 30
      Anchors = [akLeft, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      object gagProcesso: TGauge
        Left = 0
        Top = 13
        Width = 484
        Height = 17
        Align = alTop
        ForeColor = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Progress = 75
        ExplicitTop = 24
      end
      object lblProcesso: TLabel
        Left = 0
        Top = 0
        Width = 484
        Height = 13
        Align = alTop
        Caption = 'Andamento do processo...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 146
      end
    end
  end
  object gpbParametro: TGroupBox
    Left = 0
    Top = 0
    Width = 672
    Height = 65
    Align = alTop
    Caption = 'Par'#226'metros de gera'#231#227'o do(s) arquivo(s) XML'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      672
      65)
    object lblAnoMes: TLabel
      Left = 12
      Top = 17
      Width = 52
      Height = 13
      Caption = 'Ano/m'#234's'
      FocusControl = cmbAnoMes
    end
    object gpbOperacao: TRadioGroup
      AlignWithMargins = True
      Left = 358
      Top = 17
      Width = 308
      Height = 40
      Anchors = [akTop, akRight]
      Caption = 'Opera'#231#227'o'
      Columns = 3
      Items.Strings = (
        'Inclus'#227'o'
        'Altera'#231#227'o'
        'Exclus'#227'o')
      TabOrder = 1
    end
    object cmbAnoMes: TComboBox
      Left = 12
      Top = 36
      Width = 101
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
  end
  object gpbEvento: TGroupBox
    Left = 0
    Top = 65
    Width = 672
    Height = 218
    Align = alClient
    Caption = 'Eventos'
    TabOrder = 2
    DesignSize = (
      672
      218)
    object Checb_ZeraBase: TCheckBox
      AlignWithMargins = True
      Left = 490
      Top = 196
      Width = 177
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akRight, akBottom]
      Caption = 'Limpar base p/ novo envio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cbS1200: TCheckBox
      Left = 16
      Top = 24
      Width = 306
      Height = 17
      Caption = 'S-1200 - Remunera'#231#227'o do Trabalhador'
      TabOrder = 1
    end
    object cbS1202: TCheckBox
      Left = 16
      Top = 47
      Width = 306
      Height = 17
      Caption = 'S-1202 - Remunera'#231#227'o de trabalhadores RPPS'
      TabOrder = 2
    end
    object cbS1207: TCheckBox
      Left = 16
      Top = 70
      Width = 306
      Height = 17
      Caption = 'S-1207 - Benef'#237'cios  Previdenci'#225'rios - RPPS'
      TabOrder = 3
    end
    object cbS1210: TCheckBox
      Left = 16
      Top = 93
      Width = 306
      Height = 17
      Caption = 'S-1210 - Pagamentos de Rendimentos do Trabalho'
      TabOrder = 4
    end
    object cbS1250: TCheckBox
      Left = 16
      Top = 118
      Width = 306
      Height = 16
      Caption = 'S-1250 - Aquisi'#231#227'o de Produ'#231#227'o Rural'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 5
    end
    object cbS1260: TCheckBox
      Left = 16
      Top = 139
      Width = 306
      Height = 17
      Caption = 'S-1260 - Comercializa'#231#227'o da Produ'#231#227'o Rural Pessoa F'#237'sica'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 6
    end
    object cbS1300: TCheckBox
      Left = 326
      Top = 140
      Width = 332
      Height = 15
      Caption = 'S-1300 - Contribui'#231#227'o Sindical Patronal'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 7
    end
    object cbS1299: TCheckBox
      Left = 326
      Top = 117
      Width = 332
      Height = 17
      Caption = 'S-1299 - Fechamento dos Eventos Peri'#243'dicos'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 8
    end
    object cbS1298: TCheckBox
      Left = 326
      Top = 94
      Width = 332
      Height = 17
      Caption = 'S-1298 - Reabertura dos Eventos Peri'#243'dicos'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 9
    end
    object cbS1295: TCheckBox
      Left = 326
      Top = 71
      Width = 332
      Height = 17
      Caption = 'S-1295 - Solicita'#231#227'o de Totaliza'#231#227'o para Pgto. em Conting'#234'ncia'
      Enabled = False
      TabOrder = 10
    end
    object cbS1280: TCheckBox
      Left = 326
      Top = 47
      Width = 332
      Height = 18
      Caption = 'S-1280 - Informa'#231#245'es Complementares aos Eventos Peri'#243'dicos'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 11
    end
    object cbS1270: TCheckBox
      Left = 326
      Top = 24
      Width = 332
      Height = 17
      Caption = 'S-1270 - Contrata'#231#227'o de Trabalhadores Avulsos N'#227'o Portu'#225'rios'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 12
    end
  end
end
