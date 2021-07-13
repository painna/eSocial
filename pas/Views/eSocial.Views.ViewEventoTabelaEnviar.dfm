inherited ViewEventoTabelaEnviar: TViewEventoTabelaEnviar
  Align = alNone
  Caption = 'ViewEventoTabelaEnviar'
  ClientWidth = 780
  Position = poOwnerFormCenter
  OnShow = FormShow
  ExplicitWidth = 780
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelView: TPanel
    Width = 780
    ExplicitWidth = 780
    inherited PanelHeader: TPanel
      Width = 780
      ExplicitWidth = 780
      inherited PanelTitle: TPanel
        inherited lblSubtitle: TLabel
          Caption = 
            'Envio das tabelas de eventos para o Sistema Simplificado de Escr' +
            'itura'#231#227'o Digital das Obriga'#231#245'es Previdenci'#225'rias.'
        end
      end
    end
    inherited PanelContent: TPanel
      Width = 780
      ExplicitWidth = 780
      inherited PanelBody: TPanel
        Width = 740
        Height = 296
        Padding.Bottom = 10
        ExplicitWidth = 740
        ExplicitHeight = 296
        object FlowPanelBody: TFlowPanel
          Left = 0
          Top = 0
          Width = 740
          Height = 286
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitTop = 4
          DesignSize = (
            740
            286)
          object PanelLegendas: TPanel
            Left = 0
            Top = 0
            Width = 740
            Height = 40
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object imgInform: TImage
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 34
              Height = 34
              Align = alLeft
              Center = True
            end
            object lblInformSemPedencia: TLabel
              Left = 40
              Top = 0
              Width = 137
              Height = 40
              Align = alLeft
              AutoSize = False
              Caption = 'Sem pend'#234'ncias para envio ao WebService do e-Social'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
              StyleElements = []
            end
            object imgAlert: TImage
              AlignWithMargins = True
              Left = 190
              Top = 3
              Width = 34
              Height = 34
              Align = alLeft
              Center = True
              ExplicitLeft = 336
              ExplicitTop = 0
            end
            object lblInformPendencia: TLabel
              Left = 227
              Top = 0
              Width = 137
              Height = 40
              Align = alLeft
              AutoSize = False
              Caption = 'Enviar dados ao WebService do e-Social'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
              StyleElements = []
              ExplicitLeft = 217
            end
            object imgError: TImage
              AlignWithMargins = True
              Left = 377
              Top = 3
              Width = 34
              Height = 34
              Align = alLeft
              Center = True
              ExplicitLeft = 476
              ExplicitTop = -5
            end
            object lblInformErroEnvio: TLabel
              Left = 414
              Top = 0
              Width = 137
              Height = 40
              Align = alLeft
              AutoSize = False
              Caption = 'Erro no envio dos dados ao WebService do e-Social'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
              StyleElements = []
              ExplicitLeft = 617
            end
            object imgSuccess: TImage
              AlignWithMargins = True
              Left = 564
              Top = 3
              Width = 34
              Height = 34
              Align = alLeft
              Center = True
              ExplicitLeft = 637
              ExplicitTop = 11
            end
            object lblInformSucessoEnvio: TLabel
              Left = 601
              Top = 0
              Width = 137
              Height = 40
              Align = alLeft
              AutoSize = False
              Caption = 'Dados enviados com sucesso ao WebServce'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
              StyleElements = []
              ExplicitLeft = 711
            end
            object Bevel1: TBevel
              Left = 364
              Top = 0
              Width = 10
              Height = 40
              Align = alLeft
              Shape = bsSpacer
              ExplicitLeft = 351
              ExplicitTop = -6
            end
            object Bevel2: TBevel
              Left = 177
              Top = 0
              Width = 10
              Height = 40
              Align = alLeft
              Shape = bsSpacer
              ExplicitLeft = 164
              ExplicitTop = -6
            end
            object Bevel3: TBevel
              Left = 551
              Top = 0
              Width = 10
              Height = 40
              Align = alLeft
              Shape = bsSpacer
              ExplicitLeft = 548
            end
          end
          object PanelFiltros: TPanel
            Left = 0
            Top = 40
            Width = 740
            Height = 57
            Align = alTop
            BevelOuter = bvNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object pnlCompetencia: TPanel
              AlignWithMargins = True
              Left = 5
              Top = 10
              Width = 169
              Height = 37
              Margins.Left = 5
              Margins.Top = 10
              Margins.Right = 0
              Margins.Bottom = 10
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object lblCompetencia: TLabel
                AlignWithMargins = True
                Left = 0
                Top = 0
                Width = 169
                Height = 13
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                Caption = 'Compet'#234'ncia'
                Color = clBtnFace
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Transparent = True
                StyleElements = []
                ExplicitWidth = 74
              end
              object cmbCompetencia: TComboBox
                AlignWithMargins = True
                Left = 0
                Top = 16
                Width = 169
                Height = 21
                Margins.Left = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                BevelEdges = [beBottom]
                BevelKind = bkSoft
                Ctl3D = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                Text = 'cmbCompetencia'
                OnChange = cmbCompetenciaChange
              end
            end
            object gpbOperacao: TRadioGroup
              AlignWithMargins = True
              Left = 429
              Top = 3
              Width = 308
              Height = 51
              Align = alRight
              Caption = ' Opera'#231#227'o '
              Color = clBtnFace
              Columns = 3
              Ctl3D = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Items.Strings = (
                'Inclus'#227'o'
                'Altera'#231#227'o'
                'Exclus'#227'o')
              ParentColor = False
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 1
              StyleElements = []
              OnClick = gpbOperacaoClick
            end
          end
          object pnlS1000: TPanel
            Left = 0
            Top = 97
            Width = 740
            Height = 34
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object imgS1000: TImage
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 34
              Height = 28
              Align = alLeft
              Center = True
              ExplicitHeight = 43
            end
            object lblS1000: TLabel
              Left = 40
              Top = 0
              Width = 700
              Height = 34
              Align = alClient
              AutoSize = False
              Caption = 
                'S1000 - Unidade Gestora Principal (Informa'#231#245'es do Empregador / C' +
                'ontribuinte / '#211'rg'#227'o P'#250'blico)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
              StyleElements = []
              ExplicitLeft = 28
              ExplicitWidth = 213
              ExplicitHeight = 49
            end
          end
          object pnlS1005: TPanel
            Left = 0
            Top = 131
            Width = 740
            Height = 34
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object imgS1005: TImage
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 34
              Height = 28
              Align = alLeft
              Center = True
              ExplicitHeight = 43
            end
            object lblS1005: TLabel
              Left = 40
              Top = 0
              Width = 700
              Height = 34
              Align = alClient
              AutoSize = False
              Caption = 
                'S1005 - Outras Unidades Gestoras (Tabela de Estabelecimentos, Ob' +
                'ras ou Unidades de '#211'rg'#227'os P'#250'blicos)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
              StyleElements = []
              ExplicitLeft = 28
              ExplicitWidth = 213
              ExplicitHeight = 49
            end
          end
          object pnlS1010: TPanel
            Left = 0
            Top = 165
            Width = 740
            Height = 34
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            object imgS1010: TImage
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 34
              Height = 28
              Align = alLeft
              Center = True
              ExplicitHeight = 43
            end
            object lblS1010: TLabel
              Left = 40
              Top = 0
              Width = 700
              Height = 34
              Align = alClient
              AutoSize = False
              Caption = 'S1010 - Eventos (Tabela de Rubricas)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
              StyleElements = []
              ExplicitLeft = 28
              ExplicitWidth = 213
              ExplicitHeight = 49
            end
          end
          object pnlS1020: TPanel
            Left = 0
            Top = 199
            Width = 740
            Height = 34
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            object imgS1020: TImage
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 34
              Height = 28
              Align = alLeft
              Center = True
              ExplicitHeight = 43
            end
            object lblS1020: TLabel
              Left = 40
              Top = 0
              Width = 700
              Height = 34
              Align = alClient
              AutoSize = False
              Caption = 'S1020 - Configura'#231#245'es do '#211'rg'#227'o (Tabela de Lota'#231#245'es Tribut'#225'rias)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
              StyleElements = []
              ExplicitLeft = 28
              ExplicitWidth = 213
              ExplicitHeight = 49
            end
          end
        end
      end
      object PanelFooter: TPanel
        Left = 20
        Top = 316
        Width = 740
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object BevelSpace: TBevel
          Left = 607
          Top = 0
          Width = 10
          Height = 41
          Align = alRight
          Shape = bsSpacer
          ExplicitLeft = 603
        end
        object pnlConfirmar: TPanel
          Left = 484
          Top = 0
          Width = 123
          Height = 41
          Align = alRight
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object btnConfirmar: TSpeedButton
            Left = 0
            Top = 0
            Width = 123
            Height = 41
            Align = alClient
            Caption = 'Gerar / Enviar'
            Flat = True
            OnClick = btnConfirmarClick
            ExplicitLeft = 38
            ExplicitTop = -4
            ExplicitWidth = 82
          end
        end
        object pnlFechar: TPanel
          Left = 617
          Top = 0
          Width = 123
          Height = 41
          Align = alRight
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 1
          object btnFechar: TSpeedButton
            Left = 0
            Top = 0
            Width = 123
            Height = 41
            Align = alClient
            Caption = 'Fechar'
            Flat = True
            OnClick = btnFecharClick
            ExplicitLeft = 38
            ExplicitTop = -4
            ExplicitWidth = 82
          end
        end
        object pnlProcesso: TPanel
          AlignWithMargins = True
          Left = 10
          Top = 3
          Width = 464
          Height = 35
          Margins.Left = 10
          Margins.Right = 10
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 2
          object lblProcesso: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 458
            Height = 13
            Align = alTop
            Caption = 'Andamento do processo...'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            StyleElements = []
            ExplicitWidth = 146
          end
          object gagProcesso: TGauge
            Left = 0
            Top = 19
            Width = 464
            Height = 16
            Align = alClient
            ForeColor = 4794629
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Progress = 75
            ExplicitTop = 24
            ExplicitWidth = 484
            ExplicitHeight = 17
          end
        end
      end
    end
  end
end
