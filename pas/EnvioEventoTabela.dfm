inherited frmEnvioEventoTabela: TfrmEnvioEventoTabela
  Caption = 'eSocial - Enviar Eventos de Tabela'
  ClientWidth = 716
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 730
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlControle: TPanel
    Width = 716
    TabOrder = 2
    ExplicitWidth = 716
    inherited btnCancelar: TBitBtn
      Left = 628
      ExplicitLeft = 628
    end
    inherited btnOk: TBitBtn
      Left = 534
      OnClick = btnOkClick
      ExplicitLeft = 534
    end
    object pnlProcesso: TPanel
      Left = 0
      Top = 6
      Width = 528
      Height = 30
      Anchors = [akLeft, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      object gagProcesso: TGauge
        Left = 0
        Top = 13
        Width = 528
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
        ExplicitWidth = 484
      end
      object lblProcesso: TLabel
        Left = 0
        Top = 0
        Width = 528
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
    Width = 716
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
      716
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
      Left = 402
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
      OnChange = cmbAnoMesChange
    end
  end
  object gpbEvento: TGroupBox
    Left = 0
    Top = 65
    Width = 716
    Height = 218
    Align = alClient
    Caption = 'Eventos'
    TabOrder = 1
    DesignSize = (
      716
      218)
    object FlowPanel: TFlowPanel
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 706
      Height = 195
      Align = alClient
      BevelOuter = bvNone
      Padding.Left = 3
      Padding.Top = 3
      Padding.Right = 3
      Padding.Bottom = 3
      TabOrder = 0
      object cbS1000: TCheckBox
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 340
        Height = 17
        Caption = 'S1000 - Unidade Gestora Principal (Informa'#231#245'es do Empregador)'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object cbS1005: TCheckBox
        AlignWithMargins = True
        Left = 352
        Top = 6
        Width = 340
        Height = 17
        Caption = 'S1005 - Outras Unidades Gestoras (Unidades de '#211'rg'#227'os P'#250'blicos)'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        OnClick = cbS1005Click
      end
      object cbS1010: TCheckBox
        AlignWithMargins = True
        Left = 6
        Top = 29
        Width = 340
        Height = 17
        Caption = 'S1010 - Eventos (Tabela de Rubricas)'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
      end
      object cbS1020: TCheckBox
        AlignWithMargins = True
        Left = 352
        Top = 29
        Width = 340
        Height = 17
        Caption = 'S1020 - Configura'#231#245'es do '#211'rg'#227'o (Lota'#231#245'es Tribut'#225'rias)'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object cbS1030: TCheckBox
        AlignWithMargins = True
        Left = 6
        Top = 52
        Width = 340
        Height = 17
        Caption = 'S-1030 Tabela de Cargos'
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 4
        Visible = False
      end
      object cbS1035: TCheckBox
        AlignWithMargins = True
        Left = 352
        Top = 52
        Width = 340
        Height = 17
        Caption = 'S-1035 Tabela de Carreiras P'#250'blicas'
        Enabled = False
        TabOrder = 5
        Visible = False
      end
      object cbS1040: TCheckBox
        AlignWithMargins = True
        Left = 6
        Top = 75
        Width = 340
        Height = 17
        Caption = 'S-1040 Tabela de Fun'#231#245'es'
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 6
        Visible = False
        OnClick = cbS1040Click
      end
      object cbS1050: TCheckBox
        AlignWithMargins = True
        Left = 352
        Top = 75
        Width = 340
        Height = 17
        Caption = 'S-1050 Tabela de Hor'#225'rios/Turnos de Trabalho'
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 7
        Visible = False
      end
      object cbS1060: TCheckBox
        AlignWithMargins = True
        Left = 6
        Top = 98
        Width = 340
        Height = 17
        Caption = 'S-1060 Tabela de Ambientes de Trabalho'
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 8
        Visible = False
      end
      object cbS1070: TCheckBox
        AlignWithMargins = True
        Left = 352
        Top = 98
        Width = 340
        Height = 17
        Caption = 'S-1070 Tabela de Processos'
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 9
        Visible = False
      end
      object cbS1080: TCheckBox
        AlignWithMargins = True
        Left = 6
        Top = 121
        Width = 340
        Height = 17
        Caption = 'S-1080 Tabela de Operadores Portu'#225'rios'
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 10
        Visible = False
      end
    end
    object Checb_ZeraBase: TCheckBox
      AlignWithMargins = True
      Left = 534
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
      TabOrder = 1
    end
  end
end
