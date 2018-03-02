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
      Properties.ActivePage = tbsUNG
      Properties.CustomButtons.Buttons = <>
      Properties.Options = [pcoAlwaysShowGoDialogButton, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize, pcoSort]
      Properties.Style = 9
      ExplicitLeft = 192
      ExplicitTop = 72
      ExplicitWidth = 613
      ExplicitHeight = 270
      ClientRectBottom = 364
      ClientRectRight = 668
      ClientRectTop = 23
      object tbsUNG: TcxTabSheet
        Caption = '&1 - Ente Federativo'
        ImageIndex = 0
        ExplicitLeft = -3
        object lblID_UNID_GESTORA: TcxLabel
          Left = 11
          Top = 42
          Caption = 'Unidade Gestora Prncipal:'
          FocusControl = dbeID_UNID_GESTORA
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 140
        end
        object dbeID_UNID_GESTORA: TcxDBLookupComboBox
          Left = 146
          Top = 41
          DataBinding.DataField = 'ID_UNID_GESTORA'
          DataBinding.DataSource = ds1
          ParentFont = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Caption = 'Raz'#227'o Social'
              MinWidth = 320
              FieldName = 'RAZAO_SOCIAL'
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
          Left = 49
          Top = 67
          Caption = 'Natureza Jur'#237'dica:'
          FocusControl = dbeNAT_JURIDICA
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 140
        end
        object dbeNAT_JURIDICA: TcxDBLookupComboBox
          Left = 146
          Top = 66
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
          Left = 146
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
          Left = 68
          Top = 17
          Caption = 'N'#250'mero SIAFI:'
          FocusControl = dbeNRO_SIAFI
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 140
        end
        object lblSUBTETO_VENCTO_VALOR: TcxLabel
          Left = 29
          Top = 116
          Caption = 'Valor do Subteto (R$):'
          FocusControl = dbeSUBTETO_VENCTO_VALOR
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 140
        end
        object dbeSUBTETO_VENCTO_TIPO: TcxDBLookupComboBox
          Left = 146
          Top = 90
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
          Left = 146
          Top = 115
          DataBinding.DataField = 'SUBTETO_VENCTO_VALOR'
          DataBinding.DataSource = ds1
          ParentFont = False
          Properties.DisplayFormat = '0.00;-,0.00'
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
          Left = 58
          Top = 91
          Caption = 'Tipo do Subteto:'
          FocusControl = dbeSUBTETO_VENCTO_TIPO
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 140
        end
        object dbePOSSUI_RPPS: TcxDBCheckBox
          Left = 146
          Top = 143
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
      end
      object tbsContador: TcxTabSheet
        Caption = '&2 - Contador'
        ImageIndex = 1
        ExplicitWidth = 970
        ExplicitHeight = 276
        object cxLabel6: TcxLabel
          Left = 59
          Top = 17
          Caption = 'Nome Completo:'
          ParentFont = False
          Style.StyleController = dmPrincipal.cxLabelStyleNormal
          Properties.Alignment.Horz = taRightJustify
          Transparent = True
          AnchorX = 140
        end
        object cxDBTextEdit2: TcxDBTextEdit
          Left = 146
          Top = 16
          DataBinding.DataSource = ds1
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 1
          Width = 439
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
    Top = 320
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
      end>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 0
      end>
    OnNewRecord = cds1NewRecord
    Left = 80
    Top = 320
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
  end
  inherited ds1: TDataSource
    Left = 112
    Top = 320
  end
  object qryUNG: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'Select'#13#10'    u.id'#13#10'  , coalesce(nullif(trim(u.razao_social), '#39#39'),' +
      ' trim(u.descricao)) as razao_social'#13#10'  , u.cnpj'#13#10'from UNID_GESTO' +
      'RA u'#13#10'order by'#13#10'  1'
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
end
