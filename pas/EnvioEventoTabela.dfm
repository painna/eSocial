inherited frmEnvioEventoTabela: TfrmEnvioEventoTabela
  Caption = 'eSocial - Enviar Eventos de Tabela'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlControle: TPanel
    TabOrder = 2
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
      TabOrder = 2
    end
    object cmbAnoMes: TComboBox
      Left = 12
      Top = 36
      Width = 101
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
    object Checb_ZeraBase: TCheckBox
      Left = 119
      Top = 38
      Width = 222
      Height = 17
      Caption = 'Limpar base p/ novo envio'
      TabOrder = 1
    end
  end
  object gpbEvento: TGroupBox
    Left = 0
    Top = 65
    Width = 672
    Height = 218
    Align = alClient
    Caption = 'Eventos'
    TabOrder = 1
    object cbS1000: TCheckBox
      Left = 12
      Top = 20
      Width = 196
      Height = 17
      Caption = 'S-1000 Informa'#231#245'es do Empregador'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object cbS1005: TCheckBox
      Left = 12
      Top = 41
      Width = 329
      Height = 17
      Caption = 'S-1005 Tabela de Estab., Obras ou Unidades de '#211'rg'#227'os P'#250'blicos'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object cbS1010: TCheckBox
      Left = 12
      Top = 62
      Width = 156
      Height = 17
      Caption = 'S-1010 Tabela de Rubricas'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object cbS1020: TCheckBox
      Left = 12
      Top = 82
      Width = 236
      Height = 17
      Caption = 'S-1020 Tabela de Lota'#231#245'es/Departamentos'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 3
    end
    object cbS1030: TCheckBox
      Left = 12
      Top = 105
      Width = 144
      Height = 17
      Caption = 'S-1030 Tabela de Cargos'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 4
    end
    object cbS1035: TCheckBox
      Left = 12
      Top = 126
      Width = 249
      Height = 17
      Caption = 'S-1035 Tabela de Carreiras P'#250'blicas'
      Enabled = False
      TabOrder = 5
    end
    object cbS1040: TCheckBox
      Left = 358
      Top = 20
      Width = 156
      Height = 17
      Caption = 'S-1040 Tabela de Fun'#231#245'es'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 6
    end
    object cbS1050: TCheckBox
      Left = 358
      Top = 41
      Width = 248
      Height = 17
      Caption = 'S-1050 Tabela de Hor'#225'rios/Turnos de Trabalho'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 7
    end
    object cbS1060: TCheckBox
      Left = 358
      Top = 62
      Width = 228
      Height = 17
      Caption = 'S-1060 Tabela de Ambientes de Trabalho'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 8
    end
    object cbS1070: TCheckBox
      Left = 358
      Top = 83
      Width = 168
      Height = 17
      Caption = 'S-1070 Tabela de Processos'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 9
    end
    object cbS1080: TCheckBox
      Left = 358
      Top = 105
      Width = 224
      Height = 17
      Caption = 'S-1080 Tabela de Operadores Portu'#225'rios'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 10
    end
  end
end
