inherited frmEnvioEventoTabela: TfrmEnvioEventoTabela
  Caption = 'eSocil - Enviar Eventos de Tabela'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlControle: TPanel
    TabOrder = 2
    ExplicitLeft = 0
    ExplicitTop = 283
    ExplicitWidth = 672
    inherited btnCancelar: TBitBtn
      ExplicitLeft = 584
    end
    inherited btnOk: TBitBtn
      ExplicitLeft = 490
    end
    object Checb_ZeraBase: TCheckBox
      Left = 12
      Top = 6
      Width = 138
      Height = 17
      Caption = 'Zera Base Homologa'#231#227'o'
      Enabled = False
      TabOrder = 2
    end
  end
  object gpbParametro: TGroupBox
    Left = 0
    Top = 0
    Width = 672
    Height = 105
    Align = alTop
    Caption = 'Par'#226'metros de gera'#231#227'o do(s) arquivo(s) XML'
    TabOrder = 0
    ExplicitTop = -6
    object gpbOperacao: TRadioGroup
      AlignWithMargins = True
      Left = 85
      Top = 34
      Width = 308
      Height = 47
      Caption = 'Opera'#231#227'o'
      Columns = 3
      Items.Strings = (
        'Inclus'#227'o'
        'Altera'#231#227'o'
        'Exclus'#227'o')
      TabOrder = 0
    end
  end
  object gpbEvento: TGroupBox
    Left = 0
    Top = 105
    Width = 672
    Height = 178
    Align = alClient
    Caption = 'Eventos'
    TabOrder = 1
    ExplicitLeft = 8
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
      Caption = 'S-1005 Tabela de Estabelecimentos e Obras de Constru'#231#227'o Civil'
      Ctl3D = False
      Enabled = False
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
      Enabled = False
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
