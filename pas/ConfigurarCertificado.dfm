object frmConfigurarCertificado: TfrmConfigurarCertificado
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Configurar Certificado'
  ClientHeight = 507
  ClientWidth = 287
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pgcConfigurar: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 281
    Height = 470
    ActivePage = tbsGeral
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object tbsGeral: TTabSheet
      Caption = 'Geral'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 267
        Height = 225
        Align = alTop
        Caption = 'Geral'
        TabOrder = 0
        DesignSize = (
          267
          225)
        object sbtnPathSalvar: TSpeedButton
          Left = 233
          Top = 156
          Width = 23
          Height = 23
          Anchors = [akTop, akRight]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
            07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
            0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          OnClick = sbtnPathSalvarClick
        end
        object Label3: TLabel
          Left = 8
          Top = 34
          Width = 72
          Height = 13
          Caption = 'Formato Alerta'
        end
        object Label4: TLabel
          Left = 8
          Top = 77
          Width = 119
          Height = 13
          Caption = 'Vers'#227'o Documento Fiscal'
        end
        object spPathSchemas: TSpeedButton
          Left = 233
          Top = 193
          Width = 23
          Height = 23
          Anchors = [akTop, akRight]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
            07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
            0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          OnClick = spPathSchemasClick
        end
        object Label1: TLabel
          Left = 8
          Top = 179
          Width = 198
          Height = 13
          Caption = 'Diret'#243'rios com os arquivos XSD(Schemas)'
        end
        object edtPathLogs: TEdit
          Left = 8
          Top = 157
          Width = 226
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object ckSalvar: TCheckBox
          Left = 8
          Top = 138
          Width = 209
          Height = 15
          Caption = 'Salvar Arquivos de Envio e Resposta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object cbxExibirErroSchema: TCheckBox
          Left = 8
          Top = 16
          Width = 129
          Height = 17
          Caption = 'Exibir Erro Schema'
          TabOrder = 2
        end
        object edtFormatoAlerta: TEdit
          Left = 8
          Top = 50
          Width = 248
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
        object cbxRetirarAcentos: TCheckBox
          Left = 8
          Top = 120
          Width = 193
          Height = 17
          Caption = 'Retirar Acentos dos XMLs enviados'
          TabOrder = 4
        end
        object cbVersaoDF: TComboBox
          Left = 8
          Top = 93
          Width = 248
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
        end
        object edtPathSchemas: TEdit
          Left = 8
          Top = 194
          Width = 226
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
        end
      end
      object gbDadosEmpresa: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 234
        Width = 267
        Height = 167
        Align = alTop
        Caption = 'Dados Empresa'
        TabOrder = 1
        DesignSize = (
          267
          167)
        object Label2: TLabel
          Left = 8
          Top = 18
          Width = 101
          Height = 13
          Caption = 'CNPJ do Empregador'
        end
        object Label5: TLabel
          Left = 8
          Top = 58
          Width = 123
          Height = 13
          Caption = 'CPF/CNPJ do Transmissor'
        end
        object Label7: TLabel
          Left = 8
          Top = 101
          Width = 96
          Height = 13
          Caption = 'Tipo de Empregador'
        end
        object edtIdEmpregador: TEdit
          Left = 7
          Top = 34
          Width = 248
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object edtIdTransmissor: TEdit
          Left = 7
          Top = 74
          Width = 248
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object cbTEmpregador: TComboBox
          Left = 8
          Top = 117
          Width = 248
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
      end
    end
    object tbsCertificado: TTabSheet
      Caption = 'Certificado'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        273
        442)
      object Label6: TLabel
        Left = 39
        Top = 16
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'SSLLib'
        Color = clBtnFace
        ParentColor = False
      end
      object Label12: TLabel
        Left = 29
        Top = 43
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'CryptLib'
        Color = clBtnFace
        ParentColor = False
      end
      object Label13: TLabel
        Left = 35
        Top = 70
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = 'HttpLib'
        Color = clBtnFace
        ParentColor = False
      end
      object Label14: TLabel
        Left = 17
        Top = 97
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'XMLSignLib'
        Color = clBtnFace
        ParentColor = False
      end
      object GroupBox2: TGroupBox
        AlignWithMargins = True
        Left = 4
        Top = 118
        Width = 263
        Height = 144
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Certificado'
        TabOrder = 0
        DesignSize = (
          263
          144)
        object Label15: TLabel
          Left = 8
          Top = 16
          Width = 41
          Height = 13
          Caption = 'Caminho'
        end
        object Label16: TLabel
          Left = 8
          Top = 56
          Width = 30
          Height = 13
          Caption = 'Senha'
        end
        object sbtnCaminhoCert: TSpeedButton
          Left = 232
          Top = 31
          Width = 23
          Height = 23
          Anchors = [akTop, akRight]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
            07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
            0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          OnClick = sbtnCaminhoCertClick
        end
        object Label17: TLabel
          Left = 8
          Top = 96
          Width = 79
          Height = 13
          Caption = 'N'#250'mero de S'#233'rie'
        end
        object sbtnGetCert1: TSpeedButton
          Left = 232
          Top = 111
          Width = 23
          Height = 23
          Anchors = [akTop, akRight]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
            07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
            0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          OnClick = sbtnGetCert1Click
        end
        object edtCaminho: TEdit
          Left = 8
          Top = 32
          Width = 225
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object edtSenha: TEdit
          Left = 8
          Top = 72
          Width = 247
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          PasswordChar = '*'
          TabOrder = 1
        end
        object edtNumSerie: TEdit
          Left = 8
          Top = 112
          Width = 225
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
      end
      object btnValidadeData: TButton
        Left = 12
        Top = 266
        Width = 97
        Height = 25
        Caption = 'Data de Validade'
        TabOrder = 1
        OnClick = btnValidadeDataClick
      end
      object btnNumSerie: TButton
        Left = 115
        Top = 266
        Width = 62
        Height = 25
        Caption = 'Num.S'#233'rie'
        TabOrder = 2
        OnClick = btnNumSerieClick
      end
      object btnSubjectName: TButton
        Left = 12
        Top = 297
        Width = 97
        Height = 25
        Caption = 'Subject Name'
        TabOrder = 3
        OnClick = btnSubjectNameClick
      end
      object btnCNPJ: TButton
        Left = 115
        Top = 297
        Width = 62
        Height = 25
        Caption = 'CNPJ'
        TabOrder = 4
        OnClick = btnCNPJClick
      end
      object btnIssuerName: TButton
        Left = 183
        Top = 297
        Width = 76
        Height = 25
        Caption = 'Issuer Name'
        TabOrder = 5
        OnClick = btnIssuerNameClick
      end
      object GroupBox3: TGroupBox
        AlignWithMargins = True
        Left = 4
        Top = 328
        Width = 263
        Height = 80
        Caption = 'Calculo de Hash e assinatura'
        TabOrder = 6
        Visible = False
        object edtCalcHash: TEdit
          Left = 7
          Top = 17
          Width = 249
          Height = 21
          TabOrder = 0
          Text = '0548133600013704583493000190'
        end
        object btnSHA_RSA: TButton
          Left = 8
          Top = 44
          Width = 99
          Height = 25
          Caption = 'SHA256+RSA'
          TabOrder = 1
        end
        object cbAssinar: TCheckBox
          Left = 113
          Top = 47
          Width = 54
          Height = 19
          Caption = 'Assinar'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
      object btnHTTPS: TButton
        Left = 8
        Top = 414
        Width = 128
        Height = 25
        Caption = 'HTTPS sem Certificado'
        TabOrder = 7
        Visible = False
      end
      object btnX509: TButton
        Left = 144
        Top = 414
        Width = 115
        Height = 25
        Caption = 'Leitura de X509'
        TabOrder = 8
        Visible = False
      end
      object cbSSLLib: TComboBox
        Left = 80
        Top = 8
        Width = 177
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
      end
      object cbCryptLib: TComboBox
        Left = 80
        Top = 35
        Width = 177
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 10
      end
      object cbHttpLib: TComboBox
        Left = 80
        Top = 62
        Width = 177
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 11
      end
      object cbXmlSignLib: TComboBox
        Left = 80
        Top = 89
        Width = 177
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 12
      end
    end
    object tbsWebService: TTabSheet
      Caption = 'WebService'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox4: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 267
        Height = 150
        Align = alTop
        Caption = 'WebService'
        TabOrder = 0
        DesignSize = (
          267
          150)
        object Label18: TLabel
          Left = 191
          Top = 72
          Width = 40
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'TimeOut'
          Color = clBtnFace
          ParentColor = False
        end
        object Label19: TLabel
          Left = 11
          Top = 119
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'SSLType'
          Color = clBtnFace
          ParentColor = False
        end
        object cbxVisualizar: TCheckBox
          Left = 8
          Top = 74
          Width = 153
          Height = 17
          Caption = 'Visualizar Mensagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object rgTipoAmb: TRadioGroup
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 257
          Height = 52
          Align = alTop
          Caption = 'Selecione o Ambiente de Destino'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Produ'#231#227'o'
            'Homologa'#231#227'o')
          TabOrder = 1
        end
        object cbxSalvarSOAP: TCheckBox
          Left = 8
          Top = 92
          Width = 153
          Height = 17
          Caption = 'Salvar envelope SOAP'
          TabOrder = 2
        end
        object seTimeOut: TSpinEdit
          Left = 191
          Top = 88
          Width = 66
          Height = 22
          Anchors = [akTop, akRight]
          Increment = 10
          MaxValue = 999999
          MinValue = 1000
          TabOrder = 3
          Value = 5000
        end
        object cbSSLType: TComboBox
          Left = 97
          Top = 116
          Width = 160
          Height = 21
          Hint = 'Depende de configura'#231#227'o de  SSL.HttpLib'
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
        end
      end
      object GroupBox8: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 242
        Width = 267
        Height = 104
        Align = alTop
        Caption = 'Proxy'
        TabOrder = 1
        DesignSize = (
          267
          104)
        object Label20: TLabel
          Left = 8
          Top = 16
          Width = 22
          Height = 13
          Caption = 'Host'
        end
        object Label21: TLabel
          Left = 207
          Top = 16
          Width = 26
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Porta'
        end
        object Label22: TLabel
          Left = 8
          Top = 56
          Width = 36
          Height = 13
          Caption = 'Usu'#225'rio'
        end
        object Label23: TLabel
          Left = 135
          Top = 56
          Width = 30
          Height = 13
          Caption = 'Senha'
        end
        object edtProxyHost: TEdit
          Left = 8
          Top = 32
          Width = 193
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object edtProxyPorta: TEdit
          Left = 207
          Top = 32
          Width = 50
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 1
        end
        object edtProxyUser: TEdit
          Left = 8
          Top = 72
          Width = 121
          Height = 21
          TabOrder = 2
        end
        object edtProxySenha: TEdit
          Left = 135
          Top = 72
          Width = 123
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          PasswordChar = '*'
          TabOrder = 3
        end
      end
      object GroupBox9: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 159
        Width = 267
        Height = 77
        Align = alTop
        Caption = 'Retorno de Envio do eSocial '
        TabOrder = 2
        object Label24: TLabel
          Left = 93
          Top = 31
          Width = 51
          Height = 13
          Caption = 'Tentativas'
        end
        object Label26: TLabel
          Left = 176
          Top = 31
          Width = 44
          Height = 13
          Caption = 'Intervalo'
        end
        object Label27: TLabel
          Left = 8
          Top = 31
          Width = 45
          Height = 13
          Hint = 
            'Aguardar quantos segundos para primeira consulta de retorno de e' +
            'nvio'
          Caption = 'Aguardar'
        end
        object cbxAjustarAut: TCheckBox
          Left = 8
          Top = 14
          Width = 234
          Height = 17
          Caption = 'Ajustar Automaticamente prop. "Aguardar"'
          TabOrder = 0
        end
        object edtTentativas: TEdit
          Left = 93
          Top = 47
          Width = 57
          Height = 21
          TabOrder = 2
        end
        object edtIntervalo: TEdit
          Left = 176
          Top = 47
          Width = 57
          Height = 21
          TabOrder = 3
        end
        object edtAguardar: TEdit
          Left = 8
          Top = 47
          Width = 57
          Height = 21
          Hint = 
            'Aguardar quantos segundos para primeira consulta de retorno de e' +
            'nvio'
          TabOrder = 1
        end
      end
    end
    object tbsArquivos: TTabSheet
      Caption = 'Arquivos'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        273
        442)
      object sbPatheSocial: TSpeedButton
        Left = 240
        Top = 142
        Width = 23
        Height = 23
        Anchors = [akTop, akRight]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
          07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
          0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
        OnClick = sbPatheSocialClick
      end
      object Label28: TLabel
        Left = 6
        Top = 127
        Width = 108
        Height = 13
        Caption = 'Pasta Arquivos eSocial'
      end
      object Label36: TLabel
        Left = 6
        Top = 173
        Width = 109
        Height = 13
        Caption = 'Pasta Arquivos Evento'
      end
      object sbPathEvento: TSpeedButton
        Left = 240
        Top = 188
        Width = 23
        Height = 23
        Anchors = [akTop, akRight]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
          07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
          0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
        OnClick = sbPathEventoClick
      end
      object cbxSalvarArqs: TCheckBox
        Left = 6
        Top = 12
        Width = 210
        Height = 17
        Caption = 'Salvar Arquivos em Pastas Separadas'
        TabOrder = 0
      end
      object cbxPastaMensal: TCheckBox
        Left = 6
        Top = 28
        Width = 210
        Height = 17
        Caption = 'Criar Pastas Mensalmente'
        TabOrder = 1
      end
      object cbxAdicionaLiteral: TCheckBox
        Left = 6
        Top = 44
        Width = 210
        Height = 17
        Caption = 'Adicionar Literal no nome das pastas'
        TabOrder = 2
      end
      object cbxEmissaoPatheSocial: TCheckBox
        Left = 6
        Top = 60
        Width = 233
        Height = 17
        Caption = 'Salvar eSocial pelo campo Data de Emiss'#227'o'
        TabOrder = 3
      end
      object cbxSalvaPathEvento: TCheckBox
        Left = 6
        Top = 76
        Width = 233
        Height = 17
        Caption = 'Salvar Arqs de Eventos'
        TabOrder = 4
      end
      object cbxSepararPorCNPJ: TCheckBox
        Left = 6
        Top = 92
        Width = 233
        Height = 17
        Caption = 'Separar Arqs pelo CNPJ do Certificado'
        TabOrder = 5
      end
      object edtPatheSocial: TEdit
        Left = 6
        Top = 143
        Width = 235
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
      end
      object edtPathEvento: TEdit
        Left = 6
        Top = 189
        Width = 235
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
      end
    end
  end
  object btnSalvarConfig: TBitBtn
    AlignWithMargins = True
    Left = 3
    Top = 479
    Width = 281
    Height = 25
    Align = alBottom
    Caption = 'Salvar Configura'#231#245'es'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
      7700333333337777777733333333008088003333333377F73377333333330088
      88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
      000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
      FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
      99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 1
  end
  object opdAbrir: TOpenDialog
    DefaultExt = '*-nfe.XML'
    Filter = 
      'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|To' +
      'dos os Arquivos (*.*)|*.*'
    Title = 'Selecione a NFe'
    Left = 43
    Top = 400
  end
end
