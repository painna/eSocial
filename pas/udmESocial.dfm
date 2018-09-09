object dmESocial: TdmESocial
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 516
  Width = 818
  object ACBrESocial: TACBreSocial
    MAIL = ACBrMail
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Left = 32
    Top = 24
  end
  object ACBrMail: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 32
    Top = 72
  end
  object dspTabela: TDataSetProvider
    DataSet = qryTabela
    Exported = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 135
  end
  object cdsTabela: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DATA_MOVIM'
        DataType = ftDate
      end
      item
        Name = 'HORA_MOVIM'
        DataType = ftTime
      end
      item
        Name = 'ID_USUARIO_LOGADO'
        DataType = ftInteger
      end
      item
        Name = 'ID_USUARIO_EXECUT'
        DataType = ftInteger
      end
      item
        Name = 'NOME_FORM1'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NOME_FORM2'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NOME_TABELA'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'OPERACAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CAMPO_PK1'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CAMPO_PK2'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CAMPO_PK3'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CAMPO_PK4'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CAMPO_PK5'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CAMPO_PK6'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NOME_CAMPO'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'VAL_CAMPO_ANTER'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'VAL_CAMPO_NOVO'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'NOME_USUARIO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CARGO_USUARIO'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspTabela'
    StoreDefs = True
    Left = 272
    Top = 183
  end
  object qryTabela: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmPrincipal.SConPrincipal
    Left = 272
    Top = 96
  end
  object ACBrValidador: TACBrValidador
    IgnorarChar = './-'
    Left = 104
    Top = 160
  end
  object dspDetalhe: TDataSetProvider
    DataSet = qryDetalhe
    Exported = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 175
  end
  object cdsDetalhe: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DATA_MOVIM'
        DataType = ftDate
      end
      item
        Name = 'HORA_MOVIM'
        DataType = ftTime
      end
      item
        Name = 'ID_USUARIO_LOGADO'
        DataType = ftInteger
      end
      item
        Name = 'ID_USUARIO_EXECUT'
        DataType = ftInteger
      end
      item
        Name = 'NOME_FORM1'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NOME_FORM2'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NOME_TABELA'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'OPERACAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CAMPO_PK1'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CAMPO_PK2'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CAMPO_PK3'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CAMPO_PK4'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CAMPO_PK5'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CAMPO_PK6'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NOME_CAMPO'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'VAL_CAMPO_ANTER'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'VAL_CAMPO_NOVO'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'NOME_USUARIO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CARGO_USUARIO'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspDetalhe'
    StoreDefs = True
    Left = 408
    Top = 223
  end
  object qryDetalhe: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmPrincipal.SConPrincipal
    Left = 408
    Top = 136
  end
  object dspProtocolo: TDataSetProvider
    DataSet = qryProtocolo
    Exported = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 552
    Top = 287
  end
  object cdsProtocolo: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftLargeint
      end
      item
        Name = 'NUMERO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'INSCRICAO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATA_HORA'
        DataType = ftTimeStamp
      end
      item
        Name = 'VERSAO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ARQUIVO_ENVIADO'
        DataType = ftBlob
        Size = 1
      end
      item
        Name = 'ARQUIVO_RETORNO'
        DataType = ftBlob
        Size = 1
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftString
        Name = 'numero'
        ParamType = ptInput
        Size = 30
        Value = ''
      end>
    ProviderName = 'dspProtocolo'
    StoreDefs = True
    Left = 552
    Top = 335
    object cdsProtocoloID: TLargeintField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProtocoloNUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
      Size = 30
    end
    object cdsProtocoloINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProtocoloDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProtocoloVERSAO: TStringField
      FieldName = 'VERSAO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsProtocoloARQUIVO_ENVIADO: TBlobField
      FieldName = 'ARQUIVO_ENVIADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsProtocoloARQUIVO_RETORNO: TBlobField
      FieldName = 'ARQUIVO_RETORNO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object qryProtocolo: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'numero'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select'
      '    p.id'
      '  , p.numero'
      '  , p.inscricao'
      '  , p.data_hora'
      '  , p.versao'
      '  , p.arquivo_enviado'
      '  , p.arquivo_retorno'
      'from ESOCIAL_RETORNO_PROTOCOLO p'
      'where p.numero = :numero')
    SQLConnection = dmPrincipal.SConPrincipal
    Left = 552
    Top = 248
    object qryProtocoloID: TLargeintField
      FieldName = 'ID'
    end
    object qryProtocoloNUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
      Size = 30
    end
    object qryProtocoloINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
    end
    object qryProtocoloDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
    end
    object qryProtocoloVERSAO: TStringField
      FieldName = 'VERSAO'
      Size = 10
    end
    object qryProtocoloARQUIVO_ENVIADO: TBlobField
      FieldName = 'ARQUIVO_ENVIADO'
      Size = 1
    end
    object qryProtocoloARQUIVO_RETORNO: TBlobField
      FieldName = 'ARQUIVO_RETORNO'
      Size = 1
    end
  end
  object dspGeral: TDataSetProvider
    DataSet = qryGeral
    Exported = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 168
    Top = 303
  end
  object cdsGeral: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DATA_MOVIM'
        DataType = ftDate
      end
      item
        Name = 'HORA_MOVIM'
        DataType = ftTime
      end
      item
        Name = 'ID_USUARIO_LOGADO'
        DataType = ftInteger
      end
      item
        Name = 'ID_USUARIO_EXECUT'
        DataType = ftInteger
      end
      item
        Name = 'NOME_FORM1'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NOME_FORM2'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NOME_TABELA'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'OPERACAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CAMPO_PK1'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CAMPO_PK2'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CAMPO_PK3'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CAMPO_PK4'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CAMPO_PK5'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CAMPO_PK6'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NOME_CAMPO'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'VAL_CAMPO_ANTER'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'VAL_CAMPO_NOVO'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'NOME_USUARIO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CARGO_USUARIO'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspGeral'
    StoreDefs = True
    Left = 168
    Top = 351
  end
  object qryGeral: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmPrincipal.SConPrincipal
    Left = 168
    Top = 264
  end
end
