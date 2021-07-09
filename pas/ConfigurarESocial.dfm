inherited frmConfigurarESocial: TfrmConfigurarESocial
  Caption = 'Configurar eSocial'
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelClient: TPanel
    inherited lblPadrao: TcxLabel
      Left = 1
      Top = 1
      Align = alTop
      Caption = 'Configurar eSocial'
      ParentColor = False
      Style.Color = 10454867
      Style.Font.Height = -13
      Style.TextColor = clWhite
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 674
      ExplicitHeight = 33
      Height = 33
      Width = 674
      AnchorX = 338
      AnchorY = 18
    end
    object pgDados: TcxPageControl
      AlignWithMargins = True
      Left = 4
      Top = 37
      Width = 668
      Height = 364
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      Properties.ActivePage = tbsResponsavel
      Properties.CustomButtons.Buttons = <>
      Properties.Options = [pcoAlwaysShowGoDialogButton, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize, pcoSort]
      Properties.Style = 9
      ClientRectBottom = 364
      ClientRectRight = 668
      ClientRectTop = 23
      object tbsUNG: TcxTabSheet
        Caption = '&1 - Ente Federativo'
        ImageIndex = 0
        object lblID_UNID_GESTORA: TcxLabel
          Left = 17
          Top = 41
          Caption = 'Unidade Gestora Prncipal:'
          FocusControl = dbeID_UNID_GESTORA
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 146
        end
        object dbeID_UNID_GESTORA: TcxDBLookupComboBox
          Left = 152
          Top = 40
          DataBinding.DataField = 'ID_UNID_GESTORA'
          DataBinding.DataSource = ds1
          ParentFont = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Caption = 'Descri'#231#227'o'
              MinWidth = 320
              FieldName = 'FANTASIA'
            end
            item
              Fixed = True
              FieldName = 'CNPJ'
            end>
          Properties.ListSource = dsUNG
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 3
          Width = 431
        end
        object lblNAT_JURIDICA: TcxLabel
          Left = 55
          Top = 65
          Caption = 'Natureza Jur'#237'dica:'
          FocusControl = dbeNAT_JURIDICA
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 146
        end
        object dbeNAT_JURIDICA: TcxDBLookupComboBox
          Left = 152
          Top = 64
          DataBinding.DataField = 'NAT_JURIDICA'
          DataBinding.DataSource = ds1
          ParentFont = False
          Properties.KeyFieldNames = 'CODIGO'
          Properties.ListColumns = <
            item
              Caption = 'Descri'#231#227'o'
              MinWidth = 320
              FieldName = 'DESCRICAO'
            end
            item
              Caption = 'Refer'#234'ncia'
              MinWidth = 70
              FieldName = 'CODIGO'
            end>
          Properties.ListSource = dsNatureza
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 5
          Width = 431
        end
        object dbeNRO_SIAFI: TcxDBTextEdit
          Left = 152
          Top = 16
          DataBinding.DataField = 'NRO_SIAFI'
          DataBinding.DataSource = ds1
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 1
          Width = 121
        end
        object lblNRO_SIAFI: TcxLabel
          Left = 74
          Top = 17
          Caption = 'N'#250'mero SIAFI:'
          FocusControl = dbeNRO_SIAFI
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 146
        end
        object lblSUBTETO_VENCTO_VALOR: TcxLabel
          Left = 35
          Top = 114
          Caption = 'Valor do Subteto (R$):'
          FocusControl = dbeSUBTETO_VENCTO_VALOR
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 146
        end
        object dbeSUBTETO_VENCTO_TIPO: TcxDBLookupComboBox
          Left = 152
          Top = 88
          DataBinding.DataField = 'SUBTETO_VENCTO_TIPO'
          DataBinding.DataSource = ds1
          ParentFont = False
          Properties.KeyFieldNames = 'CODIGO'
          Properties.ListColumns = <
            item
              FieldName = 'DESCRICAO'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsTipoTeto
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 7
          Width = 431
        end
        object dbeSUBTETO_VENCTO_VALOR: TcxDBCurrencyEdit
          Left = 153
          Top = 113
          DataBinding.DataField = 'SUBTETO_VENCTO_VALOR'
          DataBinding.DataSource = ds1
          ParentFont = False
          Properties.DisplayFormat = ',0.00'
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 9
          Width = 121
        end
        object lblSUBTETO_VENCTO_TIPO: TcxLabel
          Left = 64
          Top = 89
          Caption = 'Tipo do Subteto:'
          FocusControl = dbeSUBTETO_VENCTO_TIPO
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 146
        end
        object dbePOSSUI_RPPS: TcxDBCheckBox
          Left = 153
          Top = 141
          Caption = 'Possui Regime Proprio de Previdencia Social (RPPS)'
          DataBinding.DataField = 'POSSUI_RPPS'
          DataBinding.DataSource = ds1
          ParentFont = False
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 10
          Transparent = True
        end
        object dbeDATA_IMPLANTACAO: TcxDBDateEdit
          Left = 153
          Top = 191
          DataBinding.DataField = 'DATA_IMPLANTACAO'
          DataBinding.DataSource = ds1
          TabOrder = 13
          Width = 121
        end
        object lblDATA_IMPLANTACAO: TcxLabel
          Left = 6
          Top = 194
          Caption = 'Data de Implata'#231#227'o e-Social:'
          FocusControl = dbeSUBTETO_VENCTO_VALOR
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 146
        end
        object dbePOSSUI_TABELA_CARREIRA: TcxDBCheckBox
          Left = 153
          Top = 166
          Caption = 'Possui Tabela de Carreira P'#250'blica'
          DataBinding.DataField = 'POSSUI_TABELA_CARREIRA'
          DataBinding.DataSource = ds1
          ParentFont = False
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 11
          Transparent = True
        end
      end
      object tbsResponsavel: TcxTabSheet
        Caption = '&2 - Respons'#225'vel eSocial'
        ImageIndex = 2
        object cxLabel1: TcxLabel
          Left = 66
          Top = 17
          Caption = 'Nome Completo:'
          FocusControl = dbeRESPONSAVEL_NOME
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 147
        end
        object dbeRESPONSAVEL_NOME: TcxDBTextEdit
          Left = 152
          Top = 16
          DataBinding.DataField = 'RESPONSAVEL_NOME'
          DataBinding.DataSource = ds1
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 1
          Width = 439
        end
        object cxLabel2: TcxLabel
          Left = 121
          Top = 41
          Caption = 'CPF:'
          FocusControl = dbeRESPONSAVEL_CPF
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 147
        end
        object dbeRESPONSAVEL_CPF: TcxDBMaskEdit
          Left = 152
          Top = 40
          DataBinding.DataField = 'RESPONSAVEL_CPF'
          DataBinding.DataSource = ds1
          ParentFont = False
          Properties.EditMask = '000.000.000-00;0; '
          Properties.OnValidate = ValidarNumeroCPF
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 3
          Width = 121
        end
        object cxLabel3: TcxLabel
          Left = 76
          Top = 65
          Caption = 'Telefone Fixo:'
          FocusControl = dbeRESPONSAVEL_FONEFIXO
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 147
        end
        object dbeRESPONSAVEL_FONEFIXO: TcxDBMaskEdit
          Left = 152
          Top = 64
          DataBinding.DataField = 'RESPONSAVEL_FONEFIXO'
          DataBinding.DataSource = ds1
          ParentFont = False
          Properties.EditMask = '(00)0000-0000;0; '
          Properties.OnValidate = ValidarFone
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 5
          Width = 121
        end
        object cxLabel4: TcxLabel
          Left = 63
          Top = 89
          Caption = 'Telefone Celular:'
          FocusControl = dbeRESPONSAVEL_FONECELULAR
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 147
        end
        object dbeRESPONSAVEL_FONECELULAR: TcxDBMaskEdit
          Left = 152
          Top = 88
          DataBinding.DataField = 'RESPONSAVEL_FONECELULAR'
          DataBinding.DataSource = ds1
          ParentFont = False
          Properties.EditMask = '(00)0000-0000;0; '
          Properties.OnValidate = ValidarFone
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 7
          Width = 121
        end
        object cxLabel5: TcxLabel
          Left = 112
          Top = 113
          Caption = 'E-mail:'
          FocusControl = dbeRESPONSAVEL_EMAIL
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 147
        end
        object dbeRESPONSAVEL_EMAIL: TcxDBTextEdit
          Left = 152
          Top = 112
          DataBinding.DataField = 'RESPONSAVEL_EMAIL'
          DataBinding.DataSource = ds1
          ParentFont = False
          Properties.CharCase = ecLowerCase
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 9
          Width = 439
        end
      end
      object tbsContador: TcxTabSheet
        Caption = '&3 - Contador'
        ImageIndex = 1
        object lblCONTADOR_NOME: TcxLabel
          Left = 66
          Top = 17
          Caption = 'Nome Completo:'
          FocusControl = dbeCONTADOR_NOME
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 147
        end
        object dbeCONTADOR_NOME: TcxDBTextEdit
          Left = 152
          Top = 16
          DataBinding.DataField = 'CONTADOR_NOME'
          DataBinding.DataSource = ds1
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 1
          Width = 439
        end
        object lblCONTADOR_CPF: TcxLabel
          Left = 121
          Top = 41
          Caption = 'CPF:'
          FocusControl = dbeCONTADOR_CPF
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 147
        end
        object dbeCONTADOR_CPF: TcxDBMaskEdit
          Left = 152
          Top = 40
          DataBinding.DataField = 'CONTADOR_CPF'
          DataBinding.DataSource = ds1
          ParentFont = False
          Properties.EditMask = '000.000.000-00;0; '
          Properties.OnValidate = ValidarNumeroCPF
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 3
          Width = 121
        end
        object dbeCONTADOR_FONEFIXO: TcxDBMaskEdit
          Left = 152
          Top = 64
          DataBinding.DataField = 'CONTADOR_FONEFIXO'
          DataBinding.DataSource = ds1
          ParentFont = False
          Properties.EditMask = '(00)0000-0000;0; '
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 4
          Width = 121
        end
        object lblCONTADOR_FONEFIXO: TcxLabel
          Left = 76
          Top = 65
          Caption = 'Telefone Fixo:'
          FocusControl = dbeCONTADOR_FONEFIXO
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 147
        end
        object lblCONTADOR_FONECELULAR: TcxLabel
          Left = 63
          Top = 89
          Caption = 'Telefone Celular:'
          FocusControl = dbeCONTADOR_FONECELULAR
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 147
        end
        object dbeCONTADOR_FONECELULAR: TcxDBMaskEdit
          Left = 152
          Top = 88
          DataBinding.DataField = 'CONTADOR_FONECELULAR'
          DataBinding.DataSource = ds1
          ParentFont = False
          Properties.EditMask = '(00)0000-0000;0; '
          Properties.OnValidate = ValidarFone
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 7
          Width = 121
        end
        object dbeCONTADOR_EMAIL: TcxDBTextEdit
          Left = 152
          Top = 112
          DataBinding.DataField = 'CONTADOR_EMAIL'
          DataBinding.DataSource = ds1
          ParentFont = False
          Properties.CharCase = ecLowerCase
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 8
          Width = 439
        end
        object lblCONTADOR_EMAIL: TcxLabel
          Left = 112
          Top = 113
          Caption = 'E-mail:'
          FocusControl = dbeCONTADOR_EMAIL
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 147
        end
      end
    end
  end
  inherited Panel: TPanel
    inherited btnCancelar: TcxButton
      Left = 341
      ExplicitLeft = 341
    end
    inherited btnGravar: TcxButton
      Left = 243
      ExplicitLeft = 243
    end
  end
  inherited sds1: TSQLDataSet
    CommandText = 'SELECT * FROM CONFIG_ESOCIAL WHERE ID_CONFIG_ORGAO = :ID'
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 0
      end>
    Left = 16
    Top = 319
    object sds1ID_CONFIG_ORGAO: TIntegerField
      FieldName = 'ID_CONFIG_ORGAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sds1ID_UNID_GESTORA: TIntegerField
      FieldName = 'ID_UNID_GESTORA'
      ProviderFlags = [pfInUpdate]
    end
    object sds1CONTADOR_NOME: TStringField
      FieldName = 'CONTADOR_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object sds1CONTADOR_CPF: TStringField
      FieldName = 'CONTADOR_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object sds1CONTADOR_FONEFIXO: TStringField
      FieldName = 'CONTADOR_FONEFIXO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sds1CONTADOR_FONECELULAR: TStringField
      FieldName = 'CONTADOR_FONECELULAR'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object sds1CONTADOR_EMAIL: TStringField
      FieldName = 'CONTADOR_EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sds1RESPONSAVEL_NOME: TStringField
      FieldName = 'RESPONSAVEL_NOME'
      Size = 50
    end
    object sds1RESPONSAVEL_CPF: TStringField
      FieldName = 'RESPONSAVEL_CPF'
      Size = 11
    end
    object sds1RESPONSAVEL_FONEFIXO: TStringField
      FieldName = 'RESPONSAVEL_FONEFIXO'
      Size = 10
    end
    object sds1RESPONSAVEL_FONECELULAR: TStringField
      FieldName = 'RESPONSAVEL_FONECELULAR'
      Size = 11
    end
    object sds1RESPONSAVEL_EMAIL: TStringField
      FieldName = 'RESPONSAVEL_EMAIL'
      Size = 60
    end
    object sds1NAT_JURIDICA: TStringField
      FieldName = 'NAT_JURIDICA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object sds1NRO_SIAFI: TStringField
      FieldName = 'NRO_SIAFI'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object sds1SUBTETO_VENCTO_TIPO: TStringField
      FieldName = 'SUBTETO_VENCTO_TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object sds1SUBTETO_VENCTO_VALOR: TFMTBCDField
      FieldName = 'SUBTETO_VENCTO_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object sds1POSSUI_RPPS: TStringField
      FieldName = 'POSSUI_RPPS'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object sds1POSSUI_TABELA_CARREIRA: TStringField
      DisplayWidth = 1
      FieldName = 'POSSUI_TABELA_CARREIRA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sds1TIPO_OPERACAO: TStringField
      FieldName = 'TIPO_OPERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object sds1DATA_IMPLANTACAO: TDateField
      FieldName = 'DATA_IMPLANTACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  inherited dsp1: TDataSetProvider
    Left = 48
    Top = 320
  end
  inherited cds1: TClientDataSet
    CommandText = 'SELECT * FROM CONFIG_ESOCIAL WHERE ID_CONFIG_ORGAO = :ID'
    FieldDefs = <
      item
        Name = 'ID_CONFIG_ORGAO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_UNID_GESTORA'
        DataType = ftInteger
      end
      item
        Name = 'CONTADOR_NOME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CONTADOR_CPF'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'CONTADOR_FONEFIXO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CONTADOR_FONECELULAR'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'CONTADOR_EMAIL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'RESPONSAVEL_NOME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'RESPONSAVEL_CPF'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'RESPONSAVEL_FONEFIXO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RESPONSAVEL_FONECELULAR'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'RESPONSAVEL_EMAIL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NAT_JURIDICA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NRO_SIAFI'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'SUBTETO_VENCTO_TIPO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SUBTETO_VENCTO_VALOR'
        DataType = ftFMTBcd
        Precision = 18
        Size = 2
      end
      item
        Name = 'POSSUI_RPPS'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'POSSUI_TABELA_CARREIRA'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TIPO_OPERACAO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATA_IMPLANTACAO'
        DataType = ftDate
      end>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 0
      end>
    BeforePost = cds1BeforePost
    OnNewRecord = cds1NewRecord
    Left = 81
    Top = 319
    object cds1ID_CONFIG_ORGAO: TIntegerField
      FieldName = 'ID_CONFIG_ORGAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds1ID_UNID_GESTORA: TIntegerField
      FieldName = 'ID_UNID_GESTORA'
      ProviderFlags = [pfInUpdate]
    end
    object cds1CONTADOR_NOME: TStringField
      FieldName = 'CONTADOR_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cds1CONTADOR_CPF: TStringField
      FieldName = 'CONTADOR_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object cds1CONTADOR_FONEFIXO: TStringField
      FieldName = 'CONTADOR_FONEFIXO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cds1CONTADOR_FONECELULAR: TStringField
      FieldName = 'CONTADOR_FONECELULAR'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object cds1CONTADOR_EMAIL: TStringField
      FieldName = 'CONTADOR_EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cds1RESPONSAVEL_NOME: TStringField
      FieldName = 'RESPONSAVEL_NOME'
      Size = 50
    end
    object cds1RESPONSAVEL_CPF: TStringField
      FieldName = 'RESPONSAVEL_CPF'
      Size = 11
    end
    object cds1RESPONSAVEL_FONEFIXO: TStringField
      FieldName = 'RESPONSAVEL_FONEFIXO'
      Size = 10
    end
    object cds1RESPONSAVEL_FONECELULAR: TStringField
      FieldName = 'RESPONSAVEL_FONECELULAR'
      Size = 11
    end
    object cds1RESPONSAVEL_EMAIL: TStringField
      FieldName = 'RESPONSAVEL_EMAIL'
      Size = 60
    end
    object cds1NAT_JURIDICA: TStringField
      FieldName = 'NAT_JURIDICA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cds1NRO_SIAFI: TStringField
      FieldName = 'NRO_SIAFI'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object cds1SUBTETO_VENCTO_TIPO: TStringField
      FieldName = 'SUBTETO_VENCTO_TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cds1SUBTETO_VENCTO_VALOR: TFMTBCDField
      FieldName = 'SUBTETO_VENCTO_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cds1POSSUI_RPPS: TStringField
      FieldName = 'POSSUI_RPPS'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cds1POSSUI_TABELA_CARREIRA: TStringField
      FieldName = 'POSSUI_TABELA_CARREIRA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cds1TIPO_OPERACAO: TStringField
      FieldName = 'TIPO_OPERACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cds1DATA_IMPLANTACAO: TDateField
      FieldName = 'DATA_IMPLANTACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  inherited ds1: TDataSource
    OnDataChange = ds1DataChange
    Left = 112
    Top = 320
  end
  object qryUNG: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'Select'#13#10'    u.id'#13#10'  , coalesce(nullif(trim(u.razao_social), '#39#39'),' +
      ' trim(u.descricao)) as razao_social'#13#10'  , trim(u.descricao) as fa' +
      'ntasia'#13#10'  , u.cnpj'#13#10'from UNID_GESTORA u'#13#10'order by'#13#10'  1'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = dmPrincipal.SConPrincipal
    Left = 536
    Top = 223
  end
  object dspUNG: TDataSetProvider
    DataSet = qryUNG
    Exported = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 536
    Top = 271
  end
  object cdsUNG: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'RAZAO_SOCIAL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'FANTASIA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CNPJ'
        Attributes = [faRequired]
        DataType = ftString
        Size = 14
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspUNG'
    StoreDefs = True
    Left = 536
    Top = 319
  end
  object dsUNG: TDataSource
    DataSet = cdsUNG
    Left = 540
    Top = 368
  end
  object qryNatureza: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'Select'#13#10'    n.codigo'#13#10'  , n.descricao'#13#10'from ESOCIAL_NATUREZA_JUR' +
      'IDICA n'#13#10'order by'#13#10'  1'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = dmPrincipal.SConPrincipal
    Left = 576
    Top = 223
  end
  object dspNatureza: TDataSetProvider
    DataSet = qryNatureza
    Exported = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 576
    Top = 271
  end
  object cdsNatureza: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 240
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspNatureza'
    StoreDefs = True
    Left = 576
    Top = 319
  end
  object dsNatureza: TDataSource
    DataSet = cdsNatureza
    Left = 580
    Top = 368
  end
  object qryTipoTeto: TSQLDataSet
    GetMetadata = False
    CommandText = 'Select *'#13#10'from VW_TIPO_SUBTETO'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = dmPrincipal.SConPrincipal
    Left = 616
    Top = 223
  end
  object dspTipoTeto: TDataSetProvider
    DataSet = qryTipoTeto
    Exported = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 616
    Top = 271
  end
  object cdsTipoTeto: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 16
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspTipoTeto'
    StoreDefs = True
    Left = 616
    Top = 319
  end
  object dsTipoTeto: TDataSource
    DataSet = cdsTipoTeto
    Left = 620
    Top = 368
  end
  object qryServidor: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'Select'#13#10'    g.id_servid_gestor as id_servidor'#13#10'  , s.matricula'#13#10 +
      '  , p.nome'#13#10'  , p.cpf'#13#10'  , p.telefone'#13#10'  , null as celular'#13#10'  , ' +
      'p.e_mail'#13#10'from UNID_GESTORA g'#13#10'  inner join SERVIDOR s on (s.id ' +
      '= g.id_servid_gestor)'#13#10'  inner join PESSOA_FISICA p on (p.id = s' +
      '.id_pessoa_fisica)'#13#10'where (g.id = :ug)'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ug'
        ParamType = ptInput
      end>
    SQLConnection = dmPrincipal.SConPrincipal
    Left = 488
    Top = 223
  end
  object dspServidor: TDataSetProvider
    DataSet = qryServidor
    Exported = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 488
    Top = 271
  end
  object cdsServidor: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'RAZAO_SOCIAL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'FANTASIA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CNPJ'
        Attributes = [faRequired]
        DataType = ftString
        Size = 14
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ug'
        ParamType = ptInput
      end>
    ProviderName = 'dspServidor'
    StoreDefs = True
    Left = 488
    Top = 319
  end
end
