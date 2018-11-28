object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 529
  Width = 478
  object SConPrincipal: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'ConnectionString=DriverName=Firebird,Database=database.gdb'
      'User_Name=GERASYS.TI'
      'Password=gsti2010'
      
        'Database=C:\Users\Isaque\Documents\Projetos\GeraSysTI\eSocial\tr' +
        'unk\db\REMUN_PMSJA_USO_ESOCIAL.FDB'
      'ServerCharSet=WIN1252')
    BeforeConnect = SConPrincipalBeforeConnect
    Left = 56
    Top = 40
  end
  object cxEditStyleReadyOnly: TcxEditStyleController
    Style.BorderColor = clGray
    Style.BorderStyle = ebsSingle
    Style.Color = 13688759
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -12
    Style.Font.Name = 'Arial'
    Style.Font.Style = [fsBold]
    Style.Shadow = False
    Style.TextColor = clNavy
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clGray
    StyleFocused.BorderStyle = ebsSingle
    StyleFocused.Color = 4227200
    StyleFocused.TextColor = clBlue
    StyleHot.BorderStyle = ebsSingle
    StyleHot.TextColor = clBlue
    Left = 48
    Top = 88
    PixelsPerInch = 96
  end
  object cxEditStyleNormal: TcxEditStyleController
    Style.BorderColor = clGray
    Style.BorderStyle = ebsSingle
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWhite
    Style.Font.Height = -12
    Style.Font.Name = 'Arial'
    Style.Font.Style = [fsBold]
    Style.Shadow = False
    Style.TextColor = 10485760
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clGray
    StyleFocused.BorderStyle = ebsOffice11
    StyleFocused.Color = 14548479
    StyleHot.BorderStyle = ebsSingle
    Left = 48
    Top = 136
    PixelsPerInch = 96
  end
  object cxEditStyleCheckBox: TcxEditStyleController
    Style.BorderColor = clWindow
    Style.BorderStyle = ebs3D
    Style.Color = clWindow
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -15
    Style.Font.Name = 'Arial'
    Style.Font.Style = [fsBold]
    Style.Shadow = False
    Style.TextColor = 10485760
    Style.TransparentBorder = False
    Style.ButtonStyle = btsOffice11
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clGray
    StyleFocused.BorderStyle = ebsSingle
    StyleFocused.Color = clBtnFace
    StyleHot.BorderColor = 4227200
    StyleHot.BorderStyle = ebsSingle
    StyleHot.TextColor = 10485760
    StyleHot.TextStyle = [fsBold]
    Left = 48
    Top = 184
    PixelsPerInch = 96
  end
  object cxStyleRepository: TcxStyleRepository
    Left = 280
    Top = 8
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15461355
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Default'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Default'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Default'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4210688
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Default'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8404992
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Default'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clTeal
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8421440
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 8404992
      TextColor = clBlack
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor]
      Color = 8404992
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor]
      Color = 12615680
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBlack
      TextColor = clWhite
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13687246
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8454143
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle43: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 8454143
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9157775
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle45: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11193702
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle46: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 5737262
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle47: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9157775
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle48: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 5736750
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle49: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7627325
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle50: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle51: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4615972
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle52: TcxStyle
    end
    object cxStyle53: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4227200
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle54: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12107912
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle55: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14213320
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle56: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12107912
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle57: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8949832
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle58: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4673068
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle59: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4227200
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle60: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6053956
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle61: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12107912
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle62: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14213320
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle63: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6053956
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle64: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle65: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle66: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle67: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle68: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle69: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle70: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle71: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle72: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle73: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle74: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle75: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle76: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle77: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle78: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object cxStyle79: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle80: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14810367
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle81: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle82: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle83: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle84: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle85: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle86: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle87: TcxStyle
      AssignedValues = [svColor]
      Color = 8421440
    end
    object cxStyle88: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle89: TcxStyle
      AssignedValues = [svColor]
      Color = 14216958
    end
    object cxStyle90: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle91: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle92: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clFuchsia
      TextColor = clWhite
    end
    object cxStyle93: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clRed
    end
    object cxStyle94: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clGreen
    end
    object cxStyle95: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle96: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clDefault
    end
    object cxStyle97: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object cxStyle98: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle99: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle100: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle101: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle102: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle103: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle104: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle105: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle106: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object cxStyle107: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle108: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle109: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle110: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle111: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle112: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle113: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle114: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle115: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle116: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle117: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle118: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle119: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object GridTableViewStyleSheetPadrao: TcxGridTableViewStyleSheet
      Caption = 'UserFormat4'
      Styles.Content = cxStyle1
      Styles.ContentEven = cxStyle2
      Styles.ContentOdd = cxStyle3
      Styles.Footer = cxStyle4
      Styles.Group = cxStyle5
      Styles.GroupByBox = cxStyle6
      Styles.Header = cxStyle7
      Styles.Inactive = cxStyle8
      Styles.Indicator = cxStyle9
      Styles.Preview = cxStyle10
      Styles.Selection = cxStyle11
      BuiltIn = True
    end
    object GridTableViewStyleSheetPadrao2: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle13
      Styles.Content = cxStyle14
      Styles.ContentEven = cxStyle15
      Styles.ContentOdd = cxStyle16
      Styles.FilterBox = cxStyle17
      Styles.IncSearch = cxStyle23
      Styles.Footer = cxStyle18
      Styles.Group = cxStyle19
      Styles.GroupByBox = cxStyle20
      Styles.Header = cxStyle21
      Styles.Inactive = cxStyle22
      Styles.Indicator = cxStyle24
      Styles.Preview = cxStyle25
      Styles.Selection = cxStyle26
      BuiltIn = True
    end
    object GridTableViewStyleSheetPadrao3: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle27
      Styles.Content = cxStyle28
      Styles.ContentEven = cxStyle29
      Styles.ContentOdd = cxStyle30
      Styles.FilterBox = cxStyle31
      Styles.IncSearch = cxStyle37
      Styles.Footer = cxStyle32
      Styles.Group = cxStyle33
      Styles.GroupByBox = cxStyle34
      Styles.Header = cxStyle35
      Styles.Inactive = cxStyle36
      Styles.Indicator = cxStyle38
      Styles.Preview = cxStyle39
      Styles.Selection = cxStyle40
      BuiltIn = True
    end
    object GridTableViewStyleSheetPadrao4: TcxGridTableViewStyleSheet
      Caption = 'UserFormat2'
      Styles.Content = cxStyle41
      Styles.ContentEven = cxStyle42
      Styles.ContentOdd = cxStyle43
      Styles.Footer = cxStyle44
      Styles.Group = cxStyle45
      Styles.GroupByBox = cxStyle46
      Styles.Header = cxStyle47
      Styles.Inactive = cxStyle48
      Styles.Indicator = cxStyle49
      Styles.Preview = cxStyle50
      Styles.Selection = cxStyle51
      BuiltIn = True
    end
    object GridTableViewStyleSheetPadrao5: TcxGridTableViewStyleSheet
      Caption = 'Marine (high color)'
      Styles.Content = cxStyle53
      Styles.ContentEven = cxStyle54
      Styles.ContentOdd = cxStyle55
      Styles.Footer = cxStyle56
      Styles.Group = cxStyle57
      Styles.GroupByBox = cxStyle58
      Styles.Header = cxStyle59
      Styles.Inactive = cxStyle60
      Styles.Indicator = cxStyle61
      Styles.Preview = cxStyle62
      Styles.Selection = cxStyle63
      BuiltIn = True
    end
    object GridTableViewStyleSheetPadrao6: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle78
      Styles.Content = cxStyle79
      Styles.ContentEven = cxStyle80
      Styles.ContentOdd = cxStyle81
      Styles.FilterBox = cxStyle82
      Styles.IncSearch = cxStyle88
      Styles.Footer = cxStyle83
      Styles.Group = cxStyle84
      Styles.GroupByBox = cxStyle85
      Styles.Header = cxStyle86
      Styles.Inactive = cxStyle87
      Styles.Indicator = cxStyle89
      Styles.Preview = cxStyle90
      Styles.Selection = cxStyle91
      BuiltIn = True
    end
    object GridTableViewStyleSheetPadrao7: TcxGridTableViewStyleSheet
      Styles.Inactive = cxStyle8
      BuiltIn = True
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      Styles.Background = cxStyle105
      Styles.Content = cxStyle99
      Styles.ContentEven = cxStyle100
      Styles.Header = cxStyle102
      Styles.Inactive = cxStyle104
      Styles.Indicator = cxStyle103
      Styles.Selection = cxStyle101
      BuiltIn = True
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle106
      Styles.Content = cxStyle107
      Styles.ContentEven = cxStyle108
      Styles.ContentOdd = cxStyle109
      Styles.FilterBox = cxStyle110
      Styles.IncSearch = cxStyle116
      Styles.Footer = cxStyle111
      Styles.Group = cxStyle112
      Styles.GroupByBox = cxStyle113
      Styles.Header = cxStyle114
      Styles.Inactive = cxStyle115
      Styles.Indicator = cxStyle117
      Styles.Preview = cxStyle118
      Styles.Selection = cxStyle119
      BuiltIn = True
    end
  end
  object cxLabelStyleNormal: TcxEditStyleController
    Style.BorderColor = clGray
    Style.BorderStyle = ebsNone
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWhite
    Style.Font.Height = -11
    Style.Font.Name = 'Arial'
    Style.Font.Style = [fsBold]
    Style.Shadow = False
    Style.StyleController = cxLabelStyleNormal3
    Style.TextColor = clBlack
    Style.TextStyle = []
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clGray
    StyleFocused.BorderStyle = ebsOffice11
    StyleFocused.Color = clActiveCaption
    StyleHot.BorderStyle = ebsSingle
    Left = 154
    Top = 136
    PixelsPerInch = 96
  end
  object cxLabelStyleNormal2: TcxEditStyleController
    Style.BorderColor = clGray
    Style.BorderStyle = ebsNone
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWhite
    Style.Font.Height = -11
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.Shadow = False
    Style.TextColor = 16512
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clGray
    StyleFocused.BorderStyle = ebsOffice11
    StyleFocused.Color = clActiveCaption
    StyleHot.BorderStyle = ebsSingle
    Left = 154
    Top = 184
    PixelsPerInch = 96
  end
  object cxHintStyleController: TcxHintStyleController
    HintStyleClassName = 'TcxHintStyle'
    HintStyle.CaptionFont.Charset = DEFAULT_CHARSET
    HintStyle.CaptionFont.Color = clWindowText
    HintStyle.CaptionFont.Height = -11
    HintStyle.CaptionFont.Name = 'Tahoma'
    HintStyle.CaptionFont.Style = []
    HintStyle.Font.Charset = DEFAULT_CHARSET
    HintStyle.Font.Color = clBlue
    HintStyle.Font.Height = -13
    HintStyle.Font.Name = 'Arial'
    HintStyle.Font.Style = [fsBold]
    HintStyle.IconSize = cxisSmall
    HintStyle.IconType = cxhiInformation
    HintStyle.Rounded = True
    Left = 48
    Top = 296
  end
  object cxLabelStyleNormal3: TcxEditStyleController
    Style.BorderColor = clGray
    Style.BorderStyle = ebsNone
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWhite
    Style.Font.Height = -11
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.Shadow = False
    Style.TextColor = clMaroon
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clGray
    StyleFocused.BorderStyle = ebsOffice11
    StyleFocused.Color = clActiveCaption
    StyleHot.BorderStyle = ebsSingle
    Left = 154
    Top = 240
    PixelsPerInch = 96
  end
  object qryLogUsuario: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 'SELECT * FROM LOG_USUARIO WHERE ID = :pNewId'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'pNewId'
        ParamType = ptInput
      end>
    SQLConnection = SConPrincipal
    Left = 384
    Top = 151
    object qryLogUsuarioID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryLogUsuarioDATA_MOVIM: TDateField
      FieldName = 'DATA_MOVIM'
      ProviderFlags = [pfInUpdate]
    end
    object qryLogUsuarioHORA_MOVIM: TTimeField
      FieldName = 'HORA_MOVIM'
      ProviderFlags = [pfInUpdate]
    end
    object qryLogUsuarioID_USUARIO_LOGADO: TIntegerField
      FieldName = 'ID_USUARIO_LOGADO'
      ProviderFlags = [pfInUpdate]
    end
    object qryLogUsuarioID_USUARIO_EXECUT: TIntegerField
      FieldName = 'ID_USUARIO_EXECUT'
      ProviderFlags = [pfInUpdate]
    end
    object qryLogUsuarioNOME_FORM1: TStringField
      FieldName = 'NOME_FORM1'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryLogUsuarioNOME_FORM2: TStringField
      FieldName = 'NOME_FORM2'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryLogUsuarioNOME_TABELA: TStringField
      FieldName = 'NOME_TABELA'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryLogUsuarioOPERACAO: TStringField
      FieldName = 'OPERACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryLogUsuarioCAMPO_PK1: TStringField
      FieldName = 'CAMPO_PK1'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryLogUsuarioCAMPO_PK2: TStringField
      FieldName = 'CAMPO_PK2'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryLogUsuarioCAMPO_PK3: TStringField
      FieldName = 'CAMPO_PK3'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryLogUsuarioCAMPO_PK4: TStringField
      FieldName = 'CAMPO_PK4'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryLogUsuarioCAMPO_PK5: TStringField
      FieldName = 'CAMPO_PK5'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryLogUsuarioCAMPO_PK6: TStringField
      FieldName = 'CAMPO_PK6'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryLogUsuarioNOME_CAMPO: TMemoField
      FieldName = 'NOME_CAMPO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object qryLogUsuarioVAL_CAMPO_ANTER: TMemoField
      FieldName = 'VAL_CAMPO_ANTER'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object qryLogUsuarioVAL_CAMPO_NOVO: TMemoField
      FieldName = 'VAL_CAMPO_NOVO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object qryLogUsuarioNOME_USUARIO: TStringField
      FieldName = 'NOME_USUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryLogUsuarioCARGO_USUARIO: TStringField
      FieldName = 'CARGO_USUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
  end
  object dspLogUsuario: TDataSetProvider
    DataSet = qryLogUsuario
    Exported = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 384
    Top = 199
  end
  object cdsLogUsuario: TClientDataSet
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
    ProviderName = 'dspLogUsuario'
    StoreDefs = True
    AfterInsert = cdsLogUsuarioAfterInsert
    Left = 384
    Top = 247
    object cdsLogUsuarioID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLogUsuarioDATA_MOVIM: TDateField
      FieldName = 'DATA_MOVIM'
      ProviderFlags = [pfInUpdate]
    end
    object cdsLogUsuarioHORA_MOVIM: TTimeField
      FieldName = 'HORA_MOVIM'
      ProviderFlags = [pfInUpdate]
    end
    object cdsLogUsuarioID_USUARIO_LOGADO: TIntegerField
      FieldName = 'ID_USUARIO_LOGADO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsLogUsuarioID_USUARIO_EXECUT: TIntegerField
      FieldName = 'ID_USUARIO_EXECUT'
      ProviderFlags = [pfInUpdate]
    end
    object cdsLogUsuarioNOME_FORM1: TStringField
      FieldName = 'NOME_FORM1'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsLogUsuarioNOME_FORM2: TStringField
      FieldName = 'NOME_FORM2'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsLogUsuarioNOME_TABELA: TStringField
      FieldName = 'NOME_TABELA'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsLogUsuarioOPERACAO: TStringField
      FieldName = 'OPERACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsLogUsuarioCAMPO_PK1: TStringField
      FieldName = 'CAMPO_PK1'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsLogUsuarioCAMPO_PK2: TStringField
      FieldName = 'CAMPO_PK2'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsLogUsuarioCAMPO_PK3: TStringField
      FieldName = 'CAMPO_PK3'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsLogUsuarioCAMPO_PK4: TStringField
      FieldName = 'CAMPO_PK4'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsLogUsuarioCAMPO_PK5: TStringField
      FieldName = 'CAMPO_PK5'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsLogUsuarioCAMPO_PK6: TStringField
      FieldName = 'CAMPO_PK6'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsLogUsuarioNOME_CAMPO: TMemoField
      FieldName = 'NOME_CAMPO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object cdsLogUsuarioVAL_CAMPO_ANTER: TMemoField
      FieldName = 'VAL_CAMPO_ANTER'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object cdsLogUsuarioVAL_CAMPO_NOVO: TMemoField
      FieldName = 'VAL_CAMPO_NOVO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object cdsLogUsuarioNOME_USUARIO: TStringField
      FieldName = 'NOME_USUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsLogUsuarioCARGO_USUARIO: TStringField
      FieldName = 'CARGO_USUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
  end
  object dxSkinController: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2007Green'
    Left = 232
    Top = 384
  end
end
