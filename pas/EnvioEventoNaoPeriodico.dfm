inherited frmEnvioEventoNaoPeriodico: TfrmEnvioEventoNaoPeriodico
  Caption = 'eSocial - Enviar Eventos N'#227'o Peri'#243'dicos'
  ClientHeight = 406
  OnCreate = FormCreate
  ExplicitHeight = 443
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlControle: TPanel
    Top = 361
    TabOrder = 2
    ExplicitTop = 361
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
    TabOrder = 0
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
      OnClick = gpbOperacaoClick
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
    Height = 296
    Align = alClient
    Caption = 'Eventos'
    TabOrder = 1
    DesignSize = (
      672
      296)
    object Checb_ZeraBase: TCheckBox
      AlignWithMargins = True
      Left = 490
      Top = 274
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
    object cbS2190: TCheckBox
      Left = 16
      Top = 24
      Width = 299
      Height = 17
      Caption = 'S-2190 - Admiss'#227'o de Trabalhador - Registro Preliminar'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object cbS2200: TCheckBox
      Left = 16
      Top = 47
      Width = 169
      Height = 17
      Caption = 'S-2200 -  Evento Admiss'#227'o'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object cbS2205: TCheckBox
      Left = 16
      Top = 70
      Width = 299
      Height = 17
      Caption = 'S-2205 - Altera'#231#227'o de Dados Cadastrais do Trabalhador'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 3
    end
    object cbS2206: TCheckBox
      Left = 16
      Top = 93
      Width = 233
      Height = 17
      Caption = 'S-2206 - Altera'#231#227'o do Contrato de Trabalho'
      Enabled = False
      TabOrder = 4
    end
    object cbS2210: TCheckBox
      Left = 16
      Top = 116
      Width = 243
      Height = 17
      Caption = 'S-2210 - Comunica'#231#227'o de Acidente de Trabalho'
      Color = 14938356
      Ctl3D = False
      DoubleBuffered = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentCtl3D = False
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 5
    end
    object cbS2220: TCheckBox
      Left = 16
      Top = 139
      Width = 270
      Height = 17
      Caption = 'S-2220 -  Monitoramento da Sa'#250'de do Trabalhador'
      Color = 14938356
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
    end
    object cbS2240: TCheckBox
      Left = 16
      Top = 162
      Width = 321
      Height = 17
      Caption = 'S-2240 -  Condi'#231#245'es Ambientais do Trabalho - Fatores de Risco'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 7
    end
    object cbS2230: TCheckBox
      Left = 16
      Top = 185
      Width = 191
      Height = 17
      Caption = 'S-2230 - Afastamento Tempor'#225'rio'
      Enabled = False
      TabOrder = 8
    end
    object cbS2241: TCheckBox
      Left = 16
      Top = 208
      Width = 321
      Height = 17
      Caption = 'S-2241 - Insalubridade, Periculosidade e Aposentadoria Especial'
      Enabled = False
      TabOrder = 9
    end
    object cbS2250: TCheckBox
      Left = 16
      Top = 231
      Width = 145
      Height = 17
      Caption = 'S-2250 - Aviso Pr'#233'vio'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 10
    end
    object cbAviso: TComboBox
      Left = 16
      Top = 254
      Width = 145
      Height = 21
      Style = csDropDownList
      Enabled = False
      ItemIndex = 0
      TabOrder = 11
      Text = 'Aviso'
      Items.Strings = (
        'Aviso'
        'Cancelamento')
    end
    object cbs2260: TCheckBox
      Left = 358
      Top = 24
      Width = 300
      Height = 17
      Caption = 'S-2260 - Convoca'#231#227'o para Trabalho Intermitente'
      Enabled = False
      TabOrder = 12
    end
    object cbS2298: TCheckBox
      Left = 358
      Top = 47
      Width = 300
      Height = 17
      Caption = 'S-2298 - Reintegra'#231#227'o'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 13
    end
    object cbS2299: TCheckBox
      Left = 358
      Top = 70
      Width = 300
      Height = 17
      Caption = 'S-2299 - Desligamento'
      Enabled = False
      TabOrder = 14
    end
    object cbS2300: TCheckBox
      Left = 358
      Top = 93
      Width = 300
      Height = 17
      Caption = 'S-2300 - Trabalhador Sem V'#237'nculo - In'#237'cio'
      Enabled = False
      TabOrder = 15
    end
    object cbS2306: TCheckBox
      Left = 358
      Top = 116
      Width = 300
      Height = 17
      Caption = 'S-2306 - Trabalhador Sem V'#237'nculo - Altera'#231#227'o Contratual'
      Enabled = False
      TabOrder = 16
    end
    object cbS2399: TCheckBox
      Left = 358
      Top = 139
      Width = 300
      Height = 17
      Caption = 'S-2399 - Trabalhador Sem V'#237'nculo - T'#233'rmino'
      Enabled = False
      TabOrder = 17
    end
    object cbS2400: TCheckBox
      Left = 358
      Top = 162
      Width = 300
      Height = 17
      Caption = 'S-2400 - Cadastro de Benef'#237'cios Previd'#234'nci'#225'rios - RPPS'
      Enabled = False
      TabOrder = 18
    end
    object cbS3000: TCheckBox
      Left = 358
      Top = 185
      Width = 300
      Height = 17
      Caption = 'S-3000 - Exclus'#227'o de Eventos'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 19
    end
  end
end
