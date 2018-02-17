object frmSelecionarCertificado: TfrmSelecionarCertificado
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  BorderWidth = 4
  Caption = 'Selecionar Certificado'
  ClientHeight = 244
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlControle: TPanel
    Left = 0
    Top = 199
    Width = 619
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 529
    DesignSize = (
      619
      45)
    object btnCancelar: TBitBtn
      Left = 531
      Top = 6
      Width = 88
      Height = 30
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
      ExplicitLeft = 441
    end
    object btnOk: TBitBtn
      Left = 437
      Top = 6
      Width = 88
      Height = 30
      Anchors = [akTop, akRight]
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      ExplicitLeft = 347
    end
  end
  object stgCertificado: TStringGrid
    Left = 0
    Top = 0
    Width = 619
    Height = 199
    Align = alClient
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
    TabOrder = 0
    ExplicitWidth = 529
    ColWidths = (
      64
      64
      64
      64
      64)
    RowHeights = (
      24
      24)
  end
end
