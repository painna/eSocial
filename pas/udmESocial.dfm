object dmESocial: TdmESocial
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 325
  Width = 541
  object ACBrESocial: TACBreSocial
    MAIL = ACBrMail
    Integrador = ACBrIntegrador
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Left = 64
    Top = 48
  end
  object ACBrIntegrador: TACBrIntegrador
    PastaInput = 'C:\Integrador\Input\'
    PastaOutput = 'C:\Integrador\Output\'
    Left = 64
    Top = 96
  end
  object ACBrMail: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 64
    Top = 144
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
end
